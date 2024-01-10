Feature: As an administrator, I want to be able to create a new withdrawal methods record through the API connection.

  Scenario: When a valid authorization information and correct data (name, min_limit, max_limit, fixed_charge,
  rate, percent_charge, currency, description) are sent in the POST body to the 'api/withdraw/methods/add'
  endpoint, it should be verified that the returned status code is 200, and the remark information in the
  response body is "success"

    Given The API user sets "api/withdraw/methods/add" path parameters
    And The API user prepares a POST request with the correct data to send to the api withdraw methods add endpoint
    When The API user sends a POST request and records the response from the api withdraw methods add endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: When valid authorization information and incomplete data (name, min_limit, max_limit, fixed_charge,
  rate, percent_charge, currency, description) are sent in the POST body to the 'api/withdraw/methods/add'
  endpoint, it should be verified that the returned status code is 203, and the remark information in the
  response body is "failed"

    Given The API user sets "api/withdraw/methods/add" path parameters
    And The API user prepares a POST request with missing data to send to the api withdraw methods add endpoint
    When The API user sends a POST request and records the response from the api withdraw methods add endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API user verifies that the remark information in the response body is "failed"


  Scenario: When valid authorization information and a POST request without data (name, min_limit, max_limit,
  fixed_charge, rate, percent_charge, currency, description) are sent to the 'api/withdraw/methods/add'
  endpoint, it should be verified that the returned status code is 203, and the remark information in
  the response body is "failed"

    Given The API user sets "api/withdraw/methods/add" path parameters
    And The API user prepares a POST request with no data to send to the api withdraw methods add endpoint
    When The API user sends a POST request and records the response from the api withdraw methods add endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API user verifies that the remark information in the response body is "failed"


  Scenario: When a POST body containing invalid authorization information (name, min_limit, max_limit,
  fixed_charge, rate, percent_charge, currency, description) is sent to the 'api/withdraw/methods/add'
  endpoint, it should be verified that the returned status code is 401, and the error information in
  the response body is "Unauthorized request"

    Given The API user sets "api/withdraw/methods/add" path parameters
    And The API user prepares a POST request with the correct data to send to the api withdraw methods add endpoint
    When The API user sends a POST request and records the response from the api withdraw methods add endpoint with invalid authorization information
    Then The API user verifies that the status code is 401
    And The API user verifies that the error information in the response body is "Unauthorized request"


  Scenario Outline: The creation of a new withdraw methods record through the API should be verified.
  This can be confirmed by sending a GET request to the 'api/withdraw/methods/details/{{id}}' endpoint
  with the id returned in the response body

    Given The API user sets "api/withdraw/methods/details/<id>" path parameters
    And The API user saves the response from the api withdraw methods details endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"
    Then The API user verifies that the id information in the response body is <valueId>

    Examples:
      | id  | valueId |
      | 359 | 359     |
