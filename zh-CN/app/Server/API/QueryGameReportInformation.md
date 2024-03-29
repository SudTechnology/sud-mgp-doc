#

![SUD](../../Resource/logo.png)

## 简要描述

- 服务端根据game_round_id, report_game_info_key（自定义游戏局ID）, filter_types查询游戏上报信息
- 数据只支持查询一个月以内的游戏局信息
- 当前接口针对每个app_id请求限制频率为10次/秒

## 请求URL

- 测试环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中query_game_report_info字段
- 生产环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中query_game_report_info字段

## 请求方式
- 传输协议：HTTPS
- 请求方法：POST
- 参数以body传递，格式为json（见请求示例）
- Header中需要添加：Content-Type: application/json;charset=utf-8
- Header中需要添加：认证请求头Authorization

## 请求头 [Authorization]
- [认证请求头Authorization实现方式](AuthorizationDescription.md)

## 请求参数

| 参数名                  | 必选   | 类型       | 说明                                                                                                        |
|:---------------------|:-----|:---------|-----------------------------------------------------------------------------------------------------------|
| report_game_info_key | 特殊可选 | string   | 上报游戏信息时传入的上报信息key，和game_round_id不能同时为空。<br>  game_round_id 和 reoprt_game_info_key 如果同时存在优先取 game_round_id |
| game_round_id        | 特殊可选 | string   | 游戏局id， 和report_game_info_key不能同时为空                                                                        |
| filter_types         | 可选   | string[] | 过滤上报类型，数组格式， 不传则返回所有的上报类型。包括但不限于: <br>["game_start", "game_settle"]                                       |


## 请求示例

```json
{
  "game_round_id": "de56b6lzi1a7-cqhuiaj1wlh6-apgxupfcpbrf"
}
```

## 返回参数

- BaseResp

| 参数名      | 必选  | 类型                  | 说明                |
|:---------|:----|:--------------------|-------------------|
| ret_code | 是   | int                 | 响应码               |
| ret_msg  | 是   | string              | 响应信息              |
| data     | 是   | map<string, object> | 响应数据 <上报类型， 上报数据> |

- 上报类型 对应表

| 上报类型        | 上报数据               | 说明     |
|:------------|:-------------------|--------|
| game_start  | game_start_object  | 战斗开始通知 |
| game_settle | game_settle_object | 战斗结算通知 |

- game_start_object

| 参数名                  | 必选  | 类型            | 说明                      |
|:---------------------|:----|:--------------|-------------------------|
| mg_id                | 是   | int64         | 游戏id                    |
| mg_id_str            | 是   | string        | 小游戏id数值型兼容字段（nodejs服务请使用当前字段） |
| room_id              | 是   | string        | 房间id                    |
| game_mode            | 是   | int32         | 游戏模式                    |
| game_round_id        | 是   | string        | 本局游戏的id （重复上报，使用该字段去重）  |
| battle_start_at      | 是   | int32         | 战斗开始时间（秒）               |
| players              | 是   | player_object | player_object 数组        |
| report_game_info_key | 否   | string        | 自定义上报信息key              |

- player_object

| 参数名   | 必选  | 类型     | 说明           |
|:------|:----|:-------|--------------|
| uid   | 是   | string | 用户ID，机器人为空字符 |
| is_ai | 是   | int32  | 0:普通用户，1:机器人 |


- game_settle_object

| 参数名                  | 必选  | 类型                   | 说明                      |
|:---------------------|:----|:---------------------|-------------------------|
| mg_id                | 是   | int64                | 游戏id                    |
| mg_id_str            | 是   | string               | 小游戏id数值型兼容字段（nodejs服务请使用当前字段） |
| room_id              | 是   | string               | 房间id                    |
| game_mode            | 是   | int32                | 游戏模式                    |
| game_round_id        | 是   | string               | 本局游戏的id （重复上报，使用该字段去重）  |
| battle_start_at      | 是   | int32                | 战斗开始时间（秒）               |
| battle_end_at        | 是   | int32                | 战斗结束时间（秒）               |
| battle_duration      | 是   | int32                | 战斗总时间（秒）                |
| results              | 是   | player_result_object | player_result_object 数组 |
| report_game_info_key | 否   | string               | 自定义上报信息key              |


- player_result_object

| 参数名        | 必选  | 类型     | 说明            |
|:-----------|:----|:-------|---------------|
| uid        | 是   | string | 用户ID，机器人为空字符  |
| rank       | 是   | int32  | 排名从1开始，平局排名相同 |
| is_escaped | 是   | int32  | 0:正常，1:逃跑     |
| is_ai      | 是   | int32  | 0:普通用户，1:机器人  |
| role       | 否   | int32  | 0:表示没有角色信息，玩家在游戏中的角色 [游戏role 说明](../HttpsCallback/game/GameRole.md)|
| score      | 否   | int32  | 玩家当前局得到的分数 |
| is_win     | 否   | int32  | 结果 0:表示没有信息，1:输，2:赢，3:平局|
| award      | 否   | int32  | 奖励 |
| extras     | 否   | string | 扩展参数[扩展说明](../HttpsCallback/game/GameExtras.md)|
| is_managed | 否   | int32  | 是否托管 0:未托管 1:托管 |

## 返回示例

```json
{
  "ret_code": 0,
  "ret_msg": "",
  "data": {
    "game_start": {
      "mg_id": 1468434723902660610,
      "room_id": "9009",
      "report_game_info_extras": "world!",
      "mg_id_str": "1468434723902660610",
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
      "report_game_info_key": "key!@!1",
      "game_round_id": "de56b6lzi1a7-cqhuiaj1wlh6-apgxupfcpbrf",
      "battle_start_at": 1652426471
    },
    "game_settle": {
      "mg_id": 1468434723902660610,
      "room_id": "9009",
      "battle_end_at": 1652425480,
      "report_game_info_extras": "hello",
      "mg_id_str": "1468434723902660610",
      "game_mode": 1,
      "report_game_info_key": "key!@!1",
      "game_round_id": "de56b6lzi1a7-cqhuiaj1wlh6-apgxupfcpbrf",
      "battle_start_at": 1652426471,
      "results": [
        {
          "is_ai": 0,
          "uid": "b71e0ced",
          "score": 0,
          "rank": 1,
          "is_escaped": 0
        },
        {
          "is_ai": 0,
          "uid": "17864733",
          "score": 0,
          "rank": 2,
          "is_escaped": 0
        }
      ],
      "battle_duration": 10
    }
  }
}
```
