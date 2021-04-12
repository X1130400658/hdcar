# hdcar
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2020. All rights reserved.
 */
package com.huawei.sinan.topoprocessor.processor;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeoutException;

import org.apache.commons.lang.StringUtils;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.common.protocol.types.Field;
import org.apache.kafka.common.serialization.Serde;
import org.apache.kafka.common.serialization.Serdes;
import org.apache.kafka.common.utils.Utils;
import org.apache.kafka.streams.KafkaStreams;
import org.apache.kafka.streams.StreamsBuilder;
import org.apache.kafka.streams.StreamsConfig;
import org.apache.kafka.streams.errors.StreamsException;
import org.apache.kafka.streams.kstream.Aggregator;
import org.apache.kafka.streams.kstream.Consumed;
import org.apache.kafka.streams.kstream.Initializer;
import org.apache.kafka.streams.kstream.KStream;
import org.apache.kafka.streams.kstream.KTable;
import org.apache.kafka.streams.kstream.Materialized;
import org.apache.kafka.streams.kstream.Printed;
import org.apache.kafka.streams.kstream.TimeWindows;
import org.apache.kafka.streams.kstream.Windowed;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.huawei.sinan.engine.graphclient.core.SiNanClient;
import com.huawei.sinan.engine.graphclient.exception.ClientException;
import com.huawei.sinan.engine.graphclient.metadata.SiNanVertexResponse;
import com.huawei.sinan.engine.topomodel.common.ModelConstants;
import com.huawei.sinan.engine.topomodel.extend.Application;
import com.huawei.sinan.engine.topomodel.extend.MiddleWare;
import com.huawei.sinan.engine.topomodel.extend.TracingTo;
import com.huawei.sinan.topoprocessor.processor.disruptor.TracingToConsumer;
import com.huawei.sinan.topoprocessor.processor.entity.Annotation;
import com.huawei.sinan.topoprocessor.processor.entity.SpanDto;
import com.huawei.sinan.topoprocessor.serde.EdgeWraper;
import com.huawei.sinan.topoprocessor.serde.SpanSerde;
import com.huawei.sinan.topoprocessor.serde.SpanSerdeDeserializer;
import com.huawei.sinan.topoprocessor.serde.SpanSerdeSerializer;
import com.huawei.sinan.topoprocessor.serde.TracingToWrap;
import com.huawei.sinan.topoprocessor.serde.TracingToWrapSerdeDeserializer;
import com.huawei.sinan.topoprocessor.serde.TracingToWrapSerdeSerializer;
import com.huawei.sinan.topoprocessor.util.Constants;
import com.huawei.sinan.topoprocessor.util.RedisUtil;
import com.huawei.sinan.topoprocessor.util.SpanTimestampExtractor;

import lombok.SneakyThrows;

/**
 * 功能描述
 *
 * @since 2021-03-17
 */
@Component
public class SegementProcessorZipkin {

    private static final Logger LOGGER = LoggerFactory.getLogger(SegementProcessorZipkin.class);

    @Autowired
    private SegementTransformerSupplier segementTransformerSupplier;

    @Value("${kafka.topic.zipkin}")
    private String configKafkaTopic;

    @Value("${spring.kafka.bootstrap-servers}")
    private String bootstrapServers;

    @Value("${spring.kafka.streams.cache-max-size-buffering:1000000000}")
    private int cacheMaxSizeBuffering;

    @Value("${kafka.stream.num.stream.threads}")
    private int numStreamThreads;

    @Value("${kafka.save.date.time}")
    private long saveDateTime;

    @Value("${zipkin.time.window.seconds}")
    private long timeWindowSeconds;

    @Value("${spring.kafka.consumer.properties.session.timeout.ms:30000}")
    private int sessionTimeoutMs;

    @Value("${spring.kafka.consumer.properties.max.poll.interval.ms:300000}")
    private int maxPollIntervalMs;

    @Value("${spring.kafka.consumer.max-poll-records:300}")
    private int maxPollRecords;

    @Value("${spring.kafka.consumer.auto-offset-reset:latest}")
    private String autoOffsetReset;

    @Value("${name_separator:---}")
    private String nameSeparator;

    //边的name的间隔符
    @Value("${exception.message.file}")
    private String exceptionMessageFile;

