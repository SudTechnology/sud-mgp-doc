#

![SUD](../../Resource/logo.png)

## Android

```java
public class SudMGP {
    /**
     * 获取SDK版本
     * @return
     */
    public static String getVersion();

    /**
     * 获取SDK版本别名
     * @return 示例:"v1.1.35.286-et"
     */
    public static String getVersionAlias() {
        return Version.kVersionAlias;
    }

    /**
     * 获取配置 最低支持版本v1.1.46.449
     * @return ISudCfg
     */
    public static ISudCfg getCfg();
    
    /**
     * 初始化SDK
     * @param context
     * @param appId
     * @param appKey
     * @param isTestEnv
     * @param listener
     */
    public static void initSDK(Context context, String appId, String appKey, boolean isTestEnv, ISudListenerInitSDK listener);

    /**
     * 反初始化SDK
     * @param listener
     */
    public static void uninitSDK(ISudListenerUninitSDK listener);
    
    /**
     * 获取游戏列表
     * @param listener
     */
    public static void getMGList(ISudListenerGetMGList listener);

    /**
     * 加载游戏
     * @param activity
     * @param userId
     * @param roomId
     * @param code
     * @param mgId
     * @param language
     * @param fsmMG
     * @return
     */
    public static ISudFSTAPP loadMG(Activity activity, String userId, String roomId, String code, int mgId, String language, ISudFSMMG fsmMG);

    /**
     * 销毁游戏
     * @param fstApp
     * @return
     */
    public static boolean destroyMG(ISudFSTAPP fstApp);

    /**
     * 设置统计上报userId
     * @param userId
     */
    public static void setUserId(String userId);

    /**
     * 设置统计上报回调，回调在UI/Main线程
     * @param listener
     * @return
     */
    public static boolean setReportStatsEventListener(ISudListenerReportStatsEvent listener);
        
    /**
     * 设置日志等级
     * @param logLevel
     */
    public static void setLogLevel(int logLevel);

    /**
     * 设置接管日志
     * @param logger
     */
    public static void setLogger(ISudLogger logger);

}
```

## iOS

```objc
@interface SudMGP : NSObject

/**
 * 获取SDK版本
 * @return 示例:"1.1.35.286"
 */
+ (NSString*_Nonnull)getVersion;

/**
 * 获取配置 最低支持版本v1.1.46.449
 * @return ISudCfg
 */
+ (id<ISudCfg>_Nonnull)getCfg;

/**
 * 初始化SDK
 * @param context Context
 * @param appId 小游戏平台生成
 * @param appKey 小游戏平台生成
 * @param isTestEnv true:测试环境 false:生产环境
 * @param listener ISudListenerInitSDK
 */
+ (void)initSDK:(NSString*_Nonnull)appId
         appKey:(NSString*_Nonnull)appKey
      isTestEnv:(BOOL)isTestEnv
       listener:(ISudListenerInitSDK _Nullable )listener;

/**
 * 反初始化SDK
 * @param listener ISudListenerUninitSDK
 */
+ (void)uninitSDK:(ISudListenerUninitSDK _Nullable )listener;

/**
 * 获取游戏列表
 * @param listener ISudListenerGetMGList
 */
+ (void)getMGList:(ISudListenerGetMGList _Nullable )listener;

/**
 * 加载游戏
 * @param userId 用户ID，业务系统保证每个用户拥有唯一ID
 * @param roomId 房间ID，业务系统保证唯一性，进入同一房间内
 * @param code 短期令牌Code
 * @param mgId 小游戏ID，测试环境和生成环境小游戏ID是一致的
 * @param language 游戏语言 现支持，简体：zh-CN 繁体：zh-TW 英语：en-US 马来语：ms-MY
 * @param fsmMG ISudFSMMG
 * @param rootView 用于显示游戏的根视图
 * @return ISudFSTAPP
 */
+ (id<ISudFSTAPP>_Nonnull)loadMG:(NSString*_Nonnull)userId
                          roomId:(NSString*_Nonnull)roomId
                            code:(NSString*_Nonnull)code
                            mgId:(int64_t)mgId
                        language:(NSString*_Nonnull)language
                           fsmMG:(id<ISudFSMMG>_Nonnull)fsmMG
                        rootView:(UIView*_Nonnull)rootView;

/**
 * 销毁游戏
 * @param fstApp 加载游戏返回的对象ISudFSTAPP
 * @return boolean
 */
+ (bool)destroyMG:(id<ISudFSTAPP>_Nonnull) fstAPP;

/**
 * 设置统计上报userId
 * @param userId
 */
+ (void)setUserId:(NSString*)userId;

/**
 * 设置统计上报回调，回调在UI/Main线程
 * @param listener 回调
 * @return
 */
+ (bool)setReportStatsEventListener:(ISudListenerReportStatsEvent)listener;

/**
 * 设置日志等级
 * @param logLevel 输出log的等级,LogVERBOSE,LogDEBUG,LogINFO 见ISudLogger.h
 */
+ (void)setLogLevel:(int)logLevel;

/**
 * 游戏是否设置AudioSession；
 * 1. 当autoSet=true，则游戏设置AudioSession
 * 2. 当autoSet=false，则游戏不设置AudioSession
 * 3. 游戏默认是false
 * @param autoSet
 */
+ (void) autoSetAudioSession:(BOOL)autoSet;
@end
```

## API 调用时序图

![api](../../Resource/Client/sdk_api_sd.png)