####  SDK 集成示例

##### 参数

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|appId |是  |string | 申请后获取   |
|appSecret |是  |string | 申请后获取    |
| sstoken    |是  |string | jwt签名数据   |

#### Java SDK 集成示例
```java
import tech.sud.mgp.auth.api.DefaultSudMGPClient;
import tech.sud.mgp.auth.api.SdkTokenResponse;
import tech.sud.mgp.auth.api.SdkUidResponse;

        // 实例化客户端，构造函数传入appId 和appSecret
        DefaultAmphieraClient client = new DefaultAmphieraClient(appId, appSecret);
        // 验证code 是否过有效期，从sstoken 解析返回uid
        SdkUidResponse uidResp = client.getUidFromSSToken(sstoken);
        if (uidResp.isSuccess()) {
            System.out.println("调用成功 uid:" + uidResp.getUid());
        } else {
            System.out.println("验证sstoken 失败");
        }
```

#### Go SDK 集成示例
```go
func TestParseToken(t *testing.T) {
	token := "a.b.c"
	userClaims, err := ParseToken(token, appSecret)
	if err != nil {
		t.Logf("err:%+v \n", err)
	}
	t.Logf("userClaims:%+v \n", userClaims)
}
```