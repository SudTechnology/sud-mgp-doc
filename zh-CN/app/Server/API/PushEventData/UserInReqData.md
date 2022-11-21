#

![SUD](../../../Resource/logo.png)

##### UserInReqData

| 参数名            | 必选  | 类型     | 说明                                                                                                                         |
|:---------------|:----|:-------|----------------------------------------------------------------------------------------------------------------------------|
| code           | 是   | string | 用户uid对应code                                                                                                                |
| room_id        | 是   | string | 房间ID                                                                                                                       |
| mode           | 是   | int32  | 模式 默认: 1                                                                                                                   |
| language       | 否   | string | 语言 默认：zh-CN                                                                                                                |
| seat_index     | 否   | int32  | 加入的游戏位(座位号) 传-1表示随机加入<br/>从0开始，不可大于座位数 默认为0                                                                                |
| is_seat_random | 否   | bool   | 默认为false, 带有seat_index的时候有效，如果游戏位(座位号)已经被占用，是否随机分配一个空位坐下。<br/> is_seat_random=true 随机分配空位坐下<br/>is_seat_random=false 不随机分配 |
| team_id        | 否   | int32  | 不支持分队的游戏：数值填1；支持分队的游戏：数值填1或2（两支队伍）                                                                                         |


##### 请求示例
```
{
    "event": "user_in",
    "mg_id": "mg_id_1",
    "timestamp": "1657770493152",
    "data": {
        "code": "code_1",
        "room_id":"roomId_1",
        "mode": 1,
        "language":"zh-CN",
        "seat_index": -1,
        "is_seat_random": false,
        "team_id": 1
    }
}
```
