## SudAudioMgr API ##
>**继承使用查看[AudioMgr](../comframeworkApi/AudioMgrAPI.md)**
###SudAudioMgr:init(soundList)
- 说明

```txt
声音管理器初始化，把soundList传入到sdk初始化
```
- 参数

|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|soundList|是|String|一个带声音列表的数组string|

- soundList示例：

```lua
[{"name":"BGM_night","url":"https://sud-static.sudden.ltd/game/werewolf/sounds/BGM_night.mp3","type":"mp3"},{"name":"BGM_vote","url":"https://sud-static.sudden.ltd/game/werewolf/sounds/BGM_vote.mp3","type":"mp3"}}]
```

###SudAudioMgr:playMusic(name, isLoop, url)
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

###SudAudioMgr:playSound(name, isLoop, url)
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
SudAudioMgr:playSound("BGM_night",false,"https://sud-static.sudden.ltd/game/werewolf/sounds/BGM_night.mp3")
```

###SudAudioMgr:hideMusic()
- 说明

```txt
隐藏音乐,关闭音乐
```

###SudAudioMgr:openMusic()
- 说明

```txt
开启音乐
```

###SudAudioMgr:hideSound()
- 说明

```txt
隐藏音效,关闭音效
```

###SudAudioMgr:openSound()
- 说明

```txt
开启音效
```

###SudAudioMgr:getGameSoundVolume()
- 说明

```txt
获取声音大小
```

- 返回值(int)