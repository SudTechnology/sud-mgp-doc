# Summary

* [SudMGP互动小游戏接入平台文档](README.md)
    * [客户端](app/Client/README.md)
        * [客户端快速接入](app/Client/StartUp.md)
            * [iOS](app/Client/StartUp-iOS.md)
            * [Android](app/Client/StartUp-Android.md)
            * [Web](app/Client/StartUp-Web.md)
        * [客户端文档](app/Client/README.md)
            * [API](app/Client/API/README.md)
                * [SudMGP](app/Client/API/SudMGP.md)
                * [ISudCfg](app/Client/API/ISudCfg.md)
                * [ISudFSTAPP](app/Client/API/ISudFSTAPP.md)
                * [ISudFSMMG](app/Client/API/ISudFSMMG.md)
                    * [onGetGameCfg](app/Client/API/ISudFSMMG/onGetGameCfg.md)
                    * [onGetGameViewInfo](app/Client/API/ISudFSMMG/onGetGameViewInfo.md)
            * [APP状态转换器 ISudFSTAPP](app/Client/APPFST/README.md)
                * [通用状态 notifyStateChange](app/Client/APPFST/CommonState.md)
                * [元宇宙砂砂舞 notifyStateChange](app/Client/APPFST/CommonStateForDisco.md)
            * [MG状态机 ISudFSMMG](app/Client/MGFSM/README.md)
                * [通用状态-游戏 onGameStateChange](app/Client/MGFSM/CommonStateGame.md)
                * [通用状态-玩家 onPlayerStateChange](app/Client/MGFSM/CommonStatePlayer.md)
                * [你画我猜](app/Client/MGFSM/DrawGuess.md)
                * [元宇宙砂砂舞](app/Client/MGFSM/Disco.md)
        * [客户端SDK下载](app/Client/SDK/README.md)
        * [客户端Demo下载](app/Client/Demo/README.md)
        * [FAQ](app/Client/FAQ/README.md)
        * [游戏多语言](app/Client/Languages/README.md)
        * [更新日志(SudMGP和游戏)](app/Client/ChangeLog.md)
    * [服务端](app/Server/README.md)
        * [快速接入](app/Server/StartUp.md)
            * [Java](app/Server/StartUp-Java.md)
            * [Go](app/Server/StartUp-Go.md)
            * [Node](app/Server/StartUp-Node.md)
            * [C#.Net](app/Server/StartUp-Dotnet.md)
        * [SDK](app/Server/SDK/README.md)
            * [Java](app/Server/SDK/SudMGPAuth-Java.md)
            * [Go](app/Server/SDK/SudMGPAuth-Go.md)
            * [Node](app/Server/SDK/SudMGPAuth-Node.md)
            * [C#.Net](app/Server/SDK/SudMGPAuth-Dotnet.md)
        * [Https服务回调](app/Server/HttpsCallback/README.md)
            * [get_sstoken](app/Server/HttpsCallback/get_sstoken.md)
            * [update_sstoken](app/Server/HttpsCallback/update_sstoken.md)
            * [get_user_info](app/Server/HttpsCallback/get_user_info.md)
            * [report_game_info](app/Server/HttpsCallback/report_game_info.md)
            * [消息通知](app/Server/HttpsCallback/notify/README.md)
                * [房间用户变更通知](app/Server/HttpsCallback/notify/RoomUsersChangedNotify.md)
                * [单场游戏结算通知](app/Server/HttpsCallback/notify/MatchSettleNotify.md)
                * [用户结算通知](app/Server/HttpsCallback/notify/UserSettleNotify.md)
                * [订单状态变更通知](app/Server/HttpsCallback/notify/OrderChangedNotify.md)
            * [回调验签说明](app/Server/HttpsCallback/CallbackSignatureVerify.md)
            * [游戏扩展信息说明](app/Server/HttpsCallback/game/README.md)
                * [角色说明](app/Server/HttpsCallback/game/GameRole.md)
                * [扩展字段说明](app/Server/HttpsCallback/game/GameExtras.md)
        * [API](app/Server/API/README.md)
            * [认证请求头Authorization实现方式](app/Server/API/AuthorizationDescription.md)
            * [获取服务端接口API配置](app/Server/API/ObtainServerEndAPIConfigurations.md)
            * [获取游戏列表](app/Server/API/ObtainTheGameList.md)
            * [获取游戏信息](app/Server/API/ObtainGameInformation.md)
            * [获取游戏上报信息](app/Server/API/ObtainTheReportInformationOfGame.md)
            * [查询游戏上报信息（新）](app/Server/API/QueryGameReportInformation.md)
            * [分页获取房间内游戏上报信息](app/Server/API/ObtainTheReportInformationOfGameByPage.md)
            * [推送事件到游戏服务](app/Server/API/PushEventToMgServer.md)
            * [推送事件列表](app/Server/API/PushEventData/README.md)
                * [用户加入](app/Server/API/PushEventData/UserInReqData.md)
                * [用户退出](app/Server/API/PushEventData/UserOutReqData.md)
                * [用户准备/取消准备](app/Server/API/PushEventData/UserReadyReqData.md)
                * [游戏开始](app/Server/API/PushEventData/GameStartReqData.md)
                * [队长更换](app/Server/API/PushEventData/CaptainChangeReqData.md)
                * [用户踢人](app/Server/API/PushEventData/UserKickReqData.md)
                * [游戏结束](app/Server/API/PushEventData/GameEndReqData.md)
                * [游戏玩法设置](app/Server/API/PushEventData/GameSettingReqData.md)
                * [加入AI](app/Server/API/PushEventData/AiAddReqData.md)
                * [获取房间座位列表](app/Server/API/PushEventData/RoomInfoReqData.md)
                * [快速开始游戏](app/Server/API/PushEventData/QuickStartReqData.md)
                * [房间清理](app/Server/API/PushEventData/RoomClearReqData.md)
            * [游戏内付费下单](app/Server/API/CreateOrder.md)
            * [查询单场游戏基础信息](app/Server/API/QueryMatchBase.md)
            * [查询单场游戏内的所有局id](app/Server/API/QueryMatchRoundIds.md)
            * [查询订单](app/Server/API/QueryOrder.md)
            * [查询用户结算信息](app/Server/API/QueryUserSettle.md)
            * [服务端上报每局游戏消耗的货币信息](app/Server/API/ReportAmountOfCurrencyConsumedInEachGameRound.md)
            * [弹幕游戏服务端API](app/Server/API/BulletAPI/README.md)
                * [创建连接](app/Server/API/BulletAPI/BulletConnect.md)
                * [断开连接](app/Server/API/BulletAPI/BulletDisconnect.md)
                * [切换游戏](app/Server/API/BulletAPI/BulletChangeGame.md)
                * [操作游戏](app/Server/API/BulletAPI/BulletOperate.md)
                * [操作码/操作数据对应表](app/Server/API/BulletAPI/BulletOpData/README.md)
                     * [礼物](app/Server/API/BulletAPI/BulletOpData/BulletGift.md)
                     * [弹幕](app/Server/API/BulletAPI/BulletOpData/BulletComment.md)
        * [服务端Demo下载](app/Server/Demo/README.md)
        * [错误码](app/Server/ErrorCode.md)
        * [自行实现鉴权方式](app/Server/ImplementAuthenticationByYourself.md) 
        * [服务端更新日志](app/Server/Server_Change_Log.md)

* [NFT服务](nft/README.md)
    * [客户端](nft/Client/README.md)
        * [客户端快速接入](nft/Client/StartUp/README.md)
            * [iOS](nft/Client/StartUp/StartUp-iOS.md)
            * [Android](nft/Client/StartUp/StartUp-Android.md)
        * [客户端文档](nft/Client/Doc/README.md)
            * [API](nft/Client/Doc/API/README.md)
                * [SudNFT](nft/Client/Doc/API/SudNFT.md)
        * [客户端SDK下载](nft/Client/SDK/README.md)
        * [客户端Demo下载](nft/Client/Demo/README.md)
    * [服务端](nft/Server/README.md)
        * [获取已穿戴NFT详情](nft/Server/GetDetails.md)
        * [刷新已穿戴NFT详情令牌](nft/Server/RefreshDetails.md)
        * [错误码](nft/Server/RetCode.md)
