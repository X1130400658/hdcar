/*
 * Copyright (c) Huawei Technologies Co.,Ltd. 2020-2021. All rights reserved.
 */
package com.huawei.sinan.topoprocessor.processor.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;

public class SpanDto {


    private String traceId;

    private String parentId;

    private String id;

    private String kind;

    private String name;

    @JsonProperty("service_host_name")
    private String serviceHostName;

    private Long timestamp;

    private Long duration;

    private Map<String, String> schema;

    private boolean shared;

    private String tags;

    private List<Annotation> annotations;

    private Long dealtime;

    public String getTraceId() {
        return traceId;
    }

    public void setTraceId(String traceId) {
        this.traceId = traceId;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Long timestamp) {
        this.timestamp = timestamp;
    }

    public Long getDuration() {
        return duration;
    }

    public void setDuration(Long duration) {
        this.duration = duration;
    }

    public boolean isShared() {
        return shared;
    }

    public void setShared(boolean shared) {
        this.shared = shared;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public List<Annotation> getAnnotations() {
        return annotations;
    }

    public void setAnnotations(List<Annotation> annotations) {
        this.annotations = annotations;
    }

    public Map<String, String> getSchema() {
        return schema;
    }

    public void setSchema(Map<String, String> schema) {
        this.schema = schema;
    }

    public String getServiceHostName() {
        return serviceHostName;
    }

    public void setServiceHostName(String serviceHostName) {
        this.serviceHostName = serviceHostName;
    }

    public Long getDealtime() {
        return dealtime;
    }

    public void setDealtime(Long dealtime) {
        this.dealtime = dealtime;
    }

    public boolean isLegal() {
        if (!StringUtils.hasText(id) || !StringUtils.hasText(traceId) || !StringUtils.hasText(kind)) {
            return false;
        }
        if (timestamp == null) {
            timestamp = System.currentTimeMillis();
        }
        if (duration == null) {
            duration = 0L;
        }
        return true;
    }

    @Override
    public String toString() {
        return "SpanDto{" +
                "traceId='" + traceId + '\'' +
                ", parentId='" + parentId + '\'' +
                ", id='" + id + '\'' +
                ", kind='" + kind + '\'' +
                ", name='" + name + '\'' +
                ", serviceHostName='" + serviceHostName + '\'' +
                ", timestamp=" + timestamp +
                ", duration=" + duration +
                ", schema=" + schema +
                ", shared=" + shared +
                ", tags='" + tags + '\'' +
                ", annotations=" + annotations +
                ", dealtime=" + dealtime +
                '}';
    }
}
