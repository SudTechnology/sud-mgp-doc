#

![SUD](../../Resource/logo.png)

## 简要描述

- 查询单场游戏基础信息

## 请求URL

- 测试环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中query_match_base字段
- 生产环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中query_match_base字段

## 请求方式

- 传输协议：HTTPS
- 请求方法：POST
- 参数以body传递，格式为json（见请求示例）
- Header中需要添加：Content-Type: application/json;charset=utf-8
- Header中需要添加：认证请求头 Authorization

## 请求头 [Authorization]

- [认证请求头Authorization实现方式](AuthorizationDescription.md)

## 请求参数

| 参数名                  | 必选   | 类型     | 说明                                                                                                      |
|:---------------------|:-----|:-------|---------------------------------------------------------------------------------------------------------|
| match_id             | 特殊可选 | string | 游戏场次id，和report_game_info_key不能同时为空                                                                      |
| report_game_info_key | 特殊可选 | string | 游戏开始时传入的上报信息key，和match_id能同时为空。<br>report_game_info_key和match_id同时存在，则match_id优先级高于report_game_info_key |

## 请求示例

```json
{
  "match_id": "1659497694003"
}
```

## 返回参数

- BaseResp

| 参数名      | 必选  | 类型                          | 说明   |
|:---------|:----|:----------------------------|------|
| ret_code | 是   | int                         | 响应码  |
| ret_msg  | 是   | string                      | 响应信息 |
| data     | 是   | AppServerQueryMatchBaseResp | 响应数据 |

- AppServerQueryMatchBaseResp

| 参数名                     | 必选  | 类型                  | 说明                                         |
|:------------------------|:----|:--------------------|--------------------------------------------|
| mg_id                   | 是   | string              | 游戏id                                       |14615640800525066
| room_id                 | 是   | string              | 房间id                                       |9009
| game_mode               | 是   | int32               | 游戏模式                                       |1
| match_id                | 是   | string              | 游戏场次id                                     |ce56b6lzi1a7
| battle_start_at         | 是   | string              | 游戏开始时间戳(秒)                                 |1663991010
| battle_end_at           | 否   | string              | 游戏结束时间戳(秒)                                 |1663991020
| battle_duration         | 否   | string              | 游戏持续时间(秒)                                  |10
| results                 | 否   | PlayerSettleModel[] | 玩家结算数据                                     |<br>
| report_game_info_key    | 否   | string              | 游戏开始时传入的上报信息key                            |<br>
| report_game_info_extras | 否   | string              | 游戏开始时传入的扩展参数                               |<br>
| status                  | 是   | string              | 游戏场次状态: <br> PLAYING: 游戏中，<br> CLOSED: 已结束 | CLOSED

- PlayerSettleModel

| 参数名          | 必选  | 类型     | 说明            | 示例值  |
|:-------------|:----|:-------|---------------|------|
| uid          | 是   | string | 用户uid，机器人为空字符 | u001 |
| is_ai        | 是   | int32  | 0:普通用户，1:机器人  | 0    |
| score        | 是   | int32  | 玩家该场游戏得到的总分   | 10   |
| remain_score | 是   | int32  | 玩家剩余的积分       | 100  |

## 返回示例

```json
{
  "ret_code": 0,
  "ret_msg": "",
  "data": {
    "mg_id": "1557194155570024449",
    "room_id": "90091",
    "game_mode": 1,
    "match_id": "ce56b6lzi1a7-cf75pcvbs7j1-cx5h93twefna",
    "battle_start_at": "1664333908",
    "battle_end_at": "1664334968",
    "battle_duration": "1060",
    "results": [
      {
        "is_ai": 0,
        "uid": "a4c1c93d",
        "score": -100,
        "remain_score": 0
      },
      {
        "is_ai": 0,
        "uid": "5cb0d3a5",
        "score": -100,
        "remain_score": 0
      }
    ],
    "report_game_info_key": "mkey001",
    "report_game_info_extras": "extras",
    "status": "CLOSED"
  }
}
```

## 业务错误码

| 错误码   | 错误描述     | 解决方案                         |
|:------|:---------|:-----------------------------|
| 10002 | 参数错误     | 检查请求参数，修改后重新发起请求             |
| 70420 | 该游戏场次不存在 | 检查传入的订单号、上报信息key是否正确，再重新发起请求 |
