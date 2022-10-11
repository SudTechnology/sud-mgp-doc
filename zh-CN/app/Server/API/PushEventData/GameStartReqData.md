#

![SUD](../../../Resource/logo.png)

##### GameStartReqData

| 参数名                     | 必选  | 类型     | 说明                                         |
|:------------------------|:----|:-------|--------------------------------------------|
| room_id                 | 是   | string | 房间ID                                       |
| report_game_info_extras | 否   | string | 透传参数，最大长度1024字节，超过则截断                      |
| report_game_info_key    | 否   | string | 透传参数key，最大长度64字节，接入方服务端，可以根据这个字段来查询一局游戏的数据 |

##### 请求示例

```
{
    "event": "game_start",
    "mg_id": "mg_id_1",
    "timestamp": "1657770493152",
    "data": {
	    "room_id": "room_id_1",
	    "report_game_info_extras": "",
	    "report_game_info_key": ""
    }
}
```
