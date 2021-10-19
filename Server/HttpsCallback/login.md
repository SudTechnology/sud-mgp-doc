#

![SUD](../../Resource/logo.png)

[Toc]


​    
##### 简要描述

- sdk登录

## 请求URL

- 分为测试环境和生产环境，需要通知Sud分别进行配置
- 生产环境地址需要正式上线部署后才能生效


##### 请求方式
- GET 

##### 参数

- 无

##### 请求示例 
- 无


##### 返回示例 

``` 
 {
  "ret_code": 0,
  "ret_msg": "",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIxMzg3NzM0ODE5OTE5NjI2MjU4IiwiZXhwIjoxNjMwNDkyMzUwLCJhcHBfaWQiOiJhcHBJRCJ9.pQQep_BciQyHOgwfpnp7jhfUyZrnL9MYGdXt154Jyrs",
  "expireDate": "1630492350569"
}
```

##### 返回参数说明 
ret_code 返回码
token 认证token
expire_date 过期时间（毫秒数）
## 返回参数说明
|参数名|必选|类型|说明|
|:----|:---|:-----|-----|
|expire_date|是|int64|过期时间（毫秒数）|



