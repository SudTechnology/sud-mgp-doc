#

![SUD](../Resource/logo.png)

## Introduction

- The app server needs to implement the HTTPS callback API for game server authentication and obtaining basic user information.
- **sud-mgp-auth-dotnet** provides most functions for callback API implementation. The app server only needs to implement the HTTPS API and call **sud-mgp-auth-dotnet**.

## Environment requirements

- net6.0
- Contact Sud.Tech to allocate `appId`, `appKey`, and `appSecret` for your service.

## Integration process
- Set **nuget** and add the source URL.
```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
    <packageSources>
        <clear />
        <add key="sud-github" value="https://nuget.pkg.github.com/SudTechnology/index.json" />
    </packageSources>
    <packageSourceCredentials>
        <sud-github>
            <!-- GitHub user name. We recommend that you create a general company account. -->
            <add key="Username" value="USERNAME" />
            <!-- https://github.com/settings/tokens -> Personal access tokens -->
            <add key="ClearTextPassword" value="TOKEN" />
        </sud-github>
    </packageSourceCredentials>
</configuration>
```

- Reference **sud-mgp-auth-dotnet**.
```xml
<Project Sdk="Microsoft.NET.Sdk.Web">
    
    ...
    
    <ItemGroup>
        <!-- Reference sud-mgp-auth-dotnet -->
        <PackageReference Include="sud-mgp-auth-dotnet" Version="1.0.0"/>
    </ItemGroup>
</Project>
```

3. Use the APIs provided in [SudMGPAuth](./API/SudMGPAuth-Dotnet.md) to implement the following callback APIs for game server authentication and obtaining basic user information. For more information, see Demo (TODO:). 

- [get_sstoken](./HttpsCallback/get_sstoken.md)

- [update_sstoken](./HttpsCallback/update_sstoken.md)

- [get_user_info](./HttpsCallback/get_user_info.md)

