#

![SUD](../../Resource/logo.png)

## SudMGPAuth Java

```java
SudMGPAuth sudMGPAuth = new SudMGPAuth(APP_ID, APP_SECRET);

public class SudMGPAuth {

    public SudCode getCode(String uid);

    public SudCode getCode(String uid, Long expireDuration);

    public SudSSToken getSSToken(String uid);

    public SudUid getUidByCode(String code);

    public SudUid getUidBySSToken(String ssToken);

    public boolean verifyCode(String code);

    public boolean verifySSToken(String ssToken);

}

/**
 * 错误码信息定义
 * @author sud
 */
public enum ErrorCodeEnum {
    /**
     * 成功
     */
    SUCCESS(0, "成功"),
    /**
     * Token创建失败
     */
    TOKEN_CREATE_FAILED(1001, "Token创建失败"),
    /**
     * Token校验失败（算法，签名错误）
     */
    TOKEN_VERIFY_FAILED(1002, "Token校验失败"),
    /**
     * Token解析失败
     */
    TOKEN_DECODE_FAILED(1003, "Token解析失败"),
    /**
     * Token非法（携带的Claim错误）
     */
    TOKEN_INVALID(1004, "Token非法"),
    /**
     * Token过期
     */
    TOKEN_EXPIRED(1005, "Token过期"),
    /**
     * 未知错误
     */
    UNDEFINE(9999, "未知错误");
}


```

### SudMGPAuth.getCode

- 说明

```txt
获取短期令牌Code，默认时长2小时
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|uid|是|String|用户id，需全局唯一，为保证数据安全，可通过自己的UID哈希出虚拟UID|

- 返回值(SudCode)

|参数名|类型|说明|
|:----|:---|-----|
|code|String|根据UID生成的code|
|expireDate|Long|过期时间戳（毫秒）|

### SudMGPAuth.getCode

- 说明

```txt
获取短期令牌Code，自定义时长
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|uid|是|String|用户id，需全局唯一，为保证数据安全，可通过自己的UID哈希出虚拟UID|
|expireDuration|是|Long|code过期时长（毫秒数），例如：1小时：3600000|

- 返回值(SudCode)

|参数名|类型|说明|
|:----|:---|-----|
|code|String|根据UID生成的code|
|expireDate|Long|过期时间戳（毫秒）|


### SudMGPAuth.getSSToken

- 说明

```txt
通过UID获取长期令牌SSToken，SSToken为小游戏服务端与业务服务端数据交换的令牌
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|uid|是|String|用户id，需全局唯一，可通过短期令牌Code获得|

- 返回值(SudSSToken)

|参数名|类型|说明|
|:----|:---|-----|
|token|String|长期令牌SSToken|
|expireDate|Long|过期时间戳（毫秒）|

### SudMGPAuth.getUidByCode

- 说明

```txt
通过短期令牌Code获得UID
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|code|是|String|短期令牌Code|

- 返回值(SudUid)

|参数名|类型|说明|
|:----|:---|-----|
|uid|String|用户ID，从code中获取|
|isSuccess|Boolean|是否成功|
|errorCode|int|服务端sdk错误码，isSuccess为false时返回，需透传到游戏服务器|


### SudMGPAuth.getUidBySSToken

- 说明

```txt
通过长期令牌SSToken获得UID
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|ssToken|是|String|长期令牌SSToken|

- 返回值(SudUid)

|参数名|类型|说明|
|:----|:---|-----|
|uid|String|用户ID，从ssToken中获取|
|isSuccess|Boolean|是否成功|
|errorCode|int|服务端sdk错误码，isSuccess为false时返回，需透传到游戏服务器|


### SudMGPAuth.verifyCode

- 说明

```txt
校验短期令牌Code有效性
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|code|是|String|短期令牌Code|

- 返回值(ErrorCodeEnum): 见“错误码信息定义”


### SudMGPAuth.verifySSToken

- 说明

```txt
校验长期令牌SSToken有效性
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|ssToken|是|String|长期令牌SSToken|

- 返回值(ErrorCodeEnum): 见“错误码信息定义”
