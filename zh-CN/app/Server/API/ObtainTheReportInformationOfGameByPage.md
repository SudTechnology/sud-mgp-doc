#

![SUD](../../Resource/logo.png)

## 简要描述

- 服务端根据app_id，app_secret, room_id, page_no, page_size 分页获取房间内游戏上报信息
- 数据只支持查询一个月以内的游戏局信息
- 当前接口针对每个app_id请求限制频率为10次/秒

## 请求URL

- 测试环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中get_game_report_info_page字段
- 生产环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中get_game_report_info_page字段

## 请求方式
- 传输协议：HTTPS
- 请求方法：POST
- 参数以body传递，格式为json（见请求示例）
- Header中需要添加：Content-Type: application/json;charset=utf-8

## 请求参数

| 参数名        |必选|类型| 说明                  |
|:-----------|:---|:-----|---------------------|
| app_id     |是  |string | app_id              |
| app_secret |是  |string | app_secret          |
| room_id    |是  |string | 房间ID                |
| page_no    |否  |int32 | 页码（默认值: 0）          |
| page_size  |否  |int32 | 页数（默认值: 5, 最大值: 10） |

## 请求示例

```json
{
  "app_id": "1461564080052506636",
  "app_secret": "xJL0HU9ailVSGInqPyNK3Ev3qNHReRbR",
  "room_id": "9009",
  "page_no": 0,
  "page_size": 10
}
```

## 返回参数

- BaseResp

|参数名|必选| 类型                     | 说明   |
|:----    |:---|:-----------------------|------|
|ret_code |是  | int                    | 响应码  |
|ret_msg |是  | string                 | 响应信息 |
|data |是 | List< GameReportInfo > | 响应数据 |

- GameReportInfo

|参数名|必选| 类型     | 说明                 |
|:----    |:---|:----- |-----   |
|game_round_id |是  |string |游戏局ID  |
|report_info |是  |map | 上报信息    |

- report_info 键值对应表

| 键名          | 值类型         | 说明     |
|:------------|:------------|:-------|
| game_start  | game_start_object | 战斗开始通知 |
| game_settle | game_settle_object | 战斗结算通知 |

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
|role |否 |int32|0:表示没有角色信息，玩家在游戏中的角色 [游戏role 说明](../HttpsCallback/game/GameRole.md)|
|score |否 |int32|玩家当前局得到的分数 |
|is_win |否 |int32|结果 0:表示没有信息，1:输，2:赢，3:平局|
|award |否 |int32|奖励 |
|extras |否 |string|扩展参数[扩展说明](../HttpsCallback/game/GameExtras.md)|
|is_managed |否 |int32|是否托管 0:未托管 1:托管 |

## 返回示例

```json
{
  "ret_code": 0,
  "ret_msg": "",
  "data": [
    {
      "game_round_id": "ce56b6lzi1a7-cqhuiaj1wlh6-cpgxupfcpbrg",
      "report_info": {
        "game_start": {
          "mg_id": 1472142559912517631,
          "room_id": "9009",
          "mg_id_str": "1472142559912517633",
          "players": [
            {
              "is_ai": 0,
              "uid": "515b8e0b"
            },
            {
              "is_ai": 0,
              "uid": "09d032dd"
            }
          ],
          "game_mode": 1,
          "game_round_id": "ce56b6lzi1a7-cqhuiaj1wlh6-cpgxupfcpbrg",
          "battle_start_at": 1642500300
        }
      }
    },
    {
      "game_round_id": "ce56b6lzi1a7-cqhuiaj1wlh6-cpgxupfcpbrf",
      "report_info": {
        "game_start": {
          "mg_id": 1472142559912517631,
          "room_id": "9009",
          "mg_id_str": "1472142559912517633",
          "players": [
            {
              "is_ai": 0,
              "uid": "515b8e0b"
            },
            {
              "is_ai": 0,
              "uid": "09d032dd"
            }
          ],
          "game_mode": 1,
          "game_round_id": "ce56b6lzi1a7-cqhuiaj1wlh6-cpgxupfcpbrf",
          "battle_start_at": 1642500300
        }
      }
    }
  ]
}
```
