#

![SUD](../../Resource/logo.png)

## 简要描述

- 游戏内付费下单

## 请求URL

- 测试环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中create_order字段
- 生产环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中create_order字段

## 请求方式

- 传输协议：HTTPS
- 请求方法：POST
- 参数以body传递，格式为json（见请求示例）
- Header中需要添加：Content-Type: application/json;charset=utf-8
- Header中需要添加：认证请求头 Authorization

## 请求头 [Authorization]

- [认证请求头Authorization实现方式](AuthorizationDescription.md)

## 请求参数

| 参数名          | 必选   | 类型     | 说明                             |
|:-------------|:-----|:-------|--------------------------------|
| out_order_id | 是    | string | 商户自定义唯一订单号id (64个字符以内)         | 
| out_group_id | 否    | string | 商户自定义订单组id（64个字符以内，用于归类同一组订单id | 
| mg_id        | 是    | string | 游戏id                           | 
| room_id      | 是    | string | 房间id                           | 
| cmd          | 是    | string | 触发的行为动作                        | 
| from_uid     | 是    | string | 付费用户uid                        | 
| to_uid       | 是    | string | 目标用户uid                        | 
| value        | 是    | int32  | 所属的游戏价值                        |
| payload      | 特殊可选 | json   | 附加数据                           |

- cmd | payload 参数对应表

| cmd       | payload | 说明   |
|:----------|:--------|:-----|
| add_score | <br>    | 带入积分 |


## 请求示例

```json
{
  "out_order_id": "1659497694000",
  "out_group_id": "1659497694",
  "mg_id": "1461228379255603251",
  "room_id": "9009",
  "round_id": "ce56b6lzi1a7-cqhcr6fgdnwg-c5vfwwj9h6mz",
  "cmd": "add_score",
  "from_uid": "001",
  "to_uid": "002",
  "value": 100
}
```

## 返回参数

- BaseResp

| 参数名      | 必选  | 类型                       | 说明   |
|:---------|:----|:-------------------------|------|
| ret_code | 是   | int                      | 响应码  |
| ret_msg  | 是   | string                   | 响应信息 |
| data     | 是   | AppServerCreateOrderResp | 响应数据 |

- AppServerCreateOrderResp

| 参数名          | 必选  | 类型     | 说明        |
|:-------------|:----|:-------|-----------|
| out_order_id | 是   | string | 商户订单号id   |
| order_id     | 是   | string | SUD 订单号id |

## 返回示例

```json
{
  "ret_code": 0,
  "ret_msg": "",
  "data": {
    "out_order_id": "1659497694000",
    "order_id": "order_id_1"
  }
}
```

## 业务错误码

| 错误码   | 错误描述   | 解决方案                      |
|:------|:-------|:--------------------------|
| 10002 | 参数错误   | 检查请求参数，修改后重新发起请求          |
| 70501 | 订单号已存在 | 修改商户自定义的订单号，保证唯一性，再重新发起请求 |
