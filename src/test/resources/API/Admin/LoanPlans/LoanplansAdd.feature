Feature: As an administrator, I want to create a new loan plan record via API connection.

  Scenario: When a POST request with valid authorization information and correct data is sent to the
  api/loanplans/add endpoint, the returned status code should be 200, and the remark in the response
  body should be verified as "success"

    Given The API user sets "api/loanplans/add" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loanplans add endpoint
    When The API user sends a POST request and records the response returned from the api loanplans add endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

  Scenario: When a POST request with valid authorization information and incomplete data is sent to
  the api/loanplans/add endpoint, the returned status code should be 203, and the remark in the response
  body should be verified as "failed"

    Given The API user sets "api/loanplans/add" path parameters
    And The API user prepares a POST request with incomplete data to send to the api loanplans add endpoint
    When The API user sends a POST request and records the response returned from the api loanplans add endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API user verifies that the remark information in the response body is "failed"


  Scenario: When a POST request with valid authorization information and no data is sent to the
  api/loanplans/add endpoint, the returned status code should be 203, and the remark in the
  response body should be verified as "failed"

    Given The API user sets "api/loanplans/add" path parameters
    And The API user prepares a POST request without data to send to the api loanplans add endpoint
    When The API user sends a POST request and records the response returned from the api loanplans add endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API user verifies that the remark information in the response body is "failed"


  Scenario: When a POST request with invalid authorization information and a body containing data is sent to
  the api/loanplans/add endpoint, the returned status code should be 401, and the error message in the response
  body should be verified as "Unauthorized request"

    Given The API user sets "api/loanplans/add" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loanplans add endpoint
    When The API user sends a POST request and records the response returned from the api loanplans add endpoint with invalid authorization information
    Then The API user verifies that the status code is 401
    And The API user verifies that the error information in the response body is "Unauthorized request"


  Scenario Outline: The creation of the desired loanplans record through the API should be verified.
  This can be confirmed by sending a GET request to the api/loanplans/details/{{id}} endpoint with
  the Added plan id returned in the response body to ensure that the record has been successfully created

    Given The API user sets "api/loanplans/details/<id>" path parameters
    And The API user records the response from the api loanplans details endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"
    Then The API user verifies that the id information at index <index> in the response body is <valueId>

    Examples:
      | id  | index | valueId |
      | 262 | 0     | 262     |