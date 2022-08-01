## protoMgr API ##

###protoMgr:AddPb(pb)
- 说明

```txt
添加protobuffer 协议数据
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|pb|是|array|协议文件数据|

- 示例：

```lua
local api_pb= require("Protol.api_pb")
local common_pb1=require("Protol.common_pb1")
local mora_pb=require("Protol.mora_pb")
protoMgr:AddPb({api_pb,common_pb1,mora_pb})
```

###protoMgr:getEnCodeMsgBuf(protoName, msg)
- 说明

```txt
封装protobuffer协议数据
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|protoName|是|string|协议名称|
|msg|是|object|消息内容,json object|

- 示例：

```lua
local cmdName="AuthAPI"
local msgBuf = protoMgr:getEnCodeMsgBuf(cmdName, {["uid"]="1524587630749089800",["key"]=""})
```

###protoMgr:getDecodeMsgBuf(protoName, msgBuf)
- 说明

```txt
解析protobuffer协议数据
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|protoName|是|string|协议名称|
|msgBuf|是|byte[]|数据|

- 示例：

```lua
local cmdName="AuthAPI"
local msgBuf = buffer:ReadBuffer(dataLen)
local msg = protoMgr:getDecodeMsgBuf(cmdName,msgBuf)
```

###protoMgr:Clear()
- 说明

```txt
清除所有的协议数据
```

