#

![SUD](../../Resource/logo.png)

## Android

```java
public interface ISudCfg {
    /**
     * 获取加载游戏时，是否显示游戏背景图
     * @return true:显示 false:隐藏 默认:显示true
     * 最低版本：v1.1.46.xx
     */
    boolean getShowLoadingGameBg();

    /**
     * 设置加载游戏时，是否显示游戏背景图
     * @param show true:显示 false:隐藏
     * 最低版本：v1.1.46.xx
     */
    void setShowLoadingGameBg(boolean show);

    /**
     * 获取加载游戏时，是否要显示自定义的Loading效果
     * @return true:显示 false:SDK默认Loading效果 默认:显示SDK默认Loading效果
     * 最低版本：v1.1.52.xx
     */
    boolean getShowCustomLoading();

    /**
     * 设置加载游戏时，是否要显示自定义的Loading效果
     * @param show true:自定义 false:SDK默认Loading效果
     * 最低版本：v1.1.52.xx
     */
    void setShowCustomLoading(boolean show);

    /**
     * 添加游戏嵌入包路径
     * @param mgId 游戏id
     * @param mgPath 游戏路径，app assets路径下
     * 最低版本：v1.1.52.xx
     */
    void addEmbeddedMGPkg(long mgId, String mgPath);

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
    String getEmbeddedMGPkgPath(long mgId);
}
```

## iOS

```objectivec
@protocol ISudCfg <NSObject>
/// 获取加载游戏时，是否显示游戏背景图
/// @return true:显示 false:隐藏 默认:显示true
/// 最低版本：v1.1.46.xx
-(BOOL) getShowLoadingGameBg;

/// 设置加载游戏时，是否显示游戏背景图
/// @param show true:显示 false:隐藏
/// 最低版本：v1.1.46.xx
-(void) setShowLoadingGameBg:(BOOL) show;

/// 获取加载游戏时，是否要显示自定义的Loading效果
/// @return true:显示 false:SDK默认Loading效果 默认:显示SDK默认Loading效果
/// 最低版本：v1.1.52.xx
- (BOOL)getShowCustomLoading;

/// 设置加载游戏时，是否要显示自定义的Loading效果
/// @param show true:自定义 false:SDK默认Loading效果
/// 最低版本：v1.1.52.xx
- (void)setShowCustomLoading:(BOOL) show;

/// 添加游戏嵌入包路径
/// @param mgId 游戏id
/// @param mgPath 游戏路径，app assets路径下
/// 最低版本：v1.1.52.xx
- (void)addEmbeddedMGPkg:(int64_t) mgId mgPath:(NSString*) mgPath;

/// 移除游戏嵌入包
/// @param mgId
/// 最低版本：v1.1.52.xx
- (void)removeEmbeddedMGPkg:(int64_t) mgId;

/// 获取游戏嵌入包路径
/// @param mgId
/// @return mgPath
/// 最低版本：v1.1.52.xx
- (NSString *)getEmbeddedMGPkgPath:(int64_t) mgId;
@end
```