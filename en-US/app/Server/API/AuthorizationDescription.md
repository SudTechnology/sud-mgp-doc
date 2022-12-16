#

![SUD](../../Resource/logo.png)

## Description

- This topic describes the Authorization implementation method.

## Generate a signature

- ### Preparation

Application ID (app_id) and application key (app_secret)

- ### Construct a signature string

The signature string has four lines, and each line lists a parameter and ends with \n, including the last line.

```
Application ID\n
Request timestamp (the timestamp when a request is sent.)\n
Random string (a string of characters generated at random)\n
Request body (the body of the sent request)\n
```
Example:
```
1461564080052506636
146634788974
keVJLJTItd1VBtGT
{"app_id": "1461564080052506238","mg_id": "1461227817776713818","room_id": "9009","round_id": "ce56b6lzi1a7-cehorlmy01pq-ckmfkba10iv7","currency_amount": "2", "timestamp": 1654079242000}

```

- ### Calculate the signature value

Use the application key (app_secret) to perform `HmacSHA1` encryption for the signature string and generate the corresponding signature value.

#### Sample Java code:
```java
import cn.hutool.crypto.digest.HMac;
import cn.hutool.crypto.digest.HmacAlgorithm;

public class SignTest {

  public static void main(String[] args) {
    // Application ID
    String appId = "";
    // Application secret
    String appSecret = "";
    // Request timestamp (the timestamp when the request is sent.)
    String timestamp = "";
    // Random string (a custom random string of characters)
    String nonce = "";
    // Request body (The request body. To ensure data consistency between the sender and receiver, we recommend that you perform data validation at the interceptors.)
    String body = "";

    // Signature string
    String signContent = String.format("%s\n%s\n%s\n%s\n", appId, timestamp, nonce, body);
    // Signature value
    HMac hMac = new HMac(HmacAlgorithm.HmacSHA1, appSecret.getBytes());
    String signature = hMac.digestHex(signContent);
    System.out.println(signature);
  }

}
```

## Configure the Authorization header

- ### Authorization header

```
Authorization: The authorization type and signature information. (Note: The authorization type and signature information need to be separated by a space.)
```
- Authorization type: It has a fixed value of `Sud-Auth`.
- Signature information:
```
app_id
String timestamp
String nonce
String signature

* Note: You do not need to specify the preceding fields in that specific sequence. Ensure that each field is specified with corresponding value.
```

- Example: (Line breaks may occur due to layout, but the whole piece of information is in one line.)

```
Authorization: Sud-Auth app_id="1461564080052999111",timestamp="1646382565",nonce="keVJLJTItd1VBtGT",signature="8d6e3c25614278a08b5abe4c205c18adee8437d2"
```

#### Sample Java code:
```java
public class AuthorizationHeaderTest {

  public static void main(String[] args) {
    // Application ID
    String appId = "";
    // Request timestamp (the timestamp when the request is sent.)
    String timestamp = "";
    // Random string (a custom random string of characters)
    String nonce = "";
    // Signature value
    String signature = "";
    String authorization = String.format("Sud-Auth app_id=\"%s\",timestamp=\"%s\",nonce=\"%s\",signature=\"%s\"",
            appId, timestamp, nonce, signature);
    System.out.println(authorization);
  }

}
```

- ### A valid sample HTTP request:

```
curl --location --request POST 'https://sim-mg-proxy.s00.tech/v1/app/server/report_game_round_bill' \
--header 'Authorization: Sud-Auth app_id="1461564080052506636",nonce="keVJLJTItd1VBtGT",timestamp="146634788974",signature="dbe72d35f08182e948c8b92bbcc29ebfb47308d5"' \
--header 'Content-Type: application/json' \
--data-raw '{"request_id": "1655285156001", "mg_id": "1461227817776713818","room_id": "9009","round_id": "ce56b6lzi1a7-cehorlmy01pq-ckmfkba10i7","total_amount": 2, "payment_details": [{"user_id": "01", "amount": 1}, {"user_id":"002", "amount": 1}], "payment_type": "TICKET"}'
```
