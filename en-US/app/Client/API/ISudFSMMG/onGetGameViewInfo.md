#

![SUD](../../../Resource/logo.png)


## Safe zone annotation
![GameCfg](../../../Resource/Client/gameview.png)

```txt
/**
 * Obtain the game view information.
 * @param handle
 * @param dataJson {}
 */
void onGetGameViewInfo(ISudFSMStateHandle handle, String dataJson);
```

## Example

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

## Parameters

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|dataJsonResp |Yes  |string |dataJsonResp   |
|view_size.width  |Yes  |int | The width of the game view. (Unit: pixel)   |
|view_size.height |Yes  |int |The height of the game view. (Unit: pixel)  |
|view_game_rect.left |Yes  |int |Offset to the left border of the view_size. (Unit: pixel)   |
|view_game_rect.top |Yes  |int |Offset to the top border of the view_size. (Unit: pixel)   |
|view_game_rect.right |Yes  |int |Offset to the right border of the view_size. (Unit: pixel)   |
|view_game_rect.bottom |Yes  |int |Offset to the bottom border of the view_size. (Unit: pixel)   |

