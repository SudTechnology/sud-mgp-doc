#

![SUD](../../Resource/logo.png)

# 通用状态-游戏

> Tips
>
> 1. SDK 保证状态有序串行从 MG 到达 APP；
> 2. 可重复通知，无需保证通知次数；
> 3. 通知后 SudMGP 保证状态有序串行从 MG 到达 APP；会按 state 值缓存最新一次的 data 值，供 APP 随时主动获取；
> 4. ISudFSMMG void onGameStateChange(ISudFSMStateHandle handle, String state, String dataJson)；

### 0. 测试状态

- state

```
mg_common_hello_fsm
```

- data

```json
{
  "msg": "Hello FSM from MG!"
}
```

- 说明

```
用于状态测试。
```

### 1. 公屏消息（已修改）

- 最低版本: v1.1.30.xx
- state

```
mg_common_public_message
```

- data

```json
{
  "type": 0,
  "msg": [
    {
      "phrase": 1,
      "text": {
        "default": "玩家",
        "en-US": "Player"
      }
    },
    {
      "phrase": 2,
      "user": {
        "name": "用户A",
        "uid": "0001",
        "color": "#00FF00"
      }
    },
    {
      "phrase": 1,
      "text": {
        "default": "击败了玩家",
        "en-US": "击败了玩家"
      }
    },
    {
      "phrase": 2,
      "user": {
        "name": "用户B",
        "uid": "0002",
        "color": "#FF0000"
      }
    }
  ]
}
```

- 说明

```
向公屏发送消息，字段含义如下
type
0 通知
1 提醒
2 结算
3 其他
msg

<!-- -->内为转义字段：
<!--name:用户昵称|uid:用户UID|color:建议颜色-->
其中name/uid/color均为可选字段，字段为空的情况如下：
<!--name:|uid:|color:-->
SDK仅会缓存最新一条。
```

- json

| 字段 | 类型            | 必填 | 默认 | 注释           |
| :--- | :-------------- | :--- | ---- | -------------- |
| type | int             | 是   |      | 词组类型       |
| msg  | json[词组,词组] | 是   |      | 词组 json 数组 |

- 词组

| 字段   | 类型 | 必填               | 默认 | 注释                 |
| :----- | :--- | :----------------- | ---- | -------------------- |
| phrase | int  | 是                 |      | 词组类型             |
| text   | json | 当 phrase=1 时，是 |      | 当 phrase=1 时，必填 |
| user   | json | 当 phrase=2 时，是 |      | 当 phrase=2 时，必填 |

- 当 phrase=1 时参数说明

| 字段         | 类型   | 必填 | 默认 | 注释                                            |
| :----------- | :----- | :--- | ---- | ----------------------------------------------- |
| text         | json   | 是   |      | 词组类型                                        |
| text.default | string | 是   |      | default，文本默认                               |
| text.zh-CN   | string | 否   |      | zh-CN，文本                                     |
| text.en-US   | string | 否   |      | en-US，文本                                     |
| text.XXXX    | string | 否   |      | XXXX，文本                                      |
| text.XXXX    | string | 否   |      | XXXX 规则：languageCode(小写)-CountryCode(大写) |

- 当 phrase=2 时参数说明

| 字段  | 类型   | 必填 | 默认 | 注释                 |
| :---- | :----- | :--- | ---- | -------------------- |
| user  | json   | 是   |      | 当 phrase=2 时，必填 |
| name  | string | 是   |      | 当 phrase=2 时，必填 |
| uid   | string | 是   |      | 当 phrase=2 时，必填 |
| color | string | 是   |      | 当 phrase=2 时，必填 |

### 2. 关键词状态

- state

```
mg_common_key_word_to_hit
```

- data

```json
{
  "wordType": "text",   					// 必填字段；text:文本包含匹配; number:数字等于匹配(必填字段)；默认:text（你画我猜、你说我猜）；数字炸弹填number；
  "word": "关键", 					   // 单个关键词，兼容老版本
  "realWord": "关键词",
  "wordList": ["关键词1", "关键词2", …],	// 必填字段；关键词列表，可以传送多个关键词
"wordLanguage ": "zh-CN", 	  // 必填字段；关键词语言，默认:zh-CN；
}
```

- 说明

```
关键词
```

### 3. 游戏结算状态

- 最低版本: v1.1.30.xx
- state

```
mg_common_game_settle
```

- data

| 字段        | 类型                   | 必填 | 默认 | 注释             |
| :---------- | :--------------------- | :--- | ---- | ---------------- |
| gameMode    | int                    | 是   | 1    | 游戏模式默认为 1 |
| gameRoundId | string                 | 是   |      | 本局游戏的 id    |
| results     | PlayerResult json 数组 | 是   |      | 游戏结果玩家列表 |

