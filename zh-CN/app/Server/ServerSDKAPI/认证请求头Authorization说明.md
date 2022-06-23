#

![SUD](../../Resource/logo.png)

## 简要描述

- 认证请求头 Authorization 实现方式

## 签名生成

- ### 准备

接入方需要提前准备 应用id(app_id), 应用密钥(app_secret)

- ### 构造签名串

签名串一共有四行，每一行对应一个参数。行尾以 \n）结束，包括最后一行。

```
应用ID\n
请求时间戳(接入方发送请求的时间戳)\n
随机字符串(接入方随机生成的字符串)\n
请求body(接入方发送请求的body)\n
```
示例：
```
1461564080052506636
146634788974
keVJLJTItd1VBtGT
{"app_id": "1461564080052506238","mg_id": "1461227817776713818","room_id": "9009","round_id": "ce56b6lzi1a7-cehorlmy01pq-ckmfkba10iv7","currency_amount": "2", "timestamp": 1654079242000}

```

- ###计算签名值

使用应用密钥(app_secret)对签名串进行 `HmacSHA1`算法加密，生成对应的签名值

#### Java示例代码：
```java
import cn.hutool.crypto.digest.HMac;
import cn.hutool.crypto.digest.HmacAlgorithm;

public class SignTest {

  public static void main(String[] args) {
    // 应用ID
    String appId = "";
    // 应用secret
    String appSecret = "";
    // 请求时间戳（接入方发送请求的时间戳）
    String timestamp = "";
    // 随机字符串 (接入方自定义随机字符串)
    String nonce = "";
    // 请求body (接入方请求body， 需保证发送方与接收方的数据一致，建议在拦截器里做对应认证)
    String body = "";

    // 签名串
    String signContent = String.format("%s\n%s\n%s\n%s\n", appId, timestamp, nonce, body);
    // 签名值
    HMac hMac = new HMac(HmacAlgorithm.HmacSHA1, appSecret.getBytes());
    String signature = hMac.digestHex(signContent);
    System.out.println(signature);
  }

}
```

## 设置 Authorization请求头

- ### Authorization请求头

```
Authorization: 认证类型 签名信息 （注：认证类型与签名信息以空格隔开）
```
- 认证类型：当前类型为固定值 `Sud-Auth`
- 签名信息：
```
应用id， app_id
发起请求的时间戳，timestamp
随机字符串, nonce
签名值, signature

*注：以上各项签名信息无顺序要求，只需保证签名信息名称与值对应即可*
```

- 示例：(因排版问题可能存在换行，实际数据应在一行)

```
Authorizatio: Sud-Auth app_id="1461564080052999111",timestamp="1646382565",nonce="keVJLJTItd1VBtGT",signature="8d6e3c25614278a08b5abe4c205c18adee8437d2"
```

#### Java示例代码：
```java
public class AuthorizationHeaderTest {

  public static void main(String[] args) {
    // 应用ID
    String appId = "";
    // 请求时间戳（接入方发送请求的时间戳）
    String timestamp = "";
    // 随机字符串 (接入方自定义随机字符串)
    String nonce = "";
    // 签名值
    String signature = "";
    String authorization = String.format("Sud-Auth app_id=\"%s\",timestamp=\"%s\",nonce=\"%s\",signature=\"%s\"",
            appId, timestamp, nonce, signature);
    System.out.println(authorization);
  }

}
```

- ### 最终组成的HTTP请求示例:

```
curl --location --request POST 'https://sim-mg-proxy.s00.tech/v1/app/server/report_game_round_bill' \
--header 'Authorization: Sud-Auth app_id="1461564080052506636",nonce="keVJLJTItd1VBtGT",timestamp="146634788974",signature="dbe72d35f08182e948c8b92bbcc29ebfb47308d5"' \
--header 'Content-Type: application/json' \
--data-raw '{"request_id": "1655285156001", "mg_id": "1461227817776713818","room_id": "9009","round_id": "ce56b6lzi1a7-cehorlmy01pq-ckmfkba10i7","total_amount": 2, "payment_details": [{"user_id": "01", "amount": 1}, {"user_id":"002", "amount": 1}], "payment_type": "TICKET"}'
```