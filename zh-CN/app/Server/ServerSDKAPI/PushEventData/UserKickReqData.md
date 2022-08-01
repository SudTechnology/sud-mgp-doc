##### UserKickReqData

| 参数名        | 必选  | 类型     | 说明            |
|:-----------|:----|:-------|---------------|
| kicked_uid | 是   | string | 被踢用户ID（不能为队长） |

##### 请求示例
```
{
    "event": "user_kick",
    "mg_id": "mg_id_1",
    "timestamp": "1657770493152",
    "data": {
        "kicked_uid": "uid_1"
    }
}
```