    @Autowired
    private SiNanClient siNanClient;

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private TracingToConsumer tracingToConsumer;

    /**
     * 序列化/反序列化TracingTo
     */
    private Serde<TracingToWrap> tracingToSerde = Serdes.serdeFrom(new TracingToWrapSerdeSerializer(), new TracingToWrapSerdeDeserializer());

    @Bean
    public void startZipkinStream() {
        try {
            // Configure the Streams application.
            final Properties streamsConfiguration = getStreamsConfiguration(bootstrapServers);
            // Define the processing topology of the Streams application.
            final StreamsBuilder streamsBuilder = new StreamsBuilder();
            createSegmentStream(streamsBuilder);
            final KafkaStreams streams = new KafkaStreams(streamsBuilder.build(), streamsConfiguration);
            streams.cleanUp();
            streams.setUncaughtExceptionHandler((t, e) -> {
                LOGGER.error(e.getMessage() + ":", e);
            });
            // Now run the processing topology via `start()` to begin processing its input data.
            streams.start();

            // Add shutdown hook to respond to SIGTERM and gracefully close the Streams application.
            Runtime.getRuntime().addShutdownHook(new Thread(() -> {
                streams.close();
                streams.cleanUp();
            }));
        } catch (IllegalStateException | StreamsException e) {
            LOGGER.error("IllegalStateException | StreamsException {}", e.toString());
        }

    }

    private void createSegmentStream(final StreamsBuilder builder) {
        Serde<List<SpanDto>> spanDtoSerde = Serdes.serdeFrom(new SpanSerdeSerializer(), new SpanSerdeDeserializer());

        final KStream<String, List<SpanDto>> source = builder.stream(configKafkaTopic, Consumed.with(Serdes.String(), spanDtoSerde));

        addApplication(source);

        doAggregateTracingTo(source);
    }

    private Properties getStreamsConfiguration(final String bootstrapServers) {
        final Properties streamsConfiguration = new Properties();
        SpanSerde spanDtoSerde = new SpanSerde();
        // Give the Streams application a unique name.  The name must be unique in the Kafka cluster
        // against which the application is run.
        streamsConfiguration.put(StreamsConfig.APPLICATION_ID_CONFIG, configKafkaTopic + "-stream");
        streamsConfiguration.put(StreamsConfig.CLIENT_ID_CONFIG, configKafkaTopic + "-client");
        // 指定使用自定义的时间提取器
        streamsConfiguration.put(StreamsConfig.DEFAULT_TIMESTAMP_EXTRACTOR_CLASS_CONFIG, SpanTimestampExtractor.class);
        // Where to find Kafka broker(s).
        streamsConfiguration.put(StreamsConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers);
        // Specify default (de)serializers for record keys and for record values.
        streamsConfiguration.put(StreamsConfig.DEFAULT_KEY_SERDE_CLASS_CONFIG, Serdes.String().getClass().getName());
        streamsConfiguration.put(StreamsConfig.DEFAULT_VALUE_SERDE_CLASS_CONFIG, spanDtoSerde.getClass().getName());
        // Records should be flushed every 10 seconds. This is less than the default
        // in order to keep this example interactive.
        streamsConfiguration.put(StreamsConfig.COMMIT_INTERVAL_MS_CONFIG, saveDateTime * 1000);
        streamsConfiguration.put(StreamsConfig.PROCESSING_GUARANTEE_CONFIG, StreamsConfig.AT_LEAST_ONCE);
        streamsConfiguration.put(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, false);
        streamsConfiguration.put(ConsumerConfig.MAX_POLL_INTERVAL_MS_CONFIG, maxPollIntervalMs);
        streamsConfiguration.put(ConsumerConfig.SESSION_TIMEOUT_MS_CONFIG, sessionTimeoutMs);
        streamsConfiguration.put(ConsumerConfig.MAX_POLL_RECORDS_CONFIG, maxPollRecords);
        streamsConfiguration.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, autoOffsetReset);

