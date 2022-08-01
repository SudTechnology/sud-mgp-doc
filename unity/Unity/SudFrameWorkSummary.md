## 1.SudFrameWork概述 ##
**SudFrameWork**主要是对**SudSdk**做了扩展和整合，方便外部快速接入和使用SudSdk。
>整个框架结构：

    SudFrameWork
    │  SudConst.lua  ：   一些主要的事件定义
    │  SudFrameWork.lua ：框架主文件
    │  
    ├─base
    │      class.lua
    │      eventlib.lua
    │      
    ├─common
    │      Env.lua ：环境类
    │      util.lua
    │      
    ├─events
    │      EventDispatcher.lua ：事件管理类
    │      
    ├─interface
    │      ServerStructureData.lua ：定义的一些数据结构
    │      
    ├─mgrs
    │      PlatformMgr.lua ： 平台相关
    │      SudAudioMgr.lua ： 声音管理器
    │      SudLobbyMgr.lua ： 基础大厅管理器
    │      SudPlayerMgr.lua ：基础玩家管理
    │      
    ├─network
    │      Http.lua ：     http封装
    │      SocketMgr.lua ：socket封装
    │      
    └─sdks
            sdk.lua ：与原生sdk交互相关
            SudMGSDK.lua
> 具体**示例**可以查看[石头剪刀布游戏](./RpsGame/ReadMe.md)
