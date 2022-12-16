#

![SUD](../../Resource/logo.png)

## SudMGPAuth Go

```javascript

type SudMGPAuth struct {
	AppID     string
	AppSecret string
}

func NewSudMGPAuth(appID string, appSecret string) *SudMGPAuth {
	client := &SudMGPAuth{
		AppID:     appID,
		AppSecret: appSecret,
	}
	return client
}

func (client *SudMGPAuth) GetCode(uid string, expireDuration int64) *SudCode

func (client *SudMGPAuth) GetCodeByDefaultDuration(uid string) *SudCode

func (client *SudMGPAuth) GetSSToken(uid string, expireDuration int64) *SudSSToken 

func (client *SudMGPAuth) GetSSTokenByDefaultDuration(uid string) *SudSSToken 

func (client *SudMGPAuth) GetUidByCode(code string) *SudUid 

func (client *SudMGPAuth) GetUidBySSToken(ssToken string) *SudUid

func (client *SudMGPAuth) VerifyCode(code string) bool 

func (client *SudMGPAuth) VerifySSToken(code string) bool 

​``` go


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
	/**
	 * Unknown error.
	 */
	undefine = 9999
)


```

### SudMGPAuth.GetCode

- Description

```txt
You can call this API to obtain a short-term token code with custom duration.
```

- Request parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| uid | Yes | string | The globally unique user ID. To ensure data security, you can use a virtual UID obtained by hashing the actual UID. |
| expireDuration | Yes | int64 | The duration for which the short-term token code is valid, in milliseconds. For example, 3600000 means that the short-term token code is valid for 1 hour. The minimum duration is half an hour. If the configured duration is less than half an hour, the short-term token code will be valid for half an hour. |

- Response parameters (SudCode)

| Parameter | Type | Description |
|:----|:---|-----|
| code | string | The short-term token code generated based on the UID. |
| expireDate | int64 | The timestamp at which the short-term token code will expire, accurate to millisecond. |

### SudMGPAuth.GetCodeByDefaultDuration

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
| expireDate | int64 | The timestamp at which the short-term token code will expire, accurate to millisecond. |


### SudMGPAuth.GetSSToken

- Description

```txt
You can call this API to obtain a long-term token (SSToken) with custom duration based on the UID. SSToken is used for data exchange between the game server and the app server.
```

- Request parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| uid | Yes | string | The globally unique user ID. It can be obtained based on the short-term token code. |
| expireDuration | Yes | int64 | The duration for which the long-term token is valid, in milliseconds. For example, 3600000 means that the long-term token is valid for 1 hour. The minimum duration is 2 hours. If the configured duration is less than 2 hours, the long-term token will be valid for 2 hours. |

- Response parameters (SudSSToken)

| Parameter | Type | Description |
|:----|:---|-----|
| token | string | The long-term token (SSToken) generated based on the UID. |
| expireDate | int64 | The timestamp at which the SSToken will expire, accurate to millisecond. |


### SudMGPAuth.GetSSTokenByDefaultDuration

- Description

```txt
You can call this API to obtain a long-term token (SSToken) based on the UID. SSToken is used for data exchange between the game server and the app server. By default, a long-term token is valid for 2 hours.
```

- Request parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| uid | Yes | string | The globally unique user ID. It can be obtained based on the short-term token code. |

- Response parameters (SudSSToken)

| Parameter | Type | Description |
|:----|:---|-----|
| token | string | The long-term token (SSToken) generated based on the UID. |
| expireDate | int64 | The timestamp at which the SSToken will expire, accurate to millisecond. |

### SudMGPAuth.GetUidByCode

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
| sdkErrorCode | int | The server-end SDK error code. When **isSuccess** is **false**, the error code needs to be transparently transmitted to the game server. |


### SudMGPAuth.GetUidBySSToken

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
| sdkErrorCode | int | The server-end SDK error code. When **isSuccess** is **false**, the error code needs to be transparently transmitted to the game server. |


### SudMGPAuth.VerifyCode

- Description

```txt
You can call this API to verify the validity of a short-term token code.
```

- Request parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| code | Yes | string | The short-term token code. |

- Response parameters (sdkErrorCode): For more information, see "Error code definition."


### SudMGPAuth.VerifySSToken

- Description

```txt
You can call this API to verify the validity of a long-term token (SSToken).
```

- Request parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| ssToken | Yes | string | The long-term token (SSToken). |

- Response parameters (sdkErrorCode): For more information, see "Error code definition."
