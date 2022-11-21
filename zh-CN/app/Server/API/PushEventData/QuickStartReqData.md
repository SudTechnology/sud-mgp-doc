#

![SUD](../../../Resource/logo.png)

##### QuickStartReqData

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|codes |是 | string数组 |用户uid对应短令牌code |
|room_id|是  |string |房间ID |
|mode|否  |int32 |模式 默认: 1 |
|language|否  |string |语言 默认：zh-CN |
|rule|否  |object | 玩法配置 |
|report_game_info_extras|否  |string |透传参数，最大长度1024字节，超过则截断 |
|report_game_info_key|否  |string |透传参数key，最大长度64字节，接入方服务端，可以根据这个字段来查询一局游戏的数据 |

##### 玩法配置

| 游戏名称      | name        | 配置                                                                  | 介绍                                                                                                                                  |
|:----------|:------------|:--------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| 飞行棋       | ludo        | { "mode":0, "chessNum":2, "item":0 }                                | mode：默认赛制，0快速，1经典；chessNum：默认棋子数量,2对应2颗棋子，4对应4颗棋子；item：默认道具，1要，0不要                                                                  ||   |
| TeenPatti | teenpatti   | {"roundDefault": 1, "darkCardDefault": 1, "singleLimitDefault": 1}  | roundDefault: 最大回合的下标，范围为1~2，默认为1；darkCardDefault: 最大暗牌的下标，范围为1~2，默认为1；singleLimitDefault: 单注上限下标，范围1~3，默认1                         |   ||
| 台湾麻将      | twmahjong   | {"roundTimeDefault":1,"bottomScoreDefault":1 ,"multiplesDefault":1} ||   ||
| 德州扑克      | texasholdem | {"minStakes": 1, "maxChip": 1}                                      | minStakes: 大小盲数组的下标范围1~3，默认1，maxChip：最大带入数组范围下标，范围1~3，默认1; 示例: {"texasholdem":{"minStakes": 3,"maxChip": 1}}，配置选中大小盲第三个选项，最大带入第一个选项 |   ||

##### 请求示例
```
{
    "event": "quick_start",
	"mg_id": "mg_id_1",
	"app_id": "app_id_1",
    "timestamp": 1657770493152,
	"data": {
	    "codes": ["code_1", "code_2"],
		"room_id":"roomId_1",
		"mode": 1,
		"language": "zh-CN"，
		"rule": {
		    "mode": 0,
		    "chessNum": 2,
            "item": 0
		},
		"report_game_info_extras": "",
		"report_game_info_key": ""
	}
}
```