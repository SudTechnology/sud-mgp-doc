#

![SUD](../../Resource/logo.png)

## Description

- Access the server end and obtain the server-end API configuration file based on **app_id** and **app_secret**.

## Request URL

- Test environment: https://sim-asc.sudden.ltd/[app service signature]
- Production environment: https://asc.sudden.ltd/[app service signature]. The production environment is activated based on actual needs. You can contact Sud for activation.

## App service signature implementation method
- The app service signature is generated based on the HMAC algorithm. The password is **app_secret**, which is generated by **encrypting app_id**.
- Sample Java code:
```java
import cn.hutool.crypto.digest.HMac;
import cn.hutool.crypto.digest.HmacAlgorithm;

class Test {
    public static void main(String[]args){
        // Change the encrypted data to the actual app ID.
        String data = "appId";
        // Use the actual app secret key as the password.
        byte[] key = "appSecret".getBytes();
        HMac mac = new HMac(HmacAlgorithm.HmacMD5, key);
        String appServerSign = mac.digestHex(data);
        System.out.println(appServerSign);
    }
}
```
- Sample Go code
```go
package main

import (
    "crypto/hmac"
    "crypto/md5"
    "encoding/hex"
    "fmt"
)
func main() {
    key := "appSecret"
    data := "appId"
    hmac := hmac.New(md5.New, []byte(key))
    hmac.Write([]byte(data))
    fmt.Println(hex.EncodeToString(hmac.Sum([]byte(""))))
}
```

## Request method
- https
- GET
- Content-Type: application/json needs to be added to the header.

## Request parameters
None

## Sample requests


## Response parameters

| Parameter | Type | Description |
|:--------------------------|:-------|----------------------|
| get_mg_list | string | The URL of the API for the client to get the game list. |
| get_mg_info | string | The URL of the API for the client to get game information. |
| get_game_report_info | string | The URL of the API for the client to query game round information. |
| get_game_report_info_page | string | The URL of the API for the client to query game round information by page. |

## Sample responses

```json
{
  "api": {
    "get_mg_list": "",
    "get_mg_info": "",
    "get_game_report_info": "",
    "get_game_report_info_page": ""
  }
}
```