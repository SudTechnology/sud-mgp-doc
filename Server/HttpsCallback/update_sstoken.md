#

![SUD](../../Resource/logo.png)

[Toc]

##### 简要描述

- 更新token

##### 请求URL(该地址需要通知sud 进行配置)
- 开发环境` https://xxx/v1/update_sstoken`

  
##### 请求方式
- POST 

##### 参数

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|ss_token |是  |string |token   |


##### 返回示例 

``` 
{
    "ret_code": 0,
    "ret_msg": "",
    "data": {
        "ss_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIxMzgwMTAwMTc3MTUwMzQ1MjY2IiwiZXhwIjoxNjMwNTgwMTU2LCJhcHBfaWQiOiJhcHBJRCJ9.A9VAOC2ltCn_6pVn3jA8zHBos6QQs0_1_RnxsuK9M44",
        "expire_date": 1630580156184
    }
}
```

##### 返回参数说明 
expire 过期时间（毫秒数）






