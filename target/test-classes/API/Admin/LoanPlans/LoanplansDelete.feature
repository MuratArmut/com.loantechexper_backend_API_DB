Feature: As an administrator, I should be able to delete a loan plan record in the system through API connection.

  Scenario Outline:When a valid DELETE request with appropriate authorization credentials and correct data
  (id) is sent to the 'api/loanplans/delete/{{id}}' endpoint, it should return a status code of 200, and
  the message in the response body should be "Loan plan deleted"

    Given The API user sets "api/loanplans/delete/<id>" path parameters
    And The API user records the response from the api loanplans delete endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Loan plan deleted"

    Examples:
      | id  |
      | 263 |

  Scenario: When a DELETE request without the required data (id) and with valid authorization credentials is
  sent to the 'api/loanplans/delete/{{id}}' endpoint, it should return a status code of 203, and the message
  in the response body should be "No id"

    Given The API user sets "api/loanplans/delete" path parameters
    And The API user records the response from the api loanplans delete endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a DELETE request with valid authorization credentials and an (id) that does not
  correspond to an existing record is sent to the 'api/loanplans/delete/{{id}}' endpoint, it should return
  a status code of 203, and the message in the response body should be "No loanplan."

    Given The API user sets "api/loanplans/delete/<id>" path parameters
    And The API user records the response from the api loanplans delete endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No loanplan."

    Examples:
      | id  |
      | 458 |


  Scenario Outline: When an invalid DELETE request body is sent with unauthorized credentials to the
  'api/loanplans/delete/{{id}}' endpoint, it should return a status code of 401, and the error
  message in the response body should be "Unauthorized request"

    Given The API user sets "api/loanplans/delete/<id>" path parameters
    Then The API user records the response from the api loanplans delete endpoint with invalid authorization information verifies that the status code is '401' and confirms that the error information is Unauthorized'

    Examples:
      | id  |
      | 263 |


  Scenario Outline: The deletion of the loan plan record intended to be removed through the API should be
  verified. This can be confirmed by sending a GET request to the 'api/loanplans/details/{{id}}' endpoint
  with the Deleted Loan Plan id returned in the response body, thus validating that the record has been deleted

    Given The API user sets "api/loanplans/details/<id>" path parameters
    And The API user records the response from the api loanplans details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No loanplans."

    Examples:
      | id  |
      | 263 |
