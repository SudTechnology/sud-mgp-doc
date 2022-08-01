## LobbyMgr API ##

###NetMgr:init()
- 说明

```txt
初始化
```

###NetMgr.socket_connected()
- 说明

```txt
网络连接成功，回调事件
```

###NetMgr.socket_disconnect()
- 说明

```txt
网络断开，回调事件
```

###NetMgr.socket_error(error)
- 说明

```txt
网络错误，回调事件
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|error|是|String|错误信息|

###NetMgr.socket_message(buffer)
- 说明

```txt
接收到网络消息数据，回调事件
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|buffer|是|ByteBuffer|消息数据buffer|

###NetMgr:connect(host,port)
- 说明

```txt
连接
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|host|是|String|ip 地址|
|port|是|int|端口|

- 示例：

```lua
NetMgr:connect("192.168.2.3",8080)
```

###NetMgr:send(cmdId, msg)
- 说明

```txt
发送消息
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|cmdId|是|int|消息id|
|msg|是|object|数据 json object|

- 示例：

```lua
NetMgr:send(11001,{})
```

###NetMgr:request(cmdId, msg,callback, isMask)
- 说明

```txt
发送消息(多参数)
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|cmdId|是|int|消息id|
|msg|是|object|数据 json object|
|callback|是|function|请求消息返回结果的回调函数|
|isMask|否|boolean|是否有遮罩|

- 示例：

```lua
NetMgr:request(11001,{}，function(msg)
    --to do ...
end,false)
```

###NetMgr:Close()
- 说明

```txt
关闭网络
```

###NetMgr:Dispose()
- 说明

```txt
销毁NetMgr
```

###NetMgr:DisposeAll()
- 说明

```txt
销毁NetMgr,释放所有的socket,有可能创建了多个soket实例需要全部释放
```

