#

![SUD](../../../Resource/logo.png)

##### UserOutReqData

| 参数名 | 必选  | 类型     | 说明    |
|:----|:----|:-------|-------|
| uid | 是   | string | 用户uid |
|is_cancel_ready |否  |bool |是否取消准备（用户处于准备态时有效） 默认:false<br/> false:返回错误<br/>true:取消准备 |

##### 请求示例
```
{
    "event": "user_out",
    "mg_id": "mg_id_1",
    "timestamp": "1657770493152",
    "data": {
        "uid": "uid_1",
        "is_cancel_ready": false,
    }
}
```
