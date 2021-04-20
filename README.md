/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2020. All rights reserved.
 */

package com.huawei.sinan.topoprocessor.kafka;

import com.alibaba.fastjson.JSON;
import com.huawei.sinan.engine.graphclient.exception.ClientException;
import com.huawei.sinan.engine.topomodel.basic.EdgeModel;
import com.huawei.sinan.engine.topomodel.basic.VertexModel;
import com.huawei.sinan.engine.topomodel.common.ProcessStatusCode;
import com.huawei.sinan.engine.topomodel.extend.Application;
import com.huawei.sinan.engine.topomodel.extend.CreateOn;
import com.huawei.sinan.engine.topomodel.extend.Process;
import com.huawei.sinan.engine.graphclient.core.SiNanClient;
import com.huawei.sinan.topoprocessor.processor.entity.SpanDto;
import com.huawei.sinan.topoprocessor.util.Constants;

import org.apache.commons.lang.StringUtils;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.common.utils.Bytes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.support.Acknowledgment;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 事件消费者
 *
 * @author xuzhiping
 * @since 2020-12-01
 */
@Component
@EnableScheduling
public class ZipkinConsumer implements InitializingBean {
    private final Logger LOGGER = LoggerFactory.getLogger(ZipkinConsumer.class);

    @Value("${name_separator:---}")
    private String nameSeparator;

    @Autowired
    private SiNanClient siNanClient;

    @KafkaListener(topics = "#{'${kafka.zipkin.topic}'}", containerFactory = "kafkaZipkinContainerFactory")
    public void consumer(List<ConsumerRecord<String, Bytes>> records, Acknowledgment ack) {
        try {
            batchHandleSpan(records);
        } catch (Exception e) {
            LOGGER.error("success to batchHandleSpan. Msg is {}", e.getMessage());
        } finally {
            ack.acknowledge();
        }
    }

    /**
     * 批量处理span
     *
     * @param records kafka消息列表
     */
    private void batchHandleSpan(List<ConsumerRecord<String, Bytes>> records) {
        Map<String, VertexModel> vertexModels = new LinkedHashMap<>();
        Map<String, EdgeModel> edgeModels = new LinkedHashMap<>();
        for (ConsumerRecord<String, Bytes> record : records) {
            List<SpanDto> spanDtoList = JSON.parseArray(new String(record.value().get()), SpanDto.class);
            for (SpanDto spanDto : spanDtoList) {
                String appName = spanDto.getServiceHostName();
                Application application = new Application();
                application.setName(appName);
                application.setDevLanguage(Constants.NA);
                application.setCreateTime(new Date(1580091459000L));
                application.setUpdateTime(testDate(spanDto.getTimestamp()));
                Application appInMap = (Application) vertexModels.get(appName);
                if (appInMap != null) {
                    application.setCreateTime(appInMap.getCreateTime());
                }
                vertexModels.put(appName, application);
                Map<String, String> schema = spanDto.getSchema();
                String processName = schema.get(Constants.SCHEMA_INSTANCE);
                if (StringUtils.isEmpty(processName)) {
                    processName = spanDto.getServiceHostName() + nameSeparator + spanDto.getServiceHostIp();
                }
                Process process = new Process();
                process.setIpv4s(spanDto.getServiceHostIp());
                process.setServiceInstance(spanDto.getServiceHostIp());
                process.setName(processName);
                process.setHostName(spanDto.getServiceHostIp());
                process.setStatus(ProcessStatusCode.ALIVE.getName());
                process.setCreateTime(new Date(1580091459000L));
                process.setUpdateTime(testDate(spanDto.getTimestamp()));
                Process processInMap = (Process) vertexModels.get(processName);
                if (processInMap != null) {
                    process.setCreateTime(processInMap.getCreateTime());
                }
                vertexModels.put(processName, process);
                CreateOn appToProcessCreateOn = getCreateOn(appName, processName, testDate(spanDto.getTimestamp()));
                CreateOn createOnInMap = (CreateOn) edgeModels.get(appToProcessCreateOn.getName());
                if (createOnInMap != null) {
                    appToProcessCreateOn.setCreateTime(createOnInMap.getCreateTime());
                }
                edgeModels.put(appToProcessCreateOn.getName(), appToProcessCreateOn);
            }
        }
        batchAddOrUpdateVertexs(vertexModels);
        batchUpdateEdges(edgeModels);
    }

    @Override
    public void afterPropertiesSet() {
    }

    private Date testDate(long timeStamp) {
        Date date = new Date(timeStamp);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.YEAR, -1);
        return calendar.getTime();
    }

    /**
     * 批量更新点
     *
     * @param vertexsMap 批量点
     */
    private void batchAddOrUpdateVertexs(Map<String, VertexModel> vertexsMap) {
        if (vertexsMap == null || vertexsMap.size() == 0) {
            LOGGER.info("vertexsMap is null.");
            return;
        }
        List<String> names = new ArrayList<>(vertexsMap.keySet());
        try {
            Map<String, VertexModel> vertexModelMapInGes = siNanClient.queryBatchVertices(names);
            List<VertexModel> result = vertexsMap.values().stream().peek(vertexModel -> {
                VertexModel vertexModelInGes = vertexModelMapInGes.get(vertexModel.getName());
                if (vertexModelInGes != null) {
                    vertexModel.setCreateTime(vertexModelInGes.getCreateTime());
                }
            }).collect(Collectors.toList());
            siNanClient.addOrUpdateBatchVertices(result);
        } catch (ClientException e) {
            LOGGER.error("invoke sinan-client error, {}", e.getMessage());
        }
    }

    /**
     * 批量更新边
     *
     * @param edgesMap 批量边
     */
    private void batchUpdateEdges(Map<String, EdgeModel> edgesMap) {
        if (edgesMap == null || edgesMap.size() == 0) {
            LOGGER.info("edgesMap is null.");
            return;
        }
        try {
            List<EdgeModel> edgeModelList = edgesMap.values().stream().filter(edgeModel -> {
                Map<String, Object> edgeModelInGes = siNanClient.isExistStaticEdge(edgeModel.getName());
                if (edgeModelInGes != null) {
                    edgeModel.setCreateTime((Date) edgeModelInGes.get("createTime"));
                }
                return true;
            }).collect(Collectors.toList());
            if (edgeModelList.size() > 0) {
                siNanClient.addOrUpdateBatchEdges(edgeModelList);
            }
        } catch (ClientException e) {
            LOGGER.error("invoke sinan-client error, {}", e.getMessage());
        }
    }

    /**
     * 添加create on
     *
     * @param source     起点
     * @param target     终点
     * @param date 时间
     * @return createOn边
     */
    private CreateOn getCreateOn(String source, String target, Date date) {
        if (StringUtils.isEmpty(source) || StringUtils.isEmpty(target)) {
            LOGGER.error("fail to create createOn. source is {}. target is {}. date is {}", source, target, date);
            return null;
        }
        CreateOn createOn = new CreateOn();
        createOn.setSource(source);
        createOn.setTarget(target);
        createOn.setName(source + nameSeparator + target);
        createOn.setCreateTime(new Date(1580091459000L));
        createOn.setUpdateTime(date);
        return createOn;
    }
}
