## comframework概述 ##
**comframework**主要是对**SudFrameWork**做了继承和扩展，是扩展和继承**SudFrameWork**的示例，研发可以根据自己的需求和用途，自己重新扩展继承**SudFrameWork**，也可以继续使用**comframework**的基础上完善来达到自己项目的需求。
>整个框架结构：

    ─comframework
      │  FrameWork.lua  ：框架主体类 
      │  
      ├─BaseView
      │      BaseAlertView.lua  ：弹框类
      │      
      ├─common
      │      BaseCmd.lua  ：网络cmd
      │      Const.lua  ：状态码定义
      │      
      ├─mgrs
      │      AudioMgr.lua  ：扩展的声音管理器
      │      LobbyMgr.lua  ：扩展的大厅管理器
      │      NetMgr.lua  ：网络管理器
      │      PlayerMgr.lua  ：扩展的玩家管理
      │      ProtoMgr.lua  ：protobuffer协议管理器
      │      RoomMgr.lua  ：游戏房间管理器
      │      UIMgr.lua  ：ui管理器
      │      
      └─View
            commonView.lua  ：通用界面

> 具体**示例**可以查看[石头剪刀布游戏](./RpsGame/ReadMe.md)