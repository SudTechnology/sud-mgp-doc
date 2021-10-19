#

![SUD](../../Resource/logo.png)

[Toc]

## SudMGPAuth Go

```javascript
public class SudMGPAuth {

    public SudCode getCode(String uid);

    public SudSSToken getSSToken(String uid);

    public SudUid getUidByCode(String code);

    public SudUid getUidBySSToken(String ssToken);

    public boolean verify(String token);

}
```
