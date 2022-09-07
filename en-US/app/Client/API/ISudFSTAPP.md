#

![SUD](../../Resource/logo.png)

## loadMG API
- [Languages](../Languages/README.md)
    * Format: language code (lowercase letters)-country/region code (uppercase letters)
    * Example: zh-CN, en-US, and af-ZA

## Android

```java
public interface ISudFSTAPP {

    /**
     * Obtain the game view information.
     * @return
     */
    View getGameView();

    /**
     * Destroy game.
     * @return
     */
    boolean destroyMG();

    /**
     * Update code.
     * @param code
     * @param listener
     */
    void updateCode(String code, ISudListenerNotifyStateChange listener);

    /**
     * Obtain the game state.
     * @param state
     * @return
     */
    String getGameState(String state);

    /**
     * Obtain the player state.
     * @param userId
     * @param state
     * @return
     */
    String getPlayerState(String userId, String state);

    /**
     * Notify the game of the app state.
     * @param state
     * @param dataJson example: {"key": "value"}
     */
    void notifyStateChange(String state, String dataJson, ISudListenerNotifyStateChange listener);

    /**
     * Start game.
     */
    void startMG();

    /**
     * End game.
     */
    void stopMG();

    /**
     * Continue game.
     */
    void playMG();

    /**
     * Pause game.
     */
    void pauseMG();

    /**
     * The incoming audio slices must be in the PCM format, and be recorded with a sample rate of 16,000 Hz and a bit depth of 16-bit. The number of channels must be monophonic. 
     * The length of audio slices must be integers that can be divided evenly by 100. For example, 10 ms, 20 ms, 50 ms, and 100 ms.
     * The dataLength parameter must be a valid data length, otherwise the accuracy will be affected.
     */
    void pushAudio(ByteBuffer data, int dataLength);

    /**
     * Game failed to load, reload
     */
    void reloadMG();
}
```

## iOS

```objc
@protocol ISudFSTAPP <NSObject>

/// Obtain the game view information.
/// @return UIView
- (UIView *)getGameView;

/// Destroy game.
/// @return boolean
- (bool)destroyMG;

/// Update the short-term token code.
/// @param code Short-term token code.
/// @param listener The callback indicates that the game has received the app state rather than processed other logic codes, such as network request. Generally, the callback returns NULL.
- (void)updateCode:(NSString *) code listener:(ISudListenerNotifyStateChange) listener;

/// Obtain the game state.
/// @param state state
/// @return json
- (NSString*)getGameState:(NSString*) state;

/// Obtain the player state.
/// @param userId userId
/// @param state state
/// @return json
- (NSString*)getPlayerState:(NSString*) userId state:(NSString*) state;

/// Notify the game of the app state.
/// @param state state
/// @param dataJson example: {"key": "value"}
/// @param listener The callback indicates that the game has received the app state rather than processed other logic codes, such as network request. Generally, the callback returns NULL.
- (void)notifyStateChange:(const NSString *)state dataJson:(NSString *)dataJson listener:(ISudListenerNotifyStateChange) listener;

/// Continue game.
- (void) playMG;

/// Pause game.
- (void) pauseMG;

/// The incoming audio slices must be in the PCM format, and be recorded with a sample rate of 16,000 Hz and a bit depth of 16-bit. The number of channels must be monophonic. 
The length of audio slices must be integers that can be divided evenly by 100. For example, 10 ms, 20 ms, 50 ms, and 100 ms.
/// @param data PCM data.
- (void)pushAudio:(NSData *)data;
@end

/// Game failed to load, reload
- (void)reloadMG;
```



## Web

```javascript
interface ISudFSTAPP {

    /**
     * 获取游戏View
     * @return
     */
    getGameView();

    /**
     * 销毁游戏
     * @return
     */
    destroyMG(): boolean;
    /**
     * 更新code
     * @param code
     * @param listener
     */
    updateCode(code: string, listener: ISudListenerNotifyStateChange): void;

    /**
     * APP状态通知给小游戏
     * @param state
     * @param dataJson example: {"key": "value"}
     */
     notifyStateChange(
      state: string,
      dataJson: string,
      listener: ISudListenerNotifyStateChange
    ): void;
    
    /**
     * 游戏加载失败，重新加载
     */
    reloadMG(): void;
}
```

## Unity

```C#
public interface ISudFSTAPP
{
    /**
    * 销毁游戏
    * @return bool
    */
    bool destroyMG();

    /**
    * 更新短期令牌code
    * @param code 短期令牌code
    * @param listener 回调只表示APP状态通知到了小游戏，不表示小游戏执行了别的逻辑代码（比如：游戏业务逻辑网络请求），一般传null。
    */
    void updateCode(string code, ISudListenerNotifyStateChange listener);

    /**
    * 获取游戏状态
    * @param state state
    * @return json
    */
    string getGameState(string state);

    /**
    * 获取玩家状态
    * @param userId userId
    * @param state state
    * @return json
    */
    string getPlayerState(string userId, string state);

    /**
    * APP状态通知给小游戏
    * @param state state
    * @param dataJson example: {"key": "value"}
    * @param listener 回调只表示APP状态通知到了小游戏，不表示小游戏执行了别的逻辑代码（比如：游戏业务逻辑网络请求），一般传null。
    */
    void notifyStateChange(string state, string dataJson, ISudListenerNotifyStateChange listener);

    /**
    * 加载失败，重新加载游戏
    */
    void reloadMG();
}
```