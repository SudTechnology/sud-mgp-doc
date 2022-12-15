#

![SUD](../../Resource/logo.png)

## 简要描述

- 游戏内付费下单

## 请求URL

- 测试环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中create_order字段
- 生产环境：接口地址详见[获取服务端API配置](ObtainServerEndAPIConfigurations.md)中create_order字段

## 请求方式

- 传输协议：HTTPS
- 请求方法：POST
- 参数以body传递，格式为json（见请求示例）
- Header中需要添加：Content-Type: application/json;charset=utf-8
- Header中需要添加：认证请求头 Authorization

## 请求头 [Authorization]

- [认证请求头Authorization实现方式](AuthorizationDescription.md)

## 请求参数

| 参数名          | 必选   | 类型     | 说明                             |
|:-------------|:-----|:-------|--------------------------------|
| out_order_id | 是    | string | 商户自定义唯一订单号id (64个字符以内)         | 
| out_group_id | 否    | string | 商户自定义订单组id（64个字符以内，用于归类同一组订单id | 
| mg_id        | 是    | string | 游戏id                           | 
| room_id      | 是    | string | 房间id                           | 
| cmd          | 是    | string | 触发的行为动作                        | 
| from_uid     | 是    | string | 付费用户uid                        | 
| to_uid       | 是    | string | 目标用户uid                        | 
| value        | 是    | int32  | 所属的游戏价值                        |
| payload      | 特殊可选 | json   | 附加数据                           |

- #### 游戏 cmd | value | payload 参数对应表：

1.德州扑克专业版，游戏ID=1557194155570024449

| cmd       | value | payload | 说明   |
|:----------|:------|:--------|:-----|
| add_score | 积分数   |         | 带入积分 |

2.TeenPatti专业版，游戏ID=1557194487352053761

| cmd       | value | payload      | 说明   |
|:----------|:------|:-------------|:-----|
| add_score | 积分数   |              | 带入积分 |

3.太空杀，游戏ID=1559736844916183041

| cmd  | value                                                                                                                | payload | 说明  |
|:-----|:---------------------------------------------------------------------------------------------------------------------|:--------|:----|
| gift | 1 //0.5票<br/>2 //1票<br/>3 //1.5票<br/>4 //2票<br/>5 //2.5票<br/>6 //3票<br/>7 //3.5票<br/>8 //4票<br/>9 //4.5票<br/>10 //5票 |         | 打赏  | 

4.定制火箭，游戏ID=1583284410804244481

| cmd           | value | payload | 说明   |
|:--------------|:------|:--------|:-----|
| buy_component |       |         | 购买组件 | 
| fire_model    |       |         | 发射火箭 | 

5.狼人杀，游戏ID=1472142747708284929

| cmd      | value | payload                                                          | 说明   |
|:---------|:------|:-----------------------------------------------------------------|:-----|
| buy_role |       | 指定角色id，示例：{"role_id":1} 。<br>role_id 说明：1狼人，2村民，3预言家，4女巫，5猎人，6守卫 | 购买角色 | 

6.棒球，游戏ID=1594978084509368321

| cmd                | value  | payload                                    | 说明                           |
|:-------------------|:-------|:-------------------------------------------|:-----------------------------|
| buy_baseball       | 购买棒球个数 | 示例：{is_add":0} 。is_add说明：是否增加距离 0表示不加，1表示加 | 单次击N个棒球，value 表示购买棒球个数       | 
| buy_combo_baseball | 购买棒球个数 | 示例：{is_add":0} 。is_add说明：是否增加距离 0表示不加，1表示加 | 连击棒球，每次击中一个棒球，value 表示购买棒球个数 | 


## 请求示例

```json
{
  "out_order_id": "1659497694000",
  "out_group_id": "1659497694",
  "mg_id": "1461228379255603251",
  "room_id": "9009",
  "round_id": "ce56b6lzi1a7-cqhcr6fgdnwg-c5vfwwj9h6mz",
  "cmd": "add_score",
  "from_uid": "001",
  "to_uid": "002",
  "value": 100
}
```

## 返回参数

- BaseResp

| 参数名      | 必选  | 类型                       | 说明   |
|:---------|:----|:-------------------------|------|
| ret_code | 是   | int                      | 响应码  |
| ret_msg  | 是   | string                   | 响应信息 |
| data     | 是   | AppServerCreateOrderResp | 响应数据 |

- AppServerCreateOrderResp

| 参数名          | 必选  | 类型     | 说明        |
|:-------------|:----|:-------|-----------|
| out_order_id | 是   | string | 商户订单号id   |
| order_id     | 是   | string | SUD 订单号id |

## 返回示例

```json
{
  "ret_code": 0,
  "ret_msg": "",
  "data": {
    "out_order_id": "1659497694000",
    "order_id": "order_id_1"
  }
}
```

## 业务错误码

| 错误码   | 错误描述   | 解决方案                      |
|:------|:-------|:--------------------------|
| 10002 | 参数错误   | 检查请求参数，修改后重新发起请求          |
| 70501 | 订单号已存在 | 修改商户自定义的订单号，保证唯一性，再重新发起请求 |