- PlayerResult = {}

| 字段      | 类型   | 必填 | 默认 | 注释                       |
| :-------- | :----- | :--- | ---- | -------------------------- |
| uid       | string | 是   |      | 用户 id                    |
| rank      | int    | 是   |      | 排名 从 1 开始             |
| award     | int    | 是   |      | 奖励                       |
| score     | int    | 是   |      | 积分                       |
| isEscaped | int    | 否   |      | 是否逃跑 1：逃跑 0：非逃跑 |
| killerId  | string | 否   |      | 杀自己的玩家的 id          |
| isManaged | int    | 是   |      | 是否托管完成游戏           |
| extras    | string | 是   |      | 扩展信息                   |

- data

```json
{
  "gameMode": 1, // 游戏模式
  "gameRoundId": "123", // 本局游戏id
  "results": [
    {
      "uid": "用户id", // 用户id
      "rank": 1, // 排名 从 1 开始
      "award": 100, // 奖励
      "score": 100, // 积分
      "isEscaped": 1, // 逃跑
      "killerId": "杀自己的玩家id", // 杀自己的玩家id
      "isAI": 0, // 是否是AI玩家
      "isManaged": 0, // 是否托管完成游戏
      "extras": "" // 扩展信息
    }
  ]
}
```

- 说明

```
游戏结算状态
```

### 4. 加入游戏按钮点击状态

- state

```
mg_common_self_click_join_btn
```

- data

| 字段      | 类型 | 必填 | 默认 | 注释                                              |
| :-------- | :--- | :--- | ---- | ------------------------------------------------- |
| seatIndex | int  | 否   | -1   | 点击头像加入游戏对应的座位号，int 类型，从 0 开始 |

```json
{
  "seatIndex": 0 // 点击头像加入游戏对应的座位号，int 类型，从0开始， 如果seatIndex=-1，则是随机加入一个空位，如果seatIndex 大于座位数，则加入不成功
}
```

- 说明

```
用户（本人）点击加入按钮，或者点击头像加入
```

### 5. 取消加入(退出)游戏按钮点击状态

- state

```
mg_common_self_click_cancel_join_btn
```

- data

```json
{}
```

- 说明

```
用户（本人）点击取消加入按钮
```

### 6. 准备按钮点击状态

- state

```
mg_common_self_click_ready_btn
```

- data

```json
{}
```

- 说明

```
用户（本人）点击准备按钮
```

### 7. 取消准备按钮点击状态

- state

```
mg_common_self_click_cancel_ready_btn
```

- data

```json
{}
```

- 说明

```
用户（本人）点击取消准备按钮
```

### 8. 开始游戏按钮点击状态

- state

```
mg_common_self_click_start_btn
```

- data

```json
{}
```

- 说明

```
用户（本人，队长）点击开始游戏按钮
```

### 9. 分享按钮点击状态

- state

```
mg_common_self_click_share_btn
```

- data

```json
{}
```

- 说明

```
用户（本人）点击分享按钮
```

### 10. 游戏状态

- state

```
mg_common_game_state
```

- data

```json
{
  "gameState": 0 // gameState=0 (idle 状态，游戏未开始，空闲状态）；gameState=1 （loading 状态，所有玩家都准备好，队长点击了开始游戏按钮，等待加载游戏场景开始游戏）；gameState=2（playing状态，游戏进行中状态）
}
```

- 说明

```
游戏状态
```

### 11. 结算界面关闭按钮点击状态（2021-12-27 新增）

- state

```
mg_common_self_click_game_settle_close_btn
```

- data

```json
{}
```

- 说明

```
用户（本人）点击结算界面关闭按钮
```

### 12. 结算界面再来一局按钮点击状态（2021-12-27 新增）

- state

```
mg_common_self_click_game_settle_again_btn
```

- data

```json
{}
```

- 说明

```
用户（本人）点击结算界面再来一局按钮
```

### 13. 游戏上报游戏中的声音列表（2021-12-30 新增）

- state

```
mg_common_game_sound_list
```

- data

```json
{
  "list": [
    {
      "name": "click", // 声音资源的名字
      "url": "https://www.xxxx/click.mp3", // 声音资源的URL链接
      "type": "mp3" // 声音资源类型
    }
  ]
}
```

- 说明

```
游戏上报本游戏中所有的声音资源列表
```

### 14. 游通知 app 层播放声音（2021-12-30 新增）

- state

```
mg_common_game_sound
```

- data

```json
{
  "isPlay": true, // 是否播放 isPlay==true(播放)，isPlay==false(停止)
  "name": "click", // 要播放的声音文件名，不带后缀
  "type": "mp3", // 声音资源类型
  "times": 1, // 播放次数；注：times == 0 为循环播放
  "url": "https://www.xxxx.xx/xxx.mp3" // 声音资源的url链接
}
```

