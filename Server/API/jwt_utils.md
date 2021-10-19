#

![SUD](../../Resource/logo.png)

[Toc]

```go
//UserClaims 用户信息类，作为生成token的参数
type UserClaims struct {
    Uid   string `json:"uid"`
    AppID string `json:"app_id"`
    //jwt-go提供的标准claim
    jwt.StandardClaims
}

// GetToken 生成token
func GetToken(claims *UserClaims, secret string) (string, int64, error)

// ParseToken 解析Token
func ParseToken(tokenString string, secret string) (*UserClaims, error)

// UpdateToken 更新token
func UpdateToken(tokenString string, secret string) (string, int64, error)
```
