/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2020. All rights reserved.
 */
package com.huawei.sinan.topoprocessor.serde;

import org.apache.kafka.common.serialization.Serdes;

import com.huawei.sinan.topoprocessor.processor.entity.SpanDto;

/**
 * 功能描述 span序列化包装类
 *
 * @since 2021-03-18
 */
public class SpanSerde extends Serdes.WrapperSerde<SpanDto> {
    public SpanSerde() {
        super(new SpanDtoSerdeSerializer(), new SpanDtoSerdeDeserializer());
    }
}