- 说明

```
游戏通知app层播放声音
```

### 15. 游戏通知 app 层播放背景音乐状态（2022-01-07 新增）

- state

```
mg_common_game_bg_music_state
```

- data

```json
{
  "state": true // 背景音乐的开关状态 true: 开，false: 关
}
```

- 说明

```
游戏通知app层播放背景音乐的开关状态
```

### 16. 游戏通知 app 层播放音效的状态（2022-01-07 新增）

- state

```
mg_common_game_sound_state
```

- data

```json
{
  "state": true // 背景音乐的开关状态 true: 开，false: 关
}
```

- 说明

```
游戏通知app层播放音效的状态
```

### 17. ASR 状态(开启和关闭语音识别状态，SudMGP v1.1.45.xx 版本新增)

- state

```
mg_common_game_asr
```

- data

```json
{
  "isOpen": true, // true:打开语音识别 false:关闭语音识别
  "wordList": ["关键词1", "关键词2"], // 必填字段；关键词列表，可以传送多个关键词
  "realWord": "关键词",               // 必填字段；关键词
  "wordLanguage ": "zh-CN", // 必填字段；关键词语言，默认:zh-CN(老版本游戏可能没有)；透传
  "wordType": "text", // 必填字段；text:文本包含匹配; number:数字等于匹配(必填字段)；默认:text(老版本游戏可能没有)；数字炸弹填number；透传
  "isCloseConnHitted ": true, // 必填字段；关闭语音识别的方式。false: 关闭Seesion不断开连接；true:关闭Session断开连接；isOpen为true时，为命中关键字时的关闭方式，默认:true(老版本游戏可能没有)；透传
  "enableIsHit ": true, // 必填字段，是否需要匹配关键字， 默认是true,   如果是false, 则只简单的返回语音识别文本；透传
  "enableIsReturnText ": true, // 必填字段，是否需要返回转写文本，默认是true
  "extra": {} // 选填字段，客户端的额外信息，例如新功能的配置信息，暂不对外公布
}
```

- 说明

```
开启和关闭语音识别状态
```

### 18. 麦克风状态（2022-03-04 新增）

- state

```
mg_common_self_microphone
```

- data

```json
{
  "isOn": true // 麦克风开关状态 true: 开(APP开启RTC推流)；false: 关(APP关闭RTC推流)
}
```

- 说明

```
游戏通知app麦克风状态
```

### 19. 耳机（听筒，扬声器）状态（2022-03-04 新增）

- state

```
mg_common_self_headphone
```

- data

```json
{
  "isOn": true // 耳机（听筒，喇叭）开关状态 true: 开(APP开启RTC拉流)；false: 关(APP关闭RTC拉流)
}
```

- 说明

```
游戏通知app耳机（听筒，喇叭）状态
```

### 20. App 通用状态操作结果错误码（2022-05-10 新增）

- state

```
mg_common_app_common_self_x_resp
```

- data

```json
{
  "state": "app_common_self_playing", // 字段必填, 参考：游戏业务错误 https://docs.sud.tech/zh-CN/app/Client/APPFST/CommonState.html
  "resultCode": 0, // 字段必填，参考：游戏业务错误 https://docs.sud.tech/zh-CN/app/Server/ErrorCode.html
  "isIn": true, // 当state=app_common_self_in时，字段必填
  "isReady": true, // 当state=app_common_self_ready时，字段必填
  "isPlaying": true, // 当state=app_common_self_playing时，字段必填
  "reportGameInfoExtras": "", // 当state=app_common_self_playing时，字段必填
  "curCaptainUID": "", // 当state=app_common_self_captain时，字段必填
  "kickedUID": "" // 当state=app_common_self_kick时，字段必填
}
```

- 说明

```
App通用状态操作错误结果回调状态（注：只回调错误结果）
目前只支持app_common_self_playing
```

### 21. 游戏通知 app 层添加陪玩机器人是否成功（2022-05-17 新增）

- state

```
mg_common_game_add_ai_players
```

- data

```json
{
	"resultCode": 0, //返回码 0：成功，非0：不成功
	"userIds": ["123", ...] // 加入成功的playerId列表
}
```

- 说明

```
游戏通知app层添加陪玩机器人是否成功
```

### 22. 游戏通知 app 层添当前网络连接状态（2022-06-21 新增）

- state

```
mg_common_game_network_state
```

- data

```json
{
  "state": 1 // 0:closed, 1: connected
}
```

- 说明

```
游戏通知app层添当前网络连接状态
```

### 23. 游戏通知app获取积分

- state

```
mg_common_game_get_score
```

- data

```json
{
}
```

