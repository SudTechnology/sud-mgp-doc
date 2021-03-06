
#

![SUD](../../Resource/logo.png)

# General state - Game

> Tips
>
> 1. The SDK ensures that states are sent from the game to the app serially.

> 2. After a state notification, SudMGP ensures that states are sent from the game to the app serially and caches the latest **data** value based on the **state** value for the app to proactively obtain it at anytime.
>
> 3. ISudFSMMG void onGameStateChange(ISudFSMStateHandle handle, String state, String dataJson);

### 0. Testing

- state

```
mg_common_hello_fsm
```

- data

```json
{
	"msg": "Hello FSM from MG!"
}
```

- Description

```
This state is used for testing.
```

### 1. Public screen messages (modified)
- Earliest version: V1.1.30.xx
- state

```
mg_common_public_message
```

- data

```json
{
        "type":0,
        "msg":[
            {
                "phrase":1,
                "text":{
                    "default":"Player",
                    "en-US":"Player"
                }
            },
            {
                "phrase":2,
                "user":{
                    "name":"User A",
                    "uid":"0001",
                    "color":"#00FF00"
                }
            },
            {
                "phrase":1,
                "text":{
                    "default":"Defeated the player",
                    "en-US":"Defeated the player"
                }
            },
            {
                "phrase":2,
                "user":{
                    "name":"User B",
                    "uid":"0002",
                    "color":"#FF0000"
                }
            }
        ]
    }
```

- Description

```
Indicates that messages are sent to the public screen. Valid values:
type
0: notification
1: reminder
2: post-game analysis
3: others
msg

Parameters in <!-- --> are escape characters.
<!--name: user nickname|uid: user ID|color: recommended color-->
name/uid/color are optional fields. When these parameters are null, the code is as follows:
<!--name:|uid:|color:-->
The SDK caches only the latest data.
```

- json

| Parameter | Type | Required | Default | Remarks |
|:----    |:-------    |:--- |----|------      |
| type | int | Yes |    | Phrase type. |
| msg | json[Phrase, Phrase] | Yes |    | Phrase json array. |

- Phrase

| Parameter | Type | Required | Default | Remarks |
|:----    |:-------    |:--- |-- -|------      |
| phrase | int | Yes |    |  Phrase type. |
| text | json | Yes when **phrase** is **1** |    | This parameter is required when **phrase** is **1**. |
| user | json | Yes when **phrase** is **2** |    | This parameter is required when **phrase** is **2**. |

- Parameter description when **phrase** is **1**

| Parameter | Type | Required | Default | Remarks |
|:----    |:-------    |:--- |----|------      |
| text | json | Yes |    | Phrase type. |
| text.default | string | Yes |    |   default. The default type is **text**. |
| text.zh-CN | string | No |    |   zh-CN, text |
| text.en-US | string | No |    |   en-US, text |
| text.XXXX | string | No |    |   XXXX, text |
| text.XXXX | string | No |    |   XXXX rule: language code(lowercase letters)-country/region code(uppercase letters)    |

- Parameter description when **phrase** is **2**

| Parameter | Type | Required | Default | Remarks |
|:----    |:-------    |:--- |----|------      |
| user | json | Yes |    | This parameter is required when **phrase** is **2**. |
| name | string | Yes |    | This parameter is required when **phrase** is **2**. |
| uid | string | Yes |    | This parameter is required when **phrase** is **2**. |
| color | string | Yes |    | This parameter is required when **phrase** is **2**. |

### 2. Keyword

- state

```
mg_common_key_word_to_hit
```

- data

```json
{
  "wordType": "text",   					// This parameter is required. Valid values: text: fuzzy match; number: exact match (required). By default, the parameter is set to text for DrawGuess and Word Guess, and number for Number Bomb.
  "word": "Keyword", 					   // A single keyword, compatible with earlier versions.
  "wordList": ["Keyword 1", "Keyword 2", ???],	// This parameter is required and indicates the list of keywords. Multiple keywords can be entered.
"wordLanguage ": "zh-CN", 	  // This parameter is required and indicates the keyword language. The default value is zh-CN.
}
```

- Description

```
Indicates the keyword state.
```

### 3. Post-game
- Earliest version: V1.1.30.xx
- state

```
mg_common_game_settle
```

- data

