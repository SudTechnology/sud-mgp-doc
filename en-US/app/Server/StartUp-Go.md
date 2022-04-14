#

![SUD](../Resource/logo.png)

## Introduction

- The app server needs to implement the HTTPS callback API for game server authentication and obtaining basic user information.
- **mgp-auth-go** provides most functions for callback API implementation. The app server only needs to implement the HTTPS API and call **mgp-auth-go**.

## SDK environment requirements

- Go Version1.16 or later
- Contact Sud.Tech to allocate `appId`, `appKey`, and `appSecret` for your service.

## Integration process

1. Import **go.mod** to the project.

    ```xml
   replace github.com/SudTechnology/mgp-auth-go => /localpath/github.com/SudTechnology/mgp-auth-go
   ```

2. Use the APIs provided in [SudMGPAuth](./API/SudMGPAuth-Go.md) to implement the following callback APIs for game server authentication and obtaining basic user information. For more information, see Demo.

    - [get_sstoken](./HttpsCallback/get_sstoken.md)

    - [update_sstoken](./HttpsCallback/update_sstoken.md)

    - [get_user_info](./HttpsCallback/get_user_info.md)

