#

![SUD](../../Resource/logo.png)

## 简要描述

- 查询授权房间列表

## 请求URL

- 测试环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中auth_room_list字段
- 生产环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中auth_room_list字段

## 请求方式

- 传输协议：HTTPS
- 请求方法：POST
- 参数以body传递，格式为json（见请求示例）
- Header中需要添加：Content-Type: application/json;charset=utf-8
- Header中需要添加：认证请求头 Authorization

## 请求头 [Authorization]

- [认证请求头Authorization实现方式](AuthorizationDescription.md)


## 请求参数

| 参数名          | 必选  | 类型     | 说明                                |
|:-------------|:----|:-------|-----------------------------------|
| auth_secret  | 是   | string | 应用授权串                             |
| changed_time | 否   | string | 房间变更时间戳(精确到毫秒), 用于查询该时间戳前已变更的房间列表 |

## 请求示例

```json
{
  "auth_secret": "auth_secret1",
  "changed_time": "1657091216000"
}
```

## 返回参数

- BaseResp

| 参数名      | 必选  | 类型                             | 说明   |
|:---------|:----|:-------------------------------|------|
| ret_code | 是   | int                            | 响应码  |
| ret_msg  | 是   | string                         | 响应信息 |
| data     | 否   | AppServerQueryAuthRoomListResp | 响应数据 |

- AppServerQueryAuthRoomListResp

| 参数名        | 必选  | 类型             | 说明                 |
|:-----------|:----|:---------------|--------------------|
| room_infos | 是   | AuthRoomInfo[] | 房间信息列表             |
| pagination | 否   | Pagination     | 分页信息，为null则表示没有下一页 |

- AuthRoomInfo

| 参数名               | 必选  | 类型     | 说明                                          |
|:------------------|:----|:-------|---------------------------------------------|
| room_id           | 是   | string | 房间id                                        |
| mg_id             | 是   | string | 游戏id                                        |
| status            | 是   | string | 房间状态: <br> WATING: 等待游戏开始 <br> PLAYING: 游戏中 |
| player_total      | 是   | int32  | 玩家总数                                        |
| ob_total          | 是   | int32  | 观众总数                                        |
| last_changed_time | 是   | string | 最新变更时间戳 (精确到毫秒)                             |

- Pagination

| 参数名          | 必选  | 类型     | 说明                  |
|:-------------|:----|:-------|---------------------|
| changed_time | 是   | string | 下一页 房间变更时间戳 (精确到毫秒) |

## 返回示例

```json
{
  "ret_code": 0,
  "ret_msg": "",
  "data": {
    "room_infos": [{
      "room_id": "9009",
      "mg_id": "mg_id_1",
      "room_status": "PLAYING",
      "player_total": 3,
      "ob_total": 10,
      "last_changed_time": "1657091217000"
    }],
    "pagination": {
      "changed_time": "1657091218000"
    }
  }
}
```
