Feature: As an administrator, I want to be able to update the deposit information of a user in the system to 'approved' through the API connection.

  Scenario Outline: When a valid PATCH request is sent to the 'api/deposit/approve/{{id}}' endpoint with
  proper authorization information and the correct data (id) in the body, the expected behavior is that
  the status code in the response is 200. Additionally, the message information in the response body should
  be confirmed as "Deposit request approved successfully"

    Given The API user sets "api/deposit/approve/<id>" path parameters
    And The API user records the response from the api deposit approve endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Deposit request approved successfully"

    Examples:
      | id  |
      | 109 |


  Scenario Outline: Verify that when a PATCH request with valid authorization information and a previously
  approved (id) is sent to the 'api/deposit/approve/{{id}}' endpoint, the returned status code is 203, and the
  message information in the response body is "No deposit or deposit status is not pending."

    Given The API user sets "api/deposit/approve/<id>" path parameters
    And The API user records the response from the api deposit approve endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No deposit or deposit status is not pending."

    Examples:
      | id  |
      | 109 |


  Scenario: When a valid PATCH request is sent to the 'api/deposit/approve/{{id}}' endpoint with proper
  authorization information but without including the required (id) in the body, the expected behavior
  is that the status code in the response is 203. Additionally, the message information in the response
  body should be confirmed as "No id"

    Given The API user sets "api/deposit/approve" path parameters
    And The API user records the response from the api deposit approve endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a valid PATCH request is sent to the 'api/deposit/approve/{{id}}' endpoint with
  proper authorization information and an (id) that corresponds to a non-existent record in the body, the
  expected behavior is that the status code in the response is 203. Additionally, the message information
  in the response body should be confirmed as "No deposit."

    Given The API user sets "api/deposit/approve/<id>" path parameters
    And The API user records the response from the api deposit approve endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No deposit."

    Examples:
      | id  |
      | 987 |


  Scenario Outline: When an invalid PATCH request with unauthorized authorization information is sent to
  the 'api/deposit/approve/{{id}}' endpoint, the expected behavior is that the status code in the response
  is 401. Additionally, the error information in the response body should be confirmed as "Unauthorized request"

    Given The API user sets "api/deposit/approve/<id>" path parameters
    Then The API user records the response from the api deposit approve endpoint with invalid authorization information verifies that the status code is '401' and confirms that the error information is Unauthorized

    Examples:
      | id  |
      | 109 |
