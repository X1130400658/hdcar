/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2020. All rights reserved.
 */
package com.huawei.sinan.topoprocessor.util;

import java.util.List;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.streams.processor.TimestampExtractor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.huawei.sinan.topoprocessor.processor.entity.SpanDto;

/**
 * 功能描述 span时间提取器
 *
 * @since 2021-03-19
 */
@Component
public class SpanTimestampExtractor implements TimestampExtractor {

    private static final Logger LOGGER = LoggerFactory.getLogger(SpanTimestampExtractor.class);

    @Override
    public long extract(ConsumerRecord<Object, Object> record, long partitionTime) {
        try {
            if (record.value() != null) {
                List<SpanDto> list = (List<SpanDto>) record.value();
                if (list.size() > 0) {
                    return list.get(0).getTimestamp();
                }
                return record.timestamp();
            }
            return System.currentTimeMillis();
        } catch (Exception e) {
            LOGGER.error("Failed to extract time");
        }
        return 0L;
    }
}
