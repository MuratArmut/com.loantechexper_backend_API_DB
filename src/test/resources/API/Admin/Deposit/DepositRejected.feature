Feature: As an administrator, I want to be able to access rejected deposits through the API connection.

  Scenario: When a valid GET request is sent to the 'api/deposit/rejected' endpoint with proper authorization
  information, the expected behavior is that the status code in the response is 200, and the response's remark
  information is confirmed as "success"

    Given The API user sets "api/deposit/rejected" path parameters
    And The API user records the response from the api deposit rejected endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: When an invalid GET request is sent to the 'api/deposit/rejected' endpoint with unauthorized
  or invalid authorization information, the expected behavior is that the status code in the response is 401,
  and the response's error information is confirmed as "Unauthorized request"

    Given The API user sets "api/deposit/rejected" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline: Validate the information returned in the response for the one with ID(x) (user_id,
  method_code, amount, method_currency, charge, rate, final_amo, btc_amo, btc_wallet, trx, payment_try,
  status, from_api, admin_feedback, created_at, updated_at)

    Given The API user sets "api/deposit/rejected" path parameters
    And The API user records the response from the api deposit rejected endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: <user_id>, <method_code>, "<amount>", "<method_currency>", "<charge>", "<rate>", "<final_amo>", "<btc_amo>", "<trx>", <payment_try>, <status>, <from_api>, "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | user_id | method_code | amount        | method_currency | charge       | rate       | final_amo     | btc_amo | trx          | payment_try | status | from_api | created_at                  | updated_at                  |
      | 0         | 81      | 1000        | 4999.00000000 | USD             | 199.98000000 | 1.00000000 | 5198.98000000 | 0       | 58X8PP26GZWB | 0           | 3      | 0        | 2024-01-04T09:27:40.000000Z | 2024-01-04T09:28:39.000000Z |
