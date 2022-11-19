![SUD](../../app/Resource/logo.png)

## 介绍

- 应用接入方刷新详情令牌

## 请求URL

- 测试环境：接口地址详见[获取服务端API配置](../../app/Server/ServerSDKAPI/ObtainServerEndAPIConfigurations.md)中web3_api对象字段
- 生产环境：接口地址详见[获取服务端API配置](../../app/Server/ServerSDKAPI/ObtainServerEndAPIConfigurations.md)中web3_api对象字段

## 请求方式

- 传输协议：HTTPS
- 请求方法：POST
- 参数以body传递，格式为json（见请求示例）
- Header中需要添加：Content-Type: application/json;charset=utf-8
- Header中需要添加：认证请求头 Authorization

## 请求头

| Header Name     | Header Value                                                                                               |
|:----------------|:-----------------------------------------------------------------------------------------------------------|
| `Authorization` | `Sud-Auth <params>`，参考：[认证请求头Authorization实现方式](../../app/Server/ServerSDKAPI/AuthorizationDescription.md) |
| `RequestId`     | 唯一请求id                                                                                                     |

## 请求参数

| 参数名     | 必选  | 类型     | 说明   |
|:--------|:----|:-------|------|
| user_id | 是   | string | 用户id |

## 请求示例

```json
{
    "user_id": "xxx"
}
```

## 返回参数

- BaseResp

| 参数名      | 必选  | 类型                     | 说明                  |
|:---------|:----|:-----------------------|---------------------|
| ret_code | 是   | int                    | [错误码](./RetCode.md) |
| ret_msg  | 是   | string                 | 响应信息                |
| data     | 是   | `AppRefreshDTokenResp` | 响应数据                |

- AppRefreshDTokenResp

| 参数名          | 必选  | 类型           | 说明        |
|:-------------|:----|:-------------|-----------|
| expire_at_ms | 是   | int64        | 过期时间戳，毫秒  |
| tokens       | 是   | string array | 有效token列表 |

## 返回示例

```json
{
    "ret_code": 0,
    "ret_msg": "success",
    "data": {
        "expire_at_ms": 123,
		"tokens": [
			"xxx"
		]
    }
}
```