Feature: As an administrator, I want to update the status information of existing loan plans via API connection.

  Scenario Outline:When a valid PATCH request with appropriate authorization credentials and correct data
  (id) in the body is sent to the 'api/loanplans/status/{{id}}' endpoint, it should return a status code
  of 200, and the message in the response body should be "Status changed"

    Given The API user sets "api/loanplans/status/<id>" path parameters
    And The API user records the response from the api loanplans status endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Status changed"

    Examples:
      | id  |
      | 261 |

  Scenario: When a PATCH request with valid authorization information and no 'id' is sent to the
  api/loanplans/status/{{id}} endpoint, the returned status code should be 203, and the message
  in the response body should be verified as "No id"

    Given The API user sets "api/loanplans/status" path parameters
    And The API user records the response from the api loanplans status endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a PATCH request with valid authorization information and a non-existent 'id' is
  sent to the api/loanplans/status/{{id}} endpoint, the returned status code should be 203, and the message
  in the response body should be verified as "No plan"

    Given The API user sets "api/loanplans/status/<id>" path parameters
    And The API user records the response from the api loanplans status endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No plan"

    Examples:
      | id  |
      | 456 |


  Scenario Outline: When a PATCH request with invalid authorization information is sent to the
  api/loanplans/status/{{id}} endpoint with a body, the returned status code should be
  401, and the error message in the response body should be verified as "Unauthorized request"

    Given The API user sets "api/loanplans/status/<id>" path parameters
    Then The API user records the response from the api loanplans status endpoint with invalid authorization information verifies that the status code is '401' and confirms that the error information is Unauthorized

    Examples:
      | id  |
      | 261 |


  Scenario Outline: The status of the loan plan record intended to be updated through the API should be verified.
  This can be confirmed by sending a GET request to the 'api/loanplans/details/{{id}}' endpoint with the
  Loan Plan id returned in the response body, thus validating that the record has been updated

    Given The API user sets "api/loanplans/details/<id>" path parameters
    And The API user records the response from the api loanplans details endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the status information in the response body is <valueStatus>

    Examples:
      | id  | valueStatus |
      | 261 | 1           |
