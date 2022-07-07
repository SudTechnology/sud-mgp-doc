#

![SUD](../../Resource/logo.png)

## Description

- The server queries the game report information based on the game_round_id, report_game_info_key (custom game round ID), and filter_types.
- An API throttles the request frequency of each App ID to 10 requests per second.

## Request URL

- Test environment: For more information about the API URL, see the query_game_report_info field in [ObtainServerEndAPIConfigurations.md].
- Production environment: For more information about the API URL, see the query_game_report_info field in [ObtainServerEndAPIConfigurations.md].

## Request method
- Protocol: HTTPS
- Request method: POST
- Parameters are included in the request body in JSON format. (For more information, see "Sample request".)
- You must add the following information in the header: Content-Type: application/json
- You must add the following information in the header: Authorization

## Request header [Authorization]
- [Authorization implementation method](AuthorizationDescription.md)

## Request parameters

| Parameter                   | Required   | Type       | Description                                                                                                        |
|:---------------------|:-----|:---------|-----------------------------------------------------------------------------------------------------------|
| report_game_info_key | Yes in special scenarios | string   | The key of reported game information. report_game_info_key and game_round_id cannot be null at the same time. <br> If game_round_id and reoprt_game_info_key coexists, game_round_id is preferentially used. |
| game_round_id        | Yes in special scenarios | string   | The game round ID. game_round_id and report_game_info_key cannot be null at the same time.                                                                        |
| filter_types         | No                       | string[] | Filtered report types, in array format. If it is not specified, all report types are returned. The report types include but are not limited to: <br>["game_start", "game_settle"]                                       |


## Sample request

```json
{
  "game_round_id": "de56b6lzi1a7-cqhuiaj1wlh6-apgxupfcpbrf"
}
```

## Response parameters

- BaseResp

| Parameter      | Required | Type                  | Description                |
|:---------|:----|:--------------------|-------------------|
| ret_code | Yes | int                 | The response code.                 |
| ret_msg  | Yes | string              | The response message.              |
| data     | Yes | map<string, object> | The response data <report type and report data>. |

- Report type

| Report type         | Report data                | Description     |
|:------------|:-------------------|--------|
| game_start  | game_start_object  | The notification for battle startup. |
| game_settle | game_settle_object | The notification for battle settlement. |

- game_start_object

| Parameter                  | Required | Type                  | Description                  |
|:---------------------|:----|:--------------|-------------------------|
| mg_id                | Yes | int64         | The game ID.                  |
| mg_id_str            | Yes | string        | Field compatible with the numeric game ID. Use this field for the nodejs service. |
| room_id              | Yes | string        | The room ID.                  |
| game_mode            | Yes | int32         | The game mode.                  |
| game_round_id        | Yes | string        | The game round ID. This field is used for deduplication. |
| battle_start_at      | Yes | int32         | The battle start time, accurate to second. |
| players              | Yes | player_object | The player_object array.      |
| report_game_info_key | No  | string        | The key of custom report information.              |

- player_object

| Parameter   | Required | Type      | Description           |
|:------|:----|:-------|--------------|
| uid   | Yes | string | The user ID. This field is null for a robot. |
| is_ai | Yes | int32  | The value 0 indicates a human user, and the value 1 indicates a robot. |


- game_settle_object

| Parameter             | Required  | Type                | Description                  |
|:---------------------|:----|:---------------------|-------------------------|
| mg_id                | Yes | int64                | The game ID.                |
| mg_id_str            | Yes | string               | Field compatible with the numeric game ID. Use this field for the nodejs service. |
| room_id              | Yes | string               | The room ID.           |
| game_mode            | Yes | int32                | The game mode.           |
| game_round_id        | Yes | string               | The game round ID. This field is used for deduplication. |
| battle_start_at      | Yes | int32                | The battle start time, accurate to second.              |
| battle_end_at        | Yes | int32                | The battle end time, accurate to second. |
| battle_duration      | Yes | int32                | The battle duration, in seconds.                 |
| results              | Yes | player_result_object | The player_result_object array. |
| report_game_info_key | No  | string               | The key of custom report information.              |


- player_result_object

| Parameter          | Required | Type      | Description         |
|:-----------|:----|:-------|---------------|
| uid        | Yes | string | The user ID. This field is null for a robot. |
| rank       | Yes | int32  | The rank starts from 1. When two parties take a draw, their ranks are the same. |
| is_escaped | Yes | int32  | The value 0 indicates normal, and the value 1 indicates an escape. |
| is_ai      | Yes | int32  | The value 0 indicates a human user, and the value 1 indicates a robot. |

## Sample responses

```json
{
  "ret_code": 0,
  "ret_msg": "",
  "data": {
    "game_start": {
      "mg_id": 1468434723902660610,
      "room_id": "9009",
      "report_game_info_extras": "world!",
      "mg_id_str": "1468434723902660610",
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
      "report_game_info_key": "key!@!1",
      "game_round_id": "de56b6lzi1a7-cqhuiaj1wlh6-apgxupfcpbrf",
      "battle_start_at": 1652426471
    },
    "game_settle": {
      "mg_id": 1468434723902660610,
      "room_id": "9009",
      "battle_end_at": 1652425480,
      "report_game_info_extras": "hello",
      "mg_id_str": "1468434723902660610",
      "game_mode": 1,
      "report_game_info_key": "key!@!1",
      "game_round_id": "de56b6lzi1a7-cqhuiaj1wlh6-apgxupfcpbrf",
      "battle_start_at": 1652426471,
      "results": [
        {
          "is_ai": 0,
          "uid": "b71e0ced",
          "score": 0,
          "rank": 1,
          "is_escaped": 0
        },
        {
          "is_ai": 0,
          "uid": "17864733",
          "score": 0,
          "rank": 2,
          "is_escaped": 0
        }
      ],
      "battle_duration": 10
    }
  }
}
```
