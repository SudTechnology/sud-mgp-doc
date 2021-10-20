#

![SUD](../Resource/logo.png)

## 介绍

- App服务需要实现Https回调接口，供小游戏服务鉴权并获取用户基本信息
- sud-mgq-auth-node提供了实现回调接口的大部分功能，App服务只需要实现Https接口，并调用sub-mgp-auth-node即可

## SDK环境要求

- 支持node 8或其以上版本
- 需要联系Sud.Tech为业务分配 `appId`、 `appKey`、 `appSecret`

## 集成流程

1. 项目导入包 npm install -d

2. 使用[SudMGPAuth](./API/SudMGPAuth-Node.md)提供的API实现以下回调接口，供小游戏服务鉴权和获取用户基本信息，可参考Demo

    - [get_sstoken](./HttpsCallback/get_sstoken.md)

    - [update_sstoken](./HttpsCallback/update_sstoken.md)

    - [get_user_info](./HttpsCallback/get_user_info.md)
