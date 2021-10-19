#

![SUD](../../Resource/logo.png)

[Toc]

## 简要描述

- 根据code 获取sstoken

## 请求URL(该地址需要通知sud 进行配置)

- 开发环境 `https://xxx/v1/get_sstoken`

## 请求方式

- POST

## 参数（ body放json类型参数）

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|code |是  |string |客户端code   |

## 请求示例

```json
{
    "code":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIxMjMiLCJleHAiOjE2MzA0MTc4NDksImFwcF9pZCI6ImFwcElEIn0.BWFAf7-Bi20KsFIjnQcF2ET1RNhoZRhoWa-VOxYbPuY"
}
```

## 返回示例

```json
{
    "ret_code": 0,
    "ret_msg": "",
    "data": {
        "ss_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIxMjMiLCJleHAiOjE2MzA0MTc4NjEsImFwcF9pZCI6ImFwcElEIn0.vk6cX4dGHJ-du6tKAMqy-qoD9xB_GV2Dh356cZgMQxM",
        "expire_date": 1630417861359
    }
}
```

## 返回参数说明

expire_date 过期时间（毫秒数）
