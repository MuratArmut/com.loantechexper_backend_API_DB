Feature: An administrator (admin) should be able to access the deposit list via the API connection.

  Scenario: When a valid GET request is sent to the 'api/deposit/list' endpoint with proper authorization
  information, the expected behavior is that the status code in the response is 200, and the response's
  remark information is confirmed as "success"

    Given The API user sets "api/deposit/list" path parameters
    And The API user records the response from the api deposit list endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: When an invalid GET request is sent to the 'api/deposit/list' endpoint with unauthorized or
  invalid authorization information, the expected behavior is that the status code in the response is 401,
  and the response's error information is confirmed as "Unauthorized request"

    Given The API user sets "api/deposit/list" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline: Verify the information returned in the response for the one with Id(x)
  (user_id, method_code, amount, method_currency, charge, rate, final_amount, btc_amount,
  btc_wallet, trx, payment_try, status, from_api, admin_feedback, created_at, updated_at)

    Given The API user sets "api/deposit/list" path parameters
    And The API user records the response from the api deposit list endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: <user_id>, <method_code>, "<amount>", "<method_currency>", "<charge>", "<rate>", "<final_amo>", "<btc_amo>", "<trx>", <payment_try>, <status>, <from_api>, "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | user_id | method_code | amount        | method_currency | charge       | rate          | final_amo        | btc_amo | trx          | payment_try | status | from_api | created_at                  | updated_at                  |
      | 1         | 81      | 1001        | 1500.00000000 | EUR             | 335.00000000 | 1000.00000000 | 1835000.00000000 | 0       | 2WC3K58QCEP8 | 0           | 3      | 0        | 2024-01-04T09:24:24.000000Z | 2024-01-04T09:29:04.000000Z |