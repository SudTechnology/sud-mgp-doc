##### UserReadyReqData

| 参数名      | 必选  | 类型     | 说明                       |
|:---------|:----|:-------|--------------------------|
| uid      | 是   | string | 用户ID                     |
| is_ready | 是   | bool   | true: 准备<br/>false: 取消准备 |

##### 请求示例
```
{
    "event": "user_ready",
    "mg_id": "mg_id_1",
    "timestamp": "1657770493152",
    "data": {
        "uid": "uid_1",
        "is_ready": true
    }
}
```
