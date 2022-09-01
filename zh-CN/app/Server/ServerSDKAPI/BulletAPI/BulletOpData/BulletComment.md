#

![SUD](../../../../Resource/logo.png)

## 简要描述

- 发送弹幕数据

### BulletComment

| 参数名          | 必选  | 类型    | 说明          |
|:-------------|:----|:------|-------------|
| content_code | 是   | int32 | 弹幕内容码（取值如下） |

- 王者战争弹幕内容码

| 弹幕内容码 | 取值          |
|:------|:------------|
| 1     | 加入红队或召唤弹幕魔兽 |
| 2     | 加入蓝队或召唤弹幕魔兽 |

### 请求示例

```json
{
    "mg_id": "x",
    "room_id": "x",
    "op_code": 2,
    "user_info": {
        "uid": "x",
        "nick_name": "x",
        "avatar_url": "x",
        "gender": "male"
    },
    "data": {
		"content_code": 1
	}
}
```