| Parameter | Type | Required | Default | Remarks |
|:----    |:-------    |:--- |---|------      |
| gameMode | int | Yes |  1  | Game mode. The default value is **1**. |
| gameRoundId | string | Yes |    | ID of this round of game. |
| results | PlayerResult json array | Yes |    |  Game results of players. |

- PlayerResult = {}

| Parameter | Type | Required | Default | Remarks |
|:----    |:-------    |:--- |---|------      |
| uid | string | Yes |    |  User ID. |
| rank | int | Yes |    |   Player ranking, starting from 1. |
| award | int | Yes |    |  Award. |
| score | int | Yes |    |   Points. |
| isEscaped | int | No |    | Indicates whether the player has escaped. Valid values: **1**: escaped; **0**: not escaped. |
| killerId | string | No  |    | ID of the player who killed other players. |

- data

```json
{
    "gameMode": 1, 					// Game mode.
	"gameRoundId": "123",			// ID of this round of game.
    "results": [
        {
            "uid": "??????id",        // User ID.
            "rank": 1,             	// Player ranking, starting from 1.
            "award": 100,           // Award.
            "score": 100,           // Points.
            "isEscaped": 1,         // Whether the player has escaped.
            "killerId": "ID of the player who killed other players." ,   // ID of the player who killed himself/herself.
            "isAI": 0               // Whether is a AI player
        }
    ]
}
```

- Description

```
Indicates the post-game state.
```

### 4. Tapping the Join button

- state

```
mg_common_self_click_join_btn
```

- data

| Parameter | Type | Required | Default | Remarks |
|:----    |:-------    |:--- |---|------      |
| seatIndex | int | No |  -1  | Seat number of the user in the game. This parameter is of the int type, and the value ranges from 0 to the total number of seats. |

```json
{
	"seatIndex": 0	// Seat number of the user in the game. This parameter is of the int type, and the value ranges from 0 to the total number of seats. When seatIndex is -1, players take an empty seat at random. If the value of seatIndex is greater than the total number of seats, players fail to take a seat.
}
```

- Description

```
Indicates that a user taps the Join button or taps the avatar to join a game.
```

### 5. Tapping the Cancel Join button

- state

```
mg_common_self_click_cancel_join_btn
```

- data
```json
{
}
```

- Description

```
Indicates that a user taps the Cancel Join button.
```

### 6. Tapping the Ready button

- state

```
mg_common_self_click_ready_btn
```

- data

```json
{
}
```

- Description

```
Indicates that a user taps the Ready button.
```

### 7. Tapping the Cancel Ready button

- state

```
mg_common_self_click_cancel_ready_btn
```

- data

```json
{
}
```

- Description

```
Indicates that a user taps the Cancel Ready button.
```

### 8. Tapping the Start button

- state

```
mg_common_self_click_start_btn
```

- data

```json
{
}
```

- Description

```
Indicates that a user (captain) taps the Start button.
```

### 9. Tapping the Share button

- state

```
mg_common_self_click_share_btn
```

- data

```json
{
}
```

- Description

```
Indicates that a user taps the Share button.
```

### 10. Gaming

- state

```
mg_common_game_state
```

- data

```json
{
	"gameState": 0 // The state of the game. Valid values: 0: idle state. The game is not started; 1: loading state. All players are ready. The captain taps the Start button and the game scenes are loading; 2: playing state. The game is ongoing.
}
```

- Description

```
Indicates the game state.
```

### 11. Tapping the Close button on the post-game screen (added on December 27, 2021)

- state

```
mg_common_self_click_game_settle_close_btn
```

- data

```json
{
}
```

- Description

```
Indicates that a user taps the Close button on the post-game screen.
```

### 12. Tapping the Play Again button on the post-game screen (added on December 27, 2021)

- state

```
mg_common_self_click_game_settle_again_btn
```

- data

```json
{
}
```

- Description

```
Indicates that a user taps the Play Again button on the post-game page.
```

### 13. Reporting the sound list in a game (added on December 30, 2021, currently, this feature is only supported by Pong)

- state

```
mg_common_game_sound_list
```

- data

```json
{
  "list": [
    {
      "name": "click", // Sound resource name.
      "url": "https://www.xxxx/click.mp3", // URL of a sound resource.
      "type": "mp3" // Sound resource type.
    }
  ]
}
```

