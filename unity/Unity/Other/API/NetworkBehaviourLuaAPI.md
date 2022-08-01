## NetworkBehaviourLua API ##

**NetworkBehaviourLua**这个组件主要是为了替代和服务器共用逻辑的NetworkBehaviour继承类，
会把mirror的网络处理消息转发给lua处理(如:rpc,SyncVar,Command等)

> 具体使用**示例**可以查看[mirror demo](../../mirrorLua/ReadMe.md)