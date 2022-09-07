# 

![SUD](../../Resource/logo.png)

## Android

```java
public interface ISudCfg {
    /**
     * Get the game background image when loading the game
     * @return true: show false: hide Default: show true
     * Minimum version: v1.1.46.xx
     */
    boolean getShowLoadingGameBg();

    /**
     * Set whether to show the game background image when loading the game
     * @param show true: show false: hide
     * Minimum version: v1.1.46.xx
     */
    void setShowLoadingGameBg(boolean show);

    /**
     * Get whether to show a custom Loading effect when loading the game
     * @return true: show false: SDK default loading effect Default: show SDK default loading effect
     * Minimum version: v1.1.52.xx
     */
    boolean getShowCustomLoading();

    /**
     * Set whether to show a custom Loading effect when loading the game
     * @param show true: custom false: SDK default Loading effect
     * Minimum version: v1.1.52.xx
     */
    void setShowCustomLoading(boolean show);

    /**
     * Add game embed package path
     * @param mgId game id
     * @param mgPath game path, under app assets path
     * Minimum version: v1.1.52.xx
     */
    void addEmbeddedMGPkg(long mgId, String mgPath);

    /**
     * Remove game embed pack
     * @param mgId
     * Minimum version: v1.1.52.xx
     */
    void removeEmbeddedMGPkg(long mgId);

    /**
     * Get the path of the game embed package
     * @param mgId
     * @return mgPath
     * Minimum version: v1.1.52.xx
     */
    String getEmbeddedMGPkgPath(long mgId);
}
```

##iOS

```objc
@protocol ISudCfg <NSObject>
/// Get the game background image when loading the game
/// @return true: show false: hide Default: show true
/// Minimum version: v1.1.46.xx
-(BOOL) getShowLoadingGameBg;

/// Set whether to show the game background image when loading the game
/// @param show true: show false: hide
/// Minimum version: v1.1.46.xx
-(void) setShowLoadingGameBg:(BOOL) show;

/// Whether to show a custom Loading effect when loading the game
/// @return true: Show false: Default Loading effect of SDK Default: Show default Loading effect of SDK
/// Minimum version: v1.1.52.xx
- (BOOL)getShowCustomLoading;

/// Set whether to show a custom Loading effect when loading the game
/// @param show true: custom false: SDK default Loading effect
/// Minimum version: v1.1.52.xx
- (void)setShowCustomLoading:(BOOL) show;

/// Add the game embed package path
/// @param mgId game id
/// @param mgPath game path, under app assets path
/// Minimum version: v1.1.52.xx
- (void)addEmbeddedMGPkg:(int64_t) mgId mgPath:(NSString*) mgPath;

/// Remove the game embed package
/// @param mgId
/// Minimum version: v1.1.52.xx
- (void)removeEmbeddedMGPkg:(int64_t) mgId;

/// Get the path of the game embed package
/// @param mgId
/// @return mgPath
/// Minimum version: v1.1.52.xx
- (NSString *)getEmbeddedMGPkgPath:(int64_t) mgId;
@end
```

## Web

```javascript
interface ISudCfg {
  /**
   * 获取加载游戏时，是否显示游戏背景图
   * @return true:显示 false:隐藏 默认:显示true
   * 最低版本：v1.1.46.xx
   */
  getShowLoadingGameBg(): boolean;

  /**
   * 设置加载游戏时，是否显示游戏背景图
   * @param show true:显示 false:隐藏
   * 最低版本：v1.1.46.xx
   */
  setShowLoadingGameBg(show: boolean): void;

  /**
   * 获取加载游戏时，是否要显示自定义的Loading效果
   * @return true:显示 false:SDK默认Loading效果 默认:显示SDK默认Loading效果
   * 最低版本：v1.1.52.xx
   */
  getShowCustomLoading(): boolean;

  /**
   * 设置加载游戏时，是否要显示自定义的Loading效果
   * @param show true:自定义 false:SDK默认Loading效果
   * 最低版本：v1.1.52.xx
   */
  setShowCustomLoading(show: boolean): void;
}
```

## Unity

```C#
public interface ISudCfg
{
    /**
      * 获取加载游戏时，是否显示游戏背景图
      * @return true:显示 false:隐藏 默认:显示true
      * 最低版本：v1.1.46.xx
      */
    bool getShowLoadingGameBg();

    /**
      * 设置加载游戏时，是否显示游戏背景图
      * @param show true:显示 false:隐藏
      * 最低版本：v1.1.46.xx
      */
    void setShowLoadingGameBg(bool show);

    /**
      * 获取加载游戏时，是否要显示自定义的Loading效果
      * @return true:显示 false:SDK默认Loading效果 默认:显示SDK默认Loading效果
      * 最低版本：v1.1.52.xx
      */
    bool getShowCustomLoading();

    /**
      * 设置加载游戏时，是否要显示自定义的Loading效果
      * @param show true:自定义 false:SDK默认Loading效果
      * 最低版本：v1.1.52.xx
      */
    void setShowCustomLoading(bool show);

    /**
      * 添加游戏嵌入包路径
      * @param mgId 游戏id
      * @param mgPath 游戏路径，app assets路径下
      * 最低版本：v1.1.52.xx
      */
    void addEmbeddedMGPkg(long mgId, string mgPath);

    /**
      * 移除游戏嵌入包
      * @param mgId
      * 最低版本：v1.1.52.xx
      */
    void removeEmbeddedMGPkg(long mgId);

    /**
      * 获取游戏嵌入包路径
      * @param mgId
      * @return mgPath
      * 最低版本：v1.1.52.xx
      */
    string getEmbeddedMGPkgPath(long mgId);
}
```