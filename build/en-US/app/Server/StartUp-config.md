#

![SUD](../Resource/logo.png)

## Introduction

- This section describes the configuration process for applying for **appId**, **appKey**, and **appSecret**.

## Process

- 1. The iOS Bundle ID and Android application ID of the applicant need to be configured.
        - ios  bundleID
        - android  applicationID
- 2. The game client needs to send an authentication request to the applicant server and obtain player information from the applicant server. The applicant server needs to deploy the following APIs and provide URLs for API calling (public network HTTPS) for configuration:
     - [get_sstoken](./HttpsCallback/get_sstoken.md) (required)

     - [update_sstoken](./HttpsCallback/update_sstoken.md) (required)

     - [get_user_info](./HttpsCallback/get_user_info.md) (required)

     - [report_game_info](./HttpsCallback/report_game_info.md) (required)
              


