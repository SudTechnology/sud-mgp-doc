#

![SUD](../../../Resource/logo.png)


```txt
/**
 * 获取游戏View信息
 * @param handle
 * @param dataJson {}
 */
void onGetGameViewInfo(ISudFSMStateHandle handle, String dataJson);
```

## 示例

```txt
handle.success(dataJsonResp);

dataJsonResp = {
    "view_size":{
        "width":768,
        "height":1080
    },
    "view_game_rect":{
        "left":0,
        "top":200,
        "right":0,
        "bottom":200
    }
}
```

## 参数

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|dataJsonResp |是  |string |dataJsonResp   |
|view_size.width  |是  |int | 整个游戏view大小（单位像素）   |
|view_size.height |是  |int |整个游戏view大小（单位像素）  |
|view_game_rect.left |是  |int |相对于view_size左边框偏移（单位像素）   |
|view_game_rect.top |是  |int |相对于view_size上边框偏移（单位像素）   |
|view_game_rect.right |是  |int |相对于view_size右边框偏移（单位像素）   |
|view_game_rect.bottom |是  |int |相对于view_size下边框偏移（单位像素）   |
