#

![SUD](../../Resource/logo.png)

## loadMG接口
- [多语言参数 language](../Languages/README.md)
    * 格式：语言代码(小写)-国家代码(大写)
    * 示例: zh-CN、en-US、af-ZA

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

    /**
     * 传入的音频切片数据必须是：PCM格式，采样率：16000， 采样位数：16， 声道数： MONO
     * 100ms必须是音频切片长度的整数倍。切片长度可以是：10ms, 20ms, 50ms, 100ms
     * dataLength一定要是有效数据长度，否则精确性有影响
     */
    void pushAudio(ByteBuffer data, int dataLength);
    
    /**
     * 游戏加载失败，重新加载
     */
    void reloadMG();
}
```

## iOS

```objc
@protocol ISudFSTAPP <NSObject>

/// 获取游戏View
/// @return UIView
- (UIView *)getGameView;

/// 销毁游戏
/// @return boolean
- (bool)destroyMG;

/// 更新短期令牌code
/// @param code 短期令牌code
/// @param listener 回调只表示APP状态通知到了小游戏，不表示小游戏执行了别的逻辑代码（比如：游戏业务逻辑网络请求），一般传null。
- (void)updateCode:(NSString *) code listener:(ISudListenerNotifyStateChange) listener;

/// 获取游戏状态
/// @param state state
/// @return json
- (NSString*)getGameState:(NSString*) state;

/// 获取玩家状态
/// @param userId userId
/// @param state state
/// @return json
- (NSString*)getPlayerState:(NSString*) userId state:(NSString*) state;

/// APP状态通知给小游戏
/// @param state state
/// @param dataJson example: {"key": "value"}
/// @param listener 回调只表示APP状态通知到了小游戏，不表示小游戏执行了别的逻辑代码（比如：游戏业务逻辑网络请求），一般传null。
- (void)notifyStateChange:(const NSString *)state dataJson:(NSString *)dataJson listener:(ISudListenerNotifyStateChange) listener;

/// 继续游戏
- (void) playMG;

/// 暂停游戏
- (void) pauseMG;

/// 传入的音频切片数据必须是：PCM格式，采样率：16000， 采样位数：16， 声道数： MONO
/// 100ms必须是音频切片长度的整数倍。切片长度可以是：10ms, 20ms, 50ms, 100ms
/// @param data pcm数据
- (void)pushAudio:(NSData *)data;

/// 游戏加载失败，重新加载
- (void)reloadMG;
@end

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