---
weight: 999
title: "RabbitMQ"
description: ""
icon: "article"
date: "2025-11-03T10:59:56+08:00"
lastmod: "2025-11-03T10:59:56+08:00"
draft: false
toc: true
 

---

# 基础知识

## 交换机类型

### DirectExchange（直连）

精确匹配routingKey

| routingKey   | 去向   |
| ------------ | ------ |
| order.create | queue1 |
| order.pay    | queue2 |

### TopicExchange（通配符）

支持模糊匹配

```
*  = 一个词
#  = 多个词
```

示例：

```
order.*      → 匹配 order.create
order.#      → 匹配 order.create.success
```

### FanoutExchange（广播）

不看routingKey，全部发送

### HeadersExchange（头部匹配）

```
headers["type"] = "report"
```

# 参数设置

## 队列参数

| 参数名称                | 含义                                                         |      |
| ----------------------- | ------------------------------------------------------------ | ---- |
| auto expire             | 队列多久没有被使用就删除                                     |      |
| message-ttl             | 消息过期时间，过期后进入死信队列（如果配置了）               |      |
| overflow behaviour      | 溢出策略（drop-head/默认行为-丢弃头部、reject-push/拒绝后续消息） |      |
| single active consumer  | 单机消费者                                                   |      |
| dead letter exchange    | 当消息过期或者被拒绝时，消息发送到的交换机                   |      |
| dead letter routing key | 当消息过期或者被拒绝时，消息转发给死信交换机时的routingKey   |      |
| max length              | 队列最大长度，超出后丢弃头部消息                             |      |
| max length bytes        | 队列总大小（字节）                                           |      |
| leader locator          |                                                              |      |

