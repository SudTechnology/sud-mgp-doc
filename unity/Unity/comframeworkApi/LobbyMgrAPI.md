## LobbyMgr API ##

###LobbyMgr:onCancelReady()
- 说明

```txt
取消准备，按钮事件
```

###LobbyMgr:onJoin() 
- 说明

```txt
加入游戏，按钮事件
```

###LobbyMgr:onReday()
- 说明

```txt
准备，按钮事件
```

###LobbyMgr:onCancelJoin()
- 说明

```txt
取消加入，按钮事件
```

###LobbyMgr:playerExit()
- 说明

>通知服务器玩家离开，按钮事件,具体使用查看[石头剪刀布游戏](../comframeworkSummary.md)

###LobbyMgr:playerExit()
- 说明

```txt
通知服务器玩家离开，按钮事件
```

###LobbyMgr:onStart()
- 说明

```txt
开始游戏 (一般队长才有权限开始游戏)，按钮事件
```

###LobbyMgr:OnJoinSeat(seatIndex)
- 说明

```txt
加入座位
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|seatIndex|是|int|座位号, **0**开始|

###LobbyMgr:requestLoadingGameCompile()
- 说明

```txt
通知服务器，游戏loading完成
```