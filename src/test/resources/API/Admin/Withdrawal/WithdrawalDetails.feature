Feature: As an administrator, I want to be able to access withdrawal details with a specified ID through the API connection.

  Scenario Outline: When a valid GET request is sent to the 'api/withdrawal/details/{{id}}' endpoint with
  proper authorization information and the correct data (id), the expected behavior is that the status code
  in the response is 200, and the response's remark information is confirmed as "success"

    Given The API user sets "api/withdrawal/details/<id>" path parameters
    And The API user records the response from the api withdrawal details endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

    Examples:
      | id  |
      | 432 |


  Scenario: When a valid GET request is sent to the 'api/withdrawal/details/{{id}}' endpoint with proper
  authorization information but without including the required (id), the expected behavior is that the
  status code in the response is 203. Additionally, the message information in the response body should
  be confirmed as "No id"

    Given The API user sets "api/withdrawal/details" path parameters
    And The API user records the response from the api withdrawal details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a valid GET request is sent to the 'api/withdrawal/details/{{id}}' endpoint with
  proper authorization information and an (id) that corresponds to a non-existent record, the expected
  behavior is that the status code in the response is 203. Additionally, the message information in the
  response body should be confirmed as "No withdraw."

    Given The API user sets "api/withdrawal/details/<id>" path parameters
    And The API user records the response from the api withdrawal details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No withdraw."

    Examples:
      | id  |
      | 687 |


  Scenario Outline: When an invalid GET request with unauthorized authorization information is sent to the
  'api/withdrawal/details/{{id}}' endpoint, the expected behavior is that the status code in the response
  is 401. Furthermore, the error information in the response body should be confirmed as "Unauthorized request"

    Given The API user sets "api/withdrawal/details/<id>" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized

    Examples:
      | id  |
      | 432 |


  Scenario Outline: The content of the data (id, method_id, user_id, amount, currency, rate, charge, trx,
  final_amount, after_charge, status, admin_feedback, created_at, updated_at) in the response body should
  be verified.

    Given The API user sets "api/withdrawal/details/<id>" path parameters
    And The API user records the response from the api withdrawal details endpoint with valid authorization information
    Then The API user verifies the content of the data in the response body which includes <id>, <method_id>, <user_id>, "<amount>", "<currency>", "<rate>", "<charge>", "<trx>", "<final_amount>", "<after_charge>", <status>, "<admin_feedback>", "<created_at>", "<updated_at>"

    Examples:
      | id  | id  | method_id | user_id | amount        | currency | rate         | charge      | trx          | final_amount   | after_charge | status | admin_feedback | created_at                  | updated_at                  |
      | 432 | 432 | 8         | 71      | 1000.00000000 | dolar    | 100.00000000 | 70.00000000 | H19PC44UK2XS | 93000.00000000 | 930.00000000 | 1      | deneme         | 2024-01-02T18:36:00.000000Z | 2024-01-03T15:36:57.000000Z |