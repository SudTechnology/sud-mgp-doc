#

![SUD](../../Resource/logo.png)

## 简要描述

- 回调签名验证

- #### 1. 准备

商户需要提前获取 应用id(app_id), 应用密钥(app_secret)

- #### 2. 构造签名串
- 2.1 首先，服务端从回调请求 Http Header 中获取签名信息。

```
- HTTP请求头 Sud-AppId： 应用id
- HTTP请求头 Sud-Timestamp： 回调时间戳
- HTTP请求头 Sud-Nonce: 随机字符串
- HTTP请求头 Sud-Signature: 签名值
```

- 2.2 签名串一共有四行，每一行对应一个参数。行尾以 \n 结束，包括最后一行。

```
应用ID\n
回调时间戳\n
随机字符串\n
请求body\n
```

- 2.3 签名串示例：

```
1461564080052506636
146634788974
keVJLJTItd1VBtGT
{"app_id": "1461564080052506238","mg_id": "1461227817776713818","room_id": "9009","round_id": "ce56b6lzi1a7-cehorlmy01pq-ckmfkba10iv7","currency_amount": "2", "timestamp": 1654079242000}

```

#### 3. 计算签名值并验签

使用应用密钥(app_secret)对签名串进行 `HmacSHA1`算法加密，生成对应的签名值，并与HTTP请求头`Sud-Signuture`的值比较

- #### Java示例代码：

```java
/**
 * 校验签名
 *
 * @param request     请求体
 * @param requestBody 请求内容，为保证发送方与接收方的数据一致，建议在拦截器里取对应值
 * @return true: 验签成功， false: 验签失败
 */
public boolean verifySignature(HttpServletRequest request, String requestBody) {
        // SudAppId
        String sudAppId = request.getHeader("Sud-AppId");
        // SudTimestamp
        String sudTimestamp = request.getHeader("Sud-Timestamp");
        // SudNonce
        String sudNonce = request.getHeader("Sud-Nonce");
        // SudSignature
        String sudSignature = request.getHeader("Sud-Signature");
        // 请求body (需保证发送方与接收方的数据一致，建议在拦截器里取对应值）
        String body = requestBody;

        // 构造签名串
        String signContent = String.format("%s\n%s\n%s\n%s\n", sudAppId, sudTimestamp, sudNonce, body);

        // 计算签名值
        String appSecret = "";
        HMac hMac = new HMac(HmacAlgorithm.HmacSHA1, appSecret.getBytes());
        String signature = hMac.digestHex(signContent);

        // 比较签名值 true: 验签成功， false: 验签失败
        return sudSignature.equals(signature);
        }
```






