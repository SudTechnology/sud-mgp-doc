##### AiAddReqData

| 参数名        | 必选  | 类型         | 说明                                            |
|:-----------|:----|:-----------|-----------------------------------------------|
| room_id    | 是   | string     | 房间ID                                          |
| ai_players | 是   | aiPlayer数组 | AI用户信息                                        |
| is_ready   | 是   | int        | 机器人加入后是否自动准备<br/>1：自动准备<br/>0：不自动准备 <br/>默认为1 |

##### aiPlayer

| 参数名    | 必选  | 类型     | 说明                         |
|:-------|:----|:-------|----------------------------|
| uid    | 是   | string | uid                        |
| avatar | 是   | string | 头像url                      |
| name   | 是   | string | 名字                         |
| gender | 是   | string | 性别<br/>male：男<br/>female：女 |

##### 请求示例
```
{
    "event": "ai_add",
    "mg_id": "mg_id_1",
    "timestamp": "1657770493152",
    "data": {
        "room_id": "roomId_1",
        "ai_players": [{
            "uid":"uid_1",
            "avatar":"avatar_1",
            "name":"name_1",
            "gender":"male"
        }],
        "is_ready": 1
    }
}
```

##### AiAddRespData

| 参数名  | 必选  | 类型       | 说明         |
|:-----|:----|:---------|------------|
| uids | 是   | string数组 | 加入成功的uid列表 |

##### 返回示例
```
{
    "ret_code": 0,
    "ret_msg": "",
    "data": {
        "uids": ["uid_1","uid_2"]
    }
}
```