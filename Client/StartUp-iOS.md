![SUD](/Users/zqw/Documents/project/git/divtoss/gamedemo/doc/sud-mgp-doc/Resource/logo.png)

[Toc]

# SudMGP SDK - iOS

更新时间 2021/10/19 10:00:00



## 快速开始

### iOS接入流程

1. 与Sud商务团队洽谈合作事宜，获取项目的appid、appkey、appsecret、code、SudMGP SDK库链接和Demo工程等信息

2. 从SudMGPSDK库链接下载SudMGPSDK.framework和lib_runtime.framework

3. 在工程中引入SDK：

   以Xcode 13.0，编程语言Objective-C，目标工程SudMgpExample-iOS为例：

   - 将lib_runtime.framework、SudMGPSDK.framework 拷贝到GameSDK文件夹中

   - 打开Xcode，选择TARGETS，选中SudMgpExample-iOS，选中Build Settings，搜索Enable Bitcode，配置为No

   - 在TARGETS中，选中SudMgpExample-iOS，选择 Build Phases

   - 将 lib_runtime.framework、SudMGPSDK.framework 拖到 Link Binary With Libraries

   - 选择 General，在 Frameworks, Libraries, and Embedded Content 中，将

     lib_runtime.framework、SudMGPSDK.framework设置为 Embed & Sign

     如下图：

     ![SUD](/Users/zqw/Documents/project/git/divtoss/gamedemo/doc/sud-mgp-doc/Resource/Client/bitcode.png)

     ![SUD](/Users/zqw/Documents/project/git/divtoss/gamedemo/doc/sud-mgp-doc/Resource/Client/target.png)

   ![SUD](/Users/zqw/Documents/project/git/divtoss/gamedemo/doc/sud-mgp-doc/Resource/Client/emed.png)

   

