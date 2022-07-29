#

![SUD](../../Resource/logo.png)

- [ISudFSMMG](./API/ISudFSMMG.md)
  - [onGetGameViewInfo](./ISudFSMMG/onGetGameViewInfo.md)
  - [onGetGameCfg](./ISudFSMMG/onGetGameCfg.md)

## Android

```java
public interface ISudFSMMG {
    /**
     * Game log.
     * Earliest version: V1.1.30.xx.
     */
    void onGameLog(String dataJson);

    /**
     * Game loading progress (loadMG)
     * @param stage stage: start=1,loading=2,end=3
     * @param retCode Error code: 0 success
     * @param progress progress: [0, 100]
     * Minimum version: v1.1.52.xx
     */
    void onGameLoadingProgress(int stage, int retCode, int progress);
  
    /**
     * Start game.
     * Earliest version: V1.1.30.xx.
     */
    void onGameStarted();

    /**
     * Destroy game.
     * Earliest version: V1.1.30.xx.
     */
    void onGameDestroyed();

    /**
     * Code expired.
     * The app client needs to call handle.success or handle.fail.
     * @param dataJson {"code":"value"}
     */
    void onExpireCode(ISudFSMStateHandle handle, String dataJson);

    /**
     * Obtain the game view information.
     * The app client needs to call handle.success or handle.fail.
     * @param handle
     * @param dataJson {}
     */
    void onGetGameViewInfo(ISudFSMStateHandle handle, String dataJson);

    /**
     * Obtain the game Config.
     * The app client needs to call handle.success or handle.fail.
     * @param handle
     * @param dataJson {}
     * Earliest version: V1.1.30.xx.
     */
    void onGetGameCfg(ISudFSMStateHandle handle, String dataJson);

    /**
     * Change game state.
     * The app client needs to call handle.success or handle.fail.
     * @param handle
     * @param state
     * @param dataJson
     */
    void onGameStateChange(ISudFSMStateHandle handle, String state, String dataJson);

    /**
     * Change game player state.
     * The app client needs to call handle.success or handle.fail.
     * @param handle
     * @param userId
     * @param state
     * @param dataJson
     */
    void onPlayerStateChange(ISudFSMStateHandle handle, String userId, String state, String dataJson);

}
```

## iOS

```objectivec
@protocol ISudFSMMG <NSObject>

/**
* Game log.
* Earliest version: V1.1.30.xx.
*/
-(void) onGameLog:(NSString*)dataJson;

/**
* Start game.
* Earliest version: V1.1.30.xx.
*/
-(void) onGameStarted;

/**
 * Destroy game.
 * Earliest version: V1.1.30.xx.
 */
-(void) onGameDestroyed;

/**
 * Code expired.
 * The app client needs to call handle.success or handle.fail.
 * @param dataJson {"code":"value"}
 */
-(void) onExpireCode:(id<ISudFSMStateHandle>)handle dataJson:(NSString*)dataJson;

/**
 * Obtain the game view information.
 * The app client needs to call handle.success or handle.fail.
 * @param handle
 * @param dataJson {}
 */
-(void) onGetGameViewInfo:(id<ISudFSMStateHandle>) handle dataJson:(NSString*)dataJson;

/**
 * Obtain the game Config.
 * The app client needs to call handle.success or handle.fail.
 * @param handle
 * @param dataJson {}
 * Earliest version: V1.1.30.xx.
 */
-(void) onGetGameCfg:(id<ISudFSMStateHandle>) handle dataJson:(NSString*)dataJson;

/**
 * Change game state.
 * The app client needs to call handle.success or handle.fail.
 * @param handle
 * @param state
 * @param dataJson
 */
-(void) onGameStateChange:(id<ISudFSMStateHandle>) handle state:(NSString*) state dataJson:(NSString*) dataJson;

/**
 * Change game player state.
 * The app client needs to call handle.success or handle.fail.
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