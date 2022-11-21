#

![SUD](../../Resource/logo.png)

## 简要描述

- 根据app_id，app_secret获取服务端接口API配置文件，建议由服务端进行拉取，并在本地缓存（可以定时拉取接口地址，建议间隔时间1天或者更长时间，或者访问接口失败时候刷新）

## 请求URL

- 测试环境：https://sim-asc.sudden.ltd/[app服务签名]
- 生产环境：https://asc.sudden.ltd/[app服务签名]

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

#### Node示例代码

```js
const Crypto = require('crypto');

function main() {
    let key = 'appSecret';
    let data = 'appId';
    let hmac = Crypto.createHmac('md5', key);
    let sign = hmac.update(data).digest('hex');
    console.log(sign);
}
```

## 请求方式
- 传输协议：HTTPS
- 请求方法：GET
- Header中需要添加：Content-Type: application/json

## 请求参数
无

## 请求示例


## 返回参数

#### 服务端api

| 参数名                       | 类型     | 说明                            |
|:--------------------------|:-------|-------------------------------|
| get_mg_list               | string | 拉取游戏列表接口地址（服务端使用）             |
| get_mg_info               | string | 拉取游戏信息接口地址（服务端使用）             |
| get_game_report_info      | string | 查询游戏局信息接口地址（服务端使用）            |
| get_game_report_info_page | string | 分页查询游戏局信息接口地址（服务端使用）          |
| query_game_report_info    | string | 根据自定义游戏局ID查询游戏上报信息接口地址（服务端使用） |
| report_game_round_bill    | string | 上报每局游戏消耗货币信息（服务端使用）           |
| push_event                | string | 推送事件到游戏服（服务端使用）               |
| auth_app_list             | string | 查询授权应用列表（服务端使用）               |
| auth_room_list            | string | 查询授权房间列表（服务端使用）               |
| create_order              | string | 创建订单（服务端使用）                   |
| query_order               | string | 查询订单（服务端使用）                   |
| query_match_base          | string | 查询单场游戏基础信息（服务端使用）             |
| query_match_round_ids     | string | 查询单场游戏内的所有局id（服务端使用）          |
| query_user_settle         | string | 查询用户结算信息（服务端使用）               |

#### 弹幕api
| 参数名         | 类型     | 说明              |
|:------------|:-------|-----------------|
| connect     | string | 创建连接接口地址（服务端使用） |
| operate     | string | 操作游戏接口地址（服务端使用） |
| change_game | string | 切换游戏接口地址（服务端使用） |
| disconnect  | string | 销毁连接接口地址（服务端使用） |

#### web3 API

| 参数名             | 类型     | 说明                       |
|:----------------|:-------|--------------------------|
| get_details     | string | 获取已穿戴的NFT详情接口地址（服务端使用）   |
| refresh_details | string | 刷新已穿戴的NFT详情令牌接口地址（服务端使用） |

## 返回示例

```json
{
  "api": {
    "get_mg_list": "",
    "get_mg_info": "",
    "get_game_report_info": "",
    "get_game_report_info_page": "",
    "query_game_report_info": "",
    "report_game_round_bill": "",
    "push_event": "",
    "auth_app_list": "",
    "auth_room_list": ""
  },
  "bullet_api": {
    "connect": "",
    "operate": "",
    "change_game": "",
    "disconnect": ""
  },
  "web3_api": {
    "get_nft_details": "",
    "refresh_details": ""
  }
}
```
