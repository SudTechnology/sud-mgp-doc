## SudPlayerMgr API ##
>**继承使用查看[PlayerMgr](../comframeworkApi/PlayerMgrAPI.md)**
###SudPlayerMgr:SudLogin()
- 说明

```txt
通知sdk玩家登录
```

###SudPlayerMgr:init()
- 说明

```txt
初始化
```

###SudPlayerMgr:Close()
- 说明

```txt
关闭
```

###SudPlayerMgr:AddEvents()
- 说明

```txt
添加消息事件
```

###SudPlayerMgr:RemoveEvents()
- 说明

```txt
移除消息事件
```

###SudPlayerMgr:onConnectSuccess()
- 说明

```txt
游戏服务器连接成功，通知SDK加载完成即登录完成
```

###SudPlayerMgr:onUpdateAccountAttributes(info)
- 说明 (具体**使用**可以参考[comframework](./comframeworkSummary.md))

```txt
更新自己的账号数据，数据内容必须带 playerId ，其他可以根据需求扩展
```
- 返回值(info)

|参数名|类型|说明|
|:----|:---|-----|
|playerId|String|玩家playerId|

###SudPlayerMgr:getSelfPlayerData()
- 说明

```txt
获取自己在游戏中的数据（playerData）,数据内容必须带 playerId ，其他可以根据需求扩展
```

- 返回值(playerData)

|参数名|类型|说明|
|:----|:---|-----|
|playerId|string|玩家playerId|

###SudPlayerMgr:getPlayerDatas()
- 说明

```txt
获取玩家数据列表，playerDatas
```

- 返回值(playerDatas)

|参数名|类型|说明|
|:----|:---|-----|
|playerDatas|array|数组类型|

###SudPlayerMgr:GetPlayerDataByPlayerId(playerId)
- 说明

```txt
获取玩家数据列表，playerDatas
```
|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|playerId|是|string|玩家playerId|

- 返回值(playerData)

|参数名|类型|说明|
|:----|:---|-----|
|playerId|string|玩家playerId|

###SudPlayerMgr:isPlayGame()
- 说明

```txt
自己是否在游戏中。
```

- 返回值(boolean)

|返回值|说明|
|:----|-----|
|true|在游戏中|
|false|不在游戏中|

###SudPlayerMgr:onPlayerLogin(info)
- 说明

```txt
玩家加入游戏。
```

- 参数(info)

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|account|是|object|玩家账号数据|
|game|是|object|游戏数据|

- game

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|captain|是|int|队长id|
|players|是|array|游戏中的玩家列表|

###SudPlayerMgr:restSdkStatus(playerId, teamId)
- 说明

```txt
重置玩家状态。
```

- 参数(info)

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|playerId|是|string|玩家id|
|teamId|是|string|队伍id|

###SudPlayerMgr:sendCurGameStatus(data)
- 说明

```txt
发送当前游戏状态
```

- 参数(data)

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|state|是|int|状态id|

- state

|返回值|说明|
|:----|-----|
|0|空闲状态|
|1|加载中|
|2|游戏中|

###SudPlayerMgr:sendPlayerInitStatus(data, gameInfo)
- 说明

```txt
发送玩家初始状态
```

- 参数(data)

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|state|是|int|状态id|

- 参数(gameInfo)

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|state|是|int|状态id|

- state

|返回值|说明|
|:----|-----|
|0|空闲状态|
|1|加载中|
|2|游戏中|

###SudPlayerMgr:onPlayerEnter(info)
- 说明

```txt
玩家坐下
```

- 参数(info)

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|player|是|object|玩家数据|

###SudPlayerMgr:onPlayerLeave(info)
- 说明

```txt
玩家离开座位
```

- 参数(info)

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|playerId|是|string|玩家id|

###SudPlayerMgr:onPlayerEscape(info)
- 说明

```txt
玩家游戏中逃跑
```

- 参数(info)

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|playerId|是|string|玩家id|

###SudPlayerMgr:onChangeCaptain(info)
- 说明

```txt
转移（改变）队长
```

- 参数(info)

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|playerId|是|string|玩家id|

###SudPlayerMgr:onPlayerReady(info)
- 说明

```txt
玩家准备游戏
```

- 参数(info)

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|playerId|是|string|玩家id|
|isReady|是|int|1:准备，0:取消准备|

###SudPlayerMgr:onGameReady(info)
- 说明

```txt
游戏开始前的准备过程
```

- 参数(info)

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|roundId|是|int|局数|
|game|是|object|游戏数据|

- game

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|players|是|array|游戏中的玩家列表|

###SudPlayerMgr:onGameStart()
- 说明

```txt
游戏开始
```

###SudPlayerMgr:onGameFinish(info)
- 说明

```txt
游戏结束
```

- 参数(info)

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|results|是|array|游戏结果数据|
|roundId|是|string|局ID|
|reason|是|int|原因 0: 正常结束  3: 提前结束（所有人都不玩了）|

- result

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|playerId|是|string|玩家id|

###SudPlayerMgr:onGameFinish(info)
- 说明

```txt
游戏结束
```

- 参数(info)

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|results|是|array|游戏结果数据|
|roundId|是|string|局ID|
|reason|是|int|原因 0: 正常结束  3: 提前结束（所有人都不玩了）|

- result

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|playerId|是|string|玩家id|

###SudPlayerMgr.onSdkLoginSuccess(data)
- 说明

```txt
游戏结束
```

- 参数(data)

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|code|是|int|返回码|
|room_id|是|int|房间id|


###SudPlayerMgr.onSdkStateChange(status,data)
- 说明

```txt
SDK通知游戏,状态改变
```

- 参数(status)

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|status|是|int|状态|

- 参数(data)

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|data|是|object|数据|

###SudPlayerMgr:LoginToServer()
- 说明

```txt
开始登录到游戏服务器
```

###SudPlayerMgr:expireCode()
- 说明

```txt
更新code有效期
```

###SudPlayerMgr:JoinGame(seatIndex)
- 说明

```txt
加入游戏
```

- 参数(status)

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|seatIndex|是|int|座位号，0开始，-1：随机|