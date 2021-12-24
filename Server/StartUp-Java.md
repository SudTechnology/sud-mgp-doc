#

![SUD](../Resource/logo.png)

## 介绍

- App服务需要实现Https回调接口，供小游戏服务鉴权并获取用户基本信息
- sud-mgp-auth-java提供了实现回调接口的大部分功能，App服务只需要实现Https接口，并调用sud-mgp-auth-java即可

## SDK环境要求

- 支持JKD 1.8或其以上版本
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
            <!-- github用户名，建议创建一个公司通用账号，注意：不要使用邮箱，使用用户名！！！ -->
            <username>USERNAME</username>
            <!-- https://github.com/settings/tokens -> Personal access tokens -->
            <!-- 此处使用的是personal access token，非密码明文！！！ -->
            <password>YOUR_GITHUB_PAT</password>
        </server>
    </servers>  
    ...
</settings>
```

3.使用[SudMGPAuth](./API/SudMGPAuth-Java.md)提供的API实现以下回调接口，供小游戏服务鉴权和获取用户基本信息，可参考[Demo](https://github.com/SudTechnology/hello-sud-java)

- [get_sstoken](./HttpsCallback/get_sstoken.md)

- [update_sstoken](./HttpsCallback/update_sstoken.md)

- [get_user_info](./HttpsCallback/get_user_info.md)
