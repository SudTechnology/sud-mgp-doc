#

![SUD](../../Resource/logo.png)

## 简要描述

- 接入服务端根据AppId，AppSecret 获取小游戏列表，建议server对server拉取，本地缓存！！！

## 请求URL

- 测试环境：接口地址详见[获取服务端API配置](Obtain%20server-end%20API%20configurations.md)中get_mg_list字段
- 生产环境：接口地址详见[获取服务端API配置](Obtain%20server-end%20API%20configurations.md)中get_mg_list字段

## 请求方式
- https
- POST
- 参数为Json格式，放在body内
- Header中需要添加：Content-Type: application/json

## 请求参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|app_id |是  |string |app_id   |
|app_secret |是  |string |app_secret   |

## 请求示例

```json
{
  "app_id":"1461564080052506636",
  "app_secret":"xJL0HU9ailVSGInqPyNK3Ev3qNHReRbR"
}
```

## 返回参数

- BaseResp

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|ret_code |是  |int |响应码   |
|ret_msg |是  |string | 响应信息    |
|data     |是  | AppServerGetMgListResp | 响应数据    |
|app_id     |是  |string | app_id   |

- AppServerGetMgListResp

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|mg_info_list |是  | list|游戏信息列表，内部元素定义见MgInfo |


- MgInfo

|参数名|必选|类型| 说明                           |
|:----    |:---|:----- |------------------------------|
|mg_id |是  |long | 小游戏id                        |
|mg_id_str |是  |string | 小游戏id数值型兼容字段（nodejs服务请使用当前字段） |
|name |是  |json | 小游戏名字                        |
|desc |是  |json | 小游戏描述                        |
|thumbnail332x332 |是  |json | 图像地址，尺寸: 332*332             |
|thumbnail192x192 |是  |json | 图像地址，尺寸: 192*192             |
|thumbnail128x128 |是  |json | 图像地址，尺寸: 128*128             |
|thumbnail80x80 |是  |json | 图像地址，尺寸: 80*80               |
|big_loading_pic |是  |json | 背景图像地址             |

- GameMode

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|mode |是  |int | 模式编号 |
|count |是  |list | count[0]: 最小人数，count[1]: 最大人数 |

## 返回示例

```json
{
    "ret_code": 0,
    "ret_msg": "",
    "data": {
        "mg_info_list": [
            {
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
            },
            {
                "mg_id": 1461228379255603251,
                "mg_id_str": "1461228379255603251",
                "name": {
                    "default": "飞刀",
                    "zh-HK": "飞刀",
                    "zh-CN": "飞刀"
                },
                "desc": {
                    "default": "飞刀",
                    "zh-HK": "飞刀",
                    "zh-CN": "飞刀"
                },
                "thumbnail332x332": {
                    "default": "https://sim-sud-static.sudden.ltd/game/knife/332.png",
                    "zh-HK": "https://sim-sud-static.sudden.ltd/game/knife/332.png",
                    "zh-CN": "https://sim-sud-static.sudden.ltd/game/knife/332.png"
                },
                "thumbnail192x192": {
                    "default": "https://sim-sud-static.sudden.ltd/game/knife/192.png",
                    "zh-HK": "https://sim-sud-static.sudden.ltd/game/knife/192.png",
                    "zh-CN": "https://sim-sud-static.sudden.ltd/game/knife/192.png"
                },
                "thumbnail128x128": {
                    "default": "https://sim-sud-static.sudden.ltd/game/knife/128.png",
                    "zh-HK": "https://sim-sud-static.sudden.ltd/game/knife/128.png",
                    "zh-CN": "https://sim-sud-static.sudden.ltd/game/knife/128.png"
                },
                "thumbnail80x80": {
                    "default": "https://sim-sud-static.sudden.ltd/game/knife/80.png",
                    "zh-HK": "https://sim-sud-static.sudden.ltd/game/knife/80.png",
                    "zh-CN": "https://sim-sud-static.sudden.ltd/game/knife/80.png"
                },
                "big_loading_pic": {
                    "default": "https://sim-sud-static.sudden.ltd/game/knife/bg.jpg",
                    "zh-HK": "https://sim-sud-static.sudden.ltd/game/knife/bg.jpg",
                    "zh-CN": "https://sim-sud-static.sudden.ltd/game/knife/bg.jpg"
                },
                "game_mode_list": [
                    {
                        "mode": 1,
                        "count": [
                            2,
                            6
                        ]
                    }
                ]
            }
        ]
    }
}
```