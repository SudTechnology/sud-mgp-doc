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

## 参数

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|gameMode	|否	|类型	|游戏模式（每个游戏默认模式是1，不填是1）|
|ui	|否	|string	|对游戏ui界面的配置，可定制ui界面的显示与不显示|
|ui.gameSettle  |否  |string |结算界面   |
|ui.gameSettle.hide  |否  |bool |是否隐藏结算界面（false: 显示； true: 隐藏，默认为 false）   |
|ui.ping  |否  |string |界面中的ping值  |
|ui.ping.hide  |否  |bool |是否隐藏ping值（false: 显示；true: 隐藏，默认为false）  |
|ui.version  |否  |string |界面中的版本信息值   |
|ui.version.hide  |否  |bool |是否隐藏版本信息（false: 显示； true: 隐藏，默认为false）   |
|ui.level  |否  |string |大厅中的段位信息   |
|ui.level.hide  |否  |bool |是否隐藏段位信息（false: 显示； true: 隐藏，默认为false）   |
|ui.lobby_setting_btn  |否  |string |大厅的设置按钮   |
|ui.lobby_setting_btn.hide  |否  |bool |是否隐藏大厅的设置按钮（false: 显示； true: 隐藏，默认为false）   |
|ui.lobby_help_btn  |否  |string |大厅的帮助按钮   |
|ui.lobby_help_btn.hide  |否  |bool |是否隐藏大厅的帮助按钮（false: 显示； true: 隐藏，默认为false）   |
|ui.lobby_players  |否  |string |大厅玩家展示位   |
|ui.lobby_players.hide  |否  |bool |是否隐藏大厅玩家展示位（false: 显示； true: 隐藏，默认为false）   |
|ui.lobby_player_captain_icon  |否  |string |大厅玩家展示位上队长标识   |
|ui.lobby_player_captain_icon.hide  |否  |bool |是否隐藏大厅玩家展示位上队长标识（false: 显示； true: 隐藏，默认为false）   |
|ui.lobby_player_kickout_icon  |否  |string |大厅玩家展示位上踢人标识   |
|ui.lobby_player_kickout_icon.hide  |否  |bool |是否隐藏大厅玩家展示位上踢人标识（false: 显示； true: 隐藏，默认为false）   |
|ui.lobby_rule  |否  |string |大厅的玩法规则描述文字   |
|ui.lobby_rule.hide  |否  |bool |是否隐藏大厅的玩法规则描述文字（false: 显示； true: 隐藏，默认为false）   |
|ui.lobby_game_setting  |否  |string |玩法设置   |
|ui.lobby_game_setting.hide  |否  |bool |是否隐藏玩法设置（false: 显示； true: 隐藏，默认为false）   |
|ui.jion_btn  |否  |string |加入按钮   |
|ui.jion_btn.hide  |否  |bool |是否隐藏加入按钮（false: 显示； true: 隐藏，默认为false）   |
|ui.cancel_btn  |否  |string |取消加入按钮   |
|ui.cancel_btn.hide  |否  |bool |是否隐藏取消加入按钮（false: 显示； true: 隐藏，默认为false）   |
|ui.ready_btn  |否  |string |准备按钮   |
|ui.ready_btn.hide  |否  |bool |是否隐藏准备按钮（false: 显示； true: 隐藏，默认为false）   |
|ui.cancel_ready_btn  |否  |string |取消准备按钮   |
|ui.cancel_ready_btn.hide  |否  |bool |是否隐藏取消准备按钮（false: 显示； true: 隐藏，默认为false）   |
|ui.start_btn  |否  |string |开始游戏按钮   |
|ui.start_btn.hide  |否  |bool |是否隐藏开始游戏按钮（false: 显示； true: 隐藏，默认为false）   |
|ui.share_btn  |否  |string |分享按钮   |
|ui.share_btn.hide  |否  |bool |是否隐藏分享按钮（false: 显示； true: 隐藏，默认为true）   |
|ui.game_setting_btn  |否  |string |游戏场景中的设置按钮   |
|ui.game_setting_btn.hide  |否  |bool |是否隐藏游戏场景中的设置按钮（false: 显示； true: 隐藏，默认为false）   |
|ui.game_help_btn  |否  |string |游戏场景中的帮助按钮   |
|ui.game_help_btn.hide  |否  |bool |是否隐藏游戏场景中的帮助按钮（false: 显示； true: 隐藏，默认为false）   |



## 界面列表字段
```txt
gameSettle: { //结算界面名称
	hide: false //节点开关
}
ping: {	// ping值节点
	hide: false	// 是否隐藏
}
version:{
	hide: false // 是否隐藏
}
level: {	// 段位
	hide: false
}
lobby_setting_btn: {	// 大厅的设置按钮
	hide: false
}
lobby_help_btn: {	// 大厅的帮助按钮
	hide: false
}
lobby_players: {	// 大厅玩家展示位
	hide: true
}
lobby_player_captain_icon: {	// 大厅玩家展示位上队长标识
	hide: false
}
lobby_player_kickout_icon: {	// 大厅玩家展示位上踢人标识
	hide: false
}
lobby_rule: {	// 大厅的玩法规则描述文字
 	hide: false
}
lobby_game_setting: {	// 玩法设置
	hide: false
}
jion_btn: {	// 加入按钮
	hide: false
}
cancel_btn: {	// 取消加入按钮
	hide: false
}
ready_btn: {	// 准备按钮
	hide: false
}
cancel_ready_btn: {	// 取消准备按钮
	hide: false
}
start_btn: {	// 开始游戏按钮
	hide: false
}
share_btn: {	// 分享按钮
	hide: true
}
game_setting_btn: {	// 游戏场景中的设置按钮
	hide: false
}
game_help_btn: {	// 游戏场景中的帮助按钮
	hide: false
}

```