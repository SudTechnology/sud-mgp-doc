#

![SUD](../../../../Resource/logo.png)

## 简要描述

- 发送礼物数据

### BulletGift

|    参数名    | 必选  |   类型   |     说明     |
|:---------:|:---:|:------:|:----------:|
|  gift_id  |  是  | int32  | 礼物id（取值如下） |
| gift_name |  是  | string |    礼物名称    |
|  amount   |  是  | int32  |    礼物数量    |

#### 礼物说明

- 王者战争

| 礼物id | 礼物描述  | 礼物类型 |
|:----:|:-----:|:----:|
|  1   | 初级魔兽  | 价格礼物 |
|  2   | 精英魔兽  | 价格礼物 |
|  3   | 远古魔兽  | 价格礼物 |
|  4   | 随机召唤令 | 随机礼物 |

### 请求示例

```json
{
  "mg_id": "x",
  "room_id": "x",
  "op_code": 3,
  "user_info": {
    "uid": "x",
    "nick_name": "x",
    "avatar_url": "x",
    "gender": "male"
  },
  "data": {
    "gift_id": 1,
    "gift_name": "xxx",
    "amount": 66
  }
}
```