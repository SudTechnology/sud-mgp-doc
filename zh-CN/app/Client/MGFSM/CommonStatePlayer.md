#

![SUD](../../Resource/logo.png)

## 通用状态-玩家

> Tips
> 1. SDK保证状态有序串行从MG到达APP；
> 2. 可重复通知，无需保证通知次数；
> 3. 通知后SDK会按UID和state值缓存最新一次的data值，供APP随时主动获取；
> 4. MG会通知房间内每个用户（包括所有玩家和所有OB）的状态，APP可按需处理展现；
> 5. ISudFSMMSG void onPlayerStateChange(ISudFSMStateHandle handle, String userId, String state, String dataJson);

### 0. 测试状态

- state

```
mg_common_player_hello_fsm
```

- data

```json
{
	"msg": "Hello FSM from MG player!"
}
```

- 说明

```
用于状态测试。
```

### 1.加入状态（已修改）
- 最低版本: v1.1.30.xx
- state

```
mg_common_player_in
```

- data

```json
{
	"isIn": true, 		  	// true 已加入，false 未加入;
	"teamId":1,   			// 加入哪支队伍;
	"reason": 0,		 	// 当isIn==false时有效；0 主动退出，1 被踢;（reason默认-1，无意义便于处理）
	"kickUID":"",		  	// 当reason==1时有效；kickUID为踢人的用户uid；判断被踢的人是本人条件(onPlayerStateChange(userId==kickedUID == selfUID)；（kickUID默认""，无意义便于处理）
	"seatIndex": 0,        	// 玩家的座位号 0开始(isIn 为true 时才有效)
}
```

- 说明

```
用户是否加入游戏；
游戏开始后，未加入的用户为OB视角。
```

### 2.准备状态（已修改）
- 最低版本: v1.1.30.xx
- state

```
mg_common_player_ready
```

- data

```json
{
	"isReady": true	  // true 已准备，false 未准备
}
```

- 说明

```
用户是否准备。
```

### 3.队长状态（已修改）
- 最低版本: v1.1.30.xx
- state

```
mg_common_player_captain
```

- data

```json
{
	"isCaptain": true   // true 是队长，false 不是队长；
}
```

- 说明

```
用户是否为队长，队长在游戏中会有开始游戏的权利。
```

### 4.游戏状态（已修改）
- 最低版本: v1.1.30.xx
- state

```
mg_common_player_playing
```

- data

```json
{
	"isPlaying": true,  // true 游戏中，false 未在游戏中；
	"gameRoundId": "12345699", // 本轮游戏id，当isPlaying==true时有效 
	"reason": 0,		   // 当isPlaying==false时有效；isPlaying=false, 0:本局游戏正常结束 1:提前结束本局游戏（玩家自己不玩了）2:提前结束本局游戏（无真人，只有机器人），暂不支持 3:提前结束本局游戏（所有人都不玩了）；（reason默认-1，无意义便于处理）
	"spaceMax": true // true 建议尽量收缩原生UI，给游戏留出尽量大的操作空间 false 初始状态；
}
```

### reason参数说明

|reason|类型|数值|说明|身份|操作|
|:----    |:---|:----- |:----- |-----   |-----   |
|reason |int  |0 |本局游戏正常结束   | 玩家|本局游戏正常结束 |
|reason |int  |1 |提前结束本局游戏（玩家自己不玩了）   | 玩家|APP发状态:app_common_self_playing isPlaying=false |
|reason |int  |2 |提前结束本局游戏（无真人，只有机器人）   |玩家| 暂不支持 |
|reason |int  |3 |提前结束本局游戏（所有人都不玩了）   |玩家+队长| APP发状态:app_common_self_end  |

- 说明

```
用户游戏状态，如果用户在游戏中，建议：
a.空出屏幕中心区：
关闭全屏礼物特效；
b.部分强操作类小游戏（spaceMax为true），尽量收缩原生UI，给游戏留出尽量大的操作空间：
收缩公屏；
收缩麦位；
如果不在游戏中，则恢复。
```

### 6.玩家换游戏位状态
- 最低版本: v1.1.30.xx
- state

```
mg_common_player_change_seat
```

- data

```json
{
  "preSeatIndex": 1,	// 换位前的游戏位(座位号)
  "currentSeatIndex": 1		// 换位成功后的游戏位(座位号)
}
```

- 说明

```
玩家换座位
```

### 7. 游戏通知app点击玩家头像（2022-02-09新增，仅用于游戏场景中的玩家头像）

- state

```
mg_common_self_click_game_player_icon
```

- data

```json
{
	"uid": "用户id"	// 被点击头像的用户id
}
```

- 说明

```
游戏通知app点击玩家头像
```


### 8. 游戏通知app玩家死亡状态（2022-04-24新增）

- state

```
mg_common_self_die_status
```

- data

```json
{
	"uid": "用户id",	// 用户id
	"isDeath": true,  // 玩家是否死亡 true:死亡, false: 未死亡；默认 false
}
```

- 说明

```
游戏通知app玩家死亡状态
```

### 9. 游戏通知app轮到玩家出手状态（2022-04-24新增）

- state

```
mg_common_self_turn_status
```

- data

```json
{
	"uid": "用户id",	// 用户id
	"isTurn": true,  // 是否轮到玩家出手 true:是上面uid玩家的出手回合, false: 不是上面uid玩家的出手回合；默认false
}
```

- 说明

```
游戏通知app轮到玩家出手状态
```

### 10. 游戏通知app玩家选择状态（2022-04-24新增）

- state

```
mg_common_self_select_status
```

- data

```json
{
	"uid": "用户id",		// 用户id
	"isSelected": true,  // 玩家是否选择 true:选择, false: 未选择； 默认false
}
```

- 说明

```
游戏通知app玩家选择状态
```


### 11. 游戏通知app层当前游戏剩余时间（2022-05-23新增，目前UMO生效）

- state

```
mg_common_game_countdown_time
```

- data

```json
{
	"countdown": 123 // 剩余时间，单位为秒
}
```

- 说明

```
游戏通知app层当前游戏剩余时间
```

### 12. 游戏通知app层当前玩家死亡后变成ob视角（2022-08-23新增，目前狼人杀生效）

- state

```
mg_common_self_ob_status
```

- data

```json
{
	"isOb": true	// 是否成为ob视角
}
```

- 说明

```
游戏通知app层当前玩家死亡后变成ob视角
```