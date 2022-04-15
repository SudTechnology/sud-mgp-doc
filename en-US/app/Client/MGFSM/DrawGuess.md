#

![SUD](../../Resource/logo.png)

## DrawGuess

> Tips
>
> 1. SudMGP ensures that states are sent from the game to the app serially.

> 2. After a state notification, SudMGP caches the latest **data** value based on the **state** value for the app to proactively obtain it at anytime.

### 1. Selecting words (modified)
- Earliest version: V1.1.30.xx

- state

```
mg_dg_selecting
```

- data

```json
{
	"isSelecting": true	// Bool type. Valid values: true: Selecting words; false: Not selecting words.
}
```

- Description

```txt
Indicates that the player is selecting words, and the state is displayed below the player's avatar.
```

### 2. Drawing (modified)
- Earliest version: V1.1.30.xx

- state

```
mg_dg_painting
```

- data

```json
{
	isPainting: true // Valid values: true: Drawing; false: Cancel drawing.
}
```

- Description

```txt
Indicates that the player is drawing, and the state is displayed below the player's avatar.
```


### 3. Displaying incorrect answers (modified)
- Earliest version: V1.1.30.xx

- state

```
mg_dg_erroranswer
```

- data

```json
{
	"msg": "Incorrect answers" // String type. Display incorrect answers.
}
```

- Description

```txt
Indicates the incorrect answer of the player, which can contain up to six Chinese words and is displayed below the player's avatar.
```


### 4. Displaying the total points (modified)
- Earliest version: V1.1.30.xx

- state

```
mg_dg_totalscore
```

- data

```json
{
	"msg": "10" // String type. Total points.
}
```

- Description

```txt
Indicates the total points of the player, which is displayed in the top right corner of the player's avatar.
```

### 5. Displaying the points obtained from this round (modified)
- Earliest version: V1.1.30.xx

- state

```
mg_dg_score
```

- data

```json
{
	"msg": "10"	// String type. Display the points obtained from this round of game.
}
```

- Description

```txt
Indicates the points obtained from this round of game by the player, which is displayed below the player's avatar.
```
