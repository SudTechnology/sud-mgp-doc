#

![SUD](../../Resource/logo.png)

## SudMGPAuth Dotnet

```text
private readonly SudMgpAuth _sudMgpAuth; = new SudMGPAuth(APP_ID, APP_SECRET);

public class SudMGPAuth {

    public SudCode GetCode(string uid);

    public SudCode GetCode(string uid, long expireDuration);

    public SudSsToken GetSsToken(string uid);

    public SudSsToken getSsToken(string uid, long expireDuration);

    public SudUid GetUidByCode(string code);

    public SudUid GetUidBySSToken(string ssToken);

    public ErrorCodeEnum VerifyCode(string code);

    public ErrorCodeEnum VerifySSToken(string ssToken);

}

/// <summary>
///     错误码信息定义
/// </summary>
public enum ErrorCodeEnum
{
    /// <summary>
    ///     成功
    /// </summary>
    Success = 0,

    /// <summary>
    ///     Token创建失败
    /// </summary>
    TokenCreateFailed = 1001,

    /// <summary>
    ///     Token校验失败
    /// </summary>
    TokenVerifyFailed = 1002,

    /// <summary>
    ///     Token校验失败
    /// </summary>
    TokenDecodeFailed = 1003,

    /// <summary>
    ///     Token非法
    /// </summary>
    TokenInvalid = 1004,

    /// <summary>
    ///     Token过期
    /// </summary>
    TokenExpired = 1005,

    /// <summary>
    ///     未知错误
    /// </summary>
    Undefine = 9999
}


```

### SudMgpAuth.GetCode

- 说明

```txt
获取短期令牌Code，默认时长2小时
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|uid|是|string|用户id，需全局唯一，为保证数据安全，可通过自己的UID哈希出虚拟UID|

- 返回值(SudCode)

|参数名|类型|说明|
|:----|:---|-----|
|code|string|根据UID生成的短期令牌Code|
|expireDate|long|过期时间戳（毫秒）|

### SudMgpAuth.GetCode

- 说明

```txt
获取短期令牌Code，自定义时长
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|uid|是|string|用户id，需全局唯一，为保证数据安全，可通过自己的UID哈希出虚拟UID|
|expireDuration|是|long|短期令牌Code过期时长（毫秒数），例如：1小时：3600000, 最短限制半小时，小于半小时会使用半小时|

- 返回值(SudCode)

|参数名|类型|说明|
|:----|:---|-----|
|code|string|根据UID生成的短期令牌Code|
|expireDate|long|短期令牌Code过期时间戳（毫秒）|


### SudMgpAuth.GetSsToken

- 说明

```txt
通过UID获取长期令牌SSToken，SSToken为小游戏服务端与业务服务端数据交换的令牌
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|uid|是|string|用户id，需全局唯一，可通过短期令牌Code获得|

- 返回值(SudSSToken)

|参数名|类型|说明|
|:----|:---|-----|
|token|string|根据UID生成的长期令牌SSToken|
|expireDate|long|长期令牌SSToken过期时间戳（毫秒）|

### SudMgpAuth.GetSsToken

- 说明

```txt
通过UID获取长期令牌SSToken，SSToken为小游戏服务端与业务服务端数据交换的令牌，自定义时长
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|uid|是|string|用户id，需全局唯一，可通过短期令牌Code获得|
|expireDuration|是|long|长期令牌SSToken过期时长（毫秒数），例如：1小时：3600000, 最短限制2小时，小于2小时会使用2小时|

- 返回值(SudSSToken)

|参数名|类型|说明|
|:----|:---|-----|
|token|string|根据UID生成的长期令牌SSToken|
|expireDate|long|长期令牌SSToken过期时间戳（毫秒）|

### SudMgpAuth.GetUidByCode

- 说明

```txt
通过短期令牌Code获得UID
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|code|是|string|短期令牌Code|

- 返回值(SudUid)

|参数名|类型|说明|
|:----|:---|-----|
|uid|string|用户ID，从短期令牌Code中获取|
|isSuccess|bool|是否成功|
|errorCode|int|服务端sdk错误码，isSuccess为false时返回，需透传到游戏服务器|


### SudMgpAuth.GetUidBySsToken

- 说明

```txt
通过长期令牌SSToken获得UID
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|ssToken|是|string|长期令牌SSToken|

- 返回值(SudUid)

|参数名|类型|说明|
|:----|:---|-----|
|uid|string|用户ID，从长期令牌SSToken中获取|
|isSuccess|bool|是否成功|
|errorCode|int|服务端sdk错误码，isSuccess为false时返回，需透传到游戏服务器|


### SudMgpAuth.VerifyCode

- 说明

```txt
校验短期令牌Code有效性
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|code|是|string|短期令牌Code|

- 返回值(ErrorCodeEnum): 见“错误码信息定义”


### SudMgpAuth.VerifySsToken

- 说明

```txt
校验长期令牌SSToken有效性
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|ssToken|是|string|长期令牌SSToken|

- 返回值(ErrorCodeEnum): 见“错误码信息定义”
