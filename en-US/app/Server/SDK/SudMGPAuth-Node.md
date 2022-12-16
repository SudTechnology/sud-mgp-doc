#

![SUD](../../Resource/logo.png)

## SudMGPAuth Nodejs

```javascript

module.exports.NewSudMGPAuth = function(appId, appSecret) {
    return new SudMGPAuth(appId, appSecret);
};

let SudMGPAuth = function (appId, appSecret) {
    this.appId = appId;
    this.appSecret = appSecret;
}

SudMGPAuth.prototype.getCode = function (uid, expireDuration) {}

SudMGPAuth.prototype.getSSToken = function (uid, expireDuration) {}

SudMGPAuth.prototype.getUidByCode = function (code) {}

SudMGPAuth.prototype.getUidBySSToken = function (ssToken) {}

SudMGPAuth.prototype.verifyCode = function (code) {} 

SudMGPAuth.prototype.verifySSToken = function (ssToken) {}


/**
 * Error code definition.
 * @author sud
 */

const (
	/**
	 * Success.
	 */
	tokenSuccess = 0
	/**
	 * Token creation failed.
	 */
	tokenCreateFailed = 1001
	/**
	 * Token verification failed (algorithm or signature error).
	 */
	tokenVerifyFailed = 1002
	/**
	 * Token parsing failed.
	 */
	tokenDecodeFailed = 1003
	/**
	 * Invalid token (The carried Claim is incorrect).
	 */
	tokenInvalid = 1004
	/**
	 * Token expired.
	 */
	tokenExpired = 1005
)


```

### SudMGPAuth.getCode

- Description

```txt
You can call this API to obtain a short-term token code with custom duration.
```

- Request parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| uid | Yes | string | The globally unique user ID. To ensure data security, you can use a virtual UID obtained by hashing the actual UID. |
| expireDuration | No | int64 | The duration for which the short-term token code is valid, in milliseconds. For example, 3600000 means that the short-term token code is valid for 1 hour. The minimum duration is half an hour. If the configured duration is less than half an hour, the short-term token code will be valid for half an hour. If the duration is not configured or the configured duration is **0**, the token code is valid for 2 hours by default. |

- Response parameters (SudCode)

| Parameter | Type | Description |
|:----|:---|-----|
| code | string | The short-term token code generated based on the UID. |
| expireDate | int64 | The timestamp at which the short-term token code will expire, accurate to millisecond. |


### SudMGPAuth.getSSToken

- Description

```txt
You can call this API to obtain a long-term token (SSToken) with custom duration based on the UID. SSToken is used for data exchange between the game server and the app server.
```

- Request parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| uid | Yes | string | The globally unique user ID. It can be obtained based on the short-term token code. |
| expireDuration | No | int64 | The duration for which the long-term token is valid, in milliseconds. For example, 3600000 means that the long-term token is valid for 1 hour. The minimum duration is half an hour. If the configured duration is less than half an hour, the long-term token code will be valid for half an hour. If the duration is not configured or the configured duration is **0**, the token code is valid for 2 hours by default. |

- Response parameters (SudSSToken)

| Parameter | Type | Description |
|:----|:---|-----|
| token | string | The long-term token (SSToken) generated based on the UID. |
| expireDate | int64 | The timestamp at which the SSToken will expire, accurate to millisecond. |

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
| uid | string | The user ID. It can be obtained based on the short-term token code. |
| isSuccess | bool | Whether the call is successful. |
| errorCode | int | The server-end SDK error code. For more information, see "Error code definition." When **isSuccess** is **false**, the error code needs to be transparently transmitted to the game server. |


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
| uid | string | The user ID. It can be obtained based on the long-term token (SSToken). |
| isSuccess | bool | Whether the call is successful. |
| errorCode | int | The server-end SDK error code. For more information, see "Error code definition." When **isSuccess** is **false**, the error code needs to be transparently transmitted to the game server. |


### SudMGPAuth.verifyCode

- Description

```txt
You can call this API to verify the validity of a short-term token code.
```

- Request parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| code | Yes | string | The short-term token code. |

- Response parameters (errorCode): For more information, see "Error code definition."


### SudMGPAuth.VerifySSToken

- Description

```txt
You can call this API to verify the validity of a long-term token (SSToken).
```

- Request parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| ssToken | Yes | string | The long-term token (SSToken). |

- Response parameters (errorCode): For more information, see "Error code definition."
