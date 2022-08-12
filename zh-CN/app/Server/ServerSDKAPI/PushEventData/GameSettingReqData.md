#

![SUD](../../../Resource/logo.png)

##### GameSettingReqData

| 参数名     | 必选  | 类型     | 说明   |
|:--------|:----|:-------|------|
| room_id | 是   | string | 房间ID |
| rule    | 是   | object | 玩法配置 |

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
    "event": "game_setting",
	"mg_id": "mg_id_1",
    "timestamp": "1657770493152",
	"data": {
	    "room_id": "roomId_1",
		"rule": {
		    "mode": 0,
		    "chessNum": 2,
            "item": 0
		}
	}
}
```
