#

![SUD](../../../Resource/logo.png)

## 简要描述

- 创建连接（服务端调用）

## 请求URL

- 测试环境：接口地址详见[获取服务端API配置](../ObtainServerEndAPIConfigurations.md)中bullet_api对象中字段
- 生产环境：接口地址详见[获取服务端API配置](../ObtainServerEndAPIConfigurations.md)中bullet_api对象中字段

## 请求方式

- 传输协议：HTTPS
- 请求方法：POST
- 参数以body传递，格式为json（见请求示例）
- Header中需要添加：Content-Type: application/json;charset=utf-8
- Header中需要添加：认证请求头 Authorization

## 请求头 [Authorization]

- [认证请求头Authorization实现方式](../AuthorizationDescription.md)

## 请求参数

| 参数名       | 必选  | 类型       | 说明   |
|:----------|:----|:---------|------|
| mg_id     | 是   | string   | 游戏id |
| room_id   | 是   | string   | 房间id |
| user_info | 是   | UserInfo | 用户信息 |

- UserInfo

| 参数名        | 必选  | 类型     | 说明   |
|------------|-----|--------|------|
| uid        | 是   | string | 用户id |
| nick_name  | 是   | string | 用户昵称 |
| avatar_url | 是   | string | 用户头像 |

## 请求示例

```json
{
  "mg_id": "xxx",
  "room_id": "xxx",
  "user_info":  {
    "uid": "xxx",
    "nick_name": "xxx",
    "avatar_url":"xxx"
  }
}
```

## 返回参数

- BaseResp

| 参数名      | 必选  | 类型                         | 说明   |
|:---------|:----|:---------------------------|------|
| ret_code | 是   | int                        | 响应码  |
| ret_msg  | 是   | string                     | 响应信息 |
| data     | 否   | AppserverBulletConnectResp | 响应数据 |

- AppserverBulletConnectResp

| 参数名   | 必选  | 类型     | 说明   |
|:------|:----|:-------|------|
| token | 是   | string | 连接令牌 |

## 返回示例

```json
{
  "ret_code": 0,
  "ret_msg": "",
  "data": {
    "token": "xxx"
  }
}
```
