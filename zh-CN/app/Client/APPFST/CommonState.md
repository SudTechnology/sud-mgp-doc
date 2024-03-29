#

![SUD](../../Resource/logo.png)

## 通用状态

> Tips
1. SDK保证状态有序串行从APP到达MG；
2. 可重复通知，无需保证通知次数；
3. 通知后SDK会按state值缓存最新一次的data值，供MG随时主动获取；
4. APP仅需通知用户自己的状态，MG服务会负责广播并同步到各对端；
5. ISudFSTAPP void notifyStateChange(String state, String dataJson, ISudListenerNotifyStateChange listener)使用；

[TOC]

#状态转换说明

![状态转换说明](../../Resource/Client/gamestate.png)


### 0. 测试状态

- state

```
app_common_hello_fsm
```

- data

```json
{
  "msg": "Hello FSM from APP!"
}
```

- 说明

```
用于状态测试
```

### 1. 加入状态
- 最低版本: v1.1.30.xx
- state

```
app_common_self_in
```

- data

```json
{
	"isIn": true, // true 加入游戏，false 退出游戏
	"seatIndex": 1,  // 加入的游戏位(座位号) 默认传seatIndex = -1 随机加入，seatIndex 从0开始，不可大于座位数
	"isSeatRandom": true, // 默认为ture, 带有游戏位(座位号)的时候，如果游戏位(座位号)已经被占用，是否随机分配一个空位坐下 isSeatRandom=true 随机分配空位坐下，isSeatRandom=false 不随机分配
	"teamId":1  // 不支持分队的游戏：数值填1；支持分队的游戏：数值填1或2（两支队伍）；
}
```

- 说明

```
用户（本人）加入游戏/退出游戏
正确流程：
1.isIn=true: 加入游戏=>准备游戏=>开始游戏;
2.isIn=false: 结束=>取消准备=>退出游戏;
```

### 2. 准备状态
- 最低版本: v1.1.30.xx
- state

```
app_common_self_ready
```

- data

```json
{
	"isReady": true // true 准备，false 取消准备
}
```

- 说明

```
用户（本人）准备/取消准备
```

### 3. 游戏状态
- 最低版本: v1.1.30.xx
- state

```
app_common_self_playing
```

- data

```json
{
	"isPlaying": true, // true 开始游戏，false 结束游戏
	"reportGameInfoExtras": "透传参数",		// string类型，Https服务回调report_game_info参数，最大长度1024字节，超过则截断（2022-01-21）
	"reportGameInfoKey": "透传参数key"		// string类型，最大长度64字节，接入方服务端，可以根据这个字段来查询一局游戏的数据
}
```

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

### 4. 队长状态
- 最低版本: v1.1.30.xx
- state

```
app_common_self_captain
```

- data

```json
{
	"curCaptainUID":""  // 必填，指定队长uid
}
```

- 说明

```
用户是否为队长，队长在游戏中会有开始游戏的权利。
```

### 5. 踢人
- 最低版本: v1.1.30.xx
- state

```
app_common_self_kick
```

- data

```json
{
	"kickedUID": "uid"	// 被踢用户uid
}
```

- 说明

```
用户（本人，队长）踢其他玩家；
队长才能踢人；
```

### 6. 结束游戏
- 最低版本: v1.1.30.xx

- state

```
app_common_self_end
```

- data

```json
{}
```

- 说明

```
用户（本人，队长）结束（本局）游戏，提前结束本局游戏（所有人都不玩了）
```

### 7. 房间状态（depreated 已废弃v1.1.30.xx）
- 请使用 app_common_self_in 代替
- state

```
app_common_self_room
```

- data

```json
{
	"isIn": true // true 在房间内，false 不在房间内
}
```

- 说明

```
用户（本人）房间状态，建议：
用户进出房间各通知一次
```

- 说明

```
用户（本人）离开
```

### 8. 麦位状态（depreated 已废弃v1.1.30.xx）
- 请使用 app_common_self_in 代替
- state

```
app_common_self_seat
```

- data

```json
{
	"lastSeat": -1, // 之前在几号麦，从0开始，之前未在麦上值为-1
	"currentSeat": 0 // 目前在几号麦，从0开始，目前未在麦上值为-1
}
```

- 说明