4. 如果项目使用CocoaPods，则编辑项目的Podfile，引用SDK所需第三方库，编辑如下：

   ```ruby
     # SudMGPSDK
     pod 'Masonry'
     pod 'AFNetworking', '~> 4.0'
     pod 'Toast', '~> 4.0.0'
     pod 'SDWebImage'
     pod 'XLForm', '~> 4.3'
     pod 'HXPhotoPicker/SDWebImage', '~> 3.2.1'
   ```

   然后执行pod install下载依赖库。

   如下图：

   ![SUD](/Users/zqw/Documents/project/git/divtoss/gamedemo/doc/sud-mgp-doc/Resource/Client/podfile.png)

   如果项目未使用CocoaPods，则可查看 [CocoaPods集成方法](https://cocoapods.org)

5. 项目新建两个ViewController,一个为游戏列表GameListViewController，一个为游戏显示GameViewController。如下图：

   ![SUD](/Users/zqw/Documents/project/git/divtoss/gamedemo/doc/sud-mgp-doc/Resource/Client/file.png)

   

6. 在GameListViewController中初始化SDK，代码如下：

   ```objective-c
   #import "GameListViewController.h"
   #import "GameViewController.h"
   #import <SudMGPSDK/SudMGP.h>
   
   /**
    * 初始化游戏SDK
    *
    * @param appID      NSString        项目的appID
    * @param appKey     NSString        项目的appKey
    * @param isTestEnv  Boolean         是否是测试环境，true:测试环境, false:正式环境
    * @param gameID     NSInteger       游戏ID，如 碰碰我最强:1001；飞刀我最强:1002；你画我猜:1003
    */
   - (void)initGameSDKWithAppID:(NSString *)appID appKey:(NSString *)appKey isTestEnv:(Boolean)isTestEnv gameID:(NSInteger)gameID {
       [SudMGP initSDK:appID appKey:appKey isTestEnv:isTestEnv listener:^(int retCode, const NSString *retMsg) {
           if (retCode == 0) {
               // SudMGPSDK初始化成功,跳转游戏界面
               GameViewController *gameVC = [[GameViewController alloc] init];
               if (@available(iOS 13.0, *)) {
                   gameVC.modalInPresentation = YES;
               }
               gameVC.gameEnum = (int)gameID;
               gameVC.modalPresentationStyle = UIModalPresentationFullScreen;
               [self presentViewController:gameVC animated:YES completion:nil];
           } else {
               /// 初始化失败, 可根据业务重试
               NSLog(@"初始化sdk失败");
           }
       }];
   }
   ```

   

7. 在GameViewController加载游戏view，销毁GameViewController需要调用destroyMG方法，代码入下所示：

   ```objective-c
   #import "GameViewController.h"
   #import <SudMGPSDK/ISudFSMMG.h>
   #import <SudMGPSDK/ISudFSTAPP.h>
   #import <SudMGPSDK/SudMGP.h>
   #import <SudMGPSDK/ISudFSMStateHandle.h>
   
   @interface GameViewController () <ISudFSMMG>
   @property (nonatomic, strong) id<ISudFSTAPP> fsmAPP2MG;
   @end
   
   @implementation GameViewController
   
   - (void)viewDidLoad {
       [super viewDidLoad];
       
       self.view.backgroundColor = [UIColor whiteColor];
       
       /// 加载MG
       NSString *demoCode = @"xxxxxxxxxxxxxxxx";
       [self loadMG:@"xxxxxx" roomId:@"xxx" code:demoCode mgId: xxxxxxx language:@"zh-CN" fsmMG:self rootView:self.view];
   }
   
   /** 加载游戏MG
    *
    * @param userId 用户唯一ID
    * @param roomId 房间ID
    * @param code 游戏登录code
    * @param mgId 游戏ID
    * @param language 支持简体"zh-CN "    繁体"zh-TW"    英语"en-US"   马来"ms-MY"
    * @param fsmMG 控制器
    * @param rootView 游戏根视图
    */
   - (void)loadMG: (NSString *)userId roomId: (NSString *)roomId code: (NSString *)code mgId: (int)mgId language: (NSString *)language fsmMG:(id)fsmMG rootView: (UIView*)rootView {
       self.fsmAPP2MG = [SudMGP loadMG:userId roomId:roomId code:code mgId:mgId language:language fsmMG:fsmMG rootView:rootView];
   }
   
   /// 销毁MG
   - (void)destroyMG {
       [self.fsmAPP2MG destroyMG];
   }
   ```

   

8. GameViewController需要实现 ISudFSMMG 代理协议，具体可参考SDK Demo工程

   ```objective-c
   #import "GameViewController.h"
   #import <SudMGPSDK/ISudFSMMG.h>
   #import <SudMGPSDK/ISudFSTAPP.h>
   #import <SudMGPSDK/SudMGP.h>
   #import <SudMGPSDK/ISudFSMStateHandle.h>
   
   @interface GameViewController () <ISudFSMMG>
   @property (nonatomic, strong) id<ISudFSTAPP> fsmAPP2MG;
   @end
   
   @implementation GameViewController
   
   #pragma mark - APP-->MG 状态
   /// 状态通知（app to mg）
   /// @param state 状态名称
   /// @param dataJson 需传递的json
   - (void)gameNotifyStateChange:(NSString *) state dataJson:(NSString*) dataJson {
       [self.fsmAPP2MG notifyStateChange:state dataJson:dataJson listener:^(int retCode, const NSString *retMsg, const NSString *dataJson) {
           NSLog(@"retCode=%@ retMsg=%@ dataJson=%@", @(retCode), retMsg, dataJson);
       }];
   }
     
    #pragma mark - ISudFSMMG
   /// code到期通知
   - (void)onExpireCode:(id<ISudFSMStateHandle>)handle dataJson:(NSString *)dataJson {
       NSLog(@"onExpireCode");
   }
   
   /// 获取游戏视图信息
   - (void)onGetGameViewInfo:(id<ISudFSMStateHandle>)handle dataJson:(NSString *)dataJson {
       NSLog(@"onGetGameViewInfo");
   }
   
   /// 通用状态-游戏
   - (void)onGameStateChange:(id<ISudFSMStateHandle>)handle state:(NSString *)state dataJson:(NSString *)dataJson {
       NSLog(@"onGameStateChange state: %@ --dataJson: %@", state, dataJson);
   }
   
   /// 游戏状态变更
   - (void)onPlayerStateChange:(id<ISudFSMStateHandle>)handle userId:(NSString *)userId state:(NSString *)state dataJson:(NSString *)dataJson {
       NSLog(@"onPlayerStateChange userId: %@ --state: %@ --dataJson: %@", userId, state, dataJson);
   }
     
   @end
   ```

   

   