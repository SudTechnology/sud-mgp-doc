#

![SUD](../../../Resource/logo.png)

## Android

```java
public class SudNFT {

    /**
     * 获取SDK版本
     * @return 示例:"1.1.35.286"
     */
    public static String getVersion();

    /**
     * 获取SDK版本别名
     * @return 示例:"v1.1.35.286-et"
     */
    public static String getVersionAlias();

    /**
     * 初始化, 必须初始化后使用
     * @param model    初始化参数
     * @param listener 回调
     */
    public static void initNFT(SudInitNFTParamModel model, ISudNFTListenerInitNFT listener);

    /**
     * 获取支持钱包列表
     * @param listener 回调
     */
    public static void getWalletList(ISudNFTListenerGetWalletList listener);

    // region 国外钱包接口
    /**
     * 绑定钱包
     * @param model    参数
     * @param listener 回调
     */
    public static void bindWallet(SudNFTBindWalletParamModel model, ISudNFTListenerBindWallet listener);

    /**
     * 解绑钱包
     * @param model    参数
     * @param listener 回调
     */
    public static void unbindWallet(SudNFTUnbindWalletParamModel model, ISudNFTListenerUnbindWallet listener);

    /**
     * 获取NFT列表,必须授权成功之后才能获取NFT列表
     * @param model    参数
     * @param listener 回调
     */
    public static void getNFTList(SudNFTGetNFTListParamModel model, ISudNFTListenerGetNFTList listener);

    /**
     * 生成元数据使用唯一认证token
     * @param model    参数
     * @param listener 回调
     */
    public static void genNFTCredentialsToken(SudNFTCredentialsTokenParamModel model, ISudNFTListenerGenNFTCredentialsToken listener);

    /**
     * 移除元数据使用唯一认证token
     * @param model    参数
     * @param listener 回调
     */
    public static void removeNFTCredentialsToken(SudNFTRemoveCredentialsTokenParamModel model, ISudNFTListenerRemoveNFTCredentialsToken listener);
    // endregion 国外钱包接口

    // region 国内钱包接口
    /**
     * 发送短信验证码
     * @param model    参数
     * @param listener 回调
     */
    public static void sendSmsCode(SudNFTSendSmsCodeParamModel model, ISudNFTListenerSendSmsCode listener);

    /**
     * 绑定国内钱包
     * @param model    参数
     * @param listener 回调
     */
    public static void bindCnWallet(SudNFTBindCnWalletParamModel model, ISudNFTListenerBindCnWallet listener);

    /**
     * 获取国内NFT列表
     * @param model    参数
     * @param listener 回调
     */
    public static void getCnNFTList(SudNFTGetCnNFTListParamModel model, ISudNFTListenerGetCnNFTList listener);

    /**
     * 生成国内NFT使用唯一认证token
     * @param model    参数
     * @param listener 回调
     */
    public static void genCnNFTCredentialsToken(SudNFTCnCredentialsTokenParamModel model, ISudNFTListenerGenCnNFTCredentialsToken listener);

    /**
     * 移除国内NFT使用唯一认证token
     * @param model    参数
     * @param listener 回调
     */
    public static void removeCnNFTCredentialsToken(SudNFTRemoveCnCredentialsTokenParamModel model, ISudNFTListenerRemoveCnNFTCredentialsToken listener);

    /**
     * 解绑国内钱包
     * @param model    参数
     * @param listener 回调
     */
    public static void unbindCnWallet(SudNFTUnbindCnWalletParamModel model, ISudNFTListenerUnbindCnWallet listener);
    // endregion 国内钱包接口
}
```

## iOS

```objc
@interface SudNFT : NSObject

/// 获取版本号
/// @return 返回SDK版本号
+ (NSString *)getVersion;

/// 初始化, 必须初始化后使用
/// @param paramModel 参数model
/// @param listener 结果回调
+ (void)initNFT:(SudInitNFTParamModel *)paramModel listener:(ISudNFTListenerInitNFT _Nullable)listener;

/// 获取支持钱包列表
/// @param listener 返回支持钱包列表数据
+ (void)getWalletList:(ISudNFTListenerGetWalletList _Nullable)listener;

/// 绑定钱包
/// @param paramModel 参数model
/// @param listener 结果回调
+ (void)bindWallet:(SudNFTBindWalletParamModel *)paramModel listener:(id <ISudNFTListenerBindWallet>)listener;

/// 解绑钱包
/// @param paramModel 参数model
/// @param listener 结果回调
+ (void)unbindWallet:(SudNFTUnbindWalletParamModel *)paramModel listener:(ISudNFTListenerUnbindWallet _Nullable)listener;

/// 获取NFT列表,必须授权成功之后才能获取NFT列表
/// @param paramModel 参数model
/// @param listener 回调
+ (void)getNFTList:(SudNFTGetNFTListParamModel *)paramModel listener:(ISudNFTListenerGetNFTList _Nullable)listener;

/// 生成元数据使用唯一认证token
/// @param paramModel 参数model
/// @param listener 回调
+ (void)genNFTCredentialsToken:(SudNFTCredentialsTokenParamModel *)paramModel listener:(ISudNFTListenerGenNFTCredentialsToken)listener;

/// 移除元数据使用唯一认证token
/// @param paramModel 参数model
/// @param listener 回调
+ (void)removeNFTCredentialsToken:(SudNFTRemoveCredentialsTokenParamModel *)paramModel listener:(ISudNFTListenerRemoveNFTCredentialsToken)listener;

/// 处理三方APP拉起时universal link
/// @param userActivity userActivity description
+ (BOOL)handleOpenUniversalLink:(NSUserActivity *)userActivity;

#pragma mark CN

/// 发送短信验证码
/// @param paramModel 参数model
/// @param listener 回调
+ (void)sendSmsCode:(SudNFTSendSmsCodeParamModel *)paramModel listener:(ISudNFTListenerSendSmsCode)listener;

/// 绑定国内钱包
/// @param paramModel 参数model
/// @param listener 回调
+ (void)bindCnWallet:(SudNFTBindCnWalletParamModel *)paramModel listener:(ISudNFTListenerBindCnWallet)listener;

/// 获取国内NFT列表
/// @param paramModel 参数model
/// @param listener 回调
+ (void)getCnNFTList:(SudNFTGetCnNFTListParamModel *)paramModel listener:(ISudNFTListenerGetCnNFTList)listener;

/// 生成国内NFT使用唯一认证token
/// @param paramModel 参数model
/// @param listener 回调
+ (void)genCnNFTCredentialsToken:(SudNFTCnCredentialsTokenParamModel *)paramModel listener:(ISudNFTListenerCnGenNFTCredentialsToken)listener;

/// 移除元数据使用唯一认证token
/// @param paramModel 参数model
/// @param listener 回调
+ (void)removeNFTCnCredentialsToken:(SudNFTRemoveCnCredentialsTokenParamModel *)paramModel listener:(ISudNFTListenerRemoveNFTCnCredentialsToken)listener;

/// 解绑国内钱包
/// @param paramModel 参数
/// @param listener 回调
+ (void)unbindCnWallet:(SudNFTUnBindCnWalletParamModel *)paramModel listener:(ISudNFTListenerUnBindCnWallet)listener;
@end
```
