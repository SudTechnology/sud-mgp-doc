
#

![SUD](../../Resource/logo.png)

# 通用状态-游戏

> Tips
>
> 1. SDK保证状态有序串行从MG到达APP；
> 2. 可重复通知，无需保证通知次数；
> 3. 通知后SudMGP保证状态有序串行从MG到达APP；会按state值缓存最新一次的data值，供APP随时主动获取；
> 4. ISudFSMMG void onGameStateChange(ISudFSMStateHandle handle, String state, String dataJson)；

#状态转换说明

![状态转换说明](../../Resource/Client/gamestate.png)

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
        "type":0,
        "msg":[
            {
                "phrase":1,
                "text":{
                    "default":"玩家",
                    "en-US":"Player"
                }
            },
            {
                "phrase":2,
                "user":{
                    "name":"用户A",
                    "uid":"0001",
                    "color":"#00FF00"
                }
            },
            {
                "phrase":1,
                "text":{
                    "default":"击败了玩家",
                    "en-US":"击败了玩家"
                }
            },
            {
                "phrase":2,
                "user":{
                    "name":"用户B",
                    "uid":"0002",
                    "color":"#FF0000"
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

|字段|类型|必填|默认|注释|
|:----    |:-------    |:--- |----|------      |
|type | int |是   |    |   词组类型   |
|msg | json[词组,词组] |是   |    |   词组json数组   |

- 词组

|字段|类型|必填|默认|注释|
|:----    |:-------    |:--- |-- -|------      |
|phrase |int |是   |    |   词组类型   |
|text |json | 当phrase=1时，是  |    |   当phrase=1时，必填    |
|user |json | 当phrase=2时，是  |    |   当phrase=2时，必填    |

-  当phrase=1时参数说明

|字段|类型|必填|默认|注释|
|:----    |:-------    |:--- |----|------      |
|text |json |是   |    |   词组类型   |
|text.default |string |是   |    |   default，文本默认   |
|text.zh-CN |string |否   |    |   zh-CN，文本    |
|text.en-US |string |否   |    |   en-US，文本    |
|text.XXXX |string |否   |    |   XXXX，文本    |
|text.XXXX |string |否   |    |   XXXX 规则：languageCode(小写)-CountryCode(大写)    |

-  当phrase=2时参数说明

|字段|类型|必填|默认|注释|
|:----    |:-------    |:--- |----|------      |
|user |json | 是   |    |   当phrase=2时，必填    |
|name |string | 是    |    |   当phrase=2时，必填   |
|uid |string | 是    |    |   当phrase=2时，必填   |
|color |string | 是    |    |   当phrase=2时，必填   |

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
  "wordList"：["关键词1"，"关键词2"，…],	// 必填字段；关键词列表，可以传送多个关键词
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

|字段|类型|必填|默认|注释|
|:----    |:-------    |:--- |---|------      |
|gameMode |int | 是   |  1  |   游戏模式默认为1    |
|gameRoundId |string | 是   |    |   本局游戏的id    |
|results |PlayerResult json数组 | 是    |    |  游戏结果玩家列表   |

- PlayerResult = {}

|字段|类型|必填|默认|注释|
|:----    |:-------    |:--- |---|------      |
|uid |string | 是    |    |  用户id   |
|rank |int | 是    |    |   排名 从 1 开始  |
|award |int | 是    |    |   奖励   |
|score |int | 是   |    |   积分   |
|isEscaped |int | 否    |    |  是否逃跑 1：逃跑 0：非逃跑  |
|killerId |string | 否    |    |  杀自己的玩家的id  |

- data

```json
{
    "gameMode": 1, 					// 游戏模式
	"gameRoundId": "123",			// 本局游戏id
    "results": [
        {
            "uid": "用户id",        // 用户id
            "rank": 1,             	// 排名 从 1 开始
            "award": 100,           // 奖励
            "score": 100,           // 积分
            "isEscaped": 1,         // 逃跑
            "killerId": "杀自己的玩家id",    // 杀自己的玩家id
            "isAI": 0               // 是否是AI玩家
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

|字段|类型|必填|默认|注释|
|:----    |:-------    |:--- |---|------      |
|seatIndex |int | 否   |  -1  |   点击头像加入游戏对应的座位号，int 类型，从0开始    |

```json
{
	"seatIndex": 0	// 点击头像加入游戏对应的座位号，int 类型，从0开始， 如果seatIndex=-1，则是随机加入一个空位，如果seatIndex 大于座位数，则加入不成功
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
{
}
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
{
}
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
{
}
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
{
}
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
{
}
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

### 11. 结算界面关闭按钮点击状态（2021-12-27新增）

- state

```
mg_common_self_click_game_settle_close_btn
```

- data

```json
{
}
```

- 说明

```
用户（本人）点击结算界面关闭按钮
```

### 12. 结算界面再来一局按钮点击状态（2021-12-27新增）

- state

```
mg_common_self_click_game_settle_again_btn
```

- data

```json
{
}
```

- 说明

```
用户（本人）点击结算界面再来一局按钮
```

### 13. 游戏上报游戏中的声音列表（2021-12-30新增，现在只支持碰碰我最强）

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

### 14. 游通知app层播放声音（2021-12-30新增，现在只支持碰碰我最强）

- state

```
mg_common_game_sound
```

- data

```json
{
    "isPlay": true, // 是否播放 isPlay==true(播放)，isPlay==false(停止)
    "name": "click",// 要播放的声音文件名，不带后缀
    "type": "mp3",  // 声音资源类型
    "times": 1,     // 播放次数；注：times == 0 为循环播放
    "url": "https://www.xxxx.xx/xxx.mp3" // 声音资源的url链接
}
```

- 说明

```
游戏通知app层播放声音
```

### 15. 游戏通知app层播放背景音乐状态（2022-01-07新增，现在只支持碰碰我最强）

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

### 16. 游戏通知app层播放音效的状态（2022-01-07新增，现在只支持碰碰我最强）

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

### 17. ASR状态(开启和关闭语音识别状态，SudMGP v1.1.45.xx 版本新增)

- state

```
mg_common_game_asr
```

- data

```json
{
	"isOpen": true		// true:打开语音识别 false:关闭语音识别
}
```

- 说明
```
开启和关闭语音识别状态
```

### 18. 麦克风状态（2022-03-04新增）

- state

```
mg_common_self_microphone
```

- data

```json
{
	"isOn": true	// 麦克风开关状态 true: 开(APP开启RTC推流)；false: 关(APP关闭RTC推流)
}
```

- 说明

```
游戏通知app麦克风状态
```

### 19. 耳机（听筒，扬声器）状态（2022-03-04新增）

- state

```
mg_common_self_headphone
```

- data

```json
{
	"isOn": true	// 耳机（听筒，喇叭）开关状态 true: 开(APP开启RTC拉流)；false: 关(APP关闭RTC拉流)
}
```

- 说明

```
游戏通知app耳机（听筒，喇叭）状态
```

### 20. App通用状态操作结果错误码（2022-05-10新增）

- state

```
mg_common_app_common_self_x_resp
```

- data

```json
{
  "state": "app_common_self_playing",   // 字段必填, 参考：游戏业务错误 https://docs.sud.tech/zh-CN/app/Client/APPFST/CommonState.html
  "resultCode": 0,	// 字段必填，参考：游戏业务错误 https://docs.sud.tech/zh-CN/app/Server/ErrorCode.html
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


### 21. 游戏通知app层添加陪玩机器人是否成功（2022-05-17新增）

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
