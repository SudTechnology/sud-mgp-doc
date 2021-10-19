#

![SUD](../../Resource/logo.png)

## Android

```java
public interface ISudFSMMG {

    void onExpireCode(ISudFSMStateHandle handle, String dataJson);

    void onGetGameViewInfo(ISudFSMStateHandle handle, String dataJson);

    void onGameStateChange(ISudFSMStateHandle handle, String state, String dataJson);

    void onPlayerStateChange(ISudFSMStateHandle handle, String userId, String state, String dataJson);

}
```

## iOS

```objective-c
@protocol ISudFSMMG <NSObject>

-(void) onExpireCode:(nullable id<ISudFSMStateHandle>)handle dataJson:(nullable NSString*)dataJson;

-(void) onGetGameViewInfo:(nullable id<ISudFSMStateHandle>) handle dataJson:(nullable NSString*)dataJson;

-(void) onGameStateChange:(nullable id<ISudFSMStateHandle>) handle state:(nullable NSString*) state dataJson:(nullable NSString*) dataJson;

-(void) onPlayerStateChange:(nullable id<ISudFSMStateHandle>) handle userId:(nullable NSString*) userId state:(nullable NSString*) state dataJson:(nullable NSString*) dataJson;

@end
```
