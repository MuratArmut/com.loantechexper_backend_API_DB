Feature: As an administrator, I want to update the existing loan plan information via API connection.

  Scenario Outline:When a POST request with valid authorization information, correct 'id', and valid data
  (category_id, name, title) is sent to the api/loanplans/update/{{id}} endpoint, the returned status code
  should be 200, and the message in the response body should be verified as "Loanplan updated successfully"

    Given The API user sets "api/loanplans/update/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loanplans update endpoint
    When The API user sends a POST request and records the response returned from the api loanplans update endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Loanplan updated successfully"

    Examples:
      | id  |
      | 261 |


  Scenario Outline: When a POST request with valid authorization information, correct 'id', and no data
  (category_id, name, title) is sent to the api/loanplans/update/{{id}} endpoint, the returned status
  code should be 203, and the remark in the response body should be verified as "failed"

    Given The API user sets "api/loanplans/update/<id>" path parameters
    And The API user prepares a POST request without data to send to the api loanplans update endpoint
    When The API user sends a POST request and records the response returned from the api loanplans update endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API user verifies that the remark information in the response body is "failed"

    Examples:
      | id  |
      | 261 |


  Scenario: When a POST request with valid authorization information and no 'id' is sent to the
  pi/loanplans/update/{{id}} endpoint with a body containing data (category_id, name, title),
  the returned status code should be 203, and the message in the response body should be verified as "No id."

    Given The API user sets "api/loanplans/update" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loanplans update endpoint
    When The API user sends a POST request and records the response returned from the api loanplans update endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id."


  Scenario Outline: When a POST request with valid authorization information and a non-existent 'id' is sent to
  the api/loanplans/update/{{id}} endpoint with a body containing data (category_id, name, title), the
  returned status code should be 203, and the message in the response body should be verified as "There
  is no loanplans with this id to be updated"

    Given The API user sets "api/loanplans/update/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loanplans update endpoint
    When The API user sends a POST request and records the response returned from the api loanplans update endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "There is no loanplans with this id to be updated"

    Examples:
      | id  |
      | 425 |


  Scenario Outline:"When a POST request with invalid authorization information and a valid 'id'
  is sent to the api/loanplans/update/{{id}} endpoint with a body containing data (category_id,
  name, title), the returned status code should be 401, and the error message in the response
  body should be verified as "Unauthorized request"

    Given The API user sets "api/loanplans/update/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loanplans update endpoint
    When The API user sends a POST request and records the response returned from the api loanplans update endpoint with invalid authorization information
    Then The API user verifies that the status code is 401
    And The API user verifies that the error information in the response body is "Unauthorized request"

    Examples:
      | id  |
      | 261 |


  Scenario Outline: The update of the desired loanplans record through the API should be verified.
  This can be confirmed by sending a GET request to the api/loanplans/details/{{id}} endpoint with
  the Updated loan plan id returned in the response body to ensure that the record has been successfully updated

    Given The API user sets "api/loanplans/details/<id>" path parameters
    And The API user records the response from the api loanplans details endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the title information in the response body is "<valueTitle>"

    Examples:
      | id  | valueTitle            |
      | 261 | Personal Finance Loan |