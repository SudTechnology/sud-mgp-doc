#

![SUD](../Resource/logo.png)

## Quick start for Web

### 1. Contact Sud.Tech to obtain `appId`, `appKey`, `appSecret` for your service.

### 2. Install [sudmgp-sdk-js](https://www.npmjs.com/package/sudmgp-sdk-js) and the new Demo [QuickStart](https://github.com/SudTechnology/hello-sud-plus-h5/tree/master/QuickStart/react), the demo project [Hello-sud-plus-h5](https://hello-sud.sud.tech).

### 3. Import the SDK into the project.

 
 ```javascript
  npm install sudmgp-sdk-js
 ```

```javascript
 import {SudMGP} from 'sudmgp-sdk-js'
```


### 4. Initialize the [SudMGP](./API/SudMGP.md). For details, see [QuickStart](https://github.com/SudTechnology/hello-sud-plus-android/tree/master/project/QuickStart).

### 5. Integrate lifecycle callbacks of the [SudMGP](./API/SudMGP.md) and add the game view to the native layout. For details, see [QuickStart](https://github.com/SudTechnology/hello-sud-plus-android/tree/master/project/QuickStart).

### 6. Load the game using the [SudMGP](API/SudMGP.md). For details, see [QuickStart](https://github.com/SudTechnology/hello-sud-plus-android/tree/master/project/QuickStart).

### 7. Optional: Implement [`ISudFSMMG`](API/ISudFSMMG.md). For details, see [QuickStart](https://github.com/SudTechnology/hello-sud-plus-android/tree/master/project/QuickStart).

### 8. Optional: Implement [`ISudFSTAPP`](API/ISudFSTAPP.md). For details, see [QuickStart](https://github.com/SudTechnology/hello-sud-plus-android/tree/master/project/QuickStart).

### 9. Destroy Game with the [SudMGP](API/SudMGP.md). For details, see [QuickStart](https://github.com/SudTechnology/hello-sud-plus-android/tree/master/project/QuickStart).

### 10. Call sequence diagram of APP Cient and SudMGP

   ![api](../Resource/Client/sdk_api_sd.png)

