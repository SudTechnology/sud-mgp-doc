## SocketMgr API ##

###SocketMgr:Init()
- 说明

```txt
初始化
```

###SocketMgr:connect(host,port)
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
SocketMgr:connect("192.168.2.3",8080)
```

###SocketMgr.connected()
- 说明

```txt
连接成功回调
```

###SocketMgr.onSocketClose()
- 说明

```txt
连接关闭回调
```

###SocketMgr.onSocketError(error)
- 说明

```txt
网络错误回调
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|error|是|String|错误信息|

###SocketMgr:closeSocket()
- 说明

```txt
关闭网络
```

###SocketMgr:sendData(data)
- 说明

```txt
发送网络消息
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|data|是|String|json text|

###SocketMgr:Dispose()
- 说明

```txt
销毁网络
```