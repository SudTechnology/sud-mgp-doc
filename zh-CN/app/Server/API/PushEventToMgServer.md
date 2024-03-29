#

![SUD](../../Resource/logo.png)

## 简要描述

- 推送事件到游戏服务

## 请求URL

- 测试环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中push_event字段
- 生产环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中push_event字段

## 请求方式

- 传输协议：HTTPS
- 请求方法：POST
- 参数以body传递，格式为json（见请求示例）
- Header中需要添加：Content-Type: application/json;charset=utf-8
- Header中需要添加：认证请求头 Authorization

## 请求头 [Authorization]

- [认证请求头Authorization实现方式](AuthorizationDescription.md)

## 请求参数

| 参数名             | 必选  | 类型              | 说明                      |
|:----------------|:----|:----------------|-------------------------|
| event           | 是   | string          | 游戏事件                    |
| mg_id           | 是   | string          | 游戏id                    |
| timestamp       | 是   | string          | 推送时间戳 (毫秒)              |
| data            | 是   | object          | 事件数据                    |


## 游戏事件/事件数据（event/data） 对应表

| 游戏事件           | 事件数据                                                          | 说明          |
|:---------------|:--------------------------------------------------------------|:------------|
| user_in        | [UserInReqData](PushEventData/UserInReqData.md)               | 用户加入          |
| user_out       | [UserOutReqData](PushEventData/UserOutReqData.md)             | 用户退出          |
| user_ready     | [UserReadyReqData](PushEventData/UserReadyReqData.md)         | 用户准备/取消准备  |
| game_start     | [GameStartReqData](PushEventData/GameStartReqData.md)         | 游戏开始          |
| captain_change | [CaptainChangeReqData](PushEventData/CaptainChangeReqData.md) | 队长更换          |
| user_kick      | [UserKickReqData](PushEventData/UserKickReqData.md)           | 用户踢人          |
| game_end       | [GameEndReqData](PushEventData/GameEndReqData.md)             | 游戏结束          |
| game_setting   | [GameSettingReqData](PushEventData/GameSettingReqData.md)     | 游戏玩法设置      |
| ai_add         | [AiAddReqData](PushEventData/AiAddReqData.md)                 | 加入AI            |
| room_info      | [RoomInfoReqData](PushEventData/RoomInfoReqData.md)           | 获取房间座位信息   |
| quick_start    | [QuickStartReqData](PushEventData/QuickStartReqData.md)       | 一键开始一局游戏<br/>1. 判断消息中携带的用户信息是否合法，并初始化用户信息<br/>2. 如有正在进行中的游戏，会报错。没有进行中的游戏, 踢出当前在游戏位的所有玩家<br/> 3. 设置玩法配置（如飞行棋）<br/> 4. 消息中携带的用户加入游戏位 <br/>5. 所有人准备<br/> 6. 开一局游戏且初始化游戏场景 |
| room_clear     | [RoomClearReqData](PushEventData/RoomClearReqData.md)         | 房间重置清理<br/>1. 如有正在进行中的游戏，会结算游戏<br/>2. 踢出当前在游戏位的所有玩家 |

## 请求示例

```json
{
    "event": "user_in",
    "mg_id": "mg_id_1",
    "app_id": "app_id_1",
    "timestamp": 1657770493152,
    "data": {
        "uid": "uid_1",
        "room_id":"room_id_1",
        "mode": 1,
        "language":"zh-CN",
        "seat_index": -1,
        "is_seat_random": true,
        "team_id": 1
    }
}
```

## 返回参数

- BaseResp

| 参数名      | 必选  | 类型     | 说明   |
|:---------|:----|:-------|------|
| ret_code | 是   | int    | 响应码  |
| ret_msg  | 是   | string | 响应信息 |
| data     | 否   | object | 响应数据 |

## 返回示例

```json
{
  "ret_code": 0,
  "ret_msg": ""
}
```
