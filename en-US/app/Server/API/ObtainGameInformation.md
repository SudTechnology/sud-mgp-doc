#

![SUD](../../Resource/logo.png)

## Description

- Access the server end and obtain the game information based on **app_id**, **app_secret**, and **mg_id**. We recommend that the client accesses the Sud server directly. Data is locally cached.

## Request URL

- Test environment: For more information about the API address, see the **get_mg_info** field in [Obtain server-end API configurations](ObtainServerEndAPIConfigurations.md).
- Production environment: For more information about the API address, see the **get_mg_info** field in [Obtain server-end API configurations](ObtainServerEndAPIConfigurations.md).

## Request method
- https
- POST
- Parameters are in JSON format and included in the request body.
- Content-Type: application/json needs to be added to the header.

## Request parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| app_id | Yes | string | The app ID. |
| app_secret | Yes | string | The app secret key. |
| mg_id | Yes | string | The game ID. |


## Sample requests

```json
{
    "app_id":"1461564080052506636",
    "app_secret":"xJL0HU9ailVSGInqPyNK3Ev3qNHReRbR",
    "mg_id":"1461227817776713818"
}
```

## Response parameters

- BaseResp

| Parameter | Required | Type | Description |
|:----    |:---|:----- |-----   |
| ret_code | Yes | int | The response code. |
| ret_msg | Yes | string | The response information. |
| data | Yes | AppServerGetMgInfoResp | The response data. |
| app_id | Yes | string | The app ID. |

- AppServerGetMgInfoResp

| Parameter | Required | Type | Description |
|:----    |:---|:----- |-----   |
| mg_info | Yes | MgInfo | Game information. For more information, see "MgInfo". |


- MgInfo

| Parameter | Required | Type | Description |
|:----    |:---|:----- |-----   |
| mg_id | Yes | long | The game ID. |
| mg_id_str | Yes | string | Fields compatible with the numeric game ID. Use this field for the nodejs service. |
| name | Yes | json | The game name. |
| desc | Yes | json | The game description. |
| thumbnail332x332 | Yes | json | The URL of the image. The image size is 332 x 332 pixels. |
| thumbnail192x192 | Yes | json | The URL of the image. The image size is 192 x 192 pixels. |
| thumbnail128x128 | Yes | json | The URL of the image. The image size is 128 x 128 pixels. |
| thumbnail80x80 | Yes | json | The URL of the image. The image size is 80 x 80 pixels. |
| big_loading_pic | Yes | json | The URL of the background image. |

- GameMode

| Parameter | Required | Type | Description |
|:----    |:---|:----- |-----   |
| mode | Yes | int | The mode ID. |
|count | Yes | list | The number of users required by the game. Valid values: **0**: the minimum number of users; **1**: the maximum number of users. |

## Sample responses

```json
{
    "ret_code": 0,
    "ret_msg": "",
    "data": {
        "mg_info": {
            "mg_id": 1461227817776713818,
            "mg_id_str": "1461227817776713818",
            "name": {
                "default": "碰碰车",
                "zh-HK": "碰碰车",
                "zh-CN": "碰碰车"
            },
            "desc": {
                "default": "碰碰我最强",
                "zh-HK": "碰碰我最强",
                "zh-CN": "碰碰我最强"
            },
            "thumbnail332x332": {
                "default": "https://sim-sud-static.sudden.ltd/game/bumper/332.png",
                "zh-HK": "https://sim-sud-static.sudden.ltd/game/bumper/332.png",
                "zh-CN": "https://sim-sud-static.sudden.ltd/game/bumper/332.png"
            },
            "thumbnail192x192": {
                "default": "https://sim-sud-static.sudden.ltd/game/bumper/192.png",
                "zh-HK": "https://sim-sud-static.sudden.ltd/game/bumper/192.png",
                "zh-CN": "https://sim-sud-static.sudden.ltd/game/bumper/192.png"
            },
            "thumbnail128x128": {
                "default": "https://sim-sud-static.sudden.ltd/game/bumper/128.png",
                "zh-HK": "https://sim-sud-static.sudden.ltd/game/bumper/128.png",
                "zh-CN": "https://sim-sud-static.sudden.ltd/game/bumper/128.png"
            },
            "thumbnail80x80": {
                "default": "https://sim-sud-static.sudden.ltd/game/bumper/80.png",
                "zh-HK": "https://sim-sud-static.sudden.ltd/game/bumper/80.png",
                "zh-CN": "https://sim-sud-static.sudden.ltd/game/bumper/80.png"
            },
            "big_loading_pic": {
                "default": "https://sim-sud-static.sudden.ltd/game/bumper/bg.jpg",
                "zh-HK": "https://sim-sud-static.sudden.ltd/game/bumper/bg.jpg",
                "zh-CN": "https://sim-sud-static.sudden.ltd/game/bumper/bg.jpg"
            },
            "game_mode_list": [
                {
                    "mode": 1,
                    "count": [
                        1,
                        6
                    ]
                }
            ]
        }
    }
}
```