```
用户（本人）所处的麦位状态，建议：
进入房间后初始通知一次；
每次变更（上麦/下麦/移麦）通知一次；
```

### 9. 麦克风状态（depreated 已废弃v1.1.30.xx）

- state

```
app_common_self_microphone
```

- data

```json
{
	"isOn": true, // true 开麦，false 闭麦
	"isDisabled": false // true 被禁麦，false 未被禁麦
}
```

- 说明

```
用户（本人）麦克风状态，建议：
进入房间后初始通知一次；
每次变更（开麦/闭麦/禁麦/解麦）通知一次；
```

### 10. 文字命中状态

- state

```
app_common_self_text_hit
```

- data

```json
{
	"isHit": true, // true 命中，false 未命中
	"keyWord": "关键", // 关键词
	"text": "这是关键" // 聊天原始内容
}
```

- 说明

```
用户（本人）聊天信息命中关键词状态，建议：
精确匹配；
首次聊天内容命中关键词之后，后续聊天内容不翻转成未命中；
直至小游戏侧关键词更新，再将状态翻转为未命中；
```

### 11. 打开或关闭背景音乐（2021-12-27新增）

- state

```
app_common_open_bg_music
```

- data

```json
{
	"isOpen": true // true 打开背景音乐，false 关闭背景音乐
}
```

- 说明

```
打开或者关闭背景音乐
```


### 12. 打开或关闭音效（2021-12-27新增）

- state

```
app_common_open_sound
```

- data

```json
{
	"isOpen": true // true 打开音效，false 关闭音效
}
```

- 说明

```
打开或者关闭音效
```

### 13. 打开或关闭游戏中的振动效果（2021-12-27新增）

- state

```
app_common_open_vibrate
```

- data

```json
{
	"isOpen": true // true 打开振动效果，false 关闭振动效果
}
```

- 说明

```
打开或者关闭振动效果
```

### 14. 设置游戏的音量大小（2021-12-31新增）

- state

```
app_common_game_sound_volume
```

- data

```json
{
	"volume": 100 // 音量大小 0 到 100
}
```

- 说明

```
设置游戏的音量大小
```

### 15. 设置游戏玩法选项（2022-05-10新增）

- state

```
app_common_game_setting_select_info
```

- data

```json
{
	"ludo": {			// 游戏名称
        "mode": 0,      // mode: 默认赛制，0: 快速, 1: 经典;
        "chessNum": 2,  // chessNum: 默认棋子数量, 2: 对应2颗棋子; 4: 对应4颗棋子;
        "item": 0       // item: 默认道具, 1: 有道具, 0: 没有道具
    },
}
```

- 说明

```
设置游戏玩法选项
```

### 16. 设置游戏中的AI玩家（2022-05-11新增）

- state

```
app_common_game_add_ai_players
```

- data

```json
{
	"aiPlayers": [
        {
                "userId":"",	// 玩家id
                "avatar":"",	// 头像url
                "name":"",		// 名字
                "gender":"male"		// 性别 male：男，female：女
        }
    ],
	"isReady": 1 // 机器人加入后是否自动准备 1：自动准备，0：不自动准备 默认为1
}
```

- 说明

```
设置游戏中的AI玩家
```

### 17. app在收到游戏断开连接通知后，通知游戏重试连接（2022-06-21新增）

- state

```
app_common_game_reconnect
```

- data

```json
{
	
}
```

- 说明

```
通知游戏重试连接
```

### 18. app返回玩家当前积分

- state

```
app_common_game_score
```

- data

```json
{
	"score": 10	// 玩家当前积分
}
```

- 说明

```
app返回玩家当前积分
```

### 20. app通知游戏点赞玩家（2022-11-19增加，当前支持你画我猜，你说我猜，友尽闯关）

- state

```
app_common_self_click_good
```

- data

```json
{
	
}
```

- 说明

```
app通知游戏点赞玩家
```

### 21. app通知游戏扔大便玩家（2022-11-19增加，当前支持你画我猜，你说我猜，友尽闯关）

- state

```
app_common_self_click_poop
```

- data

```json
{
	
}
```

- 说明

```
app通知游戏点踩玩家
```


### 22. app通知游戏设置FPS(目前只支持碰碰)

- state

```
app_common_game_fps
```

- data

```json
{
	"fps": 60
}
```

- 说明

```
app通知游戏设置FPS
```