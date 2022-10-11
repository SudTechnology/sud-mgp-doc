#

![SUD](../Resource/logo.png)

## 介绍

- App服务需要实现Https回调接口，供小游戏服务鉴权并获取用户基本信息
- mgp-auth-go提供了实现回调接口的大部分功能，App服务只需要实现Https接口，并调用mgp-auth-go即可

## SDK环境要求

- 支持go version1.16或其以上版本
- 需要联系Sud.Tech为业务分配 `appId`、 `appKey`、 `appSecret`

## 集成流程

1. 项目导入包 go.mod

    ```xml
   replace github.com/SudTechnology/mgp-auth-go => /localpath/github.com/SudTechnology/mgp-auth-go
    ```

2. 使用[SudMGPAuth](SDK/SudMGPAuth-Go.md)提供的API实现以下回调接口，供小游戏服务鉴权和获取用户基本信息，可参考Demo

   - get_code：此接口功能为初始化客户端SDK前生成短期令牌Code功能，由app调用业务服务端，可以通过引用服务端SDK实现，具体实现参考[demo](https://github.com/SudTechnology/hello-sud-go/releases)中login方法，如不引用SDK，可参考[自行实现鉴权](ImplementAuthenticationByYourself.md)中说明。

   - [get_sstoken](./HttpsCallback/get_sstoken.md)

   - [update_sstoken](./HttpsCallback/update_sstoken.md)

   - [get_user_info](./HttpsCallback/get_user_info.md)
