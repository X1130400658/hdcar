#=============== zipkin consumer config start=======================
# zipkin kafka主题
kafka.zipkin.topic=zipkin-test
# Event kafka集群地址
spring.kafka.zipkin.bootstrap-servers=100.93.25.28:9092,100.93.17.69:9092,100.94.169.19:9092
# 事件kafka消费者group id
spring.kafka.zipkin.consumer.group-id=zipkin-user-group-id
# 事件kafka消费者数量
kafka.zipkin.consumer.concurrency=1
# zipkin 最大拉取消息数
zipkin.max.poll.records=1000
# zipkin 最大拉取时间间隔
zipkin.max.poll.interval.ms = 600000
#=============== zipkin consumer config end=======================
