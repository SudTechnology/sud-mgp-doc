#

![SUD](../Resource/logo.png)

## 介绍

- 申请appId、 appKey、 appSecret配置流程

## 流程

- 1. 需要配置申请方ios bundleID的和android 的applicationID
        - ios  bundleID
        - android  applicationID
- 2. 小游戏客户端需要向申请方服务端鉴权和获取玩家信息，申请方服务端需要部署如下接口并提供调用地址（公网）进行配置
     - [get_sstoken](./HttpsCallback/get_sstoken.md)

     - [update_sstoken](./HttpsCallback/update_sstoken.md)

     - [get_user_info](./HttpsCallback/get_user_info.md)
              


