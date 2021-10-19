#

![SUD](../../Resource/logo.png)

[Toc]

## 简要描述

- 获取用户信息

## 请求URL(该地址需要通知sud 进行配置)

- 开发环境 `https://xxx/v1/get_user_info`

## 请求方式

- POST

## 参数

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|ss_token |是  |string |token   |

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
