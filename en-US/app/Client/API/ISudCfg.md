#

![SUD](../../Resource/logo.png)

## Android

````java
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
````

##iOS

````objectivec
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
````