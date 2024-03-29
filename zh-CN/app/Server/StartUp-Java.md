#

![SUD](../Resource/logo.png)

## 介绍

- App服务需要实现Https回调接口，供小游戏服务鉴权并获取用户基本信息
- sud-mgp-auth-java提供了实现回调接口的大部分功能，App服务只需要实现Https接口，并调用sud-mgp-auth-java即可

## SDK环境要求

- 支持JDK 1.8或其以上版本
- 需要联系Sud.Tech为业务分配 `appId`、 `appKey`、 `appSecret`

## 集成流程

1.项目集成 sud-mgp-auth-java，添加以下依赖
```xml
<!-- 引用服务端sdk依赖 -->
<dependencies>
   <dependency>
      <groupId>tech.sud.mgp.auth</groupId>
      <artifactId>sud-mgp-auth-java</artifactId>
      <version>${sud-mgp-auth-java.version}</version>
   </dependency>

   <dependency>
      <groupId>com.auth0</groupId>
      <artifactId>java-jwt</artifactId>
      <version>3.10.3</version>
   </dependency>
</dependencies>
```

2.maven(setting.xml)设置
- 2.1 必要配置
```xml
<settings>
    ...
    <profiles>
        <profile>
            <id>github</id>
            <activation>
                <activeByDefault>true</activeByDefault>
            </activation>
            <repositories>
                <repository>
                    <id>sudtech-github</id>
                    <url>https://maven.pkg.github.com/sudtechnology/sud-mgp-auth-java/</url>
                </repository>
            </repositories>
        </profile>
    </profiles>

    <servers>
        <server>
            <id>sudtech-github</id>
            <!-- github用户，建议创建一个公司通用账号，注意：不要使用邮箱，使用用户名！！！ -->
            <!-- 注意：此github用户需要提前加入项目，否则拉取不到依赖！！！ -->
            <username>USERNAME</username>
            <!-- https://github.com/settings/tokens -> Personal access tokens -->
            <!-- 此处使用的是personal access token，非密码明文！！！ -->
            <password>YOUR_GITHUB_PAT</password>
        </server>
    </servers>
    ...
</settings>
```
- 2.2 非必要配置
```xml
    <!-- 镜像设置（非必须，如果之前没有特意设置过Mirrors，忽略以下配置 -->
    <!-- 如果已经设置了其他镜像，例如阿里云等，需要在Mirrors里面添加当前设置） -->
    <mirrors>
        <!-- 将当前Mirror配置放置在Mirrors中最上面 -->
        <mirror>
            <mirrorOf>sudtech-github</mirrorOf>
            <id>sudtech-github</id>
            <url>https://maven.pkg.github.com/sudtechnology/sud-mgp-auth-java/</url>
        </mirror>
        
        <!-- 其他已经设置的镜像，例如阿里云等 -->
        <mirror>
            ......
        </mirror>
    </mirrors>
```


3.使用[SudMGPAuth](SDK/SudMGPAuth-Java.md)提供的API实现以下回调接口，供小游戏服务鉴权和获取用户基本信息，可参考[Demo](https://github.com/SudTechnology/hello-sud-java)

- get_code：此接口功能为初始化客户端SDK前生成短期令牌Code功能，由app调用业务服务端，可以通过引用服务端SDK实现，具体实现参考[demo](https://github.com/SudTechnology/hello-sud-java/releases)中login方法，如不引用SDK，可参考[自行实现鉴权](ImplementAuthenticationByYourself.md)中说明。

- [get_sstoken](./HttpsCallback/get_sstoken.md)

- [update_sstoken](./HttpsCallback/update_sstoken.md)

- [get_user_info](./HttpsCallback/get_user_info.md)
