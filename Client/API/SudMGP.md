#

![SUD](../../Resource/logo.png)

## Android

```java
public class SudMGP {
    
    public static String getVersion();

    public static void initSDK(Context context, String appId, String appKey, boolean isTestEnv, ISudListenerInitSDK listener);

    public static void getMGList(ISudListenerGetMGList listener);

    public static ISudFSTAPP loadMG(Activity activity, String userId, String roomId, String code, int mgId, String language, ISudFSMMG fsmMG);

    public static boolean destroyMG(ISudFSTAPP fstApp);

    public static void setLogLevel(int logLevel);

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

@end
```
