#

![SUD](../Resource/logo.png)

## Android 快速开始

### 1. 需要联系Sud.Tech为业务分配 `appId`、 `appKey`、 `appSecret`

### 2. 下载 [Android SDK SudMGP.aar](https://github.com/SudTechnology/sud-mgp-android/releases) 和 新接入Demo工程 [QuickStart](https://github.com/SudTechnology/hello-sud-plus-android/tree/master/project/QuickStart), 接入Demo [HelloSud-Android.zip](https://github.com/SudTechnology/hello-sud-android/releases)

### 3. 在工程中引入SDK：

    以Android Studio 4.2，Gradle 6.7.1，编程语言Java，工程HelloSud-Android为例：

    - 将 `SudMGP.aar` 拷贝到SudMgpExample-Android/app/libs目录

        如下图：

        ![SUD](../Resource/Client/libaar.png)

    - 编辑SudMgpExample-Android/app/build.gradle，增加SDK需要的配置

        ```groovy
        repositories {
            // 加载游戏SDK libs路径
            flatDir {
                dirs '../app/libs'
            }
        }
        dependencies {
            // 加载游戏SDK aar
            implementation fileTree(include: ['*.jar', "*.aar"], dir: 'libs')
            // SudMGP需引入okhttp
            implementation 'com.squareup.okhttp3:okhttp:4.9.2'
        
            ......
        }
        ```

### 4. 初始化 [SudMGP](./API/SudMGP.md) ，具体可参考[QuickStart](https://github.com/SudTechnology/hello-sud-plus-android/tree/master/project/QuickStart)

### 5. 对接 [SudMGP](./API/SudMGP.md) 相关生命周期回调，讲游戏View加入到原生布局中，具体可参考[QuickStart](https://github.com/SudTechnology/hello-sud-plus-android/tree/master/project/QuickStart)

### 6. 通过 [SudMGP](API/SudMGP.md) 加载小游戏，具体可参考[QuickStart](https://github.com/SudTechnology/hello-sud-plus-android/tree/master/project/QuickStart)

### 7. 可选：实现 [ISudFSMMG](API/ISudFSMMG.md) ，具体可参考[QuickStart](https://github.com/SudTechnology/hello-sud-plus-android/tree/master/project/QuickStart)

### 8. 可选：实现 [ISudFSTAPP](API/ISudFSTAPP.md) ，具体可参考[QuickStart](https://github.com/SudTechnology/hello-sud-plus-android/tree/master/project/QuickStart)

### 9. 销毁游戏 [SudMGP](API/SudMGP.md) ，具体可参考[QuickStart](https://github.com/SudTechnology/hello-sud-plus-android/tree/master/project/QuickStart)

### 10. API调用时序图

![api](../Resource/Client/sdk_api_sd.png)
