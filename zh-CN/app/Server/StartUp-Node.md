#

![SUD](../Resource/logo.png)

## 介绍

- App服务需要实现Https回调接口，供小游戏服务鉴权并获取用户基本信息
- sud-mgq-auth-node提供了实现回调接口的大部分功能，App服务只需要实现Https接口，并调用sub-mgp-auth-node即可

## SDK环境要求

- 支持node 8或其以上版本
- 需要联系Sud.Tech为业务分配 `appId`、 `appKey`、 `appSecret`

## 集成流程

1. NPM配置
- 建议创建一个公司github通用账号(user—>setting->Developer settings->Personal access tokens->Generate new token), 生成一个用以Npm包的Token,权限配置如图<br/>
  ![image](https://user-images.githubusercontent.com/92836734/178459371-7347ad20-a0b5-45e3-b021-a7fb6013ac9f.png)

- 在项目工程根目录新建.npmrc文件，并配置<br/>
  //npm.pkg.github.com/:_authToken=用以Npm包的Token <br/>
  @sudtechnology:registry=https://npm.pkg.github.com/

2. 项目导入包: npm install @sudtechnology/sud-mgp-auth-node

3. 使用[SudMGPAuth](./API/SudMGPAuth-Node.md)提供的API实现以下回调接口，供小游戏服务鉴权和获取用户基本信息，可参考Demo

    - get_code：此接口功能为初始化客户端SDK前生成短期令牌Code功能，由app调用业务服务端，可以通过引用服务端SDK实现，具体实现参考[demo](https://github.com/SudTechnology/hello-sud-node/releases)中login方法，如不引用SDK，可参考[自行实现鉴权](ImplementAuthenticationByYourself.md)中说明。

    - [get_sstoken](./HttpsCallback/get_sstoken.md)

    - [update_sstoken](./HttpsCallback/update_sstoken.md)

    - [get_user_info](./HttpsCallback/get_user_info.md)
