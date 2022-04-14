#

![SUD](../../Resource/logo.png)

## Description

- Obtain the SSToken based on the short-term token code.


## Request URL

- The test environment and production environment URLs are different and need to be separately configured by Sud.
- The production environment URL takes effect after its online deployment.

## Request method
- https
- POST
- Parameters are in JSON format and included in the request body.

## Request parameters (More fields may be added, and the client needs to ensure the compatibility of new fields.)

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| code | Yes | string | The client code. |

## Sample requests

```json
{
    "code":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIxMjMiLCJleHAiOjE2MzA0MTc4NDksImFwcF9pZCI6ImFwcElEIn0.BWFAf7-Bi20KsFIjnQcF2ET1RNhoZRhoWa-VOxYbPuY"
}
```

## Response parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| ret_code | Yes | int32 | The error code. Valid values: **0**: the request is successful; other values: the request is failed. |
| ret_msg | Yes | string | The error information. |
| sdk_error_code | No | int32 | The SDK error code. Valid values: **0**: the request is successful; other values: the request is failed. |
| data | Yes | object | Data. |

## data parameter description
| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| ss_token | Yes | string | The token. |
| expire_date | Yes | int64 | The expiration time, accurate to millisecond. |

## Sample success responses

```json
{
    "ret_code": 0, // The error code. Valid values: 0: the request is successful; other values: the request is failed.
    "ret_msg": "",
    "sdk_error_code":0,// The SDK error code. Valid values: 0: the request is successful; other values: the request is failed.
    "data": {
        "ss_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIxMjMiLCJleHAiOjE2MzA0MTc4NjEsImFwcF9pZCI6ImFwcElEIn0.vk6cX4dGHJ-du6tKAMqy-qoD9xB_GV2Dh356cZgMQxM",
        "expire_date": 1630417861359
    }
}
```

## Sample responses with error codes

```json
{
    "ret_code": 1, // The error code. Valid values: 0: the request is successful; other values: the request is failed.
    "ret_msg": "",
    "sdk_error_code":1005,// The SDK error code. Valid values: 0: the request is successful; other values: the request is failed.
    "data": {
        "ss_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIxMjMiLCJleHAiOjE2MzA0MTc4NjEsImFwcF9pZCI6ImFwcElEIn0.vk6cX4dGHJ-du6tKAMqy-qoD9xB_GV2Dh356cZgMQxM",
        "expire_date": 1630417861359
    }
}
```
