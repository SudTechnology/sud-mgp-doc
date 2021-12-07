#

![SUD](../../Resource/logo.png)

## 简要描述（Deprecated）

- 游戏服务端上报游戏接入方的游戏结算数据（Deprecated）

## 请求URL

- 分为测试环境和生产环境，需要通知Sud分别进行配置
- 生产环境地址需要正式上线部署后才能生效

  
## 请求方式
- https
- POST
- 参数为Json格式，放在body内

##### 参数（ body放json类型参数）

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|uid |是  |string |平台用户id   |
|ss_token  |是  |string |接入方服务端生成ss_token    |
|mg_id |是  |string |游戏id |
|room_id |是 |string |平台房间id  |
|mode |是 |int32 |游戏模式  |
|round_id |是 |string |局id （重复上报，使用该字段去重） |
|battle_start_at |是 |int32 |战斗开始时间（秒）  |
|battle_end_at |是 |int32 |战斗结束时间（秒）  |
|battle_duration |是 |int32 |战斗总时间（秒） |
|battle_rs |是 |rank_object |rank_object 数组 |

- rank_object

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|uid |是 |string|平台uid，机器人为空字符 |
|rank |是 |int32|排名从1开始，平局排名相同 |
|is_escaped |是 |int32|0:正常，1:逃跑 |
|is_ai |是 |int32|0:普通用户，1:机器人 |

## 请求示例

```json
{
    "uid ":"1461298604781080632",
    "ss_token ":"fyRTOsubRLCGrRvKoKm7wIcMM1DL7cfb",
    "mg_id":"1461227817776713818",
    "room_id":"xxx123",
    "mode":1,
    "round_id":"1461227817776713818",
    "battle_start_at":1637685046,
    "battle_end_at":1637685046,
    "battle_duration":100,
    "battle_rs":[
        {
         "uid":"a1_100",
         "rank":1,
         "is_escaped":0,
		 "is_ai":0,
        },
        {
         "uid":"a2_100",
         "rank":2,
         "is_escaped":1,
		  "is_ai":0,
        }
    ]
}
```

## 返回参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|

## 返回示例

```json
{
    "ret_code": 0,// 0:成功，其他表示错误
    "ret_msg": "",
    "data": {}
}
```
##### 备注 

- 请求失败或者返回ret_code!=0，间隔一分钟后重试，最多重新请求2次。