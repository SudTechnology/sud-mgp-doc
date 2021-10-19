#

![SUD](../../Resource/logo.png)

[Toc]

## 简要描述

- 更新sstoken

## 请求URL

- 分为测试环境和生产环境，需要通知Sud分别进行配置
- 生产环境地址需要正式上线部署后才能生效

## 请求方式

- POST
- 参数为Json格式，放在body内

## 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|ss_token|是|string|token|

## 返回示例

```json
{
    "ret_code": 0,
    "ret_msg": "",
    "data": {
        "ss_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIxMzgwMTAwMTc3MTUwMzQ1MjY2IiwiZXhwIjoxNjMwNTgwMTU2LCJhcHBfaWQiOiJhcHBJRCJ9.A9VAOC2ltCn_6pVn3jA8zHBos6QQs0_1_RnxsuK9M44",
        "expire_date": 1630580156184
    }
}
```

## 返回参数说明
|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|ss_token|是|string|token|
|expire_date|是|int64|过期时间（毫秒数）|