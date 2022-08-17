#

![SUD](../../../Resource/logo.png)

##### RoomClearReqData

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|room_id|是  |string |房间ID |

##### 请求示例
```
{
    "event": "room_clear",
	"mg_id": "mg_id_1",
	"app_id": "app_id_1",
    "timestamp": 1657770493152,
	"data": {
		"room_id":"roomId_1"
	}
}
```