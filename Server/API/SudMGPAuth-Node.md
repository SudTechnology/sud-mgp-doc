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

``` go


/**
 * 错误码信息定义
 * @author sud
 */

const (
	/**
	 * 成功
	 */
	tokenSuccess = 0
	/**
	 * Token创建失败
	 */
	tokenCreateFailed = 1001
	/**
	 * Token校验失败（算法，签名错误）
	 */
	tokenVerifyFailed = 1002
	/**
	 * Token解析失败
	 */
	tokenDecodeFailed = 1003
	/**
	 * Token非法（携带的Claim错误）
	 */
	tokenInvalid = 1004
	/**
	 * Token过期
	 */
	tokenExpired = 1005
)


```

### SudMGPAuth.getCode

- 说明

```txt
获取短期令牌Code，自定义时长
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|uid|是|string|用户id，需全局唯一，为保证数据安全，可通过自己的UID哈希出虚拟UID|
|expireDuration|是|int64|短期令牌Code过期时长（毫秒数），例如：1小时：3600000, 最短限制半小时，小于半小时会使用半小时,填0时会默认2小时|

- 返回值(SudCode)

|参数名|类型|说明|
|:----|:---|-----|
|code|string|根据UID生成的短期令牌Code|
|expireDate|int64|短期令牌Code过期时间戳（毫秒）|


### SudMGPAuth.getSSToken

- 说明

```txt
通过UID获取长期令牌SSToken，SSToken为小游戏服务端与业务服务端数据交换的令牌，自定义时长
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|uid|是|string|用户id，需全局唯一，可通过短期令牌Code获得|
|expireDuration|是|int64|长期令牌SSToken过期时长（毫秒数），例如：1小时：3600000, 最短限制半小时，小于半小时会使用半小时,填0时会默认2小时|

- 返回值(SudSSToken)

|参数名|类型|说明|
|:----|:---|-----|
|token|string|根据UID生成的长期令牌SSToken|
|expireDate|int64|长期令牌SSToken过期时间戳（毫秒）|

### SudMGPAuth.getUidByCode

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
|errorCode|int|服务端sdk错误码(见“错误码信息定义”)，isSuccess为false时返回，需透传到游戏服务器|


### SudMGPAuth.getUidBySSToken

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
|errorCode|int|服务端sdk错误码(见“错误码信息定义”)，isSuccess为false时返回，需透传到游戏服务器|


### SudMGPAuth.verifyCode

- 说明

```txt
校验短期令牌Code有效性
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|code|是|string|短期令牌Code|

- 返回值true或false


### SudMGPAuth.VerifySSToken

- 说明

```txt
校验长期令牌SSToken有效性
```

- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|ssToken|是|string|长期令牌SSToken|

- 返回值true或false
