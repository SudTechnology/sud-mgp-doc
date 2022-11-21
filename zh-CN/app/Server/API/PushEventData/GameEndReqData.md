#

![SUD](../../../Resource/logo.png)

##### GameEndReqData

| 参数名     | 必选  | 类型     | 说明                             |
|:--------|:----|:-------|--------------------------------|
| room_id | 是   | string | 房间ID                           |
| uid     | 否   | string | 用户ID 指定用户结束游戏时携带。默认为空，表示游戏提前结束 |

##### 请求示例
```
{
    "event": "game_end",
    "mg_id": "mg_id_1",
    "timestamp": "1657770493152",
    "data": {
        "room_id": "roomId_1"，
        "uid": "uid_1"
    }
}
```