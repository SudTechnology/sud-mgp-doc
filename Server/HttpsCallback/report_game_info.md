#

![SUD](../../Resource/logo.png)

## 简要描述

- 游戏服务端上报游戏接入方的游戏的数据

## 请求URL

- 分为测试环境和生产环境，需要通知Sud分别进行配置
- 生产环境地址需要正式上线部署后才能生效

  
## 请求方式
- https
- POST
- 参数为Json格式，放在body内

## 请求参数（可能会新增加字段，请接入方保持新增加字段兼容性）


|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|report_type |是  |string |上报类型  |
|report_msg |是  |object |上报数据对象  |
|uid |是  |string |接入方用户id （鉴权使用）  |
|ss_token  |是  |string |接入方服务端生成ss_token （鉴权使用）   |

##### report_type 参数对应表

|参数类型|参数值|report_msg 对应类型|说明|
|:----|:---|:-----|-----|
|report_type |game_start  |game_start_object |战斗开始通知|
|report_type |game_settle  |game_settle_object |战斗结算通知|

- game_start_object

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|mg_id |是  |int64 |游戏id |
|mg_id_str |是  |string |小游戏id数值型兼容字段（nodejs服务请使用当前字段） |
|room_id |是 |string |接入方房间id  |
|game_mode  |是 |int32 |游戏模式  |
|game_round_id |是 |string |本局游戏的id （重复上报，使用该字段去重） |
|battle_start_at |是 |int32 |战斗开始时间（秒）  |
|players |是 |player_object |player_object 数组 |
|custom_param |是 |string |接入方自定义信息，取值范围：长度不超过1024字节 |

- player_object

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|uid |是 |string|接入方uid，机器人为空字符 |
|is_ai |是 |int32|0:普通用户，1:机器人 |


- game_settle_object

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|mg_id |是  |int64 |游戏id |
|mg_id_str |是  |string |小游戏id数值型兼容字段（nodejs服务请使用当前字段） |
|room_id |是 |string |接入方房间id  |
|game_mode  |是 |int32 |游戏模式  |
|game_round_id |是 |string |本局游戏的id （重复上报，使用该字段去重） |
|battle_start_at |是 |int32 |战斗开始时间（秒）  |
|battle_end_at |是 |int32 |战斗结束时间（秒）  |
|battle_duration |是 |int32 |战斗总时间（秒） |
|results  |是 |player_result_object |player_result_object 数组 |

- player_result_object

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|uid |是 |string|接入方uid，机器人为空字符 |
|rank |是 |int32|排名从1开始，平局排名相同 |
|is_escaped |是 |int32|0:正常，1:逃跑 |
|is_ai |是 |int32|0:普通用户，1:机器人 |
|role |否 |int32|玩家在游戏中的角色 [游戏role 说明](./game/游戏role说明.md)|

## game_start 请求示例
```json
{
	"report_type": "game_start",
	"report_msg": {
		"mg_id": 1461227817776713818,
		"mg_id_str": "1461227817776713818",
		"room_id": "xxx123",
		"game_mode": 1,
		"game_round_id": "ce56b6lzi1a7-cehorlmy01pq-cqkdd39jyrmz",
		"battle_start_at": 1638845715,
		"players": [{
			"uid": "u2",
			"is_ai": 0
		}, {
			"uid": "u1",
			"is_ai": 0
		}]
	},
	"uid": "u1",
	"ss_token": "fyRTOsubRLCGrRvKoKm7wIcMM1DL7cfb"
}
```

## game_finish 请求示例
```json
{
	"report_type": "game_settle",
	"report_msg": {
		"mg_id": 1461227817776713818,
		"mg_id_str": "1461227817776713818",
		"room_id": "xxx123",
		"game_mode": 1,
		"game_round_id": "ce56b6lzi1a7-cehorlmy01pq-cqkdd39jyrmz",
		"battle_start_at": 1638845715,
		"battle_end_at": 1638845720,
		"battle_duration": 5,
		"results": [{
			"uid": "u2",
			"rank": 1,
			"is_escaped": 0,
			"is_ai": 0,
			"role": 0
		}, {
			"uid": "",
			"rank": 2,
			"is_escaped": 0,
			"is_ai": 1,
			"role": 0
		}]
	},
	"uid": "u1",
	"ss_token": "fyRTOsubRLCGrRvKoKm7wIcMM1DL7cfb"
}

```

## 返回参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|-|-|-|-|

## 返回示例

```json
{
    "ret_code": 0,// 0:成功，其他表示错误
    "ret_msg": "",
    "data": {}
}
```

##### 备注 

- 请求失败或者返回ret_code!=0，间隔一分钟后重试，最多重新请求3次。