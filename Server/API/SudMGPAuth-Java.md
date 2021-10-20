#

![SUD](../../Resource/logo.png)

## SudMGPAuth Java

```java
SudMGPAuth sudMGPAuth = new SudMGPAuth(CommonConstant.APP_ID,CommonConstant.APP_SECRET);

public class SudMGPAuth {

    public String getCode(String uid);

    public String getSSToken(String uid);

    public String getUidByCode(String code);

    public String getUidBySSToken(String ssToken);

    public boolean verifyCode(String code);

    public boolean verifySSToken(String ssToken);

}
```

### SudMGPAuth.getCode

- 说明

```txt
获取临时令牌Code
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|uid|是|String|用户id，需全局唯一，为保证数据安全，可通过自己的UID哈希出虚拟UID|

- 返回值

```txt
Code
```

### SudMGPAuth.getSSToken

- 说明

```txt
通过UID获取长期令牌SSToken，SSToken为小游戏服务端与业务服务端数据交换的令牌
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|uid|是|String|用户id，需全局唯一，可通过短期令牌获得|

- 返回值

```txt
SSToken
```

### SudMGPAuth.getUidByCode

- 说明

```txt
通过短期令牌Code获得UID
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|code|是|String|短期令牌|

- 返回值

```txt
UID
```

### SudMGPAuth.getUidBySSToken

- 说明

```txt
通过长期令牌SSToken获得UID
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|ssToken|是|String|长期令牌|

- 返回值

```txt
UID
```

### SudMGPAuth.verifyCode

- 说明

```txt
校验短期令牌有效性
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|code|是|String|短期令牌|

- 返回值

```txt
0 有效
1 无效
2 过期
```

### SudMGPAuth.verifySSToken

- 说明

```txt
校验短期令牌有效性
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|ssToken|是|String|短期令牌|

- 返回值

```txt
0 有效
1 无效
2 过期
```
