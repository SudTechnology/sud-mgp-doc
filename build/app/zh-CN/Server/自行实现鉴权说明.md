#

![SUD](../Resource/logo.png)

#### 如果接入方服务端为[Java](StartUp-Java.md)，[Go](StartUp-Go.md)或者[Node](StartUp-Node.md)实现，可以直接使用SUD提供的服务端SDK实现鉴权，具体流程参考DEMO。

#### 对于非以上三种语言实现的服务端或者想自行实现鉴权方式可以遵循以下原则： 

#### 1.自行实现登录接口，GetSSToken接口，UpdateSSToken接口，GetUserInfoInfo接口四个接口

###### 登录接口
- 调用方式：GET / POST
- 调用方：接入方app
- 接口说明：生成"短期令牌Code"并返回给app客户端，"短期令牌Code"需要和用户登录态绑定，当游戏服务端使用"短期令牌Code"为参数调用接入方服务端实现的GetSSToken接口时，接入方服务端需要识别出"短期令牌Code"对应的"用户ID"，并根据"用户ID"生成"长期令牌SSToken"并返回给游戏服务端。


###### 获取长期令牌接口(GetSSToken)
- 调用方式：POST
- 调用方：游戏服务端
- 接口说明：游戏服务端使用以上登录接口产生的"短期令牌Code"为参数，调用当前接口生成一个ServerToServer交互的"长期令牌SSToken"，接入方服务端需要识别出"短期令牌Code"对应的用户ID，并根据"用户ID"生成"长期令牌SSToken"返回给游戏服务端，如果游戏服务端使用的"短期令牌Code"已经过期，需设置响应字段中的sdk_error_code值为1005，具体参考"注意事项"
- 参考：[get_sstoken](HttpsCallback/get_sstoken.md)


###### 更新长期令牌接口(UpdateSSToken)
- 调用方式：POST
- 调用方：游戏服务端
- 接口说明：游戏服务端使用以上GetSSToken接口产生的"长期令牌SSToken"为参数，获取一个新的"长期令牌SSToken"并返回给游戏服务端。
- 参考：[update_sstoken](HttpsCallback/update_sstoken.md)


###### 获取用户信息接口(GetUserInfoInfo)
- 调用方式：POST
- 调用方：游戏服务端
- 接口说明：游戏服务端使用以上GetSSToken接口或者UpdateSSToken产生的"长期令牌SSToken"为参数，获取当前"长期令牌SSToken"所对应的用户信息
- 参考：[get_user_info](HttpsCallback/get_user_info.md)


#### 2.注意事项

- 所有的令牌("短期令牌Code"或者"长期令牌SSToken")需严格和用户ID绑定，app服务端需要识别出"令牌"对应的用户ID以便进行后续处理逻辑。
- 获取长期令牌接口(GetSSToken)，更新长期令牌接口(UpdateSSToken)，获取用户信息接口(GetUserInfoInfo)三个接口响应体格式需严格按照下划线分隔格式(SNAKE_CASE)数据格式返回。
- 当接入方服务端识别到令牌过期时，需设置响应字段中的sdk_error_code值为1005，例如：
```json
{
    "ret_code": 1, // 错误码
    "ret_msg": "",
    "sdk_error_code":1005, // 令牌过期
    "data": {}
}
```