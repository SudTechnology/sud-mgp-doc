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
     * 初始化SDK
     * @param context
     * @param appId
     * @param appKey
     * @param isTestEnv
     * @param listener
     */
    public static void initSDK(Context context, String appId, String appKey, boolean isTestEnv, ISudListenerInitSDK listener);

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

```objective-c
@interface SudMGP : NSObject

+ (NSString*_Nullable) getVersion;

+ (void) initSDK:(NSString*_Nullable) appId appKey:(NSString*_Nullable) appKey isTestEnv:(BOOL) isTestEnv listener:(ISudListenerInitSDK _Nullable ) listener;

+ (void) getMGList:(ISudListenerGetMGList _Nullable ) listener;

+ (id<ISudFSTAPP>_Nonnull)loadMG:(NSString*_Nullable)userId roomId:(NSString*_Nullable)roomId code:(NSString*_Nullable)code mgId:(int)mgId language:(NSString*_Nullable)language fsmMG:(id<ISudFSMMG>_Nonnull)fsmMG rootView:(UIView*_Nullable)rootView;

+ (bool) destroyMG:(id<ISudFSTAPP>_Nullable) fstAPP;

+ (void) setLogLevel:(int) logLevel;

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
