#

![SUD](../Resource/logo.png)

## Server-end error code description

### SDK error codes (sdk_error_code)
| Error code | Error information | Remarks |
|------|-----------|-----|
| 0 | Success. ||
| 1001 | Token creation failed. ||
| 1002 | Token verification failed. ||
| 1003 | Token parsing failed. ||
| 1004 | Invalid token. ||
| 1005 | Token expired. ||




### Game server error codes
| Error code | Error information | Remarks |
|----|----|-----------------------------------------------|
| 0 | Success. ||
| 10001 | Service exception. ||
| 10002 | Parameter error. | Parameters are unreadable, the request is not a POST request, or the request body is not in JSON format. |
| 10003 | Invalid AppKey. | The AppKey is incorrect. |
| 10004 | Invalid AppSecret. | The AppSecret is incorrect. |
| 10005 | Invalid app platform information. | The transferred bundleId or ApplicationId is incorrect. |
| 10010 | Token creation failed. ||
| 10011 | Token verification failed. ||
| 10012 | Token parsing failed. ||
| 10021 | Invalid token. ||
| 10022 | Token expired. ||
| 10101 | The app does not exist. | The app basic information is not generated. Contact Sud to generate the appId, appKey, and appSecret. |
| 10102 | App data does not exist. | The app configuration information is incomplete. Contact Sud to check the information. |
| 10111 | The game does not exist. | The game ID is incorrect, or the app is not associated with the current game. |
| 10121 | SDK configuration information does not exist. | The app configuration information is incomplete. Contact Sud to check the information. |
| 10122 | Game configuration information does not exist. | The app configuration information is incomplete. Contact Sud to check the information. |
| 100000 | General error. |						|
| 100001 | The short-term token code is missing for the HTTP request. |            |
| 100002 | The **roomID** parameter is missing for the HTTP request.  |            |
| 100003 | The **appID** parameter is missing for the HTTP request. |            |
| 100004 | The **openID** parameter is missing for the HTTP request. |            |
| 100008 | Database query error.  |            |
| 100009 | Database insertion error.  |            |
| 100010 | Database modification error.  |            |
| 100011 | The **appServerInfoUrl** parameter is missing for the HTTP request. |            |
| 100012 | The **mode** parameter is incorrect for the HTTP request. |            |
| 100200 | Join error. |            |
| 100201 | Seats cannot be taken when the game is ongoing. |            |
| 100202 | The number of players in a room reaches the upper limit. |            |
| 100203 | Repeated joining. |            |
| 100204 | The seat is already occupied. |            |
| 100300 | Exit error. |            |
| 100301 | The player is not on the game seat. |            |
| 100302 | The player cannot leave the game when he/she is ready or the game is ongoing. |            |
| 100400 | Ready error. |            |
| 100401 | Cancel ready error. |            |
| 100500 | Start error. |            |
| 100501 | Started. |            |
| 100502 | Only the captain can start the game. |            |
| 100503 | Someone is not ready. |            |
| 100504 | The number of players for starting the game is insufficient. |            |
| 100600 | Kicking error. |            |
| 100601 | Only the captain can kick players. |            |
| 100602 | Kicking is unavailable in a room where the game is ongoing. |            |
| 100603 | You cannot kick yourself. |            |
| 100700 | Captain change error. |            |
| 100800 | Escape error. |            |
| 100801 | The game is over when the player escapes. |            |
| 100802 | The player is not in the game when he/she escapes. |            |
| 100900 | Disbanding error. |            |
| 100901 | The game is over during disbanding. |            |
| 100902 | Only the captain can disband the team. |            |
| 101000 | An error occurs when switching the game mode. |            |
| 101001 | The game mode cannot be switched when the game is ongoing. |            |
| 101002 | Only the captain can switch the game mode. |            |
| 105000 | General error for the short-term token code. | The client server returns a general SDK code error. |
| 105001 | Creation failed for the short-term token code. | The client server returns SDK code creation failed. |
| 105002 | Verification failed for the short-term token code. | The client server returns SDK code verification failed. |
| 105003 | Parsing failed for the short-term token code. | The client server returns SDK code parsing failed. |
| 105004 | Invalid short-term token code. | The client server returns invalid SDK code. |
| 105005 | Short-term token code expired. | The client server returns SDK code expired. |
| 105006 | Failed to request **app_server**. |            |
| 105007 | Failed to parse **app_server** data. |            |
| 105008 | Failed to request **get_sstoken**. | The game server fails to request the **get_sstoken** API from the client server. Check this API. |
| 105009 | Failed to parse **get_sstoken** data. | The game server fails to request the **get_sstoken** API from the client server. Check this API. |
| 105010 | Failed to request **get_user_info**. | The game server fails to request the **get_user_info** API from the client server. Check this API. |
| 105011 | Failed to parse **get_user_info** data. | The game server fails to request the **get_user_info** API from the client server. Check this API. |
| 105012 | Failed to request **update_sstoken**. | The game server fails to request the **update_sstoken** API from the client server. Check this API. |
| 105013 | Failed to parse **update_sstoken** data. | The game server fails to request the **update_sstoken** API from the client server. Check this API. |
| 105014 | **app_server** data mode error. | The game agency server needs to check the data. |
| 105015 | **get_sstoken** client error. The returned HTTP state code is not **200**. | When the game server requests the **get_sstoken** API from the client server, the returned HTTP state code is not **200**. Check this API. |
| 105016 | **get_user_info** client error. The returned HTTP state code is not **200**. | When the game server requests the **get_user_info** API from the client server, the returned HTTP state code is not **200**. Check this API. |
| 105017 | **update_sstoken** client error. The returned HTTP state code is not **200**. | When the game server requests the **update_sstoken** API from the client server, the returned HTTP state code is not **200**. Check this API. |
| 105100 | Serialized json error. | The game agency server needs to check the data. |
| 105101 | **app_server** agency error. The returned HTTP state code is not **200**. | The game agency server needs to check the data. |
| 105102 | **app_server** agency error. | The game agency server needs to check the data. |
| 105103 | **get_sstoken** agency error. The returned HTTP state code is not **200**. | The game agency server needs to check the data. |
| 105104 | **get_sstoken** agency error. | The game agency server needs to check the data. |
| 105105 | **get_user_info sdk** agency error. The returned HTTP state code is not **200**. | The game agency server needs to check the data. |
|105106 | **get_user_info** agency error. | The game agency server needs to check the data. |
| 105107 | **update_sstoken sdk** agency error. The returned HTTP state code is not **200**. | The game agency server needs to check the data. |
| 105108 | **update_sstoken** agency error. | The game agency server needs to check the data. |

