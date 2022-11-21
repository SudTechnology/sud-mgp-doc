![SUD](../../app/Resource/logo.png)

## 介绍

- 应用接入方获取已穿戴的NFT详情

## 请求URL

- 测试环境：接口地址详见[获取服务端API配置](../../app/Server/API/ObtainServerEndAPIConfigurations.md)中web3_api对象字段
- 生产环境：接口地址详见[获取服务端API配置](../../app/Server/API/ObtainServerEndAPIConfigurations.md)中web3_api对象字段

## 请求方式

- 传输协议：HTTPS
- 请求方法：POST
- 参数以body传递，格式为json（见请求示例）
- Header中需要添加：Content-Type: application/json;charset=utf-8
- Header中需要添加：认证请求头 Authorization

## 请求头

| Header Name     | Header Value                                                                                      |
|:----------------|:--------------------------------------------------------------------------------------------------|
| `Authorization` | `Sud-Auth <params>`，参考：[认证请求头Authorization实现方式](../../app/Server/API/AuthorizationDescription.md) |
| `RequestId`     | 唯一请求id                                                                                            |

## 请求参数

| 参数名                | 必选  | 类型           | 说明           |
|:-------------------|:----|:-------------|--------------|
| user_id            | 是   | string       | 用户id         |
| nft_details_tokens | 是   | array string | nft详情token列表 |

## 请求示例

```json
{
    "app_id": "xxx",
    "user_id": "xxx",
	"nft_details_tokens": [
		"xxx"
	]
}
```

## 返回参数

- BaseResp

| 参数名      | 必选  | 类型                  | 说明                  |
|:---------|:----|:--------------------|---------------------|
| ret_code | 是   | int                 | [错误码](./RetCode.md) |
| ret_msg  | 是   | string              | 响应信息                |
| data     | 是   | `GetNftDetailsResp` | 响应数据                |

- GetNftDetailsResp

| 参数名             | 必选  | 类型                                      | 说明      |
|:----------------|:----|:----------------------------------------|---------|
| nft_details_map | 是   | `map<nft_details_token, GetNftDetails>` | nft详情列表 |

- GetNftDetails

| 参数名              | 必选  | 类型     | 说明        |
|:-----------------|:----|:-------|-----------|
| media_type       | 是   | int32  | 媒体类型，1：图片 |
| rich_media_url   | 是   | string | 地址        |
| chain_type       | 否   | int64  | 链网类型      |
| contract_address | 否   | string | 合约地址      |
| token_id         | 否   | string | nft token |

## 返回示例

```json
{
    "ret_code": 0,
    "ret_msg": "success",
    "data": {
        "nft_details_map": {
			"xxx" : {
				"media_type": 1,
				"rich_media_url" : "xxx",
				"chain_type": 1,
				"contract_address": "xxx",
				"token_id": "xxx"
			}
		}
    }
}
```