/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2020. All rights reserved.
 */
package com.huawei.sinan.topoprocessor.serde;

import java.util.List;
import java.util.Map;

import org.apache.kafka.common.serialization.Deserializer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.huawei.sinan.topoprocessor.processor.entity.SpanDto;

/**
 * 功能描述
 *
 * @since 2021-03-18
 */
@Component
public class SpanSerdeDeserializer implements Deserializer<List<SpanDto>> {
    private static final Logger LOGGER = LoggerFactory.getLogger(SpanSerdeDeserializer.class);

    @Override
    public void configure(Map<String, ?> configs, boolean isKey) {

    }

    @Override
    public List<SpanDto> deserialize(String s, byte[] bytes) {
        if (null == bytes) {
            return null;
        } else {
            try {
                //LOGGER.info("List<SpanDto> is {}", new String(bytes));
                List<SpanDto> obj = JSON.parseArray(new String(bytes), SpanDto.class);
                return obj;
            } catch (Exception e) {
                LOGGER.error("fail to parse msg.{}", e.getMessage());
                return null;
            }
        }
    }

    @Override
    public void close() {

    }
}
