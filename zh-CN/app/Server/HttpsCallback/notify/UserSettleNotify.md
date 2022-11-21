#

![SUD](../../../Resource/logo.png)

#### 简要描述

- 用户结算通知

#### 请求方式
- https
- POST
- 参数为Json格式，放在body内

#### 请求参数（可能会新增加字段，请服务端保持新增加字段兼容性）

| 参数名          | 必选  | 类型              | 说明             | 示例值                         |
|:-------------|:----|:----------------|----------------|-----------------------------|
| notify_id    | 是   | string          | 通知ID           | 0795d77f85789da0eb387a5096  |
| notify_time  | 是   | string          | 通知时服务端的时间戳（毫秒） | 1647834452408               |
| app_id       | 是   | string          | 消息接收方的应用id     | 1                           |
| notify_event | 是   | string          | 通知事件           | sud.mg.merchant.user.settle |
| data         | 是   | UserSettleModel | 通知数据           | {}                          |

##### UserSettleModel

| 参数名       | 必选  | 类型                  | 说明       | 示例值               |
|:----------|:----|:--------------------|----------|-------------------|
| mg_id     | 是   | string              | 游戏id     | 14615640800525066 |
| room_id   | 是   | string              | 房间id     | 9009              |
| match_id  | 是   | string              | 游戏场次id   | ce56b6lzi1a7      |
| results   | 是   | PlayerSettleModel[] | 玩家结算数据   | <br>              |
| settle_at | 是   | string              | 结算时间戳(秒) | 1663991011        |

- PlayerSettleModel

| 参数名          | 必选  | 类型     | 说明            | 示例值           |
|:-------------|:----|:-------|---------------|---------------|
| uid          | 是   | string | 用户uid，机器人为空字符 | u001          |
| order_id     | 是   | string | 当次结算所归属的订单id  | 1663991011001 |
| out_order_id | 是   | string | 商户自定义的订单id    | ce56b6lzi1a   |
| is_ai        | 是   | int32  | 0:普通用户，1:机器人  | 0             |
| score        | 是   | int32  | 玩家当次结算得到的积分   | 10            |
| remain_score | 是   | int32  | 玩家当次结算剩余的积分   | 100           |

##### 消息验签
[验签](../CallbackSignatureVerify.md)

#### 请求示例
```
{
	"notify_id": "0795d77f85789da0eb387a50964993a3eba1fedfec2b12f729861392a9b5ad04",
	"notify_time": "1647844976502",
	"app_id": "14615640800525066",
	"notify_event": "sud.mg.merchant.user.settle",
	"data": {
		"mg_id": "mgid01"
		"room_id": "9009",
		"match_id": "match-001"，
		"results": [
			{
				"uid": "u001",
				"order_id": "1663991011001",
				"out_order_id": "ce56b6lzi1a",
				"is_ai": 0,
				"score": 10,
				"remain_score": 100
			},
			{
				"uid": "u002",
				"order_id": "1663991011002",
				"out_order_id": "ce56b6lzi1b",
				"is_ai": 0,
				"score": 20,
				"remain_score": 90
			}
		],
		"settle_at": "1663991011"
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
