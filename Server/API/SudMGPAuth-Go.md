#

![SUD](../../Resource/logo.png)

## SudMGPAuth Go

```javascript

type SudMGPAuth struct {
	AppID     string
	AppSecret string
}

func NewSudMGPAuth(appID string, appSecret string) *SudMGPAuth {
	client := &SudMGPAuth{
		AppID:     appID,
		AppSecret: appSecret,
	}
	return client
}

func (client *SudMGPAuth) GetCode(uid string) *SudCode

func (client *SudMGPAuth) GetSSToken(uid string) *SudSSToken 

func (client *SudMGPAuth) GetUidByCode(code string) *SudUid 

func (client *SudMGPAuth) GetUidBySSToken(ssToken string) *SudUid

func (client *SudMGPAuth) VerifyCode(code string) bool 

func (client *SudMGPAuth) VerifySSToken(code string) bool 

```
