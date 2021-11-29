#

![SUD](../../Resource/logo.png)

## 你画我猜

> Tips
>
> 1. SudMGP保证状态有序串行从MG到达APP；
> 2. 可重复通知，无需保证通知次数；
> 3. 通知后SudMGP会按state值缓存最新一次的data值，供APP随时主动获取；

### 1. 选词中状态（已修改）
- 最低版本: v1.1.30.xx

- state

```
mg_dg_selecting
```

- data

```json
{
	"isSelecting": true	// bool 类型 true：正在选词中，false: 不在选词中
}
```

- 说明

```txt
选词中，头像正下方
```

### 2. 作画中状态（已修改）
- 最低版本: v1.1.30.xx

- state

```
mg_dg_painting
```

- data

```json
{
	isPainting: true // true: 绘画中，false: 取消绘画
}
```

- 说明

```txt
作画中，头像正下方
```


### 3. 显示错误答案状态（已修改）
- 最低版本: v1.1.30.xx

- state

```
mg_dg_erroranswer
```

- data

```json
{
	"msg": "错误答案" // 字符串类型，展示错误答案
}
```

- 说明

```txt
错误的答案，最多6中文，头像正下方
```


### 4. 显示总积分状态（已修改）
- 最低版本: v1.1.30.xx

- state

```
mg_dg_totalscore
```

- data

```json
{
	"msg": "10" // 字符串类型 总积分
}
```

- 说明

```txt
总积分，位于头像右上角
```

### 5. 本次获得积分状态（已修改）
- 最低版本: v1.1.30.xx

- state

```
mg_dg_score
```

- data

```json
{
	"msg": "10"	// string类型，展示本次获得积分
}
```

- 说明

```txt
本次积分，头像正下方
```
