#

![SUD](../../../Resource/logo.png)

#### 简要描述

- 单场游戏结算通知

#### 请求方式
- https
- POST
- 参数为Json格式，放在body内

#### 请求参数（可能会新增加字段，请服务端保持新增加字段兼容性）

| 参数名          | 必选  | 类型               | 说明             | 示例值                          |
|:-------------|:----|:-----------------|----------------|------------------------------|
| notify_id    | 是   | string           | 通知ID           | 0795d77f85789da0eb387a5096   |
| notify_time  | 是   | string           | 通知时服务端的时间戳（毫秒） | 1647834452408                |
| app_id       | 是   | string           | 消息接收方的应用id     | 1                            |
| notify_event | 是   | string           | 通知事件           | sud.mg.merchant.match.settle |
| data         | 是   | MatchSettleModel | 通知数据           | {}                           |

##### MatchSettleModel

| 参数名                     | 必选  | 类型                  | 说明                       | 示例值               |
|:------------------------|:----|:--------------------|--------------------------|-------------------|
| mg_id                   | 是   | string              | 游戏id                     | 14615640800525066 |
| room_id                 | 是   | string              | 房间id                     | 9009              |
| game_mode               | 是   | int32               | 游戏模式                     | 1                 |
| match_id                | 是   | string              | 游戏场次id                   | ce56b6lzi1a7      |
| battle_start_at         | 是   | string              | 游戏开始时间戳(秒)               | 1663991010        |
| battle_end_at           | 是   | string              | 游戏结束时间戳(秒)               | 1663991020        |
| battle_duration         | 是   | string              | 游戏持续时间(秒)                | 10                |
| results                 | 是   | PlayerSettleModel[] | 玩家结算数据                   | <br>              |
| report_game_info_key    | 是   | string              | 游戏开始时传入的上报信息key, 64个字符以内 | <br>              |
| report_game_info_extras | 是   | string              | 游戏开始时传入的扩展参数, 1024个字符以内  | <br>              |

- PlayerSettleModel

| 参数名          | 必选  | 类型     | 说明            | 示例值  |
|:-------------|:----|:-------|---------------|------|
| uid          | 是   | string | 用户uid，机器人为空字符 | u001 |
| is_ai        | 是   | int32  | 0:普通用户，1:机器人  | 0    |
| score        | 是   | int32  | 玩家该场游戏得到的总分   | 10   |
| remain_score | 是   | int32  | 玩家剩余的积分       | 100  |

##### 消息验签
[验签](../CallbackSignatureVerify.md)

#### 请求示例
```
{
	"notify_id": "144884c98000100c-15da5e428a821000",
	"notify_time": "1664266669547",
	"app_id": "1461564080052506636",
	"notify_event": "sud.mg.merchant.match.settle",
	"data": {
		"mg_id": "1557194155570024449",
		"room_id": "9010",
		"game_mode": 1,
		"match_id": "ce56b6lzi1a7-cf75pcvbs7j1-cxjfg7fzupz0",
		"battle_start_at": "1664265322",
		"battle_end_at": "1664265594",
		"battle_duration": "272",
		"results": [{
			"is_ai": 0,
			"uid": "fa1c53c4",
			"score": -100,
			"remain_score": 0
		}, {
			"is_ai": 0,
			"uid": "f0818db8",
			"score": -100,
			"remain_score": 0
		}],
		"report_game_info_key": "key001",
		"report_game_info_extras": "extras"
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
