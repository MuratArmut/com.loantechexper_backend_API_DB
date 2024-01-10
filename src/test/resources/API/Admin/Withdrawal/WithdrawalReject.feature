Feature: As an administrator, I want to be able to reject the withdrawal information of a user with a given ID through the API connection.

  Scenario Outline: When a valid POST request is sent to the 'api/withdrawal/reject/{{id}}' endpoint with
  proper authorization information, the correct (id), and accurate data (details) in the body, the expected
  behavior is that the status code in the response is 200. Additionally, the remark information in the response
  body should be confirmed as "success"

    Given The API user sets "api/withdrawal/reject/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api withdrawal reject endpoint
    When The API user sends a POST request and records the response returned from the api withdrawal reject endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

    Examples:
      | id |
      | 68 |


  Scenario Outline: When a valid POST request is sent to the 'api/withdrawal/reject/{{id}}' endpoint with
  proper authorization information, the correct (id), and without including data (details) in the body,
  the expected behavior is that the status code in the response is 200. Additionally, the remark information
  in the response body should be confirmed as "success"

    Given The API user sets "api/withdrawal/reject/<id>" path parameters
    And The API user prepares a POST request without any data to send to the api withdrawal reject endpoint
    When The API user sends a POST request and records the response returned from the api withdrawal reject endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

    Examples:
      | id |
      | 70 |


  Scenario Outline: Verify that when a POST request with valid authorization information and a
  previously rejected (id) along with a body containing data fields (details) is sent to the
  'api/withdrawal/reject/{{id}}' endpoint, the returned status code is 203, and the message
  information in the response body is "No withdraw or withdraw status is not pending."

    Given The API user sets "api/withdrawal/reject/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api withdrawal reject endpoint
    When The API user sends a POST request and records the response returned from the api withdrawal reject endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No withdraw or withdraw status is not pending."

    Examples:
      | id |
      | 68 |


  Scenario: When a valid POST request is sent to the 'api/withdrawal/reject/{{id}}' endpoint with proper
  authorization information and without including the required (id) in the body (details), the expected
  behavior is that the status code in the response is 203. Additionally, the message information in the
  response body should be confirmed as "No id"

    Given The API user sets "api/withdrawal/reject" path parameters
    And The API user prepares a POST request containing the correct data to send to the api withdrawal reject endpoint
    When The API user sends a POST request and records the response returned from the api withdrawal reject endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a valid POST request is sent to the 'api/withdrawal/reject/{{id}}' endpoint with
  proper authorization information and an (id) that corresponds to a non-existent record, along with a POST
  body (details), the expected behavior is that the status code in the response is 203. Additionally, the
  message information in the response body should be confirmed as "No withdraw."


    Given The API user sets "api/withdrawal/reject/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api withdrawal reject endpoint
    When The API user sends a POST request and records the response returned from the api withdrawal reject endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No withdraw."

    Examples:
      | id  |
      | 895 |


  Scenario Outline: When an invalid POST request with unauthorized authorization information is sent to the
  'api/withdrawal/reject/{{id}}' endpoint, with the correct (id) and a POST body (details), the expected
  behavior is that the status code in the response is 401. Furthermore, the error information in the response
  body should be confirmed as "Unauthorized request"

    Given The API user sets "api/withdrawal/reject/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api withdrawal reject endpoint
    When The API user sends a POST request and records the response returned from the api withdrawal reject endpoint with invalid authorization information
    Then The API user verifies that the status code is 401
    And The API user verifies that the error information in the response body is "Unauthorized request"

    Examples:
      | id |
      | 68 |