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

## 请求参数（可能会新增加字段，请服务端保持新增加字段兼容性）

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
|user_info |否|object   |userInfoObj对象，当userInfoObj对象有数据时，小游戏服务端会采用该数据，不会调用getUserinfo接口，节省一次调用 |


##### userInfoObj 对象说明 
|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|uid|是|string|用户id|
|nick_name|是|string|用户昵称|
|avatar_url|是|string|用户头像url(建议使用128*128尺寸)|
|gender|是|string|性别（female or male or "") 未知性别请填写空字符串|
|is_ai |否|int32|0:普通用户，1:机器人（默认为0）|
## 正确返回示例

```json
{
    "ret_code": 0, //错误码，0为成功，其他错误
    "ret_msg": "",
    "sdk_error_code":0,//sdk错误码，0为成功，其他错误
    "data": {
        "ss_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIxMjMiLCJleHAiOjE2MzA0MTc4NjEsImFwcF9pZCI6ImFwcElEIn0.vk6cX4dGHJ-du6tKAMqy-qoD9xB_GV2Dh356cZgMQxM",
        "expire_date": 1630417861359,
        "user_info": {
            "uid": "1380100177150345266",
            "nick_name": "萌萌",
            "avatar_url": "https://icon.png?128*128",
            "gender": "female",
            "is_ai": 0
    	}
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
        "ss_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIxMjMiLCJleHAiOjE2MzA0MTc4NjEsImFwcF9pZCI6ImFwcElEIn0.vk6cX4dGHJ-du6tKAMqy-qoD9xB_GV2Dh356cZgMQxM",
        "expire_date": 1630417861359
    }
}
```
