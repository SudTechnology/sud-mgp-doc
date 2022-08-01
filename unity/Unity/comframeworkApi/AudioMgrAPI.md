## AudioMgr API ##
###AudioMgr:init(soundList)
- 说明

```txt
声音管理器初始化，把soundList传入到sdk初始化
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|soundList|是|object|一个带声音列表的数组 json object|

- soundList示例：

```lua
[{"name":"BGM_night","url":"https://sud-static.sudden.ltd/game/werewolf/sounds/BGM_night.mp3","type":"mp3"},{"name":"BGM_vote","url":"https://sud-static.sudden.ltd/game/werewolf/sounds/BGM_vote.mp3","type":"mp3"}}]
```

###AudioMgr:playMusic(name, isLoop, url)
- 说明

```txt
播放音乐
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|name|是|String|声音名字|
|isLoop|是|boolean|是否循环|
|url|是|String|声音文件url|

- 示例：

```lua
SudAudioMgr:playMusic("BGM_night",false,"https://sud-static.sudden.ltd/game/werewolf/sounds/BGM_night.mp3")
```

###AudioMgr.appCommonGameSoundVolum(volum)
- 说明

```txt
设置音量大小
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|volum|是|int|0-100|

###AudioMgr:playSound(name, isLoop, url)
- 说明

```txt
播放音乐
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|name|是|String|声音名字|
|isLoop|是|boolean|是否循环|
|url|是|String|声音文件路径,|


- 示例：

```lua
AudioMgr:playSound("BGM_night",false,"https://sud-static.sudden.ltd/game/werewolf/sounds/BGM_night.mp3")
```

###AudioMgr:hideMusic()
- 说明

```txt
隐藏音乐,关闭音乐
```

###AudioMgr:openMusic()
- 说明

```txt
开启音乐
```

###AudioMgr:hideSound()
- 说明

```txt
隐藏音效,关闭音效
```

###AudioMgr:openSound()
- 说明

```txt
开启音效
```

###AudioMgr:Dispose()
- 说明

```txt
销毁
```