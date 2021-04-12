/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2020. All rights reserved.
 */
package com.huawei.sinan.topoprocessor.serde;

import java.util.Map;

import org.apache.kafka.common.serialization.Deserializer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.huawei.sinan.topoprocessor.processor.entity.SpanDto;

/**
 * 功能描述 dto反序列化类
 *
 * @since 2021-03-18
 */
@Component
public class SpanDtoSerdeDeserializer implements Deserializer<SpanDto> {
    private static final Logger LOGGER = LoggerFactory.getLogger(SpanSerdeDeserializer.class);

    @Override
    public void configure(Map<String, ?> configs, boolean isKey) {

    }

    @Override
    public SpanDto deserialize(String s, byte[] bytes) {
        if (null == bytes) {
            return null;
        } else {
            SpanDto obj = JSONObject.parseObject(new String(bytes), SpanDto.class);
            LOGGER.debug("SpanDto is {}", obj.toString());
            return obj;
        }
    }

    @Override
    public void close() {

    }
}