### Game business error codes
| Error code | Error information | Remarks |
|----|----|-----------------------------------------------|
| 0 | Success. ||
| 100100 | Login Error ||
| 100200 | Join room error |state=app_common_self_in, isIn=true|
| 100201 | Room cannot be added during battle| |
| 100202 | Room is full| |
| 100203 | Repeat Join | |
| 100204 | Someone at the location | |
| 100300 | Exit error | |
| 100301 | Not in game slot | |
| 100302 | Can't exit in ready or game state | |
| 100400 | Preparation error | |
| 100401 | Cancel preparation error | |
| 100500 | Start game error | |
| 100501 | Game Started | |
| 100502 | Only the captain can start the game| |
| 100503 | Someone is not ready | |
| 100504 | Not enough people to start the game | |
| 100600 | Kick error | |
| 100601 | Captains can kick people | |
| 100602 | Can't kick people in the battle room | |
| 100603 | Can't kick myself| |
| 100700 | Change captain error | |
| 100800 | Escape Error | |
| 100801 | The game is over when you escape| |
| 100802 | The player is no longer in the game when fleeing | |
| 100900 | Dissolution error | |
| 100901 | The game is over when disbanding| |
| 100902 | The captain can be disbanded| |
| 101000 | Switch game mode error | |
| 101001 | The game mode cannot be switched during the game | |
| 101002 | Only the captain can switch the game mode | |