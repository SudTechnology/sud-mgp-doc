## PlayerMgr API ##

###PlayerMgr:init()
- 说明

```txt
初始化
```

###PlayerMgr:Close()
- 说明

```txt
关闭
```

###PlayerMgr.socket_connected()
- 说明

```txt
网络连接成功的回调
```

###PlayerMgr:AuthLogin()
- 说明

```txt
授权登录服务器
```

###PlayerMgr:connectServer(serverLoginInfo)
- 说明

```txt
连接服务器
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|serverLoginInfo|是|object|服务器配置数据 json object|

- serverLoginInfo示例:

```lua
{
    ["http_login_url"]= "https:\/\/dev-game.s00.tech\/mora\/login",
    ["tcp_login_url"]= "120.76.200.42:5600",
    ["app_server_info_url"]= "https:\/\/fat-mg-sdk.divtoss.com\/v1\/mg_server\/app_server_info",
    ["bundle_id"]= "",
    ["platform"]= 0,
    ["app_id"]= "testmg",
}
```

###PlayerMgr:GetPlayerDataByPlayerId(playerId)
- 说明

```txt
根据playerId获取玩家数据
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|playerId|是|string|玩家Id|

###PlayerMgr:sendLogin()
- 说明

```txt
发送玩家登录
```

###PlayerMgr:updateSstokenMsg() 
- 说明

```txt
通知服务器更新token
```

###PlayerMgr:onSdkStateChange(status,data)
- 说明

>sdk通知游戏状态改变，具体查看[sdk.onStateChange](https://showdoc.divtoss.com/web/#/15?page_id=583)

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|status|是|string|状态标识|
|data|是|object|状态改变的数据 json object|