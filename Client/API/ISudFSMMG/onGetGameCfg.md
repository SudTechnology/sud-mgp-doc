#

![SUD](../../../Resource/logo.png)


```txt
/**
 * 获取游戏Config
 * @param handle
 * @param dataJson {}
 * 最低版本：v1.1.30.xx
 */
void onGetGameCfg(ISudFSMStateHandle handle, String dataJson);
```

## 示例 
```txt
handle.success(dataJsonResp);

dataJsonResp = {
    "gameMode":1,	// 每个游戏默认模式是1，不填是1
	"ui":{
		"gameSettle":{
			"hide":false
		},
		"ping":{
			"hide":false
		},
		"version":{
			"hide":false
		}
	}
}
```

### 标注
![GameCfg](../../../Resource/Client/ongetgamecfg.png)

### 参数

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|gameMode	|否	|int	|游戏模式（每个游戏默认模式是1，不填是1）|
|gameCPU	|否	|int	|游戏CPU（值为0和1；0：CPU正常功耗，1：CPU低功耗；默认是0，CPU正常功耗）|
|gameSoundControl	|否	|int	|游戏中声音的播放是否被app层接管（值为0和1；0：游戏播放声音，1：app层播放声音，游戏中不播放任何声音；默认是0）|
|gameSoundVolume	|否	|int	|游戏中音量的大小（值为0到100；默认是100）|
|ui	|否	|json	|对游戏ui界面的配置，可定制ui界面的显示与不显示|
|ui.gameSettle  |否  |json |结算界面   |
|ui.gameSettle.hide  |否  |bool |是否隐藏结算界面（false: 显示； true: 隐藏，默认为 false）   |
|ui.ping  |否  |json |界面中的ping值  |
|ui.ping.hide  |否  |bool |是否隐藏ping值（false: 显示；true: 隐藏，默认为false）  |
|ui.version  |否  |json |界面中的版本信息值   |
|ui.version.hide  |否  |bool |是否隐藏版本信息（false: 显示； true: 隐藏，默认为false）   |
|ui.level  |否  |json |大厅中的段位信息   |
|ui.level.hide  |否  |bool |是否隐藏段位信息（false: 显示； true: 隐藏，默认为false）   |
|ui.lobby_setting_btn  |否  |json |大厅的设置按钮   |
|ui.lobby_setting_btn.hide  |否  |bool |是否隐藏大厅的设置按钮（false: 显示； true: 隐藏，默认为false）   |
|ui.lobby_help_btn  |否  |json |大厅的帮助按钮   |
|ui.lobby_help_btn.hide  |否  |bool |是否隐藏大厅的帮助按钮（false: 显示； true: 隐藏，默认为false）   |
|ui.lobby_players  |否  |json |大厅玩家展示位   |
|ui.lobby_players.custom  |否  |bool |大厅玩家展示位头像点击加入（false: 游戏处理逻辑； true: 游戏只通知按钮点击事件，不处理；默认为false）   |
|ui.lobby_players.hide  |否  |bool |是否隐藏大厅玩家展示位（false: 显示； true: 隐藏，默认为false）   |
|ui.lobby_player_captain_icon  |否  |json |大厅玩家展示位上队长标识   |
|ui.lobby_player_captain_icon.hide  |否  |bool |是否隐藏大厅玩家展示位上队长标识（false: 显示； true: 隐藏，默认为false）   |
|ui.lobby_player_kickout_icon  |否  |json |大厅玩家展示位上踢人标识   |
|ui.lobby_player_kickout_icon.hide  |否  |bool |是否隐藏大厅玩家展示位上踢人标识（false: 显示； true: 隐藏，默认为false）   |
|ui.lobby_rule  |否  |json |大厅的玩法规则描述文字   |
|ui.lobby_rule.hide  |否  |bool |是否隐藏大厅的玩法规则描述文字（false: 显示； true: 隐藏，默认为false）   |
|ui.lobby_game_setting  |否  |json |玩法设置   |
|ui.lobby_game_setting.hide  |否  |bool |是否隐藏玩法设置（false: 显示； true: 隐藏，默认为false）   |
|ui.join_btn  |否  |json |加入按钮   |
|ui.join_btn.custom  |否  |bool |加入按钮（false: 游戏处理逻辑； true: 游戏只通知按钮点击事件，不处理；默认为false）   |
|ui.join_btn.hide  |否  |bool |是否隐藏加入按钮（false: 显示； true: 隐藏，默认为false）   |
|ui.cancel_join_btn  |否  |json |取消加入按钮   |
|ui.cancel_join_btn.custom  |否  |bool |取消加入按钮（false: 游戏处理逻辑； true: 游戏只通知按钮点击事件，不处理；默认为false）   |
|ui.cancel_join_btn.hide  |否  |bool |是否隐藏取消加入按钮（false: 显示； true: 隐藏，默认为false）   |
|ui.ready_btn  |否  |json |准备按钮   |
|ui.ready_btn.custom  |否  |bool |准备按钮（false: 游戏处理逻辑； true: 游戏只通知按钮点击事件，不处理；默认为false）   |
|ui.ready_btn.hide  |否  |bool |是否隐藏准备按钮（false: 显示； true: 隐藏，默认为false）   |
|ui.cancel_ready_btn  |否  |json |取消准备按钮   |
|ui.cancel_ready_btn.custom  |否  |bool |取消准备按钮（false: 游戏处理逻辑； true: 游戏只通知按钮点击事件，不处理；默认为false）   |
|ui.cancel_ready_btn.hide  |否  |bool |是否隐藏取消准备按钮（false: 显示； true: 隐藏，默认为false）   |
|ui.start_btn  |否  |json |开始游戏按钮   |
|ui.start_btn.custom  |否  |bool |开始游戏按钮（false: 游戏处理逻辑； true: 游戏只通知按钮点击事件，不处理；默认为false）   |
|ui.start_btn.hide  |否  |bool |是否隐藏开始游戏按钮（false: 显示； true: 隐藏，默认为false）   |
|ui.share_btn  |否  |json |分享按钮   |
|ui.share_btn.custom  |否  |bool |分享按钮（false: 游戏处理逻辑； true: 游戏只通知按钮点击事件，不处理；默认为false）   |
|ui.share_btn.hide  |否  |bool |是否隐藏分享按钮（false: 显示； true: 隐藏，默认为true）   |
|ui.game_setting_btn  |否  |json |游戏场景中的设置按钮   |
|ui.game_setting_btn.hide  |否  |bool |是否隐藏游戏场景中的设置按钮（false: 显示； true: 隐藏，默认为false）   |
|ui.game_help_btn  |否  |json |游戏场景中的帮助按钮   |
|ui.game_help_btn.hide  |否  |bool |是否隐藏游戏场景中的帮助按钮（false: 显示； true: 隐藏，默认为false）   |
|ui.game_settle_close_btn  |否  |json |游戏结算界面中的关闭按钮   |
|ui.game_settle_close_btn.custom  |否  |bool |游戏结算界面中的关闭按钮（false: 关闭结算界面返回大厅； true: 游戏通知按钮点击事件，并关闭结算界面返回大厅；默认为false）   |
|ui.game_settle_again_btn  |否  |json |游戏结算界面中的再来一局按钮   |
|ui.game_settle_again_btn.custom  |否  |bool |游戏结算界面中的再来一局按钮（false: 关闭结算界面返回大厅并将玩家设置为准备状态； true: 游戏通知按钮点击事件，并关闭结算界面返回大厅（不将玩家设置为准备状态）；默认为false）   |
|ui.game_bg  |否  |json |大厅及游戏中的背景图   |
|ui.game_bg.hide  |否  |bool |是否隐藏大厅及游戏中的背景图（false: 显示； true: 隐藏，默认为false，配合SudMGP.getCfg().setShowLoadingGameBg(false)使用）|



