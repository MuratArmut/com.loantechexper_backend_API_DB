Feature: As a user, I want to access the user list transactions through API connection.

  Scenario: When a GET request with valid authorization information is sent to the user/list/transaction
  endpoint, the returned status code should be 200, and the response remark should be verified as "success"

    Given The API user sets "user/list/transaction" path parameters
    And The API user saves the response from the user list transaction endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: Verify that when a GET request is sent to the 'user/list/transaction' endpoint with invalid
  authorization information, the returned status code is 401, and the error message in the response body
  is "Unauthorized request"

    Given The API user sets "user/list/transaction" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline: Verify the information returned in the response for the entity with id(x)
  (user_id, amount, charge, post_balance, trx_type, trx, details, remark, created_at, updated_at)

    Given The API user sets "user/list/transaction" path parameters
    And The API user saves the response from the user list transaction endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: <user_id>, "<amount>", "<charge>", "<post_balance>", "<trx_type>", "<trx>", "<details>", "<remark>", "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | user_id | amount        | charge       | post_balance  | trx_type | trx          | details                            | remark   | created_at                  | updated_at                  |
      | 0         | 11      | 2500.00000000 | 225.00000000 | 5195.00000000 | -        | ZPPCKC28PXJT | 4,550.00 USD Withdraw Via Method 5 | withdraw | 2023-12-22T20:31:27.000000Z | 2023-12-22T20:31:27.000000Z |
