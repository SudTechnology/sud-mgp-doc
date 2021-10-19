#

![SUD](../../Resource/logo.png)

[Toc]

## 简要描述

- 获取用户信息

## 请求URL

- 分为测试环境和生产环境，需要通知Sud分别进行配置
- 生产环境地址需要正式上线部署后才能生效

## 请求方式

- POST
- 参数为Json格式，放在body内

## 请求参数

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
|uid|是|string|用户id|
|nick_name|是|string|用户昵称|
|avatar_url|是|string|用户头像url|
|gender|是|string|性别（female|male）|

## 返回示例

```json
{
    "ret_code": 0,
    "ret_msg": "",
    "data": {
        "uid": "1380100177150345266",
        "nick_name": "萌萌",
        "avatar_url": "https://icon.png",
        "gender": "female"
    }
}
```
