#

![SUD](../../../Resource/logo.png)

## 简要描述

- 操作游戏（服务端调用）

## 请求URL

- 测试环境：接口地址详见[获取服务端API配置](../ObtainServerEndAPIConfigurations.md)中bullet_api对象中字段
- 生产环境：接口地址详见[获取服务端API配置](../ObtainServerEndAPIConfigurations.md)中bullet_api对象中字段

## 请求方式

- 传输协议：HTTPS
- 请求方法：POST
- 参数以body传递，格式为json（见请求示例）
- Header中需要添加：Content-Type: application/json;charset=utf-8
- Header中需要添加：认证请求头 Authorization，以及请求唯一值 RequestId

## 请求头

| Header Name     | Header Value                                                                                 |
|:----------------|:---------------------------------------------------------------------------------------------|
| `RequestId`     | 每次请求的唯一值                                                                                     |
| `Authorization` | `Sud-Auth <params>`，参考：[认证请求头Authorization实现方式](../AuthorizationDescription.md) |

## 请求参数

| 参数名       | 必选  | 类型       | 说明   |
|:----------|:----|:---------|------|
| mg_id     | 是   | string   | 游戏id |
| room_id   | 是   | string   | 房间id |
| op_code   | 是   | int      | 操作码  |
| user_info | 是   | UserInfo | 用户信息 |
| data      | 是   | Object   | 操作数据 |

- UserInfo

| 参数名        | 必选  | 类型     | 说明   |
|------------|-----|--------|------|
| uid        | 是   | string | 用户id |
| nick_name  | 是   | string | 用户昵称 |
| avatar_url | 是   | string | 用户头像 |

- 操作码/操作数据对应表

| 操作码（op_code） | 操作数据（data）                                     | 说明  |
|--------------|------------------------------------------------|-----|
| 2            | [BulletComment](BulletOpData/BulletComment.md) | 弹幕  |
| 3            | [BulletGift](BulletOpData/BulletGift.md)       | 礼物  |


## 请求示例

```json
{
  "mg_id": "x",
  "room_id": "x",
  "op_code": 2,
  "user_info": {
    "uid": "x",
    "nick_name": "x",
    "avatar_url": "x",
    "gender": "male"
  },
  "data": {
    "content_code": 1
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
