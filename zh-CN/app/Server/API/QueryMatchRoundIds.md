#

![SUD](../../Resource/logo.png)

## 简要描述

- 查询单场游戏内的所有局id

## 请求URL

- 测试环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中query_match_round_ids字段
- 生产环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中query_match_round_ids字段

## 请求方式

- 传输协议：HTTPS
- 请求方法：POST
- 参数以body传递，格式为json（见请求示例）
- Header中需要添加：Content-Type: application/json;charset=utf-8
- Header中需要添加：认证请求头 Authorization

## 请求头 [Authorization]

- [认证请求头Authorization实现方式](AuthorizationDescription.md)

## 请求参数

| 参数名                  | 必选   | 类型     | 说明                                                                                                      |
|:---------------------|:-----|:-------|---------------------------------------------------------------------------------------------------------|
| match_id             | 特殊可选 | string | 游戏场次id，和report_game_info_key不能同时为空                                                                      |
| report_game_info_key | 特殊可选 | string | 游戏开始时传入的上报信息key，和match_id能同时为空。<br>report_game_info_key和match_id同时存在，则match_id优先级高于report_game_info_key |

## 请求示例

```json
{
  "match_id": "1659497694003"
}
```

## 返回参数

- BaseResp

| 参数名      | 必选  | 类型                              | 说明   |
|:---------|:----|:--------------------------------|------|
| ret_code | 是   | int                             | 响应码  |
| ret_msg  | 是   | string                          | 响应信息 |
| data     | 是   | AppServerQueryMatchRoundIdsResp | 响应数据 |

- AppServerQueryMatchRoundIdsResp

| 参数名                  | 必选  | 类型       | 说明                   |
|:---------------------|:----|:---------|----------------------|
| match_id             | 是   | string   | 游戏场次id               |ce56b6lzi1a7
| total                | 是   | int32    | 游戏局总数                |10
| round_ids            | 是   | string[] | 游戏局id列表 (按游戏局索引正序排序) |<br>
| report_game_info_key | 否   | string   | 游戏开始时传入的上报信息key      |<br>


## 返回示例

```json
{
  "ret_code": 0,
  "ret_msg": "",
  "data": {
    "match_id": "ce56b6lzi1a7-cf75m85c4b1f-cxzdyxkqqal0",
    "total": 4,
    "round_ids": [
      "ce56b6lzi1a7-cf75m85c4b1f-cxzd9yv2m9jd",
      "ce56b6lzi1a7-cf75m85c4b1f-cxzdh4am1l70",
      "ce56b6lzi1a7-cf75m85c4b1f-cxzdjb01m3gz",
      "ce56b6lzi1a7-cf75m85c4b1f-cxzdgbk9zfbd"
    ],
    "report_game_info_key": ""
  }
}
```

## 业务错误码

| 错误码   | 错误描述     | 解决方案                         |
|:------|:---------|:-----------------------------|
| 10002 | 参数错误     | 检查请求参数，修改后重新发起请求             |
| 70420 | 该游戏场次不存在 | 检查传入的订单号、上报信息key是否正确，再重新发起请求 |
