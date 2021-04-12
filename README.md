/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2020. All rights reserved.
 */
package com.huawei.sinan.topoprocessor.serde;

import java.util.Map;

import org.apache.kafka.common.serialization.Serializer;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.huawei.sinan.topoprocessor.processor.entity.SpanDto;

/**
 * 功能描述 dto序列化类
 *
 * @since 2021-03-18
 */
@Component
public class SpanDtoSerdeSerializer implements Serializer<SpanDto> {
    @Override
    public void configure(Map<String, ?> configs, boolean isKey) {

    }

    @Override
    public byte[] serialize(String s, SpanDto obj) {
        return JSONObject.toJSONString(obj).getBytes();
    }

    @Override
    public void close() {

    }
}
