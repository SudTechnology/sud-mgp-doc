## Mirror Lua API ##

###RemoteProcedureCalls.RegisterRpc(componentType,functionFullName,func)
- 说明

```txt
注册rpc，类似c#中在函数上加[ClientRpc]
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|componentType|是|type|类型|
|functionFullName|是|String|函数完整名字，要和服务器匹配|
|func|是|function|rpc调用回调|

- 示例：

```lua
RemoteProcedureCalls.RegisterRpc(typeof(NetworkBehaviourLua),"System.Void Mirror.Examples.Tanks.Tank::RpcOnFire()",function(obj, reader,senderConnection)
--to do ...
end)
```

###RemoteProcedureCalls.RegisterCommand(componentType,functionFullName,func)
- 说明

```txt
注册Command，类似c#中在函数上加[Command]
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|componentType|是|type|类型|
|functionFullName|是|String|函数完整名字，要和服务器匹配|
|func|是|function|rpc调用回调|

- 示例：

```lua
RemoteProcedureCalls.RegisterCommand(typeof(NetworkBehaviourLua),"System.Void Mirror.Examples.Tanks.Tank::CmdFire()",function(obj, reader,senderConnection)
--to do ...
end)
```

###RemoteProcedureCalls.RemoveDelegate(functionFullName)
- 说明

```txt
移除注册的Command和ClientRpc
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|functionFullName|是|String|函数完整名字，要和服务器匹配|

- 示例：

```lua
RemoteProcedureCalls.RemoveDelegate("System.Void Mirror.Examples.Tanks.Tank::RpcOnFire()")
RemoteProcedureCalls.RemoveDelegate("System.Void Mirror.Examples.Tanks.Tank::CmdFire()")
```

###RemoteProcedureCalls.RemoveAll()
- 说明

```txt
移除所有注册的Command和ClientRpc
```

- 示例：

```lua
RemoteProcedureCalls.RemoveAll()
```

