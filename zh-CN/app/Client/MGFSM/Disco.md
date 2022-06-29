#

![SUD](../../Resource/logo.png)

## 你画我猜

> Tips
>
> 1. SudMGP保证状态有序串行从MG到达APP；
> 2. 可重复通知，无需保证通知次数；
> 3. 通知后SudMGP会按state值缓存最新一次的data值，供APP随时主动获取；

### 1. 蹦迪指令回调

- state

```
mg_common_game_disco_action
```

- data


```json
{
	"actionId": 15,  // 指令序号类型
    "isSuccess":true  // true 指令成功，false 指令失败
}
```

- 说明

```
app指令请求游戏客户端成功与否的回调
```

### 2. 蹦迪指令动作结束通知

- state

```
mg_common_game_disco_action_end
```

- data


```json
{
	"actionId": 15,  // 指令序号类型
    "playerId": "user_id"  // 玩家ID string 类型
}
```

- 说明

```
游戏客户端通知APP指令动作结束
```
