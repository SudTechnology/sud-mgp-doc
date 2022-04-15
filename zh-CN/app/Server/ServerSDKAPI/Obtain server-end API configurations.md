#

![SUD](../../Resource/logo.png)

## 简要描述

- 接入方服务端根据app_id，app_secret获取服务端接口API配置文件

## 请求URL

- 测试环境：https://sim-asc.sudden.ltd/[app服务签名]
- 生产环境：https://asc.sudden.ltd/[app服务签名]，生产环境暂时为按需开通，请联系SUD！

## app服务签名实现方式
- app服务签名基于hmac算法生成，密码为app_secret，以app_id作为数据进行加密生成
#### Java示例代码：
```java
import cn.hutool.crypto.digest.HMac;
import cn.hutool.crypto.digest.HmacAlgorithm;

class Test {
    public static void main(String[]args){
        // 加密数据更换为实际的AppId
        String data = "appId";
        // 密码使用实际的AppSecret
        byte[] key = "appSecret".getBytes();
        HMac mac = new HMac(HmacAlgorithm.HmacMD5, key);
        String appServerSign = mac.digestHex(data);
        System.out.println(appServerSign);
    }
}
```
#### Go示例代码
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

## 请求方式
- https
- GET
- Header中需要添加：Content-Type: application/json

## 请求参数
无

## 请求示例


## 返回参数

| 参数名                       | 类型     | 说明                   |
|:--------------------------|:-------|----------------------|
| get_mg_list               | string | 游戏接入服务端拉取游戏列表接口地址    |
| get_mg_info               | string | 游戏接入服务端拉取游戏信息接口地址    |
| get_game_report_info      | string | 游戏接入服务端查询游戏局信息接口地址   |
| get_game_report_info_page | string | 游戏接入服务端分页查询游戏局信息接口地址 |

## 返回示例

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
