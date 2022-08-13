#

![SUD](../../Resource/logo.png)

## 简要描述

- 弹幕服务切换游戏

## 请求URL

- 测试环境：
- 生产环境：

## 请求方式

- 传输协议：HTTPS
- 请求方法：POST
- 参数以body传递，格式为json（见请求示例）
- Header中需要添加：Content-Type: application/json;charset=utf-8
- Header中需要添加：认证请求头 Authorization

## 请求头 [Authorization]

- [认证请求头Authorization实现方式](../ServerSDKAPI/AuthorizationDescription.md)

## 请求参数

| 参数名     | 必选  | 类型       | 说明       |
|:--------|:----|:---------|----------|
| mg_id   | 是   | string   | 要切换的游戏id |
| room_id | 是   | string   | 房间id     |

## 请求示例

```json
{
  "mg_id": "xxx",
  "room_id": "xxx"
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
