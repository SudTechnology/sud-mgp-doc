#

![SUD](../../Resource/logo.png)

## Description

- Report game data of game clients at the game server end.

## Request URL

- The test environment and production environment URLs are different and need to be separately configured by Sud.
- The production environment URL takes effect after its online deployment.

  
## Request method
- https
- POST
- Parameters are in JSON format and included in the request body.

## Request parameters (More fields may be added, and the client needs to ensure the compatibility of new fields.)


| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| report_type | Yes | string | The report type. |
| report_msg | Yes | object | The reported data object. |
| uid | Yes | string | The user ID of the client's leader (used for authentication). |
| ss_token | Yes | string | The SSToken of the client's leader (used for authentication). |

##### report_type parameters

| Parameter type | Parameter value | report_msg type | Description |
|:----|:---|:-----|-----|
| report_type | game_start | game_start_object | The notification for game startup. |
| report_type | game_settle | game_settle_object | The notification for post-game analysis. |

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
| report_game_info_extras | Yes | string | The game report information extended parameter, which is transparently passed. The maximum value length is 1024 bytes. A longer value will be truncated. |

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
| report_game_info_extras | Yes | string | The game report information extended parameter, which is transparently passed. The maximum value length is 1024 bytes. A longer value will be truncated. |

- player_result_object

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| uid | Yes | string | The user ID of a player. If the player is a robot, this field is left empty. |
| rank | Yes | int32 | The player ranking starts from 1. When two players take a draw, their ranks are the same. |
| is_escaped | Yes | int32 | Indicates whether the player has escaped. Valid values: **0**: not escaped; **1**: escaped. |
| is_ai | Yes | int32 | Indicates whether the player is a robot. Valid values: **0**: common user; **1**: robot. |
| role | No | int32 | The role information. The value **0** indicates no role information. For more information about player roles, see [Game role description](./game/Game role description.md). |
| score | No | int32 | The score of a player in the current round. |
| is_win | No | int32 | The result of the game. Valid values: **0**: no information; **1**: lose; **2**: win; **3**: draw. |

## Sample request for game_start
```json
{
	"report_type": "game_start",
	"report_msg": {
		"mg_id": 1461227817776713818,
		"mg_id_str": "1461227817776713818",
		"room_id": "xxx123",
		"game_mode": 1,
		"game_round_id": "ce56b6lzi1a7-cehorlmy01pq-cqkdd39jyrmz",
		"battle_start_at": 1638845715,
		"players": [{
			"uid": "u2",
			"is_ai": 0
		}, {
			"uid": "u1",
			"is_ai": 0
		}],
		"report_game_info_extras":"custom param"
	},
	"uid": "u1",
	"ss_token": "fyRTOsubRLCGrRvKoKm7wIcMM1DL7cfb",
	
}
```

## Sample request for game_finish
```json
{
	"report_type": "game_settle",
	"report_msg": {
		"mg_id": 1461227817776713818,
		"mg_id_str": "1461227817776713818",
		"room_id": "xxx123",
		"game_mode": 1,
		"game_round_id": "ce56b6lzi1a7-cehorlmy01pq-cqkdd39jyrmz",
		"battle_start_at": 1638845715,
		"battle_end_at": 1638845720,
		"battle_duration": 5,
		"results": [{
			"uid": "u2",
			"rank": 1,
			"is_escaped": 0,
			"is_ai": 0,
			"role": 0,
			"score":1,
			"is_win":1
		}, {
			"uid": "",
			"rank": 2,
			"is_escaped": 0,
			"is_ai": 1,
			"role": 0,
			"score":2,
			"is_win":0
		}],
		"report_game_info_extras":"custom param"
	},
	"uid": "u1",
	"ss_token": "fyRTOsubRLCGrRvKoKm7wIcMM1DL7cfb"
}

```

## Response parameters

| Parameter | Required | Type | Description |
|:----|:---|:-----|-----|
| ret_code | Yes | int32 | The error code. Valid values: **0**: the request is successful; other values: the request is failed. |
| ret_msg | Yes | string | The error information. |
| sdk_error_code | No | int32 | The SDK error code. Valid values: **0**: the request is successful; other values: the request is failed. |
| data | Yes | object | Data. |

## Sample responses

```json
{
    "ret_code": 0,// Valid values: 0: the request is successful; other values: the request is failed.
    "ret_msg": "",
    "data": {}
}
```

##### Remarks 

- When a request fails or **ret_code!=0** is returned, try again after 1 minute. A request can be re-sent for 3 times at most.
