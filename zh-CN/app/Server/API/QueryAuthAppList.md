#

![SUD](../../Resource/logo.png)

## 简要描述

- 查询授权应用列表

## 请求URL

- 测试环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中auth_app_list字段
- 生产环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中auth_room_list字段

## 请求方式

- 传输协议：HTTPS
- 请求方法：GET
- 参数以body传递，格式为json（见请求示例）
- Header中需要添加：Content-Type: application/json;charset=utf-8
- Header中需要添加：认证请求头 Authorization

## 请求头 [Authorization]

- [认证请求头Authorization实现方式](AuthorizationDescription.md)

## 返回参数

- BaseResp

| 参数名      | 必选  | 类型            | 说明   |
|:---------|:----|:--------------|------|
| ret_code | 是   | int           | 响应码  |
| ret_msg  | 是   | string        | 响应信息 |
| data     | 是   | AuthAppInfo[] | 响应数据 |

- AuthAppInfo

| 参数名         | 必选  | 类型     | 说明    |
|:------------|:----|:-------|-------|
| app_name    | 是   | string | 应用名称  |
| auth_secret | 是   | string | 应用授权串 |

## 返回示例

```json
{
  "ret_code": 0,
  "ret_msg": "",
  "data": [
    {
      "app_name": "HelloSud1",
      "auth_secret": "auth_secret1"
    },
    {
      "app_name": "HelloSud2",
      "auth_secret": "auth_secret2"
    }
  ]
}
```
