![SUD](../Resource/logo.png)

[Toc]

# SudMGP SDK - Android

更新时间 2021/10/19 10:00:00



## 快速开始

### Android接入流程

1. 与Sud商务团队洽谈合作事宜，获取项目的appid、appkey、appsecret、code、SudMGP SDK库链接和Demo工程等信息

2. 从SudMGPSDK库链接下载SudMGPSDK.aar

3. 在工程中引入SDK：

   以Android Studio 4.2，Gradle 6.7.1，编程语言Java，工程SudMgpExample-Android为例：

   - 将SudMGPSDK.aar拷贝到SudMgpExample-Android/app/libs目录

     如下图：

     ![SUD](../Resource/Client/libaar.png)

   - 编辑SudMgpExample-Android/app/build.gradle，增加SDK需要的配置

     ```groovy
     android {
       	......
         // 游戏SDK使用了viewBinding
         buildFeatures {
             viewBinding true
         }
     }
     
     repositories {
         // 加载游戏SDK libs路径
         flatDir {
             dirs '../app/libs'
         }
     }
     dependencies {
       	// 加载游戏SDK aar
         implementation fileTree(include: ['*.jar', "*.aar"], dir: 'libs')
         // 游戏SDK需引入glide库
         implementation 'com.github.bumptech.glide:glide:4.12.0'
     
     		......
     }
     ```

4. 新建注册GameActivity用于展示游戏界面

5. 在游戏列表入口界面跳转游戏界面GameActivity

   ```java
   	public static final int GAME_ID_BUMPER_CAR = 1001; // 游戏ID:碰碰车
   	public static final int GAME_ID_FLY_CUTTER = 1002; // 游戏ID:飞刀达人
   	public static final int GAME_ID_DRAW_GUESS = 1003; // 游戏ID:你画我猜
   
   	/**
     	* 打开-碰碰车游戏
     	*/
       public void startBumperCar(View view) {
           Intent intent = new Intent(this, GameActivity.class);
           intent.putExtra(GameActivity.KEY_GAME_ID, GAME_ID_BUMPER_CAR);
           startActivity(intent);
       }
   
       /**
        * 打开-飞刀达人游戏
        */
       public void startFlyCutter(View view) {
           Intent intent = new Intent(this, GameActivity.class);
           intent.putExtra(GameActivity.KEY_GAME_ID, GAME_ID_FLY_CUTTER);
           startActivity(intent);
       }
   
       /**
        * 打开-你画我猜游戏
        */
       public void startDrawGuess(View view) {
           Intent intent = new Intent(this, GameActivity.class);
           intent.putExtra(GameActivity.KEY_GAME_ID, GAME_ID_DRAW_GUESS);
           startActivity(intent);
       }
   
   
   ```

6. GameActivity初始化游戏SDK，加载游戏，回调生命周期并把游戏view加入项目界面

   ```java
   	 private ISudFSTAPP mISudFSTAPP; //调用游戏SDK的接口,成功加载游戏后可用
   
   	 /**
        * 1，初始化游戏SDK
        *
        * @param context   上下文
        * @param appID     appID
        * @param appKey    appKey
        * @param isTestEnv 是否是测试环境，true：测试环境，false：正式环境
        */
       private void initGameSDK(Context context, String appID, String appKey, Boolean isTestEnv) {
           SudMGP.initSDK(context, appID, appKey, isTestEnv, new ISudListenerInitSDK() {
               @Override
               public void onSuccess() {
                   showToast("初始化游戏SDK成功");
                   loadMG(GameActivity.this, mUserID, mRoomID, CODE, mGameId, mLanguage);
               }
   
               @Override
               public void onFailure(int code, String errInfo) {
                   showToast("初始化游戏SDK失败:" + code + "--errInfo:" + errInfo);
               }
           });
       }
   
       /**
        * 2，加载游戏
        *
        * @param activity 上下文Activity
        * @param userID   用户ID，业务系统保证每个用户拥有唯一ID
        * @param roomID   房间ID，进入同一房间内的
        * @param code     令牌
        * @param gameID   游戏ID
        * @param language 游戏语言 现支持，简体：zh-CN 繁体：zh-TW 英语：en-US 马来语：ms-MY
        */
       private void loadMG(Activity activity, String userID, String roomID, String code, int gameID, String language) {
           mISudFSTAPP = SudMGP.loadMG(activity, userID, roomID, code, gameID, language, mISudFSMMG);
           addGameView(mISudFSTAPP.getGameView());
       }
   
       /**
        * 3，将游戏view添加到我们的布局当中
        *
        * @param gameView
        */
       private void addGameView(View gameView) {
           FrameLayout container = findViewById(R.id.game_container);
           container.addView(gameView);
           appStateToMG();
       }
   
   		@Override
       protected void onStart() {
           super.onStart();
           if (mISudFSTAPP != null) {
               mISudFSTAPP.startMG();//启动游戏
           }
       }
   
       @Override
       protected void onResume() {
           super.onResume();
           if (mISudFSTAPP != null) {
               mISudFSTAPP.playMG();//开始游戏
           }
       }
   
       @Override
       protected void onPause() {
           super.onPause();
           if (mISudFSTAPP != null) {
               mISudFSTAPP.pauseMG();//暂停游戏
           }
       }
   
       @Override
       protected void onStop() {
           super.onStop();
           if (mISudFSTAPP != null) {
               mISudFSTAPP.stopMG();//停止游戏
           }
       }
   
       @Override
       protected void onDestroy() {
           super.onDestroy();
           if (mISudFSTAPP != null) {
               mISudFSTAPP.destroyMG();//释放资源
           }
       }
   ```

   

7. GameActivity实现ISudFSMMG接口，具体可参考SDK Demo工程

   ```java
   	 /**
        * 游戏SDK调用app的接口
        */
       private final ISudFSMMG mISudFSMMG = new ISudFSMMG() {
   
           /**
            * 回调此方法，表示令牌过期，此时需要刷新令牌并使用ISudFSMStateHandle回调
            * @param handle
            * @param dataJson
            */
           @Override
           public void onExpireCode(ISudFSMStateHandle handle, String dataJson) {
               
           }
   
           /**
            * 处理获取游戏视图信息
            * @param handle
            * @param dataJson
            */
           @Override
           public void onGetGameViewInfo(ISudFSMStateHandle handle, String dataJson) {
               
           }
   
           /**
            * 通知游戏，游戏视图信息
            * @param handle
            * @param gameViewWidth
            * @param gameViewHeight
            */
           private void notifyGameViewInfo(ISudFSMStateHandle handle, int gameViewWidth, int gameViewHeight) {
               
           }
   
           /**
            * 游戏状态变化
            * @param handle
            * @param state     状态名
            * @param dataJson  状态数据，json字符串
            */
           @Override
           public void onGameStateChange(ISudFSMStateHandle handle, String state, String dataJson) {
               Log.d(TAG, "onGameStateChange state:" + state + "--dataJson:" + dataJson);
           }
   
           /**
            * 玩家状态变化
            * @param handle
            * @param userId    玩家用户ID
            * @param state     状态名
            * @param dataJson  状态数据，json字符串。参考文档
            */
           @Override
           public void onPlayerStateChange(ISudFSMStateHandle handle, String userId, String state, String dataJson) {
               Log.d(TAG, "onPlayerStateChange userId:" + userId + "--state:" + state + "--dataJson:" + dataJson);
           }
       };
   ```