### 返回示例
```txt
{
    "gameMode":1,
	"gameCPU": 0,
	"gameSoundControl": 0,
	"gameSoundVolume": 100,
    "ui":{
        "gameSettle":{
            "hide":false
        },
        "ping":{
            "hide":false
        },
        "version":{
            "hide":false
        },
        "level":{
            "hide":false
        },
        "lobby_setting_btn":{
            "hide":false
        },
        "lobby_help_btn":{
            "hide":false
        },
        "lobby_players":{
			"custom": false,
            "hide":true
        },
        "lobby_player_captain_icon":{
            "hide":false
        },
        "lobby_player_kickout_icon":{
            "hide":false
        },
        "lobby_rule":{
            "hide":false
        },
        "lobby_game_setting":{
            "hide":false
        },
        "join_btn":{
            "custom":false,
            "hide":false
        },
        "cancel_join_btn":{
            "custom":false,
            "hide":false
        },
        "ready_btn":{
            "custom":false,
            "hide":false
        },
        "cancel_ready_btn":{
            "custom":false,
            "hide":false
        },
        "start_btn":{
            "custom":false,
            "hide":false
        },
        "share_btn":{
			"custom":false,
            "hide":true
        },
        "game_setting_btn":{
            "hide":false
        },
        "game_help_btn":{
            "hide":false
        }
        "game_settle_close_btn": {
            "custom": false
        },
        "game_settle_again_btn": {
            "custom": false
        },
        "game_bg": {
            "hide": false
        }
    }
}
```
