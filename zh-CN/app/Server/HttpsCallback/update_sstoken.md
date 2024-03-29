#

![SUD](../../Resource/logo.png)

## 简要描述

- 更新sstoken

## 请求URL

- 分为测试环境和生产环境，需要通知Sud分别进行配置
- 生产环境地址需要正式上线部署后才能生效

## 请求方式
- https
- POST
- 参数为Json格式，放在body内

## 请求参数（可能会新增加字段，请接入方保持新增加字段兼容性）

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|ss_token|是|string|token|

## 请求示例

```json
{
    "ss_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIxMjMiLCJleHAiOjE2MzA0MTc4NDksImFwcF9pZCI6ImFwcElEIn0.BWFAf7-Bi20KsFIjnQcF2ET1RNhoZRhoWa-VOxYbPuY"
}
```

## 返回参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|ret_code|是|int32|错误码，0:成功，其他表示错误|
|ret_msg|是|string|错误信息|
|sdk_error_code|否|int32|sdk错误码，0:成功，其他表示错误|
|data|是|object|data数据|

## data 参数说明

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|ss_token|是|string|token|
|expire_date|是|int64|过期时间（毫秒数）|
|expire_date_str|否|string|过期时间（毫秒数）,nodejs服务请使用当前字段|

## 正确返回示例

```json
{
    "ret_code": 0, //错误码，0为成功，其他错误
    "ret_msg": "",
    "sdk_error_code":0,//sdk错误码，0为成功，其他错误
    "data": {
        "ss_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIxMzgwMTAwMTc3MTUwMzQ1MjY2IiwiZXhwIjoxNjMwNTgwMTU2LCJhcHBfaWQiOiJhcHBJRCJ9.A9VAOC2ltCn_6pVn3jA8zHBos6QQs0_1_RnxsuK9M44",
        "expire_date": 1630580156184
    }
}
```

## 带错误码返回示例

```json
{
    "ret_code": 1, //错误码，0为成功，其他错误
    "ret_msg": "",
    "sdk_error_code":1005,//sdk错误码，0为成功，其他错误
    "data": {
        "ss_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIxMzgwMTAwMTc3MTUwMzQ1MjY2IiwiZXhwIjoxNjMwNTgwMTU2LCJhcHBfaWQiOiJhcHBJRCJ9.A9VAOC2ltCn_6pVn3jA8zHBos6QQs0_1_RnxsuK9M44",
        "expire_date": 1630580156184
    }
}
```
