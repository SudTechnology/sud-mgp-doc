#

![SUD](../../../Resource/logo.png)

##### RoomInfoReqData

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|room_id|是  |string |房间ID |

##### 请求示例
```
{
    "event": "room_info",
	"mg_id": "mg_id_1",
	"app_id": "app_id_1",
    "timestamp": 1657770493152,
	"data": {
	    "room_id": "roomId_1"
	}
}
```

##### RoomInfoRespData

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|status |是  |string |房间状态<br/>WATING: 等待游戏开始<br/>PLAYING: 游戏中 |
|captain_uid |是  |string |队长uid |
|players |是  |PlayerObject数组 |游戏位玩家数组 |

##### PlayerObject
|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|uid |是  |string |用户uid |
|seat_index |是  |int32 |座位号，从0开始 |
|status |是  |string |用户状态<br/>IDLE:空闲未准备<br/>READY:准备 |
|is_ai |是  |int32 |是否机器人 0：否 1：是 |

##### 返回示例
```
{
    "ret_code": 0,
    "ret_msg": "",
	"data": {
        "status": "WATING",
		"captain_uid": "uid_1",
		"players": [{
		     "uid": "uid_1",
			 "seat_index": 0,
			 "status": "READY",
			 "is_ai": 0
		},{
		     "uid": "uid_2",
			 "seat_index": 1,
			 "status": "IDLE",
			 "is_ai": 0
		}]
	}
}
```