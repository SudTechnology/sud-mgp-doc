#

![SUD](../../../Resource/logo.png)


##### 异步通知根据后台设置的notify_url地址发送，按通知事件值区分对应的通知，异步通知验签见 [回调签名验证](../CallbackSignatureVerify.md)

| 通知事件名称   | 通知事件值                                                           |
|:---------|:----------------------------------------------------------------|
| 房间用户人数变更 | [sud.mg.merchant.room.users.changed](RoomUsersChangedNotify.md) |
| 订单状态变更   | [sud.mg.merchant.order.changed](OrderChangedNotify.md)          |
| 用户结算     | [sud.mg.merchant.user.settle](UserSettleNotify.md)              |
| 单场游戏结算   | [sud.mg.merchant.match.settle](MatchSettleNotify.md)            |



