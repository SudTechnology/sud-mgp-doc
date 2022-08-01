## Http API ##

###Http:Post(url,body, callback, timeout)
- 说明

```txt
以post方式打开url
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|url|是|String|url|
|body|否|String|json text|
|callback|否|function|回调|
|timeout|否|int|超时 单位:秒|

- 返回值(json object)

|参数名|类型|说明|
|:----|:---|-----|
|error|string|错误消息|
|text|string|返回的text|

- 示例：

```lua
Http:Post("http://www.xxx.com","{'body':'test'}",function(jsonobj) end,5)
```

###Http:Get(url, callback, downloadHandler, timeout)
- 说明

```txt
以get方式打开url
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|url|是|String|url|
|callback|否|function|回调|
|downloadHandler|否|downloadHandler|支持downloadHandler，DownloadHandlerAudioClip，DownloadHandlerAssetBundle，DownloadHandlerBuffer，DownloadHandlerFile，DownloadHandlerScript，DownloadHandlerTexture|
|timeout|否|int|超时 单位:秒|

- 返回值(json object)

|参数名|类型|说明|
|:----|:---|-----|
|error|string|错误消息|
|text|string|返回的text|

- 示例：

```lua
local texD1 = DownloadHandlerTexture.New(true)
Http:Get(url,function(jsonobj)
    if not jsonobj.error then
        local myTexture= texD1.texture
        --to do ...
    end
end,texD1)
```


