Feature: As an administrator, I want to be able to access approved withdrawals through the API connection.

  Scenario: When a valid GET request is sent to the 'api/withdrawal/approved' endpoint with proper
  authorization information, the expected behavior is that the status code in the response is 200,
  and the response's remark information is confirmed as "success"

    Given The API user sets "api/withdrawal/approved" path parameters
    And The API user records the response from the api withdrawal approved endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: When an invalid GET request is sent to the 'api/withdrawal/approved' endpoint with unauthorized
  or invalid authorization information, the expected behavior is that the status code in the response is 401.
  Furthermore, the error information in the response body should be confirmed as "Unauthorized request"

    Given The API user sets "api/withdrawal/approved" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline: Verify the information in the response for the one with ID(x) (method_id, user_id,
  amount, currency, rate, charge, trx, final_amount, after_charge, status, admin_feedback, created_at,
  updated_at)

    Given The API user sets "api/withdrawal/approved" path parameters
    And The API user records the response from the api withdrawal approved endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: <method_id>, <user_id>, "<amount>", "<currency>", "<rate>", "<charge>", "<trx>", "<final_amount>", "<after_charge>", <status>, "<admin_feedback>", "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | method_id | user_id | amount        | currency | rate         | charge      | trx          | final_amount   | after_charge | status | admin_feedback | created_at                  | updated_at                  |
      | 0         | 8         | 71      | 1000.00000000 | dolar    | 100.00000000 | 70.00000000 | H19PC44UK2XS | 93000.00000000 | 930.00000000 | 1      | deneme         | 2024-01-02T18:36:00.000000Z | 2024-01-03T15:36:57.000000Z |
