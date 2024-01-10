Feature: As an administrator, I want to be able to reject the deposit information of a user with a given ID through the API connection.

  Scenario Outline: When a valid POST request is sent to the 'api/deposit/reject/{{id}}' endpoint with proper
  authorization information, the correct (id), and the accurate data (message) in the body, the expected
  behavior is that the status code in the response is 200. Additionally, the message information in the
  response body should be confirmed as "Deposit request rejected successfully"

    Given The API user sets "api/deposit/reject/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api deposit reject endpoint
    When The API user sends a POST request and records the response returned from the api deposit reject endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Deposit request rejected successfully"

    Examples:
      | id  |
      | 106 |


  Scenario Outline: When a valid POST request is sent to the 'api/deposit/reject/{{id}}' endpoint with
  proper authorization information, the correct (id), and a POST body that does not include the required
  data (message), the expected behavior is that the status code in the response is 200. Additionally,
  the message information in the response body should be confirmed as "Deposit request rejected successfully"

    Given The API user sets "api/deposit/reject/<id>" path parameters
    And The API user prepares a POST request without data to send to the api deposit reject endpoint
    When The API user sends a POST request and records the response returned from the api deposit reject endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Deposit request rejected successfully"

    Examples:
      | id  |
      | 107 |


  Scenario Outline: Verify that when a POST request with valid authorization information and a previously
  rejected (id) along with a body containing data fields (message) is sent to the 'api/deposit/reject/{{id}}'
  endpoint, the returned status code is 203, and the message information in the response body is "No deposit
  or deposit status is not pending."

    Given The API user sets "api/deposit/reject/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api deposit reject endpoint
    When The API user sends a POST request and records the response returned from the api deposit reject endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No deposit or deposit status is not pending."

    Examples:
      | id  |
      | 106 |


  Scenario: When a valid POST request is sent to the 'api/deposit/reject/{{id}}' endpoint with proper
  authorization information and a POST body that does not include the required (id) but includes (message),
  the expected behavior is that the status code in the response is 203. Additionally, the message information
  in the response body should be confirmed as "No id"

    Given The API user sets "api/deposit/reject" path parameters
    And The API user prepares a POST request containing the correct data to send to the api deposit reject endpoint
    When The API user sends a POST request and records the response returned from the api deposit reject endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a valid POST request is sent to the 'api/deposit/reject/{{id}}' endpoint with proper
  authorization information and a POST body containing an invalid (id) for a non-existent record (message),
  the expected behavior is that the status code in the response is 203. Additionally, the message information
  in the response body should be confirmed as "No deposit."

    Given The API user sets "api/deposit/reject/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api deposit reject endpoint
    When The API user sends a POST request and records the response returned from the api deposit reject endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No deposit."

    Examples:
      | id    |
      | 14578 |


  Scenario Outline: When an invalid POST request with unauthorized authorization information is sent to
  the 'api/deposit/reject/{{id}}' endpoint with the correct (id) and a POST body (message), the expected
  behavior is that the status code in the response is 401. Furthermore, the error information in the
  response body should be confirmed as "Unauthorized request"

    Given The API user sets "api/deposit/reject/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api deposit reject endpoint
    When The API user sends a POST request and records the response returned from the api deposit reject endpoint with invalid authorization information
    Then The API user verifies that the status code is 401
    And The API user verifies that the error information in the response body is "Unauthorized request"

    Examples:
      | id  |
      | 106 |
