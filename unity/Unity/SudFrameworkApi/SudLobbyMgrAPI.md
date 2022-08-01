## SudLobbyMgr API ##
>**继承使用查看[LobbyMgr](../comframeworkApi/LobbyMgrAPI.md)**
###SudLobbyMgr:onCancelReady()
- 说明

```txt
取消准备，主要区分是否为app自定义按钮处理，还有有游戏按钮处理逻辑。
```

- 返回值(boolean)

|返回值|说明|
|:----|-----|
|true|由app处理逻辑|
|false|游戏处理逻辑|

###SudLobbyMgr:onJoin()
- 说明

```txt
加入游戏，主要区分是否为app自定义按钮处理，还有有游戏按钮处理逻辑。
```

- 返回值(boolean)

|返回值|说明|
|:----|-----|
|true|由app处理逻辑|
|false|游戏处理逻辑|

###SudLobbyMgr:onReday()
- 说明

```txt
准备游戏，主要区分是否为app自定义按钮处理，还有有游戏按钮处理逻辑。
```

- 返回值(boolean)

|返回值|说明|
|:----|-----|
|true|由app处理逻辑|
|false|游戏处理逻辑|

###SudLobbyMgr:onCancelJoin()
- 说明

```txt
取消加入游戏，主要区分是否为app自定义按钮处理，还有有游戏按钮处理逻辑。
```

- 返回值(boolean)

|返回值|说明|
|:----|-----|
|true|由app处理逻辑|
|false|游戏处理逻辑|

###SudLobbyMgr:onStart()
- 说明

```txt
开始游戏，队长才有权使用这个。
```

- 返回值(boolean)

|返回值|说明|
|:----|-----|
|true|由app处理逻辑|
|false|游戏处理逻辑|

###SudLobbyMgr:canChangeSeat()
- 说明

```txt
是否能改变座位。
```

- 返回值(boolean)

|返回值|说明|
|:----|-----|
|true|由app处理逻辑|
|false|游戏处理逻辑|

###SudLobbyMgr:OnJoinSeat(seatIndex)
- 说明 (具体**使用**可以参考[comframework](./comframeworkSummary.md))

```txt
玩家加入座位。
```
|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|seatIndex|是|int|座位号,从**0**开始|

- 返回值(int)

|返回值|说明|
|:----|-----|
|-1|不能换座位|
|0|不需要通知服务器处理|
|1|通知服务器处理玩家换座位|
|2|通知服务器处理玩家直接坐下到座位|

###SudLobbyMgr:changeSeat(preSeatIndex,currentSeatIndex)
- 说明 (具体**使用**可以参考[comframework](./comframeworkSummary.md))

```txt
通知app玩家更换换座。
```
|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|preSeatIndex|是|int|改变之前的座位号,从**0**开始|
|currentSeatIndex|是|int|改变之后的座位号,从**0**开始|
