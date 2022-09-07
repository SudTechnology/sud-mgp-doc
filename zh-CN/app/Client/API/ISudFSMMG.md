#

![SUD](../../Resource/logo.png)

- [ISudFSMMG](./API/ISudFSMMG.md)
  - [onGetGameViewInfo](./ISudFSMMG/onGetGameViewInfo.md)
  - [onGetGameCfg](./ISudFSMMG/onGetGameCfg.md)

## Android

```java
public interface ISudFSMMG {
    /**
     * 游戏日志
     * 最低版本：v1.1.30.xx
     */
    void onGameLog(String dataJson);

    /**
     * 游戏加载进度(loadMG)
     * @param stage 阶段：start=1,loading=2,end=3
     * @param retCode 错误码：0成功
     * @param progress 进度：[0, 100]
     * 最低版本：v1.1.52.xx
     */
    void onGameLoadingProgress(int stage, int retCode, int progress);
  
    /**
     * 游戏开始（游戏长连接建立完成）
     * 最低版本：v1.1.30.xx
     */
    void onGameStarted();

    /**
     * 游戏销毁
     * 最低版本：v1.1.30.xx
     */
    void onGameDestroyed();

    /**
     * Code过期
     * APP接入方需要调用handle.success或handle.fail
     * @param dataJson {"code":"value"}
     */
    void onExpireCode(ISudFSMStateHandle handle, String dataJson);

    /**
     * 获取游戏View信息
     * APP接入方需要调用handle.success或handle.fail
     * @param handle
     * @param dataJson {}
     */
    void onGetGameViewInfo(ISudFSMStateHandle handle, String dataJson);

    /**
     * 获取游戏Config
     * APP接入方需要调用handle.success或handle.fail
     * @param handle
     * @param dataJson {}
     * 最低版本：v1.1.30.xx
     */
    void onGetGameCfg(ISudFSMStateHandle handle, String dataJson);

    /**
     * 游戏状态变化
     * APP接入方需要调用handle.success或handle.fail
     * @param handle
     * @param state
     * @param dataJson
     */
    void onGameStateChange(ISudFSMStateHandle handle, String state, String dataJson);

    /**
     * 游戏玩家状态变化
     * APP接入方需要调用handle.success或handle.fail
     * @param handle
     * @param userId
     * @param state
     * @param dataJson
     */
    void onPlayerStateChange(ISudFSMStateHandle handle, String userId, String state, String dataJson);

}
```

## iOS

```objc
@protocol ISudFSMMG <NSObject>

/**
* 游戏日志
* 最低版本：v1.1.30.xx
*/
-(void) onGameLog:(NSString*)dataJson;

/**
* 游戏开始
* 最低版本：v1.1.30.xx
*/
-(void) onGameStarted;

/**
 * 游戏销毁
 * 最低版本：v1.1.30.xx
 */
-(void) onGameDestroyed;

/**
 * Code过期
 * APP接入方需要调用handle.success或handle.fail
 * @param dataJson {"code":"value"}
 */
-(void) onExpireCode:(id<ISudFSMStateHandle>)handle dataJson:(NSString*)dataJson;

/**
 * 获取游戏View信息
 * APP接入方需要调用handle.success或handle.fail
 * @param handle
 * @param dataJson {}
 */
-(void) onGetGameViewInfo:(id<ISudFSMStateHandle>) handle dataJson:(NSString*)dataJson;

/**
 * 获取游戏配置
 * APP接入方需要调用handle.success或handle.fail
 * @param handle
 * @param dataJson {}
 * 最低版本：v1.1.30.xx
 */
-(void) onGetGameCfg:(id<ISudFSMStateHandle>) handle dataJson:(NSString*)dataJson;

/**
 * 游戏状态变化
 * APP接入方需要调用handle.success或handle.fail
 * @param handle
 * @param state
 * @param dataJson
 */
-(void) onGameStateChange:(id<ISudFSMStateHandle>) handle state:(NSString*) state dataJson:(NSString*) dataJson;

/**
 * 游戏玩家状态变化
 * APP接入方需要调用handle.success或handle.fail
 * @param handle
 * @param userId
 * @param state
 * @param dataJson
 */
-(void) onPlayerStateChange:(nullable id<ISudFSMStateHandle>) handle userId:(NSString*) userId state:(NSString*) state dataJson:(NSString*) dataJson;

@end
```



