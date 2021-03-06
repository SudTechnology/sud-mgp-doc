#

![SUD](../../Resource/logo.png)

## 简要描述

- 服务端上报每局游戏消耗的货币信息

## 请求URL

- 测试环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中report_game_round_bill字段
- 生产环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中report_game_round_bil字段

## 请求方式
- 传输协议：HTTPS
- 请求方法：POST
- 参数以body传递，格式为json（见请求示例）
- Header中需要添加：Content-Type: application/json;charset=utf-8
- Header中需要添加：认证请求头 Authorization

## 请求头 [Authorization]
- [认证请求头Authorization实现方式](AuthorizationDescription.md)

## 请求参数

| 参数名             | 必选  | 类型              | 说明                          |
|:----------------|:----|:----------------|-----------------------------|
| request_id      | 是   | string          | 请求id，64个字符以内，需保证唯一性 |
| mg_id           | 是   | string          | 游戏id                        |
| room_id         | 是   | string          | 房间id                        |
| round_id        | 是   | string          | 游戏局id                       |
| total_amount    | 是   | string          | 当局游戏总的消耗货币数，精确到小数点后两位       |
| payment_details | 是   | PaymentDetail[] | 当局游戏内用户的支付列表信息              |
| payment_type    | 是   | string          | 支付类型。枚举值: <br> TICKET: 门票   |

- PaymentDetail

| 参数名     | 必选  | 类型     | 说明               |
|:--------|:----|:-------|------------------|
| user_id | 是   | string | 用户ID             |
| amount  | 是   | string | 消耗的货币数，精确到小数点后两位 |


## 请求示例

```json
{
  "request_id": "1655285156000",
  "mg_id": "1461227817776713818",
  "room_id": "9009",
  "round_id": "ce56b6lzi1a7-cehorlmy01pq-ckmfkba10i7",
  "total_amount": "2",
  "payment_details": [{
    "user_id": "001",
    "amount": "1"
  }, {
    "user_id": "002",
    "amount": "1"
  }],
  "payment_type": "TICKET"
}
```

## 返回参数

- BaseResp

| 参数名      | 必选  | 类型                  | 说明                |
|:---------|:----|:--------------------|-------------------|
| ret_code | 是   | int                 | 响应码               |
| ret_msg  | 是   | string              | 响应信息              |

## 返回示例

```json
{
  "ret_code": 0,
  "ret_msg": "成功"
}
```
