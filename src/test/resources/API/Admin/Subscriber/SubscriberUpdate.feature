Feature: As an administrator, I want to update the existing subscriber information via API connection.

  Scenario Outline: When a valid POST request with appropriate authorization credentials, correct data (email),
  and the right (id) is sent to the 'api/subscriber/update/{{id}}' endpoint, it should return a status code of
  200, and the message in the response body should be "Subscriber updated successfully"

    Given The API user sets "api/subscriber/update/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api subscriber update endpoint
    When The API user sends a POST request and records the response returned from the api subscriber update endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Subscriber updated successfully"

    Examples:
      | id  |
      | 391 |


  Scenario Outline: "When a valid POST request with appropriate authorization credentials, correct (id),
  and an empty data (email) in the body is sent to the 'api/subscriber/update/{{id}}' endpoint, it should
  return a status code of 203, and the remark in the response body should be "failed"

    Given The API user sets "api/subscriber/update/<id>" path parameters
    And The API user prepares a POST request without data to send to the api subscriber update endpoint
    When The API user sends a POST request and records the response returned from the api subscriber update endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API user verifies that the remark information in the response body is "failed"

    Examples:
      | id  |
      | 391 |


  Scenario Outline: "When a valid POST request with appropriate authorization credentials, correct (id),
  and incorrect data (mail) is sent to the 'api/subscriber/update/{{id}}' endpoint, it should return a
  status code of 203, and the remark in the response body should be "failed"

    Given The API user sets "api/subscriber/update/<id>" path parameters
    And The API user prepares a POST request with incorrect data to send to the api subscriber update endpoint
    When The API user sends a POST request and records the response returned from the api subscriber update endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API user verifies that the remark information in the response body is "failed"

    Examples:
      | id  |
      | 391 |


  Scenario: When a POST request with valid authorization credentials and an empty (id) in the body (email)
  is sent to the 'api/subscriber/update/{{id}}' endpoint, it should return a status code of 203, and the
  message in the response body should be "No id."

    Given The API user sets "api/subscriber/update" path parameters
    And The API user prepares a POST request containing the correct data to send to the api subscriber update endpoint
    When The API user sends a POST request and records the response returned from the api subscriber update endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id."


  Scenario Outline: When a POST request with valid authorization credentials and an (id) that does not correspond to
  an existing record is sent to the 'api/subscriber/update/{{id}}' endpoint, it should return a status code
  of 203, and the message in the response body should be "There is no subscriber with this id to be updated"

    Given The API user sets "api/subscriber/update/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api subscriber update endpoint
    When The API user sends a POST request and records the response returned from the api subscriber update endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "There is no subscriber with this id to be updated"

    Examples:
      | id  |
      | 546 |


  Scenario Outline: When an invalid POST request with unauthorized credentials, correct (id), and a body
  containing data (email) is sent to the 'api/subscriber/update/{{id}}' endpoint, it should return a
  status code of 401, and the error message in the response body should be "Unauthorized request"

    Given The API user sets "api/subscriber/update/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api subscriber update endpoint
    When The API user sends a POST request and records the response returned from the api subscriber update endpoint with invalid authorization information
    Then The API user verifies that the status code is 401
    And The API user verifies that the error information in the response body is "Unauthorized request"

    Examples:
      | id  |
      | 391 |


  Scenario Outline: The update of the desired subscriber record via API should be confirmed by sending a
  GET request to the 'api/subscriber/details/{{id}}' endpoint with the 'updated subscriber id' obtained
  from the response body. This verification process ensures that the record has been successfully updated

    Given The API user sets "api/subscriber/details/<id>" path parameters
    And The API user records the response from the api subscriber details endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the email information in the response body is "<valueEmail>"

    Examples:
      | id  | valueEmail        |
      | 391 | ayilmaz@gmail.com |
