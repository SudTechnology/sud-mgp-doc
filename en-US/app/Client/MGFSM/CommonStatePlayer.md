#

![SUD](../../Resource/logo.png)

## General state - Player

> Tips
>
> 1. The SDK ensures that states are sent from the game to the app serially.

> 2. After a state notification, the SDK caches the latest **data** value based on the **UID** and **state** value for the app to proactively obtain it at anytime.
>
> 3. The game notifies the states of all users (including players and OBs) in a room. The app can display the states as needed.
>
> 4. ISudFSMMSG void onPlayerStateChange(ISudFSMStateHandle handle, String userId, String state, String dataJson);

### 0. Testing

- state

```
mg_common_player_hello_fsm
```

- data

```json
{
  "msg": "Hello FSM from MG player!"
}
```

- Description

```
This state is used for testing.
```

### 1. Joining (modified)

- Earliest version: V1.1.30.xx
- state

```
mg_common_player_in
```

- data

```json
{
  "isIn": true,   // Indicates whether a user joins or exits a game. Valid values: true: joined; false: not joined.
  "teamId": 1,    // Team to join.
  "reason": 0,    // This parameter is valid when isIn is set to false. Valid values: 0: proactively exit; 1: kicked. This parameter is set to -1 by default, which is meaningless and facilitates handling.
  "kickUID": "",  // This parameter is valid when reason is set to 1. kickUID indicates the ID of the user who kicks other players. The condition onPlayerStateChange (userId == kickedUID == selfUID) is designed for users to determine whether he or she has been kicked. By default, kickUID is set to NULL, which is meaningless and facilitates handling.
  "seatIndex": 0, // The player's seat number starts from 0 (only valid when isIn is true)
}
```

- Description

```
Whether a user joins a game.
After a game starts, users who do not join the game are OBs.
```

### 2. Ready (modified)

- Earliest version: V1.1.30.xx
- state

```
mg_common_player_ready
```

- data

```json
{
  "isReady": true // Indicates whether a user gets ready for a game. Valid values: true: ready; false: not ready.
}
```

- Description

```
Whether a user gets ready for a game.
```

### 3. Captain (modified)

- Earliest version: V1.1.30.xx
- state

```
mg_common_player_captain
```

- data

```json
{
  "isCaptain": true // Indicates whether a user is captain. Valid values: true: captain; false: not captain.
}
```

- Description

```
Whether a user is the captain who is authorized to start the game.
```

### 4. Gaming (modified)

- Earliest version: V1.1.30.xx
- state

```
mg_common_player_playing
```

- data

```json
{
  "isPlaying": true, // Indicates whether a user is playing a game. Valid values: true: playing a game; false: not playing a game.
  "gameRoundId": "12345699", // ID of this round of game. This parameter is valid when isPlaying is set to true.
  "reason": 0, // This parameter is valid when isPlaying is set to false. Valid values: 0: indicates that this round of game is over normally; 1: indicates that this round of game is over in advance (the player ends the game); 2: indicates that this round of game is over in advance (no real players and only robots play the game), which is not supported temporarily; 3: indicates that this round of game is over in advance (no one plays). By default, reason is set to -1, which is meaningless and facilitates handling.
  "spaceMax": true // Valid values: true: you are advised to downsize the native UI and spare as much operation space for the game as possible; false: initial state.
}
```

### reason parameter description

| reason | Type | Value | Description                                                                          | Role             | Operation                                                       |
| :----- | :--- | :---- | :----------------------------------------------------------------------------------- | ---------------- | --------------------------------------------------------------- |
| reason | int  | 0     | This round of game is over normally.                                                 | Player           | This round of game is over normally.                            |
| reason | int  | 1     | This round of game is over in advance (the player ends the game).                    | Player           | **app_common_self_playing isPlaying=false** is sent to the app. |
| reason | int  | 2     | This round of game is over in advance (no real plays and only robots play the game). | Player           | Not supported temporarily.                                      |
| reason | int  | 3     | This round of game is over in advance (no one plays).                                | Player + captain | **app_common_self_end** is sent to the app.                     |

- Description

```
A user's gaming state. If the user is in the game, you are advised to:
a. Empty the central area of the screen:
Disable the full-screen gift effect.
b. For games that require frequent operations with spaceMax set to true, downsize the native UI and spare as much operation space for the game as possible:
Downsize the public screen.
Downsize the voice chat area.
If the user exits the game, restore the space allocation.
```

### 5. Changing the game seat

- Earliest version: V1.1.30.xx
- state

```
mg_common_player_change_seat
```

- data

```json
{
  "preSeatIndex": 1, // Previous game seat No.
  "currentSeatIndex": 1 // Current game seat No.
}
```

- Description

```
Indicates that a player changes his/her game seat.
```

### 6. Notifying the app of tapping a player's avatar (Added on February 9, 2022. This state applies only to player avatars in game scenes.)

- state

```
mg_common_self_click_game_player_icon
```

- data

```json
{
  "uid": "User ID" // ID of the user whose avatar is tapped.
}
```

- Description

```
Indicates that the game notifies the app of tapping a player's avatar.
```

### 7. Click the player's Avatar on the game notification app

- state

```
mg_common_self_click_game_player_icon
```

- data

```json
{
  "uid": "用户id" // ID of the user whose avatar is tapped.
}
```

- Description

```
 Click the player's Avatar on the game notification app
```

### 8. Game notification app player death status (added on April 24, 2022)

- state

```
mg_common_self_die_status
```

- data

```json
{
  "uid": "player id", // player id
  "isDeath": true // Whether the player is dead: true: dead, false: not dead; Default false
}
```

- Description

```
Game notification app player death status
```

### 9. Game notification app player's turn (added on April 24, 2022)

- state

```
mg_common_self_turn_status
```

- data

```json
{
  "uid": "player id", // player id
  "isTurn": true // Whether it's the player's turn to take the shot true: it's the shot round of the above uid player, false: it's not the shot round of the above uid player; Default false
}
```

- Description

```
 Game notification app player's turn
```

### 10. Game notification app player selection status (added on April 24, 2022)

- state

```
mg_common_self_select_status
```

- data

```json
{
  "uid": "player id", // player id
  "isSelected": true // Whether the player selects true: selected, false: not selected; Default false
}
```

- Description

```
 Game notification app player selection status
```

### 11. The game notifies the app layer of the remaining time of the current game (added on May 23, 2022, and UMO takes effect at present)

- state

```
mg_common_game_countdown_time
```

- data

```json
{
  "countdown": 123 // Time remaining in seconds
}
```

- Description

```
The game notifies the app layer of the remaining time of the current game
```

### 12. The game notifies the app layer that the current player will become an OB perspective after death (added on August 23, 2022, and now the werewolf )

- state

```
mg_common_self_ob_status
```

- data

```json
{
  "isOb": true
}
```

- 说明

```
The game notifies the app layer that the current player will become an OB perspective after death
```
