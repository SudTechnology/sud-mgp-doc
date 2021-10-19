#

![SUD](../Resource/logo.png)

[Toc]

## 介绍

app服务端集成jar包后，根据jar包生成code，解析code，提供小游戏服务端访问http接口。

### 环境要求

- sud-mgp-auth-java 需要配合JKD 1.8或其以上版本。
- 使用 sud-mgp-auth-java 之前 ，您需要先前与Sud商务团队洽谈合作事宜，获取项目的appid、appkey、appsecret、code和SudMGPSDK库链接等信息等。

### 集成流程

1. 项目集成 sud-mgp-auth-java-1.0.2.jar，初始化DefaultSudMGPClient类，传appId 和appSecret
2. getCode 生成，根据DefaultSudMGPClient对象，传入uid 生成code和过期时间
3. 服务端实现[get_sstoken](./HttpsCallback/get_sstoken.md)，[update_sstoken](./HttpsCallback/update_sstoken.md)，[get_user_info](./HttpsCallback/get_user_info.md) 三个接口。

### sdk快速开始

- 项目集成jar包，您需在项目的pom.xml文件中声明如下依赖

```xml
<dependency>
    <groupId>tech.sud.mgp.auth</groupId>
    <artifactId>sud-mgp-auth-java</artifactId>
    <version>1.0.2</version>
    <scope>system</scope>
    <systemPath>${project.basedir}/lib/sud-mgp-auth-java-1.0.2.jar</systemPath>
</dependency>

<dependency>
    <groupId>com.auth0</groupId>
    <artifactId>java-jwt</artifactId>
    <version>3.10.3</version>
</dependency>
```

- 调用示例

```java
package tech.sud.mgp.auth.example;

import tech.sud.mgp.auth.api.DefaultSudMGPClient;
import tech.sud.mgp.auth.api.SdkTokenResponse;
import tech.sud.mgp.auth.api.SdkUidResponse;

public class Main {
    public static void main(String[] args) {

        // 测试环境数据
        String appID = "tech.sud.mgp.hello";
        String secret = "123456";
        String uid = "uid123";

        // getCode
        DefaultSudMGPClient client = new DefaultSudMGPClient(appID, secret);
        SdkTokenResponse resp = client.getCode(String.valueOf(uid));
        System.out.println("code:" + resp.getToken());

        // getUidFromCode
        String code = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIxNDM4NzU3ODI1MjQwMTMzNjY4IiwiZXhwIjoxNjM1NTYwODM4LCJhcHBfaWQiOiJhcHBpZDEyMyJ9.gIZhP1Qt16ZXYaqGt2OflOIZArtlRMQwBzaSySFml9c";
        SdkUidResponse uidResp = client.getUidFromCode(code);
        if (uidResp.isSuccess()) {
            System.out.println("调用成功 uid:" + uidResp.getUid());
        } else {
            System.out.println("验证code 失败");
        }

    }
}

```

### 小游戏服务端调用的接口文档

- [get_sstoken](./HttpsCallback/get_sstoken.md)
- [update_sstoken](./HttpsCallback/update_sstoken.md)
- [get_user_info](./HttpsCallback/get_user_info.md)

### sdk 接口

[DefaultSudMGPClient](./API/DefaultSudMGPClient.md)
