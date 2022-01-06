#

![SUD](../Resource/logo.png)

## 服务端错误码说明

### SDK错误码（sdk_error_code）
| 错误码  | 错误信息      | 备注  |
|------|-----------|-----|
| 0    | 成功        ||
| 1001 | Token创建失败 ||
| 1002 | Token校验失败 ||
| 1003 | Token解析失败 ||
| 1004 | Token非法   ||
| 1005 | Token过期   ||




### 游戏服务端错误码
| 错误码   | 错误信息 | 备注                                            |
|----|----|-----------------------------------------------|
| 0     | 成功   ||
| 10001 | 服务异常 ||
| 10002 | 参数错误 | 参数不可读，请求非POST，请求体不是json格式                     |
| 10003 | AppKey非法 | AppKey错误                                      |
| 10004 | AppSecret非法 | AppSecret错误                                   |
| 10005 | App平台信息非法 | bundleId或者ApplicationId传递错误                   |
| 10010 | Token创建失败 ||
| 10011 | Token校验失败 ||
| 10012 | Token解析失败 ||
| 10021 | Token非法 ||
| 10022 | Token过期 ||
| 10101 | App不存在 | App基本信息未生成，需联系SUD进行生成appId，appKey，appSecret信息 |
| 10102 | App数据不存在 | 当前App配置信息不完整，需联系SUD进行核对                       |
| 10111 | 小游戏不存在 | 游戏ID错误或者app未关联当前游戏                            |
| 10121 | SDK配置信息不存在 | 当前App配置信息不完整，需联系SUD进行核对                       |
| 10122 | 游戏配置信息不存在 | 当前App配置信息不完整，需联系SUD进行核对                       |
|100000 |通用错误                       |						|
|100001 |http 缺失code 参数             |            |
|100002 |http 缺失roomID 参数            |            |
|100003 |http 缺失appID 参数             |            |
|100004 |http 缺失openID 参数            |            |
|100008 |数据库查询错误                     |            |
|100009 |数据库插入错误                     |            |
|100010 |数据库修改错误                     |            |
|100011 |http 缺失 appServerInfoUrl 参数 |            |
|100012 |http mode参数错误               |            |
|105000 |code 通用错误                   | 接入方服务端返回sdk code通用错误            |
|105001 |code 创建失败                   | 接入方服务端返回sdk code创建失败           |
|105002 |code 效验失败                   | 接入方服务端返回sdk code效验失败            |
|105003 |code 解析失败                   | 接入方服务端返回sdk code解析失败            |
|105004 |code 非法                     | 接入方服务端返回sdk code非法            |
|105005 |code 过期                     | 接入方服务端返回sdk code过期            |
|105006 |请求app_server 失败             |            |
|105007 |解析app_server 数据失败           |            |
|105008 |请求get_sstoken 失败                |   游戏服务端请求接入方服务端get_sstoken 接口失败，请检查该接口        |
|105009 |解析get_sstoken 数据失败              |  游戏服务端请求接入方服务端get_sstoken 接口失败，请检查该接口          |
|105010 |请求get_user_info 失败          |    游戏服务端请求接入方服务端get_user_info 接口失败，请检查该接口        |
|105011 |解析get_user_info 数据失败        |   游戏服务端请求接入方服务端get_user_info 接口失败，请检查该接口          |
|105012 |请求update_sstoken 失败         |    游戏服务端请求接入方服务端update_sstoken 接口失败，请检查该接口       |
|105013 |解析update_sstoken 数据失败       |   游戏服务端请求接入方服务端update_sstoken 接口失败，请检查该接口         |