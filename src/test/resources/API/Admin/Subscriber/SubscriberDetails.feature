Feature: "As an administrator, I want to access the subscriber details of a user with a specified ID via API connection.

  Scenario Outline:When a valid GET request with appropriate authorization credentials and correct data (id)
  is sent to the 'api/subscriber/details/{{id}}' endpoint, it should return a status code of 200, and the
  response remark should be "success"

    Given The API user sets "api/subscriber/details/<id>" path parameters
    And The API user records the response from the api subscriber details endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

    Examples:
      | id  |
      | 390 |


  Scenario: When a GET request without the required data (id) and with valid authorization credentials is sent
  to the 'api/subscriber/details/{{id}}' endpoint, it should return a status code of 203, and the response
  message should be "No id"

    Given The API user sets "api/subscriber/details" path parameters
    And The API user records the response from the api subscriber details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline:When a GET request with valid authorization credentials and an (id) that does not
  correspond to an existing record is sent to the 'api/subscriber/details/{{id}}' endpoint, it should
  return a status code of 203, and the response message should be "No subscriber "

    Given The API user sets "api/subscriber/details/<id>" path parameters
    And The API user records the response from the api subscriber details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No subscriber "

    Examples:
      | id  |
      | 604 |


  Scenario Outline: When an invalid GET request with unauthorized credentials is sent to the
  'api/subscriber/details/{{id}}' endpoint, it should return a status code of 401, and the
  error message in the response body should be "Unauthorized request"

    Given The API user sets "api/subscriber/details/<id>" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized

    Examples:
      | id  |
      | 390 |


  Scenario Outline: The contents of data (id, email, created_at, updated_at) in the response body should be verified

    Given The API user sets "api/subscriber/details/<id>" path parameters
    And The API user records the response from the api subscriber details endpoint with valid authorization information
    Then The API user verifies the content of the data in the response body which includes <id>, "<email>", "<created_at>","<updated_at>"

    Examples:
      | id  | id  | email            | created_at                  | updated_at                  |
      | 390 | 390 | megenc@gmail.com | 2024-01-06T18:10:01.000000Z | 2024-01-06T18:10:01.000000Z |