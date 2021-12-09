# SUD MGP 互动小游戏接入平台

![SUD](./Resource/logo.png)

![SUD](./Resource/startup.png)

> Tips
>
> 1. 客户端中，小游戏与App互为有限状态机，逻辑上完全0耦合。
> 2. 业务App可选择性响应小游戏状态机 `ISudFSMMG` 中发出的状态，并在原生中做出对应交互，也可以什么都不做。
> 3. 业务App可选择性向App状态控制器 `ISudFSTAPP` 同步App状态，小游戏会做出相应的反馈和交互调整，也可以什么都不做。

## 客户端快速接入

- [Android](./Client/StartUp-Android.md)

- [iOS](./Client/StartUp-iOS.md)

## 客户端文档

- [文档](./Client/StartUp.md)

- [更新日志(SudMGP和游戏)](./Client/ChangeLog.md)
## 客户端SDK下载

- [SudMGP-Android-v1.1.32.200](https://github.com/SudTechnology/sud-mgp-android/releases/tag/v1.1.32.200)
  
- [SudMGP-iOS-v1.1.32.232](https://github.com/SudTechnology/sud-mgp-ios/releases/tag/v1.1.32.232)
  

## 客户端Demo下载
- [HelloSud-Android-v1.1.32.200](https://github.com/SudTechnology/hello-sud-android/releases)
  
- [HelloSud-iOS-v1.1.32.232](https://github.com/SudTechnology/hello-sud-ios/releases)

> Tips
>
> 1. 服务端中，小游戏服务与业务服务的鉴权和数据交换，建议通过标准JWT进行，也可以通过任何自定义的方式进行。
> 2. 通过 `SudMGPAuth` 实现标准JWT的方式，业务服务可保持原有客户端登陆鉴权逻辑，并将登陆状态穿透至服务端，使得小游戏服务与业务服务的鉴权和数据交换都是基于用户登陆行为的，以此最大限度保证业务数据安全。同时业务服务无需额外的持久化服务处理复杂的映射关系（如业务真实UID和提供给SudMGP的虚拟UID的对应关系）问题，理论上只需要单点无存储服务即可，信息实际安全存储于JWT令牌中。
> 3. 自定义方式，业务方可自行选择任意长短令牌生成和交换方式，无需使用 `SudMGPAuth` 。

## 服务端快速接入

- [Java](./Server/StartUp-Java.md)

- [Go](./Server/StartUp-Go.md)

- [Node](./Server/StartUp-Node.md)

## 服务端文档

- [文档](./Server/StartUp.md)
- [更新日志](./Server/Server_Change_Log.md)

## 服务端SDK下载

- [Java v1.0.4](https://github.com/SudTechnology/sud-mgp-auth-java/releases)

- [Go v1.0.2](https://github.com/SudTechnology/sud-mgp-auth-go/releases)

- [Node v1.0.0](https://github.com/SudTechnology/sud-mgp-auth-node/releases)

## 服务端Demo下载

- [Java v1.0.0](https://github.com/SudTechnology/hello-sud-java/releases)

- [Go v1.0.0](https://github.com/SudTechnology/hello-sud-go/releases)

- [Node v1.0.0](https://github.com/SudTechnology/hello-sud-node/releases)
