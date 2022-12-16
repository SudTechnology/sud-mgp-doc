#

![SUD](../../Resource/logo.png)

## SudMGPAuth Java

```java
SudMGPAuth sudMGPAuth = new SudMGPAuth(APP_ID, APP_SECRET);

public class SudMGPAuth {

    public SudCode getCode(String uid);

    public SudCode getCode(String uid, Long expireDuration);

    public SudSSToken getSSToken(String uid);

    public SudSSToken getSSToken(String uid, Long expireDuration);

    public SudUid getUidByCode(String code);

    public SudUid getUidBySSToken(String ssToken);

    public boolean verifyCode(String code);

    public boolean verifySSToken(String ssToken);

}

/**
 * Error code definition.
 * @author sud
 */
public enum ErrorCodeEnum {
    /**
     * Success.
     */
    SUCCESS (0, "Success."),
    /**
     * Token creation failed.
     */
    TOKEN_CREATE_FAILED (1001, "Token creation failed."),
    /**
     * Token verification failed (algorithm or signature error).
     */
    TOKEN_VERIFY_FAILED (1002, "Token verification failed."),
    /**
     * Token parsing failed.
     */
    TOKEN_DECODE_FAILED (1003, "Token parsing failed."),
    /**
     * Invalid token (The carried Claim is incorrect).
     */
    TOKEN_INVALID (1004, "Invalid token."),
    /**
     * Token expired.
     */
    TOKEN_EXPIRED (1005, "Token expired."),
    /**
     * Unknown error.
     */
    UNDEFINE (9999, "Unknown error.");
}


```

### SudMGPAuth.getCode

- Description

```txt
You can call this API to obtain a short-term token code. By default, the short-term token code is valid for 2 hours.
```

- Request parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| uid | Yes | string | The globally unique user ID. To ensure data security, you can use a virtual UID obtained by hashing the actual UID. |

- Response parameters (SudCode)

| Parameter | Type | Description |
|:----|:---|-----|
| code | string | The short-term token code generated based on the UID. |
| expireDate | long | The timestamp at which the token code will expire, accurate to millisecond.|

### SudMGPAuth.getCode

- Description

```txt
You can call this API to obtain a short-term token code with custom duration.
```

- Request parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| uid | Yes | string | The globally unique user ID. To ensure data security, you can use a virtual UID obtained by hashing the actual UID. |
| expireDuration | Yes | long | The duration for which the short-term token code is valid, in milliseconds. For example, 3600000 means that the short-term token code is valid for 1 hour. The minimum duration is half an hour. If the configured duration is less than half an hour, the short-term token code will be valid for half an hour. |

- Response parameters (SudCode)

| Parameter | Type | Description |
|:----|:---|-----|
| code | string | The short-term token code generated based on the UID. |
| expireDate | long | The timestamp at which the short-term token code will expire, accurate to millisecond. |


### SudMGPAuth.getSSToken

- Description

```txt
You can call this API to obtain a long-term token (SSToken) based on the UID. SSToken is used for data exchange between the game server and the app server.
```

- Request parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| uid | Yes | string | The globally unique user ID. It can be obtained based on the short-term token code. |

- Response parameters (SudSSToken)

| Parameter | Type | Description |
|:----|:---|-----|
| token | string | The long-term token (SSToken) generated based on the UID. |
| expireDate | long | The timestamp at which the SSToken will expire, accurate to millisecond. |

### SudMGPAuth.getSSToken

- Description

```txt
You can call this API to obtain a long-term token (SSToken) with custom duration based on the UID. SSToken is used for data exchange between the game server and the app server.
```

- Request parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| uid | Yes | string | The globally unique user ID. It can be obtained based on the short-term token code. |
| expireDuration | Yes | long | The duration for which the long-term token is valid, in milliseconds. For example, 3600000 means that the long-term token is valid for 1 hour. The minimum duration is 2 hours. If the configured duration is less than 2 hours, the long-term token will be valid for 2 hours. |

- Response parameters (SudSSToken)

| Parameter | Type | Description |
|:----|:---|-----|
| token | string | The long-term token (SSToken) generated based on the UID. |
| expireDate | long | The timestamp at which the SSToken will expire, accurate to millisecond. |

### SudMGPAuth.getUidByCode

- Description

```txt
You can call this API to obtain the UID based on the short-term token code.
```

- Request parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| code | Yes | string | The short-term token code. |

- Response parameters (SudUid)

| Parameter | Type | Description |
|:----|:---|-----|
| uid | String | The user ID. It can be obtained based on the short-term token code. |
| isSuccess | bool | Whether the call is successful. |
| errorCode | int | The server-end SDK error code. When **isSuccess** is **false**, the error code needs to be transparently transmitted to the game server. |


### SudMGPAuth.getUidBySSToken

- Description

```txt
You can call this API to obtain the UID based on the long-term token (SSToken).
```

- Request parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| ssToken | Yes | string | The long-term token (SSToken). |

- Response parameters (SudUid)

| Parameter | Type | Description |
|:----|:---|-----|
| uid | String | The user ID. It can be obtained based on the long-term token (SSToken). |
| isSuccess | bool | Whether the call is successful. |
| errorCode | int | The server-end SDK error code. When **isSuccess** is **false**, the error code needs to be transparently transmitted to the game server. |


### SudMGPAuth.verifyCode

- Description

```txt
You can call this API to verify the validity of a short-term token code.
```

- Request parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| code | Yes | string | The short-term token code. |

- Response parameters (ErrorCodeEnum): For more information, see "Error code definition."


### SudMGPAuth.verifySSToken

- Description

```txt
You can call this API to verify the validity of a long-term token (SSToken).
```

- Request parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| ssToken | Yes | string | The long-term token (SSToken). |

- Response parameters (ErrorCodeEnum): For more information, see "Error code definition."