## Web

```javascript
interface ISudFSMMG {
    /**
     * 游戏日志
     * 最低版本：v1.1.30.xx
     */
    onGameLog(dataJson: string): void

    /**
     * 游戏加载进度(loadMG)
     * @param stage 阶段：start=1,loading=2,end=3
     * @param retCode 错误码：0成功
     * @param progress 进度：[0, 100]
     * 最低版本：v1.1.52.xx
     */
    onGameLoadingProgress(stage: number, retCode: number, progress: number): void
  
    /**
     * 游戏开始（游戏长连接建立完成）
     * 最低版本：v1.1.30.xx
     */
    onGameStarted(): void

    /**
     * 游戏销毁
     * 最低版本：v1.1.30.xx
     */
    onGameDestroyed(): void;

    /**
     * Code过期
     * APP接入方需要调用handle.success或handle.fail
     * @param dataJson {"code":"value"}
     */
    onExpireCode(handle: ISudFSMStateHandle, dataJson: string): void;

    /**
     * 获取游戏View信息
     * APP接入方需要调用handle.success或handle.fail
     * @param handle
     * @param dataJson {}
     */
    onGetGameViewInfo(handle: ISudFSMStateHandle, dataJson: string): void;

    /**
     * 获取游戏Config
     * APP接入方需要调用handle.success或handle.fail
     * @param handle
     * @param dataJson {}
     * 最低版本：v1.1.30.xx
     */
    onGetGameCfg(handle: ISudFSMStateHandle, dataJson: string): void;

    /**
     * 游戏状态变化
     * APP接入方需要调用handle.success或handle.fail
     * @param handle
     * @param state
     * @param dataJson
     */
    onGameStateChange(
      handle: ISudFSMStateHandle,
      state: string,
      dataJson: string
    ): void
    
    /**
     * 游戏玩家状态变化
     * APP接入方需要调用handle.success或handle.fail
     * @param handle
     * @param userId
     * @param state
     * @param dataJson
     */
    onPlayerStateChange(
      handle: ISudFSMStateHandle,
      userId: string,
      state: string,
      dataJson: string
    ): void;    
}
```

## Unity

```C#
public interface ISudFSMMG
{
    /**
    * 游戏日志
    * 最低版本：v1.1.30.xx
    */
    void onGameLog(string dataJson);

    /**
    * 游戏加载进度(loadMG)
    * @param stage 阶段：start=1,loading=2,end=3
    * @param retCode 错误码：0成功
    * @param progress 进度：[0, 100]
    */
    void onGameLoadingProgress(int stage, int retCode, int progress);

    /**
    * 游戏开始（游戏长连接建立完成）
    * 最低版本：v1.1.30.xx
    */
    void onGameStarted();

    /**
    * 游戏销毁
    * 最低版本：v1.1.30.xx
    */
    void onGameDestroyed();

    /**
    * 短期令牌code过期
    * APP接入方需要调用handle.success或handle.fail
    * @param dataJson {"code":"value"}
    */
    void onExpireCode(ISudFSMStateHandle handle, string dataJson);

    /**
    * 获取游戏View信息
    * APP接入方需要调用handle.success或handle.fail
    * @param handle ISudFSMStateHandle
    * @param dataJson {}
    */
    void onGetGameViewInfo(ISudFSMStateHandle handle, string dataJson);

    /**
    * 获取游戏Config
    * APP接入方需要调用handle.success或handle.fail
    * @param handle ISudFSMStateHandle
    * @param dataJson dataJson
    * 最低版本：v1.1.30.xx
    */
    void onGetGameCfg(ISudFSMStateHandle handle, string dataJson);

    /**
    * 游戏状态变化
    * APP接入方需要调用handle.success或handle.fail
    * @param handle ISudFSMStateHandle
    * @param state state
    * @param dataJson dataJson
    */
    void onGameStateChange(ISudFSMStateHandle handle, string state, string dataJson);

    /**
    * 游戏玩家状态变化
    * APP接入方需要调用handle.success或handle.fail
    * @param handle ISudFSMStateHandle
    * @param userId userId
    * @param state state
    * @param dataJson dataJson
    */
    void onPlayerStateChange(ISudFSMStateHandle handle, string userId, string state, string dataJson);
}
```