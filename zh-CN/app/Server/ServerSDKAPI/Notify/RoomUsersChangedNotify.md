#

![SUD](../../../Resource/logo.png)

#### 简要描述

- 房间用户人数变更通知

#### 请求方式
- https
- POST
- 参数为Json格式，放在body内

#### 请求参数（可能会新增加字段，请服务端保持新增加字段兼容性）

| 参数名          | 必选  | 类型                    | 说明             | 示例值                                |
|:-------------|:----|:----------------------|----------------|------------------------------------|
| notify_id    | 是   | string                | 通知ID           | 0795d77f85789da0eb387a5096         |
| notify_time  | 是   | string                | 通知时服务端的时间戳（毫秒） | 1647834452408                      |
| app_id       | 是   | string                | 消息接收方的应用id     | 1                                  |
| notify_event | 是   | string                | 通知事件           | sud.mg.merchant.room.users.changed |
| data         | 是   | RoomUsersChangedModel | 通知数据           | {}                                 |

##### RoomUsersChangedModel

| 参数名          | 必选  | 类型     | 说明        | 示例值               |
|:-------------|:----|:-------|-----------|-------------------|
| room_id      | 是   | string | 房间id      | 9009              |
| mg_id        | 是   | string | 游戏id      | 14615640800525066 |
| player_total | 是   | int32  | 玩家总人数     | 2                 |
| ob_total     | 是   | int32  | 观众总人数     | 2                 |
| changed_time | 是   | string | 变更时间戳(毫秒) | 1647844976502     |

##### 消息验签
[验签](../CallbackSignatureVerify.md)

#### 请求示例
```
{
	"notify_id": "0795d77f85789da0eb387a50964993a3eba1fedfec2b12f729861392a9b5ad04",
	"notify_time": "1647844976502",
	"app_id": "14615640800525066",
	"notify_event": "sud.mg.merchant.room.users.changed",
	"data": {
		"room_id": "9009",
		"mg_id": "mgid01"
		"player_total": 2,
		"ob_total": 2,
		"changed_time": "1647844976502"
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