- Description

```
Indicates that a game reports the list of all sound resources in the game.
```

### 14. Notifying the app layer of playing sound (added on December 30, 2021, currently, this feature is only supported by Pong)

- state

```
mg_common_game_sound
```

- data

```json
{
    "isPlay": true, // Indicates whether to play sound. Valid values: true: sound is played; false: sound is not played.
    "name": "click",// The name of the sound file to be played without a suffix.
    "type": "mp3",  // Sound resource type.
    "times": 1,     // Number of play times. Note: When times is 0, sound is played in a circular manner.
    "url": "https://www.xxxx.xx/xxx.mp3" // URL of a sound resource.
}
```

- Description

```
Indicates that the game notifies the app layer of playing sound.
```

### 15. Notifying the app layer of playing background music (added on January 7, 2022, currently, this feature is only supported by Pong)

- state

```
mg_common_game_bg_music_state
```

- data

```json
{
    "state": true // State of the background music. Valid values: true: background music is turned on;  false: background music is turned off.
}
```

- Description

```
Indicates that the game notifies the app layer of playing background music.
```

### 16. Notifying the app layer of playing sound effect (added on January 7, 2022, currently, this feature is only supported by Pong)

- state

```
mg_common_game_sound_state
```

- data

```json
{
    "state": true // State of the sound effect. Valid values: true: sound effect is turned on;  false: sound effect is turned off.
}
```

- Description

```
Indicates that the game notifies the app layer of playing sound effect.
```

### 17. ASR (enabling/disabling voice recognition, added in SudMGP V1.1.45.xx)

- state

```
mg_common_game_asr
```

- data

```json
{
	"isOpen": true		// Indicates whehter the voice recognition is enabled. Valid values: true: voice recognition is enabled; false: voice recognition is disabled.
}
```

- Description
```
Indicates whether voice recognition is enabled.
```

### 18. Microphone (added on March 4, 2022)

- state

```
mg_common_self_microphone
```

- data

```json
{
	"isOn": true	// Indicates whether a user turns on or off the microphone. Valid values: true: the microphone is turned on, and the app enables RTC stream push; false: the microphone is turned off, and the app disables RTC stream push.
}
```

- Description

```
Indicates that the game notifies the app of the microphone state.
```

### 19. Headphone (receiver and speaker) (added on March 4, 2022)

- state

```
mg_common_self_headphone
```

- data

```json
{
	"isOn": true	// Headphone state (receiver and speaker). Valid values: true: the headset is turned on, and the app enables RTC stream push; false: the headset is turned off, and the app disables RTC stream push.
}
```

- Description

```
Indicates that the game notifies the app of the headset state (receiver and speaker).
```

### 20. app_common_self_x response error code???added on May 10, 2022???

- state

```
mg_common_app_common_self_x_resp
```

- data

```json
{
  "state": "app_common_self_playing",   // Field required, refer to: https://docs.sud.tech/zh-CN/app/Client/APPFST/CommonState.html
  "resultCode": 0,	// Field required???refer to: https://docs.sud.tech/zh-CN/app/Server/ErrorCode.html
  "isIn": true, // When state=app_common_self_in, the field is required
  "isReady": true, // When state=app_common_self_ready, the field is required
  "isPlaying": true, // When state=app_common_self_playing, the field is required
  "reportGameInfoExtras": "", // When state=app_common_self_playing, the field is required
  "curCaptainUID": "", // When state=app_common_self_captain, the field is required
  "kickedUID": "" //When state=app_common_self_kick, the field is required
}
```

- Description

```
App Common state operation error result callback state (Note: only the resultCode != 0 is called back)
```

### 21. Whether the game notifies the app layer of the success of adding the robot players (added on May 17, 2022)

- state

```
mg_common_game_add_ai_players
```

- data

```json
{
	"resultCode": 0, // Return code 0: successful, non-0: unsuccessful
	"userIds": ["123", ...] // Successfully added to the playerid list
}
```

- Description

```
Whether the game notifies the app layer to add the accompanying robot successfully
```

### 22. The game notifies the app layer to add the current network connection status (added on June 21, 2022)

- state

```
mg_common_game_network_state
```

- data

```json
{
	"state": 1,	// 0:closed, 1: connected
}
```

- Description

```
The game notifies the app layer to add the current network connection status
```