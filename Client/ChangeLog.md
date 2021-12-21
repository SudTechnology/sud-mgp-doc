# SudMGP和游戏 更新日志


## 游戏更新 (2021-12-15)

**新增功能:**
- 新增状态 [玩家换游戏位状态](https://github.com/SudTechnology/sud-mgp-doc/blob/main/Client/MG%20FSM/%E9%80%9A%E7%94%A8%E7%8A%B6%E6%80%81-%E7%8E%A9%E5%AE%B6.md)
- 新增状态 [游戏状态](https://github.com/SudTechnology/sud-mgp-doc/blob/main/Client/MG%20FSM/%E9%80%9A%E7%94%A8%E7%8A%B6%E6%80%81-%E6%B8%B8%E6%88%8F.md)
- 新增字段isSeatRandom [加入状态app_common_self_in](https://github.com/SudTechnology/sud-mgp-doc/blob/main/Client/APP%20FST/%E9%80%9A%E7%94%A8%E7%8A%B6%E6%80%81.md)
- 新增字段gameCPU，低功耗 [onGetGameCfg](https://github.com/SudTechnology/sud-mgp-doc/blob/main/Client/API/ISudFSMMG/onGetGameCfg.md)

**修改功能:**
- 无

**优化内容:**
- 优化断线重连状态通知的完整性和一致性；
- 优化排名算法，相同积分则相同排名；
- 优化段位升级算法，不再扣除奖杯；
- 优化调整分享按钮位置； 
- 优化游戏位的默认头像；

**Bug修复:**
- 修复隐藏段位UI，结算界面的奖杯资源未隐藏的问题；
- 修复断线重连的相关问题；
- 修复“飞镖达人”的logo适配；
- 修复其他问题;
- 修复teamId不同问题；
- 修复游戏位根据配置隐藏队长和踢人标识；
- 修复玩家断线，在重连上来之前，有玩家离开导致的麦位和游戏位玩家显示不一致的问题；

## v1.1.33.xx (2021-12-14)
**Android:**
- [SudMGP-Android-v1.1.33.227](https://github.com/SudTechnology/sud-mgp-android/releases/tag/v1.1.33.227)
- [HelloSud-Android-v1.1.33.227](https://github.com/SudTechnology/hello-sud-android/releases)

**iOS:**
- [SudMGP-iOS-v1.1.33.258](https://github.com/SudTechnology/sud-mgp-ios/releases/tag/v1.1.33.258)
- [HelloSud-iOS-v1.1.33.258](https://github.com/SudTechnology/hello-sud-ios/releases)

**新增功能:**
- 无

**修改功能:**
- 无

**优化内容:**
- 无

**Bug修复:**
- 修复指令集兼容问题；

## v1.1.33.xx (2021-12-13)
**Android:**
- [SudMGP-Android-v1.1.33.219](https://github.com/SudTechnology/sud-mgp-android/releases/tag/v1.1.33.219)
- [HelloSud-Android-v1.1.33.219](https://github.com/SudTechnology/hello-sud-android/releases)

**iOS:**
- [SudMGP-iOS-v1.1.33.258](https://github.com/SudTechnology/sud-mgp-ios/releases/tag/v1.1.33.258)
- [HelloSud-iOS-v1.1.33.258](https://github.com/SudTechnology/hello-sud-ios/releases)

**新增功能:**
- 无

**修改功能:**
- 无

**优化内容:**
- 优化连接超时时间；
- 游戏ID传递给游戏；
- iOS destroyMG时，SDK内主动移除游戏View；

**Bug修复:**
- 修复Android加载进度条阴影变大问题；
- 修复iOS类型错误问题；
- 修复iOS点击重新加载按钮没有隐藏问题；

## v1.1.32.xx (2021-12-08)
**Android:**
- [SudMGP-Android-v1.1.32.200](https://github.com/SudTechnology/sud-mgp-android/releases/tag/v1.1.32.200)
- [HelloSud-Android-v1.1.32.200](https://github.com/SudTechnology/hello-sud-android/releases)

**iOS:**
- [SudMGP-iOS-v1.1.32.232](https://github.com/SudTechnology/sud-mgp-ios/releases/tag/v1.1.32.232)
- [HelloSud-iOS-v1.1.32.232](https://github.com/SudTechnology/hello-sud-ios/releases)

**新增功能:**
- [状态app_common_self_in新增字段seatIndex](https://github.com/SudTechnology/sud-mgp-doc/blob/main/Client/APP%20FST/%E9%80%9A%E7%94%A8%E7%8A%B6%E6%80%81.md)
- [状态mg_common_self_click_join_btn新增字段seatIndex](https://github.com/SudTechnology/sud-mgp-doc/blob/main/Client/MG%20FSM/%E9%80%9A%E7%94%A8%E7%8A%B6%E6%80%81-%E6%B8%B8%E6%88%8F.md)
- [onGetGameCfg游戏位加入按钮新增自定义配置lobby_players.custom](https://github.com/SudTechnology/sud-mgp-doc/blob/main/Client/API/ISudFSMMG/onGetGameCfg.md)

**修改功能:**
- 无

**优化内容:**
- 小游戏弹框加上错误码提示，便于排查问题；

**Bug修复:**
- 小游戏修复已知bug；

## v1.1.32.xx (2021-12-07)
**Android:**
- [SudMGP-Android-v1.1.32.200](https://github.com/SudTechnology/sud-mgp-android/releases/tag/v1.1.32.200)
- [HelloSud-Android-v1.1.32.200](https://github.com/SudTechnology/hello-sud-android/releases)

**iOS:**
- [SudMGP-iOS-v1.1.32.232](https://github.com/SudTechnology/sud-mgp-ios/releases/tag/v1.1.32.232)
- [HelloSud-iOS-v1.1.32.232](https://github.com/SudTechnology/hello-sud-ios/releases)

**新增功能:**
- 无

**修改功能:**
- 无

**优化内容:**
- SudMGP SDK把platform传递给小游戏；

**Bug修复:**
- 无

## v1.1.31.xx (2021-12-05)
**Android:**
- [SudMGP-Android-v1.1.31.188](https://github.com/SudTechnology/sud-mgp-android/releases/tag/v1.1.31.188)
- [HelloSud-Android-v1.1.31.188](https://github.com/SudTechnology/hello-sud-android/releases)

**iOS:**
- [SudMGP-iOS-v1.1.31.222](https://github.com/SudTechnology/sud-mgp-ios/releases/tag/v1.1.31.222)
- [HelloSud-iOS-v1.1.31.222](https://github.com/SudTechnology/hello-sud-ios/releases)

**新增功能:**
- [MG状态机-通用状态-游戏](https://github.com/SudTechnology/sud-mgp-doc/blob/main/Client/MG%20FSM/%E9%80%9A%E7%94%A8%E7%8A%B6%E6%80%81-%E6%B8%B8%E6%88%8F.md)
- 4.加入游戏按钮点击状态
- 5.取消加入游戏按钮点击状态
- 6.准备按钮点击状态
- 7.取消准备按钮点击状态
- 8.开始游戏按钮点击状态

**修改功能:**
- 无
  
**优化内容:**
- [优化onGetGameCfg文档](https://github.com/SudTechnology/sud-mgp-doc/blob/main/Client/API/ISudFSMMG/onGetGameCfg.md)
  
**Bug修复:**
- 无

## v1.1.31.xx (2021-12-03)
**Android:**
- [SudMGP-Android-v1.1.31.188](https://github.com/SudTechnology/sud-mgp-android/releases/tag/v1.1.31.188)
- [HelloSud-Android-v1.1.31.188](https://github.com/SudTechnology/hello-sud-android/releases/tag/v1.1.31.188)

**iOS:**
- [SudMGP-iOS-v1.1.31.222](https://github.com/SudTechnology/sud-mgp-ios/releases/tag/v1.1.31.222)
- [HelloSud-iOS-v1.1.31.222](https://github.com/SudTechnology/hello-sud-ios/releases)

**新增功能:**
- 无

**修改功能:**
- 无
  
**优化内容:**
- 无
  
**Bug修复:**
- 修复Android SDK initSDK Activity持有问题；

## v1.1.31.xx (2021-12-02)
**Android:**
- [SudMGP-Android-v1.1.31.181](https://github.com/SudTechnology/sud-mgp-android/releases/tag/v1.1.31.181)
- [HelloSud-Android-v1.1.31.181](https://github.com/SudTechnology/hello-sud-android/releases/tag/v1.1.31.181)

**iOS:**
- [SudMGP-iOS-v1.1.31.222](https://github.com/SudTechnology/sud-mgp-ios/releases/tag/v1.1.31.222)
- [HelloSud-iOS-v1.1.31.222](https://github.com/SudTechnology/hello-sud-ios/releases)

**新增功能:**
- [游戏结算状态](https://github.com/SudTechnology/sud-mgp-doc/blob/main/Client/MG%20FSM/%E9%80%9A%E7%94%A8%E7%8A%B6%E6%80%81-%E6%B8%B8%E6%88%8F.md)，新增gameRoundId字段；
- [游戏状态](https://github.com/SudTechnology/sud-mgp-doc/blob/main/Client/MG%20FSM/%E9%80%9A%E7%94%A8%E7%8A%B6%E6%80%81-%E7%8E%A9%E5%AE%B6.md)，新增gameRoundId字段；

**修改功能:**
- [onGetGameCfg](https://github.com/SudTechnology/sud-mgp-doc/blob/main/Client/API/ISudFSMMG/onGetGameCfg.md)，ui中的jion_btn 改为join_btn , cancel_btn 改为 cancel_join_btn
  
**优化内容:**
- 优化部分游戏的国际化多语言修改；
- 兼容服务端修改；
- 优化代码；
  
**Bug修复:**
- 修复iOS内存释放；

## v1.1.30.xx (2021-11-27)
**Android:**
- [SudMGP-Android-v1.1.30.161](https://github.com/SudTechnology/sud-mgp-android/releases/tag/v1.1.30.161)
- [HelloSud-Android-v1.1.30.161](https://github.com/SudTechnology/hello-sud-android/releases/tag/v1.1.30.161)

**iOS:**
- [SudMGP-iOS-v1.1.31.187](https://github.com/SudTechnology/sud-mgp-ios/releases/tag/v1.1.30.187)
- [HelloSud-iOS-v1.1.31.187](https://github.com/SudTechnology/hello-sud-ios/releases)

**新增功能:**
- 提供更灵活的接口，APP自定义主动串游戏逻辑([APP状态控制器-通用状态](https://github.com/SudTechnology/sud-mgp-doc/blob/main/Client/APP%20FST/%E9%80%9A%E7%94%A8%E7%8A%B6%E6%80%81.md))，或者游戏主动串游戏逻辑([MG状态机-通用状态-游戏]()和[MG状态机-通用状态-玩家](https://github.com/SudTechnology/sud-mgp-doc/blob/main/Client/MG%20FSM/%E9%80%9A%E7%94%A8%E7%8A%B6%E6%80%81-%E7%8E%A9%E5%AE%B6.md))；

**修改功能:**
- [MG状态机-通用状态-玩家](https://github.com/SudTechnology/sud-mgp-doc/blob/main/Client/MG%20FSM/%E9%80%9A%E7%94%A8%E7%8A%B6%E6%80%81-%E7%8E%A9%E5%AE%B6.md) 新增参数；
- 废弃Depreated APP状态控制器-通用状态 [房间状态和麦位状态](https://github.com/SudTechnology/sud-mgp-doc/blob/main/Client/APP%20FST/%E9%80%9A%E7%94%A8%E7%8A%B6%E6%80%81.md)；
- iOS SDK使用SudMGP.xcframework方式出包;
- 修改appId生成规则；
- 修改mgId类型，int改成int64；
  
**优化内容:**
- 优化代码结构；
- 优化Loading UI；
- 优化首次下载包体积；
  
**Bug修复:**
- 修复状态栏，改成默认不隐藏；
- 修复已知bug；