- 说明

```
游戏通知app获取积分
```

### 24. 游戏通知app带入积分

- state

```
mg_common_game_set_score
```

- data

```json
{
	"currentScore": 0,	// 本人当前积分
	"addScore": 10,		// 充值积分
	"totalScore": 10	// 充值后总积分
}
```

- 说明
```
游戏通知app带入积分
```


### 25. 创建订单

- state

```
mg_common_game_create_order
```

- data

```json
{
	"cmd": "",	     // 触发的行为动作，比如打赏，购买等
	"fromUid": "",	 // 付费用户uid
	"toUid": "",	 // 目标用户uid
	"value": 123,	 // 所属的游戏价值
	"payload": "{}", // 扩展数据 json 字符串, 特殊可选
}
```

- cmd 事件数据参数对应表

1.德州扑克专业版，游戏ID=1557194155570024449

|cmd|value|cmd附加数据(payload)|说明|
|:----|:---|:---|:-----|
|add_score ||| 带入积分| 

2.TeenPatti专业版，游戏ID=1557194487352053761

|cmd|value|cmd附加数据(payload)|说明|
|:----|:---|:---|:-----|
|add_score ||| 带入积分| 

3.太空杀，游戏ID=1559736844916183041

|cmd|value|cmd附加数据(payload)|说明|
|:----|:---|:---|:-----|
|reward |1 //0.5票<br/>2 //1票<br/>3 //1.5票<br/>4 //2票<br/>5 //2.5票<br/>6 //3票<br/>7 //3.5票<br/>8 //4票<br/>9 //4.5票<br/>10 //5票|| 打赏| 

4.狼人杀，游戏ID=1472142747708284929

|cmd|value|cmd附加数据(payload)|说明|
|:----|:---|:---|:-----|
|use_role ||{"role_id": 1 || 2 || 3 || 4 || 5 || 6 }| 抢角色|
role_id 说明（1：狼人，2：村民，3：预言家，4：女巫，5：猎人，6：守卫）
- 说明

```
创建订单
```

### 26. 游戏通知app玩家角色(仅对狼人杀有效)

- state

```
mg_common_player_role_id
```

- data

```json
{
	"playersRoleId": [{"uid": "玩家id", "roleId": 1 }, {"uid": "玩家id", "roleId": 1}], 	// roleId: (0:不知道，1狼人，2村民，3预言家，4女巫，5猎人, 6守卫)
}
```

- 说明
```
游戏通知app玩家角色
```


### 27. 游戏通知app玩家被扔便便(仅对你画我猜有效)

- state

```
mg_common_self_click_poop
```

- data

```json
{
	
}
```

- 说明
```
游戏通知app玩家被扔便便
```

### 28. 游戏通知app玩家被点赞(仅对你画我猜有效)

- state

```
mg_common_self_click_good
```

- data

```json
{
	
}
```

- 说明
```
游戏通知app玩家被点赞
```


### 29. 游戏通知app游戏FPS(仅对碰碰，多米诺骨牌，飞镖达人生效)

- state

```
mg_common_game_fps
```

- data

```json
{
	"fps": 60
}
```

- 说明
```
游戏通知app游戏FPS
```


### 30. 游戏通知app游戏弹框

- state

```
mg_common_alert
```

- data

```json
{
	"state": "show" // show:显示，close:关闭
}
```

- 说明
```
游戏通知app游戏弹框
```

### 31. 游戏通知app最坑队友（只支持友尽闯关）

- state

```
mg_common_worst_teammate
```

- data

```json
{
	"uid": "123" // 最坑队友的uid
}
```

- 说明
```
游戏通知app最坑队友
```

### 32. 游戏通知app因玩家逃跑导致游戏结束（只支持友尽闯关）

- state

```
mg_common_game_over_tip
```

- data

```json
{
	"uids": ["123", "345"] // 逃跑玩家的uid数组
}
```

- 说明
```
游戏通知app因玩家逃跑导致游戏结束
```


### 33. 游戏通知app玩家颜色（只支持友尽闯关）

- state

```
mg_common_game_player_color
```

- data

```json
{
	"players": [
		{"uid": "123", "color": 1},
		{"uid": "123", "color": 2},
		{"uid": "123", "color": 3}
	]
}

//color:1是粉色，2是紫色，3是绿色，4是蓝色，5是黄色，6是橙色
```

- 说明
```
游戏通知app玩家颜色
```

### 34. 游戏通知app玩家头像的坐标（只支持ludo）

- state

```
mg_common_game_player_icon_position
```

- data

```json
{
	"uid":"123",	// 玩家id
	"position":	{"x": 0, "y": 0}	// 头像坐标
}
```

- 说明
```
游戏通知app玩家头像的坐标
```