        // For illustrative purposes we disable record caches.
        streamsConfiguration.put(StreamsConfig.CACHE_MAX_BYTES_BUFFERING_CONFIG, cacheMaxSizeBuffering);
        // Use a temporary directory for storing state, which will be automatically removed after the test.
        streamsConfiguration.put(StreamsConfig.STATE_DIR_CONFIG, tempDirectory().getAbsolutePath());
        streamsConfiguration.put(StreamsConfig.NUM_STREAM_THREADS_CONFIG, numStreamThreads);
        streamsConfiguration.put(StreamsConfig.TOPOLOGY_OPTIMIZATION, StreamsConfig.OPTIMIZE);
        return streamsConfiguration;
    }

    private File tempDirectory() {
        final File file;
        try {
            file = Files.createTempDirectory("confluent").toFile();
        } catch (IOException var2) {
            throw new RuntimeException("Failed to create a temp dir", var2);
        }
        file.deleteOnExit();
        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            try {
                Utils.delete(file);
            } catch (IOException e) {
                LOGGER.error(e.getMessage(), e);
            }
        }));
        return file;
    }

    /**
     * zipkin 动态边聚合运算
     *
     * @param source 消息流
     */
    private void doAggregateTracingTo(KStream<String, List<SpanDto>> source) {
        KTable<Windowed<String>,
                TracingToWrap> sumWindowed = source.filter((k, v) -> {
            if (v == null) {
                return false;
            } else {
                return true;
            }
        }).flatMapValues(value -> value).groupBy((key, value) -> {
            return Constants.TRACINGTO_KEY;
        }).windowedBy(TimeWindows.of(Duration.ofSeconds(timeWindowSeconds)))
                .aggregate(new Initializer<TracingToWrap>() {
                    @Override
                    public TracingToWrap apply() {
                        return new TracingToWrap();
                    }
                }, new Aggregator<String, SpanDto, TracingToWrap>() {
                    @SneakyThrows
                    @Override
                    public TracingToWrap apply(String aggKey, SpanDto spanDto, TracingToWrap tracingTos) {
                        spanDto.setDealtime(System.currentTimeMillis());
                        String pid = spanDto.getParentId();

                        // pid为空还要继续分析  这个逻辑先去掉 if (StringUtils.isEmpty(pid)) {
                        if (false) {
                            applyStartTracing(spanDto, tracingTos);
                        } else {
                            Map<String, String> schema = spanDto.getSchema();
                            String req_params = "";
                            String protocol = "";
                            if (!schema.isEmpty()) {
                                req_params = schema.get(Constants.SCHEMA_REQ_PARAMS);
                                protocol = schema.get(Constants.SCHEMA_PROTOCOL);
                            }

                            // 判断数据库和kafka调用
                            if (StringUtils.isNotEmpty(req_params) && isServer(spanDto) && schema.get(Constants.SCHEMA_REQ_PARAMS).contains(Constants.SCHEMA_DATABASE)) {
                                processDatabaseSpan(spanDto, tracingTos);
                            } else if (StringUtils.isNotEmpty(protocol) && Constants.SCHEMA_KAFKA.equals(protocol)) {
                                processKafkaSpan(spanDto, tracingTos);
                            }
                            if (!redisUtil.hHasKey(Constants.SPAN_NAME_FLAG, spanDto.getId())) {
                                Map<String, String> subMap = new HashMap<>();
                                subMap.put(spanDto.getId(), JSONObject.toJSONString(spanDto, SerializerFeature.IgnoreNonFieldGetter));
                                redisUtil.setHashMap(Constants.SPAN_NAME_FLAG, subMap);
                            } else {
                                List<SpanDto> list = new ArrayList<>();
                                SpanDto bufferSpanDto = JSONObject
                                        .parseObject(redisUtil.getHash(Constants.SPAN_NAME_FLAG, spanDto.getId()), SpanDto.class);
                                list.add(bufferSpanDto);
                                list.add(spanDto);
                                applyTracing(list, tracingTos);
                                redisUtil.delHash(Constants.SPAN_NAME_FLAG, spanDto.getId());
                            }
                        }
                        return tracingTos;
                    }
                }, Materialized.with(Serdes.String(), tracingToSerde));
        sumWindowed.toStream().print(Printed.toSysOut());
        KStream<Windowed<String>, TracingToWrap> transform = sumWindowed.toStream();
        transform.transform(segementTransformerSupplier);
    }

    public boolean isNeedHandle(String key, SpanDto spanDto) {
        List<Annotation> annotations = spanDto.getAnnotations();
        String parentId = spanDto.getParentId();
        String flag = annotations.get(0).getValue();
        if (annotations.size() == 0) {
            LOGGER.info("annotations is null.No need to handel span.");
            return true;
        } else if (StringUtils.isNotEmpty(parentId) && ("ss".equals(flag) || "sr".equals(flag))) {
            LOGGER.info("flag is {}, parentId is {}.No need to handel span.", flag, parentId);
            return true;
        }
        return true;
    }

    /**
     * 判断是否是server
     *
     * @param spanDto span
     * @return
     */
    public boolean isServer(SpanDto spanDto) {
        List<Annotation> annotations = spanDto.getAnnotations();
        if (annotations == null || annotations.size() == 0) {
            LOGGER.info("annotations is null.");
            return false;
        }
        String flag = annotations.get(0).getValue();
        if (Constants.SERVER_SENT.equals(flag) || Constants.SERVER_RECEIVED.equals(flag)) {
            return true;
        }
        return false;
    }

    /**
     * 判断是否是client
     *
     * @param spanDto span
     * @return
     */
    public boolean isClient(SpanDto spanDto) {
        List<Annotation> annotations = spanDto.getAnnotations();
        if (annotations == null || annotations.size() == 0) {
            LOGGER.info("annotations is null.");
            return false;
        }
        String flag = annotations.get(0).getValue();
        if (Constants.CLIENT_SENT.equals(flag) || Constants.CLIENT_RECEIVED.equals(flag)) {
            return true;
        }
        return false;
    }

    /**
     * zipkin消息解析
     *
     * @param spanDtoList 链路消息
     * @param tracingTos  tracingTo集合对象
     */
    public void applyTracing(List<SpanDto> spanDtoList, EdgeWraper tracingTos) {
        String fromService = "";
        String toService = "";
        long timeStamp = spanDtoList.get(1).getTimestamp();
        long responseTime = 0L;
        for (SpanDto spanDto : spanDtoList) {
            List<Annotation> annotations = spanDto.getAnnotations();
            if (annotations == null || annotations.size() == 0) {
                LOGGER.info("annotations is null.");
                return;
            }
            if (isClient(spanDto)) {
                fromService = spanDto.getServiceHostName();
                long startTime = 0L;
                long endTime = 0L;
                for (Annotation annotation : annotations) {
                    switch (annotation.getValue()) {
                        case Constants.CLIENT_SENT:
                            startTime = annotation.getTimestamp();
                            break;
                        case Constants.CLIENT_RECEIVED:
                            endTime = annotation.getTimestamp();
                            break;
                    }
                }

                // zipkin里面的时间都是微秒  转化为毫秒
                responseTime = (endTime - startTime) / 1000;
            } else if (isServer(spanDto)) {
                toService = spanDto.getServiceHostName();
            }
        }
        setTraceTo(fromService, toService, tracingTos, responseTime, timeStamp);
    }

    /**
     * 添加起始trace
     *
     * @param spanDto    消息
     * @param tracingTos 集合
     */
    public void applyStartTracing(SpanDto spanDto, EdgeWraper tracingTos) {
        String fromService = "";
        if (isServer(spanDto)) {
            fromService = ModelConstants.START_POINT;
        } else if (isClient(spanDto)) {
            fromService = ModelConstants.INNER;
        }
        long startTime = 0L;
        long endTime = 0L;
        List<Annotation> annotations = spanDto.getAnnotations();
        for (Annotation annotation : annotations) {
            switch (annotation.getValue()) {
                case Constants.SERVER_RECEIVED:
                    startTime = annotation.getTimestamp();
                    break;
                case Constants.SERVER_SENT:
                    endTime = annotation.getTimestamp();
                    break;
            }
        }

        // zipkin里面的时间都是微秒  转化为毫秒
        long responseTime = (endTime - startTime) / 1000;
        setTraceTo(fromService, spanDto.getServiceHostName(), tracingTos, responseTime, spanDto.getTimestamp());
    }

    /**
     * 设置tracingto
     *
     * @param fromService  起点
     * @param toService    终点
     * @param tracingTos   边集合
     * @param responseTime rt
     * @param timestamp    datatime
     */
    public void setTraceTo(String fromService, String toService, EdgeWraper tracingTos, long responseTime, long timestamp) {
        if (StringUtils.isEmpty(fromService) || StringUtils.isEmpty(toService)) {
            LOGGER.info("fromService or toService is null.");
            return;
        }
        String traceToName = fromService + nameSeparator + toService;
        TracingTo tracingTo = tracingTos.getTracingTo(traceToName);
        tracingTo.setName(traceToName);
        tracingTo.setTarget(toService);
        tracingTo.setSource(fromService);
        if (tracingTo.getCallPerMinute() == 0) {
            tracingTo.setCreateTime(testDate(timestamp));
            tracingTo.setUpdateTime(testDate(timestamp));
        } else {
            if (timestamp > tracingTo.getUpdateTime().getTime()) {
                tracingTo.setUpdateTime(testDate(timestamp));
            }
        }
        tracingTo.setCallPerMinute(tracingTo.getCallPerMinute() + 1);
        tracingTo.setResponseTimePerMin(responseTime + tracingTo.getResponseTimePerMin());
    }

    /**
     * 新增应用
     *
     * @param source 源流
     */
    private void addApplication(KStream<String, List<SpanDto>> source) {
        source.filter((k, v) -> {
            if (v == null) {
                return false;
            } else {
                return true;
            }
        }).foreach((k, v) -> {
            for (SpanDto spanDto : v) {
                String appName = spanDto.getServiceHostName();
                Application application = new Application();
                application.setName(appName);
                application.setDevLanguage(Constants.NA);
                // 创建时间先放到以前
                application.setCreateTime(new Date(1580091459000L));
                application.setUpdateTime(testDate(spanDto.getTimestamp()));
                siNanClient.addOrUpdateApplication(application);
            }
        });
    }

    private Date testDate(long timeStamp) {
        Date date = new Date(timeStamp);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.YEAR, -1);
        return calendar.getTime();
    }

    /**
     * 如果缓存中存在无法处理的数据，两个span都是server或者都是client也可以生成tracingto
     */
    @Scheduled(fixedRate = Constants.PROCESS_CACHE_SPAN_INTERVAL_MS)
    public void processCacheSpan() {
        Map<Object, Object> map = redisUtil.gethashEntry(Constants.SPAN_NAME_FLAG);
        Map<String, List<SpanDto>> spanMap = new HashMap<>();
        List<SpanDto[]> spanArrList = new ArrayList<>();
        for (Map.Entry<Object, Object> mapEntry : map.entrySet()) {
            try {
                SpanDto spanDto = JSONObject
                        .parseObject((String) mapEntry.getValue(), SpanDto.class);
                List<SpanDto> spanList = spanMap.computeIfAbsent(spanDto.getTraceId(), k -> new ArrayList<>());
                spanList.add(spanDto);
            } catch (RuntimeException re) {
                LOGGER.error("Data error", re);
            }
        }
        for (Map.Entry<String, List<SpanDto>> mapEntry : spanMap.entrySet()) {
            try {
                List<SpanDto> spanDtoList = mapEntry.getValue();
                for (int i = 0; i < spanDtoList.size() - 1; i++) {
                    for (int j = i + 1; j < spanDtoList.size(); j++) {
                        SpanDto[] spanArr = parseRelation(spanDtoList.get(i), spanDtoList.get(j));

                        // 如果span在缓存中存在5分钟以上，还没有匹配到对应的client和server，则考虑两个server和两个client的情况
                        if (spanArr != null && System.currentTimeMillis() - spanArr[0].getDealtime() > Constants.PROCESS_CACHE_SPAN_INTERVAL_MS
                                && System.currentTimeMillis() - spanArr[1].getDealtime() > Constants.PROCESS_CACHE_SPAN_INTERVAL_MS) {
                            spanArrList.add(spanArr);

                            // 记录异常数据
                            recordException(spanArr);
                        }
                    }
                }
            } catch (RuntimeException re) {
                LOGGER.error("Data error", re);
            }
        }
        if (spanArrList.size() > 0) {
            addTracingTo(spanArrList);
        }
    }

    /**
     * 处理数据库调用
     *
     * @param spanDto span
     */
    public void processDatabaseSpan(SpanDto spanDto, TracingToWrap tracingTos) {
        long timeStamp = spanDto.getTimestamp();
        Map<String, String> schema = spanDto.getSchema();
        String ip = getDatabaseIp(schema.get(Constants.SCHEMA_REQ_PARAMS));
        MiddleWare middleWare = new MiddleWare();
        middleWare.setName(ip);
        middleWare.setCreateTime(testDate(timeStamp));
        middleWare.setUpdateTime(testDate(timeStamp));
        middleWare.setMiddleWareType(Constants.DATABASE);
        CompletableFuture<SiNanVertexResponse> rspFuture = siNanClient.addOrUpdateMiddleWare(middleWare);
        try {
            SiNanVertexResponse rsp = rspFuture.get();
            if (rsp.isSuccess()) {
                String fromService = spanDto.getServiceHostName();
                List<Annotation> annotations = spanDto.getAnnotations();
                if (annotations == null || annotations.size() == 0) {
                    LOGGER.info("annotations is null.");
                    return;
                }
                long startTime = 0L;
                long endTime = 0L;
                for (Annotation annotation : annotations) {
                    switch (annotation.getValue()) {
                        case Constants.SERVER_SENT:
                            startTime = annotation.getTimestamp();
                            break;
                        case Constants.SERVER_RECEIVED:
                            endTime = annotation.getTimestamp();
                            break;
                    }
                }
                long responseTime = (endTime - startTime) / 1000;
                setTraceTo(fromService, ip, tracingTos, responseTime, timeStamp);
            }
        } catch (InterruptedException | ExecutionException e) {
            LOGGER.error("invoke siNanClient error!{}", e.getMessage());
        }
    }

    /**
     * 处理kafka调用
     *
     * @param spanDto span
     */
    public void processKafkaSpan(SpanDto spanDto, TracingToWrap tracingTos) {
        long timeStamp = spanDto.getTimestamp();
        Map<String, String> schema = spanDto.getSchema();
        String topic = schema.get(Constants.SCHEMA_TOPIC);
        MiddleWare middleWare = new MiddleWare();
        middleWare.setName(topic);
        middleWare.setCreateTime(testDate(timeStamp));
        middleWare.setUpdateTime(testDate(timeStamp));
        middleWare.setMiddleWareType(Constants.MQ);
        CompletableFuture<SiNanVertexResponse> rspFuture = siNanClient.addOrUpdateMiddleWare(middleWare);
        try {
            SiNanVertexResponse rsp = rspFuture.get();
            if (rsp.isSuccess()) {
                String fromService = "";
                String toService = "";
                List<Annotation> annotations = spanDto.getAnnotations();
                if (annotations == null || annotations.size() == 0) {
                    LOGGER.info("annotations is null.");
                    return;
                }
                long startTime = 0L;
                long endTime = 0L;
                if (isServer(spanDto)) {
                    fromService = topic;
                    toService = spanDto.getServiceHostName();
                    for (Annotation annotation : annotations) {
                        switch (annotation.getValue()) {
                            case Constants.SERVER_RECEIVED:
                                startTime = annotation.getTimestamp();
                                break;
                            case Constants.SERVER_SENT:
                                endTime = annotation.getTimestamp();
                                break;
                        }
                    }
                } else if (isClient(spanDto)) {
                    fromService = spanDto.getServiceHostName();
                    toService = topic;
                    for (Annotation annotation : annotations) {
                        switch (annotation.getValue()) {
                            case Constants.CLIENT_SENT:
                                startTime = annotation.getTimestamp();
                                break;
                            case Constants.CLIENT_RECEIVED:
                                endTime = annotation.getTimestamp();
                                break;
                        }
                    }
                }
                long responseTime = (endTime - startTime) / 1000;
                setTraceTo(fromService, toService, tracingTos, responseTime, timeStamp);
            }
        } catch (InterruptedException | ExecutionException e) {
            LOGGER.error("invoke siNanClient error!{}", e.getMessage());
        }
    }

    /**
     * 获取数据ip
     *
     * @param reqParams req
     * @return ip
     */
    public String getDatabaseIp(String reqParams) {
        if (StringUtils.isEmpty(reqParams)) {
            LOGGER.error("reqParams is null.");
            return StringUtils.EMPTY;
        }
        String sub = reqParams.substring(reqParams.indexOf("@") + 1);
        if (sub.contains(":")) {
            return sub.substring(0, sub.indexOf(":"));
        }
        return StringUtils.EMPTY;
    }

    /**
     * 添加异常情况下的tracingto
     *
     * @param spanArrList span列表
     */
    public void addTracingTo(List<SpanDto[]> spanArrList) {
        TracingToWrap tracingToWrap = new TracingToWrap();
        for (SpanDto[] spanArr : spanArrList) {
            String fromService = spanArr[0].getServiceHostName();
            String toService = spanArr[1].getServiceHostName();
            long timeStamp = 0L;
            long responseTime = 0L;
            long startTime = 0L;
            long endTime = 0L;
            List<Annotation> annotations = new ArrayList<>();
            if (isClient(spanArr[0])) {
                timeStamp = spanArr[0].getTimestamp();
                annotations = spanArr[0].getAnnotations();
                redisUtil.del(Constants.SPAN_NAME_FLAG, spanArr[0].getId());
            } else {
                timeStamp = spanArr[1].getTimestamp();
                annotations = spanArr[1].getAnnotations();
                redisUtil.del(Constants.SPAN_NAME_FLAG, spanArr[1].getId());
            }
            for (Annotation annotation : annotations) {
                switch (annotation.getValue()) {
                    case Constants.CLIENT_SENT:
                        startTime = annotation.getTimestamp();
                        break;
                    case Constants.CLIENT_RECEIVED:
                        endTime = annotation.getTimestamp();
                        break;
                }
            }

            // zipkin里面的时间都是微秒  转化为毫秒
            responseTime = (endTime - startTime) / 1000;
            setTraceTo(fromService, toService, tracingToWrap, responseTime, timeStamp);
        }
        tracingToConsumer.consume(tracingToWrap);
    }

    /**
     * 解决两个span都是client，两个span都是server的情况
     * client缺失或者server缺失
     *
     * @param spanDto1 span1
     * @param spanDto2 span2
     * @return 结果
     */
    public SpanDto[] parseRelation(SpanDto spanDto1, SpanDto spanDto2) {
        SpanDto[] res = new SpanDto[2];
        if (spanDto1 == null || spanDto2 == null || !spanDto1.getTraceId().equals(spanDto2.getTraceId())) {
            return null;
        }
        if ((isServer(spanDto1) && isServer(spanDto2)) || (isClient(spanDto1) && isClient(spanDto2))) {
            if (spanDto1.getId().equals(spanDto2.getParentId())) {
                res[0] = spanDto1;
                res[1] = spanDto2;
                return res;
            } else if (spanDto2.getId().equals(spanDto1.getParentId())) {
                res[0] = spanDto2;
                res[1] = spanDto1;
                return res;
            }
        }
        return null;
    }

    /**
     * 记录链路消息异常数据
     *
     * @param spanArr ss和cc数据
     */
    public void recordException(SpanDto[] spanArr) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String date = sdf.format(new Date());
        try {
            File filename = new File(exceptionMessageFile);
            if (!filename.exists()) {
                filename.createNewFile();
            }
            BufferedWriter bw = new BufferedWriter(new FileWriter(exceptionMessageFile, true));
            bw.append(date + "两个server或者两个client的情况：  ");
            bw.newLine();
            bw.append("spanArr[0] is " + spanArr[0].toString() + ". spanArr[1] is " + spanArr[1].toString());
            bw.newLine();
            bw.close();
        } catch (IOException e) {
            LOGGER.error("recordException is Error.{}", e.getMessage());
        }
    }

    /**
     * 排查问题，用于记录日志
     *
     * @param str 信息
     */
    public void record(String str) {
        try {
            File filename = new File("D:\\record.txt");
            if (!filename.exists()) {
                filename.createNewFile();
            }
            BufferedWriter bw = new BufferedWriter(new FileWriter("D:\\record.txt", true));
            bw.append(str);
            bw.newLine();
            bw.close();
        } catch (IOException e) {
            LOGGER.error("recordException is Error.{}", e.getMessage());
        }
    }
}
