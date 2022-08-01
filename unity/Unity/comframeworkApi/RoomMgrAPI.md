## RoomMgr API ##

###RoomMgr:join(seatIndex, teamId, isSeatRandom)
- 说明

```txt
通知服务器加入房间
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|seatIndex|是|int|座位号,0开始|
|teamId|是|int|队伍id|
|isSeatRandom|是|int|是否随机座位,避免位置冲突|

- 示例：

```lua
RoomMgr:join(1,0,0)
```

###RoomMgr:changeSeat(seatIndex) 
- 说明

```txt
通知服务器换座，改变座位
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|seatIndex|是|int|座位号,0开始|

- 示例：

```lua
RoomMgr:changeSeat(1) 
```

###RoomMgr:exit()
- 说明

```txt
通知服务器退出房间
```

###RoomMgr:cancelReady(callback)
- 说明

```txt
通知服务器取消准备
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|callback|是|function|取消返回回调|

- 示例：

```lua
RoomMgr:cancelReady(function()
    --todo ... 
end)
```

###RoomMgr:ready()
- 说明

```txt
通知服务器准备
```

###RoomMgr:gameStart(reportGameInfoExtras, reportGameInfoKey)
- 说明

```txt
通知服务器开始游戏
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|reportGameInfoExtras|否|string|游戏上报信息扩展参数（透传），取值范围：长度不超过1024字节，超过则截断|
|reportGameInfoKey|否|string|新增查询字段，开始游戏客户端携带该参数，服务端game_report 上报携带该参数|

- 示例：

```lua
RoomMgr:gameStart()
```

###RoomMgr:reqAddAIPlayers(data)
- 说明

>通知服务器添加ai玩家,具体查看[app_common_game_add_ai_players](https://showdoc.divtoss.com/web/#/15?page_id=573)


- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|data|否|object|ai 玩家列表数据，json object|

###RoomMgr:transferCaptain(seatIdx)
- 说明

```txt
转入队长
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|seatIdx|是|int|座位号,0开始|

###RoomMgr:escape()
- 说明

```txt
逃跑
```

###RoomMgr:kickout(seatIndex)
- 说明

```txt
踢人(队长才又权限踢人)
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|seatIdx|是|int|座位号,0开始|

###RoomMgr:disband()
- 说明

```txt
解散游戏
```