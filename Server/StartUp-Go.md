#

![SUD](../Resource/logo.png)

[Toc]

## 介绍

- App服务需要实现Https回调接口，供小游戏服务鉴权并获取用户基本信息
- mgp-auth-go提供了实现回调接口的大部分功能，App服务只需要实现Https接口，并调用mgp-auth-go即可

## SDK环境要求

- 支持go version1.16或其以上版本
- 需要联系Sud.Tech为业务分配 `appId`、 `appKey`、 `appSecret`

## 集成流程

1. 项目导入包 go.mod

    ```xml
   replace github.com/SudTechnology/mgp-auth-go => /Users/xiaoenai/working/go/src/github.com/SudTechnology/mgp-auth-go
    ```

2. 调用工具类 [jwt_utils](./API/jwt_utils.md)

    ```go
    token, exp, err := jwtUtils.GetToken(userClaims, appSecret)
    user, err := jwtUtils.ParseToken(req.Code, appSecret)
    token, exp, err := jwtUtils.UpdateToken(req.Token, appSecret)
    ```

3. 使用[DefaultSudMGPClient](./API/DefaultSudMGPClient.md)提供的API实现以下回调接口，供小游戏服务鉴权和获取用户基本信息，可参考Demo

    - [get_sstoken](./HttpsCallback/get_sstoken.md)

    - [update_sstoken](./HttpsCallback/update_sstoken.md)

    - [get_user_info](./HttpsCallback/get_user_info.md)
