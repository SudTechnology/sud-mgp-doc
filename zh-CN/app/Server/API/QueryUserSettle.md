#

![SUD](../../Resource/logo.png)

## 简要描述

- 查询用户结算信息

## 请求URL

- 测试环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中query_user_settle字段
- 生产环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中query_user_settle字段

## 请求方式

- 传输协议：HTTPS
- 请求方法：POST
- 参数以body传递，格式为json（见请求示例）
- Header中需要添加：Content-Type: application/json;charset=utf-8
- Header中需要添加：认证请求头 Authorization

## 请求头 [Authorization]

- [认证请求头Authorization实现方式](AuthorizationDescription.md)

## 请求参数

| 参数名          | 必选   | 类型     | 说明                                                                                  |
|:-------------|:-----|:-------|-------------------------------------------------------------------------------------|
| out_order_id | 特殊可选 | string | 商户自定义唯一订单号id，和SUD订单号不能同时为空。<br>out_order_id和order_id同时存在，则order_id优先级高于out_order_id |
| order_id     | 特殊可选 | string | SUD订单号，和商户自定义订单号不能同时为空                                                              |

## 请求示例

```json
{
  "out_order_id": "1659497694000",
  "order_id": "1659497694003"
}
```

## 返回参数

- BaseResp

| 参数名      | 必选  | 类型                      | 说明   |
|:---------|:----|:------------------------|------|
| ret_code | 是   | int                     | 响应码  |
| ret_msg  | 是   | string                  | 响应信息 |
| data     | 是   | AppServerUserSettleResp | 响应数据 |

- AppServerUserSettleResp

| 参数名          | 必选  | 类型     | 说明            |
|:-------------|:----|:-------|---------------|
| order_id     | 是   | string | SUD 订单号       |1659497694888
| out_order_id | 是   | string | 商户自定义唯一订单号    |1659497694000
| mg_id        | 是   | string | 游戏id          |14615640800525066
| room_id      | 是   | string | 房间id          |9009|
| match_id     | 是   | string | 游戏场次id        |m001
| uid          | 是   | string | 玩家uid，机器人为空字符 | u001
| is_ai        | 是   | int32  | 0:普通用户，1:机器人  | 0
| score        | 是   | int32  | 玩家当次结算得到的积分   | 10
| remain_score | 是   | int32  | 玩家当次结算剩余的积分   | 100
| settle_at    | 是   | string | 结算时间戳（秒）      |1661312610


## 返回示例

```json
{
  "ret_code": 0,
  "ret_msg": "",
  "data": {
    "order_id": "1575032972267098112",
    "out_order_id": "1664184984",
    "mg_id": "1557194155570024449",
    "room_id": "90091",
    "match_id": "ce56b6lzi1a7-cf75pcvbs7j1-cx5h93twefnc",
    "uid": "5cb0d3a5",
    "is_ai": 0,
    "score": -100,
    "remain_score": 0,
    "settle_at": "1664334968522"
  }
}
```

## 业务错误码

| 错误码   | 错误描述         | 解决方案                       |
|:------|:-------------|:---------------------------|
| 10002 | 参数错误         | 检查请求参数，修改后重新发起请求           |
| 70503 | 订单不存在        | 检查传入的订单号是否正确，修改后重新发起请求     |
| 70504 | 订单无关联的用户结算信息 | 检查传入的订单号或等待相应的用户结算，再重新发起请求 |
