#

![SUD](../../Resource/logo.png)

[Toc]

## DefaultSudMGPClient

```java
public class DefaultSudMGPClient {

    public SdkTokenResponse getCode(String uid);

    public SdkTokenResponse getSSToken(String uid);

    public SdkUidResponse getUidFromCode(String code);

    public SdkUidResponse getUidFromSSToken(String ssToken);

    public boolean verify(String token);

}
```
