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
