#

![SUD](../Resource/logo.png)

## Introduction

- The app server needs to implement the HTTPS callback API for game server authentication and obtaining basic user information.
- **sud-mgq-auth-node** provides most functions for callback API implementation. The app server only needs to implement the HTTPS API and call **sud-mgq-auth-node**.

## SDK environment requirements

- node 8 or later
- Contact Sud.Tech to allocate `appId`, `appKey`, and `appSecret` for your service.

## Integration process

1. Import **npm install -d** to the project.

2. Use the APIs provided in [SudMGPAuth](./API/SudMGPAuth-Node.md) to implement the following callback APIs for game server authentication and obtaining basic user information. For more information, see Demo.

    - [get_sstoken](./HttpsCallback/get_sstoken.md)

    - [update_sstoken](./HttpsCallback/update_sstoken.md)

    - [get_user_info](./HttpsCallback/get_user_info.md)
