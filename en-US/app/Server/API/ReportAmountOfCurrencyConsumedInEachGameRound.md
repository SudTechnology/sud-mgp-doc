#

![SUD](../../Resource/logo.png)

## Description

- The server reports the amount of currency consumed in each game round.

## Request URL

- Test environment: For more information about the API URL, see the report_game_round_bill field in [ObtainServerEndAPIConfigurations.md].
- Production environment: For more information about the API URL, see the report_game_round_bil field in [ObtainServerEndAPIConfigurations.md].

## Request method
- Protocol: HTTPS
- Request method: POST
- Parameters are included in the request body in JSON format. (For more information, see "Sample request".)
- You must add the following information in the header: Content-Type: application/json
- You must add the following information in the header: Authorization

## Request header [Authorization]
- [Authorization implementation method](AuthorizationDescription.md)

## Request parameters

| Parameter             | Required  | Type              | Description                          |
|:----------------|:----|:----------------|-----------------------------|
| request_id      | Yes   | string          | The unique request ID, which is a string of up to 64 characters. |
| mg_id           | Yes   | string          | The game ID.                        |
| room_id         | Yes   | string          | The room ID.                         |
| round_id        | Yes   | string          | The game round ID.                       |
| total_amount    | Yes   | string          | The total amount of currency consumed in this game round, round to 2 decimal places. |
| payment_details | Yes   | PaymentDetail[] | The payment list of users in this game round. |
| payment_type    | Yes   | string          | The payment type. Enumeration value: <br> TICKET: Ticket   |

- PaymentDetail

| Parameter     | Required  | Type     | Description               |
|:--------|:----|:-------|------------------|
| user_id | Yes   | string | The user ID.             |
| amount  | Yes   | string | The amount of currency consumed, round to 2 decimal places.  |


## Sample request

```json
{
  "request_id": "1655285156000",
  "mg_id": "1461227817776713818",
  "room_id": "9009",
  "round_id": "ce56b6lzi1a7-cehorlmy01pq-ckmfkba10i7",
  "total_amount": "2",
  "payment_details": [{
    "user_id": "001",
    "amount": "1"
  }, {
    "user_id": "002",
    "amount": "1"
  }],
  "payment_type": "TICKET"
}
```

## Response parameters

- BaseResp

| Parameter      | Required  | Type                  | Description                |
|:---------|:----|:--------------------|-------------------|
| ret_code | Yes   | int                  | The response code.               |
| ret_msg | Yes   | string              | The response message.              |

## Sample response

```json
{
  "ret_code": 0,
  "ret_msg": "Success"
}
```
