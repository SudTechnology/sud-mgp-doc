####  SDK 集成示例

##### 参数

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|appId |是  |string | 申请后获取   |
|appSecret |是  |string | 申请后获取    |
| uid    |是  |string | 用户id, token中携带的用户数据   |

#### Java SDK 集成示例
```java
import tech.sud.mgp.auth.api.DefaultSudMGPClient;
import tech.sud.mgp.auth.api.SdkTokenResponse;
import tech.sud.mgp.auth.api.SdkUidResponse;

        // 实例化客户端，构造函数传入appId 和appSecret
		DefaultSudMGPClient client = new DefaultSudMGPClient(appID, secret);
        // 传入uid参数，JWT签名后，返回token和有效期（有效期默认2小时）
        SdkTokenResponse resp = client.getCode(String.valueOf(uid));
        System.out.println("token:" + resp.getToken());
        System.out.println("ExpireDate:" + resp.getExpireDate());
```

#### Go SDK 集成示例
```go
func TestGenerateToken(t *testing.T) {
	// 实例化UserClaims，传入参数
	userClaims := &UserClaims{
		AppID: appId,
		Uid:   uid,
	}

	// 生成token和有效期（有效期默认2小时）
	token, exp, err := GenerateToken(userClaims, appSecret)
	if err != nil {
		t.Logf("err:%+v \n", err)
	}
	t.Logf("token:%+v,exp:%+v \n", token, exp)
}
```
