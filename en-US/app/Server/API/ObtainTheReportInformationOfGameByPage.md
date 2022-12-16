#

![SUD](../../Resource/logo.png)

## Description

- Access the server end and obtain game report information in rooms by page based on **AppId**, **AppSecret**, **RoomId**, **PageNo**, and **PageSize**.
- Only game data in 24 hours is stored.

## Request URL

- Test environment: For more information about the API address, see the **get_game_report_info_page** field in [Obtain server-end API configurations](ObtainServerEndAPIConfigurations.md).
- Production environment: For more information about the API address, see the **get_game_report_info_page** field in [Obtain server-end API configurations](ObtainServerEndAPIConfigurations.md).

## Request method
- https
- POST
- Parameters are in JSON format and included in the request body.
- Content-Type: application/json needs to be added to the header.

## Request parameters

| Parameter | Required | Type | Description |
|:-----------|:---|:-----|---------------------|
| app_id | Yes | string | The app ID. |
| app_secret | Yes | string | The app secret key. |
| room_id | Yes | string | The room ID. |
| page_no | No | int32 | The page number. The parameter is set to **0** by default. |
| page_size | No | int32 | Number of pages. The parameter is set to **5** by default. The maximum valid value is **10**. |

## Sample requests

```json
{
  "app_id": "1461564080052506636",
  "app_secret": "xJL0HU9ailVSGInqPyNK3Ev3qNHReRbR",
  "room_id": "9009",
  "page_no": 0,
  "page_size": 10
}
```

## Response parameters

- BaseResp

| Parameter | Required | Type | Description |
|:----    |:---|:-----------------------|------|
| ret_code | Yes | int | The response code. |
| ret_msg | Yes | string | The response information. |
| data | Yes | List< GameReportInfo > | The response data. |

- GameReportInfo

| Parameter | Required | Type | Description |
|:----    |:---|:----- |-----   |
| game_round_id | Yes | string | The game round ID. |
| report_info | Yes | map | The reported information. |

- report_info key values

| Key | Value type | Description |
|:------------|:------------|:-------|
| game_start | game_start_object | The notification for game startup. |
| game_settle | game_settle_object | The notification for post-game analysis. |

- game_start_object

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| mg_id | Yes | int64 | The game ID. |
| mg_id_str | Yes | string | Fields compatible with the numeric game ID. Use this field for the nodejs service. |
| room_id | Yes | string | The room ID of the game. |
| game_mode | Yes | int32 | The game mode. |
| game_round_id | Yes | string | The game ID in this round. This field is used to remove repeatedly reported game IDs. |
| battle_start_at | Yes | int32 | The game start time, accurate to second. |
| players | Yes | player_object | The player_object array. |

- player_object

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| uid | Yes | string | The user ID of a player. If the player is a robot, this field is left empty. |
| is_ai | Yes | int32 | Indicates whether the player is a robot. Valid values: **0**: common user; **1**: robot. |


- game_settle_object

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| mg_id | Yes | int64 | The game ID. |
| mg_id_str | Yes | string | Fields compatible with the numeric game ID. Use this field for the nodejs service. |
| room_id | Yes | string | The room ID of the game. |
| game_mode | Yes | int32 | The game mode. |
| game_round_id | Yes | string | The game ID in this round. This field is used to remove repeatedly reported game IDs. |
| battle_start_at | Yes | int32 | The game start time, accurate to second. |
| battle_end_at | Yes | int32 | The game end time, accurate to second. |
| battle_duration | Yes | int32 | The game duration, accurate to second. |
| results | Yes | player_result_object | The player_result_object array. |

- player_result_object

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| uid | Yes | string | The user ID of a player. If the player is a robot, this field is left empty. |
| rank | Yes | int32 | The player ranking starts from 1. When two players take a draw, their ranks are the same. |
| is_escaped | Yes | int32 | Indicates whether the player has escaped. Valid values: **0**: not escaped; **1**: escaped. |
| is_ai | Yes | int32 | Indicates whether the player is a robot. Valid values: **0**: common user; **1**: robot. |

## Sample responses

```json
{
  "ret_code": 0,
  "ret_msg": "",
  "data": [
    {
      "game_round_id": "ce56b6lzi1a7-cqhuiaj1wlh6-cpgxupfcpbrg",
      "report_info": {
        "game_start": {
          "mg_id": 1472142559912517631,
          "room_id": "9009",
          "mg_id_str": "1472142559912517633",
          "players": [
            {
              "is_ai": 0,
              "uid": "515b8e0b"
            },
            {
              "is_ai": 0,
              "uid": "09d032dd"
            }
          ],
          "game_mode": 1,
          "game_round_id": "ce56b6lzi1a7-cqhuiaj1wlh6-cpgxupfcpbrg",
          "battle_start_at": 1642500300
        }
      }
    },
    {
      "game_round_id": "ce56b6lzi1a7-cqhuiaj1wlh6-cpgxupfcpbrf",
      "report_info": {
        "game_start": {
          "mg_id": 1472142559912517631,
          "room_id": "9009",
          "mg_id_str": "1472142559912517633",
          "players": [
            {
              "is_ai": 0,
              "uid": "515b8e0b"
            },
            {
              "is_ai": 0,
              "uid": "09d032dd"
            }
          ],
          "game_mode": 1,
          "game_round_id": "ce56b6lzi1a7-cqhuiaj1wlh6-cpgxupfcpbrf",
          "battle_start_at": 1642500300
        }
      }
    }
  ]
}
```
