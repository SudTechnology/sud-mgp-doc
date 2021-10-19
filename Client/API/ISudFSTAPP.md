#

![SUD](../../Resource/logo.png)

[Toc]

## Android

```java
public interface ISudFSTAPP {

    View getGameView();

    boolean destroyMG();

    void changeMG(String userId, String roomId, String code, int mgId, ISudFSMMG fsmMg);

    void updateCode(String code, ISudListenerNotifyStateChange listener);

    String getGameState(String state);

    String getPlayerState(String userId, String state);

    void notifyStateChange(String state, String dataJson, ISudListenerNotifyStateChange listener);

    void startMG();
    void stopMG();
    void playMG();
    void pauseMG();

}
```

## iOS

```objective-c
@protocol ISudFSTAPP <NSObject>

- (UIView *) getGameView;

- (bool) destroyMG;

- (bool) changeMG:(NSString *)userId roomId:(NSString *)roomId code:(NSString *)code mgId:(int)mgId fsmMG:(id<ISudFSMMG>)fsmMG;

- (void) updateCode:(NSString *) code listener:(ISudListenerNotifyStateChange) listener;

- (NSString*) getGameState:(NSString*) state;

- (NSString*) getPlayerState:(NSString*) userId state:(NSString*) state;

- (void) notifyStateChange:(NSString*) state dataJson:(NSString*) dataJson listener:(ISudListenerNotifyStateChange) listener;

@end
```
