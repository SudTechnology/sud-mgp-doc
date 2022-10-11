#

![SUD](../../../Resource/logo.png)

#### 简要描述

- 订单状态变更通知

#### 请求方式
- https
- POST
- 参数为Json格式，放在body内

#### 请求参数（可能会新增加字段，请服务端保持新增加字段兼容性）

| 参数名          | 必选  | 类型                | 说明             | 示例值                           |
|:-------------|:----|:------------------|----------------|-------------------------------|
| notify_id    | 是   | string            | 通知ID           | 0795d77f85789da0eb387a5096    |
| notify_time  | 是   | string            | 通知时服务端的时间戳（毫秒） | 1647834452408                 |
| app_id       | 是   | string            | 消息接收方的应用id     | 1                             |
| notify_event | 是   | string            | 通知事件           | sud.mg.merchant.order.changed |
| data         | 是   | OrderChangedModel | 通知数据           | {}                            |

##### OrderChangedModel

| 参数名          | 必选   | 类型     | 说明                                                                                           | 示例值               |
|:-------------|:-----|:-------|----------------------------------------------------------------------------------------------|-------------------|
| order_id     | 是    | string | SUD 订单号                                                                                      | 1659497694888     |
| out_order_id | 是    | string | 商户自定义唯一订单号                                                                                   | 1659497694000     |
| out_group_id | 否    | string | 商户自定义订单组id                                                                                   | 1659497694        |
| mg_id        | 是    | string | 游戏id                                                                                         | 14615640800525066 |
| room_id      | 是    | string | 房间id                                                                                         | 9009              |
| round_id     | 否    | string | 订单关联的游戏局id                                                                                   | ce56b6lzi1a7      |
| cmd          | 是    | string | 触发的行为动作                                                                                      | test              |
| from_uid     | 是    | string | 付费用户uid                                                                                      | u001              |
| to_uid       | 是    | string | 目标用户uid                                                                                      | u002              |
| value        | 否    | int32  | 所属的游戏价值                                                                                      | 1                 |
| seq          | 否    | int32  | 序列号 (默认：0) 游戏中对时序有要求时使用                                                                      | 0                 |
| payload      | 特殊可选 | json   | 附加数据                                                                                         | <br>              |
| status       | 是    | string | 订单状态: <br> CREATED (订单创建完成，待执行)， EXECUTING (执行中)，EXECUTE_FAIL (执行失败)， EXECUTE_SUCCESS (执行成功) | EXECUTE_SUCCESS   |

##### 消息验签
[验签](../CallbackSignatureVerify.md)

#### 请求示例
```
{
	"notify_id": "0795d77f85789da0eb387a50964993a3eba1fedfec2b12f729861392a9b5ad04",
	"notify_time": "1647844976502",
	"app_id": "14615640800525066",
	"notify_event": "sud.mg.merchant.order.changed",
	"data": {
		"order_id": "1659497694888",
		"out_order_id": "1659497694000",
		"out_group_id": "1659497694",
		"mg_id": "mgid01"
		"room_id": "9009",
		"round_id": "ce56b6lzi1a7-cqhcr6fgdnwg-c5vfwwj9h6mz",
		"cmd": "test",
		"from_uid": "001",
		"to_uid": "002"
		"value": 1,
		"seq": 0,
		"payload": {
			"score": 1
		}
		"status": "EXECUTE_SUCCESS"
	}
}
```
#### 通知应答
| 参数名      | 必选  | 类型     | 说明                       | 示例值     |
|:---------|:----|:-------|--------------------------|---------|
| ret_code | 是   | int32  | 返回状态码, 0为消息通知成功，其他错误码为失败 | 0       |
| ret_msg  | 是   | string | 返回消息                     | SUCCESS |

#### 应答示例
```
{
	"ret_code": 0,
	"ret_msg": "SUCCESS",
}
```
