#

![SUD](../../Resource/logo.png)

[Toc]

## DefaultSudMGPClient

```java
public class DefaultSudMGPClient {
    /**
     * 获取code
     *
     * @param uid 用户id
     * @return SdkResponse
     */
    public SdkTokenResponse getCode(String uid);

    /**
     * 获取ssToken
     *
     * @param uid 用户id
     * @return SdkResponse
     */
    public SdkTokenResponse getSSToken(String uid);

    /**
     * 根据code 获取uid
     *
     * @param code code
     * @return SdkUidResponse
     */
    public SdkUidResponse getUidFromCode(String code);

    /**
     * 根据sstoken 获取uid
     *
     * @param ssToken ssToken
     * @return SdkUidResponse
     */
    public SdkUidResponse getUidFromSSToken(String ssToken);

    /**
     * 验证token
     *
     * @param token 验证token
     * @return boolean
     */
    public boolean verify(String token);
}
```
