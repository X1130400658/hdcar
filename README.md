/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2020. All rights reserved.
 */
package com.huawei.sinan.topoprocessor.serde;

import java.util.List;
import java.util.Map;

import org.apache.kafka.common.serialization.Serializer;

import com.alibaba.fastjson.JSONObject;
import com.huawei.sinan.topoprocessor.processor.entity.SpanDto;

/**
 * 功能描述
 *
 * @since 2021-03-18
 */
public class SpanSerdeSerializer implements Serializer<List<SpanDto>> {

    @Override
    public void configure(Map<String, ?> configs, boolean isKey) {

    }

    @Override
    public byte[] serialize(String s, List<SpanDto> obj) {
        return JSONObject.toJSONString(obj).getBytes();
    }

    @Override
    public void close() {

    }
}
