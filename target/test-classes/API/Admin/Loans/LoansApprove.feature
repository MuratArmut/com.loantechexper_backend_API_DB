Feature: As an administrator, I want to be able to approve the loan information of a user with a given ID through the API connection.

  Scenario Outline: When valid authorization information and correct data (id) are sent to the
  api/loans/approve/{{id}} endpoint with a PATCH request, it should be verified that the
  returned status code is 200 and the message in the response body is "Loan approved successfully"

    Given The API user sets "api/loans/approve/<id>" path parameters
    And The API user records the response from the api loans approve endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Loan approved successfully"

    Examples:
      | id  |
      | 346 |


  Scenario Outline: Verify that when a PATCH request with valid authorization information and a previously
  approved (id) is sent to the 'api/loans/approve/{{id}}' endpoint, the returned status code is 203, and the
  message information in the response body is "No loan or loan status is not pending."

    Given The API user sets "api/loans/approve/<id>" path parameters
    And The API user records the response from the api loans approve endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No loan or loan status is not pending."

    Examples:
      | id  |
      | 346 |


  Scenario: When valid authorization information and a PATCH body without (id) are sent to the
  api/loans/approve/{{id}} endpoint, it should be verified that the returned status code is 203
  and the message in the response body is "No id"

    Given The API user sets "api/loans/approve" path parameters
    And The API user records the response from the api loans approve endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: Valid authorization information should be passed to the 'api/loans/approve/{{id}}' endpoint,
  and when a PATCH body containing an invalid (id) for an unregistered record is sent, the expected status
  code is 203, and the message information in the response body should be verified as "No loan."

    Given The API user sets "api/loans/approve/<id>" path parameters
    And The API user records the response from the api loans approve endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No loan."

    Examples:
      | id   |
      | 1258 |


  Scenario Outline: When an invalid authorization is provided along with a PATCH body to the
  'api/loans/approve/{{id}}' endpoint, the expected status code is 401, and the error
  message in the response body should be verified as "Unauthorized request"

    Given The API user sets "api/loans/approve/<id>" path parameters
    Then The API user records the response from the api loans approve endpoint with invalid authorization information verifies that the status code is '401' and confirms that the error information is Unauthorized

    Examples:
      | id  |
      | 346 |
