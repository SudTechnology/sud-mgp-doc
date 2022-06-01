#

![SUD](../Resource/logo.png)

## Introduction

- The app server needs to implement the HTTPS callback API for game server authentication and obtaining basic user information.
- **sud-mgp-auth-java** provides most functions for callback API implementation. The app server only needs to implement the HTTPS API and call **sud-mgp-auth-java**.

## SDK environment requirements

- JDK 1.8 or later
- Contact Sud.Tech to allocate `appId`, `appKey`, and `appSecret` for your service.

## Integration process

1. Integrate **sud-mgp-auth-java** with the project and add the following dependencies:
```xml
<!-- Reference the server SDK dependencies. -->
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

2. Set maven (setting.xml).
- 2.1 Required configurations
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
            <!-- GitHub user name. We recommend that you create a general company account. Note: Use usernames instead of email addresses. -->
            <!-- Note: The GitHub user needs to be added to the project in advance. Otherwise, the dependencies cannot be pulled. -->
            <username>USERNAME</username>
            <!-- https://github.com/settings/tokens -> Personal access tokens -->
            <!-- The personal access token is used, which is not a plaintext password. -->
            <password>YOUR_GITHUB_PAT</password>
        </server>
    </servers>
    ...
</settings>
```
- 2.2 Optional configurations
```xml
    <!-- Mirror settings (If mirrors are not set before, ignore the following configurations. -->
    <!-- If other mirrors are set, such as Alibaba Cloud, add the current settings to Mirrors.) -->
    <mirrors>
        <!--Place the current mirror configurations on the top in Mirrors. -->
        <mirror>
            <mirrorOf>sudtech-github</mirrorOf>
            <id>sudtech-github</id>
            <url>https://maven.pkg.github.com/sudtechnology/sud-mgp-auth-java/</url>
        </mirror>
        
        <!-- Other set mirrors, such as Alibaba Cloud -->
        <mirror>
            ......
        </mirror>
    </mirrors>
```


3. Use the APIs provided in [SudMGPAuth](./API/SudMGPAuth-Java.md) to implement the following callback APIs for game server authentication and obtaining basic user information. For more information, see [Demo](https://github.com/SudTechnology/hello-sud-java).

- [get_sstoken](./HttpsCallback/get_sstoken.md)

- [update_sstoken](./HttpsCallback/update_sstoken.md)

- [get_user_info](./HttpsCallback/get_user_info.md)
