#

![SUD](../Resource/logo.png)

## 介绍

- App服务需要实现Https回调接口，供小游戏服务鉴权并获取用户基本信息
- sud-mgp-auth-dotnet提供了实现回调接口的大部分功能，App服务只需要实现Https接口，并调用sud-mgp-auth-dotnet即可

## 环境要求

- net6.0
- 需要联系Sud.Tech为业务分配 `appId`、 `appKey`、 `appSecret`

## 集成流程
- 设置nuget，添加源地址
```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
    <packageSources>
        <clear />
        <add key="sud-github" value="https://nuget.pkg.github.com/SudTechnology/index.json" />
    </packageSources>
    <packageSourceCredentials>
        <sud-github>
            <!-- github用户名，建议创建一个公司通用账号 -->
            <add key="Username" value="USERNAME" />
            <!-- https://github.com/settings/tokens -> Personal access tokens -->
            <add key="ClearTextPassword" value="TOKEN" />
        </sud-github>
    </packageSourceCredentials>
</configuration>
```

- 引用sud-mgp-auth-dotnet
```xml
<Project Sdk="Microsoft.NET.Sdk.Web">
    
    ...
    
    <ItemGroup>
        <!-- 引用sud-mgp-auth-dotnet -->
        <PackageReference Include="sud-mgp-auth-dotnet" Version="1.0.0"/>
    </ItemGroup>
</Project>
```

3.使用[SudMGPAuth](./API/SudMGPAuth-Dotnet.md)提供的API实现以下回调接口，供小游戏服务鉴权和获取用户基本信息，可参考Demo(TODO: )

- [get_sstoken](./HttpsCallback/get_sstoken.md)

- [update_sstoken](./HttpsCallback/update_sstoken.md)

- [get_user_info](./HttpsCallback/get_user_info.md)