#

![SUD](../../Resource/logo.png)

## 简要描述

- 根据code 获取sstoken

## 请求URL

- 分为测试环境和生产环境，需要通知Sud分别进行配置
- 生产环境地址需要正式上线部署后才能生效

## 请求方式
- https
- POST
- 参数为Json格式，放在body内

## 请求参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|code|是|string|客户端code|

## 请求示例

```json
{
    "code":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIxMjMiLCJleHAiOjE2MzA0MTc4NDksImFwcF9pZCI6ImFwcElEIn0.BWFAf7-Bi20KsFIjnQcF2ET1RNhoZRhoWa-VOxYbPuY"
}
```

## 返回参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|ss_token|是|string|token|
|expire_date|是|int64|过期时间（毫秒数）|

## 返回示例

```json
{
    "ret_code": 0, //错误码，0为成功，其他错误
    "ret_msg": "",
    "sdk_error_code":0,//sdk错误码，0为成功，其他错误
    "data": {
        "ss_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIxMjMiLCJleHAiOjE2MzA0MTc4NjEsImFwcF9pZCI6ImFwcElEIn0.vk6cX4dGHJ-du6tKAMqy-qoD9xB_GV2Dh356cZgMQxM",
        "expire_date": 1630417861359
    }
}
```
