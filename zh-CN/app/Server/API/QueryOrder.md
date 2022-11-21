#

![SUD](../../Resource/logo.png)

## 简要描述

- 查询订单

## 请求URL

- 测试环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中query_order字段
- 生产环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中query_order字段

## 请求方式

- 传输协议：HTTPS
- 请求方法：POST
- 参数以body传递，格式为json（见请求示例）
- Header中需要添加：Content-Type: application/json;charset=utf-8
- Header中需要添加：认证请求头 Authorization

## 请求头 [Authorization]

- [认证请求头Authorization实现方式](AuthorizationDescription.md)

## 请求参数

| 参数名          | 必选   | 类型     | 说明                                                                                    |
|:-------------|:-----|:-------|---------------------------------------------------------------------------------------|
| out_order_id | 特殊可选 | string | 商户自定义唯一订单号id，和order_id不能同时为空。<br>out_order_id和order_id同时存在，则order_id优先级高于out_order_id |
| order_id     | 特殊可选 | string | SUD订单号，和out_order_id不能同时为空                                                            |

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
| data     | 是   | AppServerQueryOrderResp | 响应数据 |

- AppServerQueryOrderResp

| 参数名          | 必选   | 类型     | 说明                                                                                           |
|:-------------|:-----|:-------|----------------------------------------------------------------------------------------------|
| order_id     | 是    | string | SUD 订单号                                                                                      |1659497694888
| out_order_id | 是    | string | 商户自定义唯一订单号                                                                                   |1659497694000
| out_group_id | 否    | string | 商户自定义订单组id                                                                                   |1659497694
| mg_id        | 是    | string | 游戏id                                                                                         |14615640800525066
| room_id      | 是    | string | 房间id                                                                                         |9009
| cmd          | 是    | string | 触发的行为动作                                                                                      |test
| from_uid     | 是    | string | 付费用户uid                                                                                      |u001
| to_uid       | 是    | string | 目标用户uid                                                                                      |u002
| value        | 是    | int32  | 所属的游戏价值                                                                                      |1
| payload      | 特殊可选 | json   | 附加数据                                                                                         |<br>
| status       | 是    | string | 订单状态: <br> CREATED (订单创建完成，待执行)， EXECUTING (执行中)，EXECUTE_FAIL (执行失败)， EXECUTE_SUCCESS (执行成功) | EXECUTE_SUCCESS

## 返回示例

```json
{
  "ret_code": 0,
  "ret_msg": "",
  "data": {
    "order_id": "1573254561852952576",
    "out_order_id": "1659497694001",
    "out_group_id": "165949769",
    "mg_id": "1461228379255603251",
    "room_id": "9009",
    "cmd": "test",
    "value": 1,
    "status": "EXECUTE_FAIL"
  }
}
```

## 业务错误码

| 错误码   | 错误描述  | 解决方案                   |
|:------|:------|:-----------------------|
| 10002 | 参数错误  | 检查请求参数，修改后重新发起请求       |
| 70503 | 订单不存在 | 检查传入的订单号是否正确，修改后重新发起请求 |
