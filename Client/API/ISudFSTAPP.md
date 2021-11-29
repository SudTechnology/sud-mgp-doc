#

![SUD](../../Resource/logo.png)

## Android

```java
public interface ISudFSTAPP {

    /**
     * 获取游戏View
     * @return
     */
    View getGameView();

    /**
     * 销毁游戏
     * @return
     */
    boolean destroyMG();

    /**
     * 更新code
     * @param code
     * @param listener
     */
    void updateCode(String code, ISudListenerNotifyStateChange listener);

    /**
     * 获取游戏状态
     * @param state
     * @return
     */
    String getGameState(String state);

    /**
     * 获取玩家状态
     * @param userId
     * @param state
     * @return
     */
    String getPlayerState(String userId, String state);

    /**
     * APP状态通知给小游戏
     * @param state
     * @param dataJson example: {"key": "value"}
     */
    void notifyStateChange(String state, String dataJson, ISudListenerNotifyStateChange listener);

    /**
     * 开始游戏
     */
    void startMG();

    /**
     * 停止游戏
     */
    void stopMG();

    /**
     * 继续游戏
     */
    void playMG();

    /**
     * 暂停游戏
     */
    void pauseMG();

}
```

## iOS

```objective-c
@protocol ISudFSTAPP <NSObject>

- (UIView *) getGameView;

- (bool) destroyMG;

- (void) updateCode:(NSString *) code listener:(ISudListenerNotifyStateChange) listener;

- (NSString*) getGameState:(NSString*) state;

- (NSString*) getPlayerState:(NSString*) userId state:(NSString*) state;

- (void) notifyStateChange:(NSString*) state dataJson:(NSString*) dataJson listener:(ISudListenerNotifyStateChange) listener;

@end
```
