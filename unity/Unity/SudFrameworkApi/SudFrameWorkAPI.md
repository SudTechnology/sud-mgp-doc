## SudFrameWork API ##

###SudFrameWork:init(params,playerMgr)
- 说明

```txt
初始化
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|params|是|object|json object|
|playerMgr|否|object|**SudPlayerMgr** 的扩展对象|

- 返回值(json object)

|参数名|类型|说明|
|:----|:---|-----|
|sdkInfo|object|具体查看[getSDKInfo](https://showdoc.divtoss.com/web/#/15?page_id=677)说明|

###SudFrameWork:reLogin()
- 说明

```txt
重登录，主要是sdk登录失效的时候调用
```

- 返回值(json object)

|参数名|类型|说明|
|:----|:---|-----|
|sdkInfo|object|具体查看[getSDKInfo](https://showdoc.divtoss.com/web/#/15?page_id=677)说明|

###SudFrameWork:getViewConfigItem(itemName)
- 说明

```txt
获取游戏视图单项属性
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|itemName|是|string|视图属性名称|

- 返回值(json object)

|参数名|类型|说明|
|:----|:---|-----|
|config|object|具体查看[onGetGameCfg.ui](https://showdoc.divtoss.com/web/#/15?page_id=726)部分说明|

###SudFrameWork:SetSudUIConfig(uiConfig)
- 说明

```txt
设置ui配置数据，优先使用sdk配置数据，sdk没有设置的数据项目就使用
这里设置的数据。
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|uiConfig|是|object|具体查看[onGetGameCfg.ui](https://showdoc.divtoss.com/web/#/15?page_id=726)部分说明|

###SudFrameWork:getViewConfig()
- 说明

```txt
获取游戏视图配置信息
```

- 返回值(json object)

|参数名|类型|说明|
|:----|:---|-----|
|ui|object|具体查看[onGetGameCfg.ui](https://showdoc.divtoss.com/web/#/15?page_id=726)部分说明|

###SudFrameWork:mgLog(data,state)
- 说明


>上报日志到SDK,具体查看[sdk.mgLog](https://showdoc.divtoss.com/web/#/15?page_id=751)

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|data|是|object|json object|
|state|是|int|状态码|

- 示例：

```lua
local sdkmsg = { ["errorCode"]= msg.resultCode, ["isIn"]= false, ["teamId"]= teamId, ["reason"]= -1, ["kickUID"]= "" }
FrameWork:mgLog(sdkmsg, Const.SudEvent.Sdk.MG2APP_PLAYER_STATUS_LIST.mg_common_player_in)
```

###SudFrameWork:getGameViewSize()
- 说明

```txt
获取游戏视图大小
```

- 返回值(Vector4)

|参数名|类型|说明|
|:----|:---|-----|
|Vector4|Vector4|**x**:x **y**:y **z**:width **z**:height|

###SudFrameWork:getSudLanguage()
- 说明

```txt
获取sud语言类型
```

- 返回值(string)

|参数名|类型|说明|
|:----|:---|-----|
|language|string|如："zh-CN" 具体查看[getSDKInfo.language](https://showdoc.divtoss.com/web/#/15?page_id=677)|

###SudFrameWork:notifyAppChangeGameStatus(state, data)
- 说明

```txt
通知app游戏状态改变
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|state|是|int|状态码|
|data|是|object|json object|

- 示例：

```lua
SudFrameWork:notifyAppChangeGameStatus(SudConst.SudEvent.Sdk.MG2APP_GAME_STATUS_LIST.mg_common_self_click_share_btn, {})
```
###SudFrameWork:notifyPublicMessageToApp(type,msgobj)
- 说明

>通知公屏消息,具体查看[公屏消息](https://showdoc.divtoss.com/web/#/15?page_id=594)

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|type|是|int|类型|
|msgobj|是|object|json object，消息内容|

###SudFrameWork:getGameMode()
- 说明

>获取游戏模式,具体查看[onGetGameCfg.gameModel](https://showdoc.divtoss.com/web/#/15?page_id=726)


- 返回值(int)

|参数名|类型|说明|
|:----|:---|-----|
|gamemodel|int|游戏模式（每个游戏默认模式是1，不填是1）|

###SudFrameWork:checkViewConfigStatus(nodeName)
- 说明

>获取指定项的ui配置状态,具体nodeName查看[onGetGameCfg.ui](https://showdoc.divtoss.com/web/#/15?page_id=726)

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|nodeName|是|string|视图节点名称|

- 返回值(boolean)

|类型|说明|
|:----|-----|
|boolean|false:游戏自己处理逻辑，true:app处理逻辑|

###SudFrameWork:closeGame()
- 说明

>关闭按钮事件，返回false,游戏自己要处理关闭逻辑

- 返回值(boolean)

|类型|说明|
|:----|-----|
|boolean|false:游戏自己处理逻辑，true:app处理逻辑|

###SudFrameWork:backGame()
- 说明

>游戏结算界面的继续游戏或者再来一次按钮需要触发的事件

- 返回值(boolean)

|类型|说明|
|:----|-----|
|boolean|false:游戏自己处理逻辑，true:app处理逻辑|