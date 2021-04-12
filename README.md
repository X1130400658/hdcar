/*
 * Copyright (c) Huawei Technologies Co.,Ltd. 2020-2021. All rights reserved.
 */
package com.huawei.sinan.topoprocessor.processor.entity;

import java.util.Map;

/**
 * 功能描述
 *
 * @since 2021-03-19
 */
public class Annotation {

    private Map<String, String> endpoint;

    private String value;

    private long timestamp;

    public Annotation(Map<String, String> endpoint, String value, long timestamp) {
        this.endpoint = endpoint;
        this.value = value;
        this.timestamp = timestamp;
    }

    public Map<String, String> getEndpoint() {
        return endpoint;
    }

    public void setEndpoint(Map<String, String> endpoint) {
        this.endpoint = endpoint;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(long timestamp) {
        this.timestamp = timestamp;
    }

    @Override
    public String toString() {
        return "Annotation{" +
                "endpoint=" + endpoint +
                ", value='" + value + '\'' +
                ", timestamp=" + timestamp +
                '}';
    }
}
