Feature: As an administrator, I should be able to delete a loan record in the system via the API connection.

  Scenario Outline: When a valid DELETE request is sent to the 'api/loans/delete/{{id}}' endpoint with
  proper authorization information and the correct (id), the expected status code is 200. Additionally,
  the message information in the response body should be verified as "Loan deleted"

    Given The API user sets "api/loans/delete/<id>" path parameters
    And The API user records the response from the api loans delete endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Loan deleted"

    Examples:
      | id |
      | 29 |


  Scenario: When a valid DELETE request is sent to the 'api/loans/delete/{{id}}' endpoint with proper
  authorization information but without including the required (id), the expected status code is 203.
  Furthermore, the message information in the response body should be confirmed as "No id"

    Given The API user sets "api/loans/delete" path parameters
    And The API user records the response from the api loans delete endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a valid DELETE request is sent to the 'api/loans/delete/{{id}}' endpoint with proper
  authorization information and an (id) that corresponds to a non-existent record, the expected status code
  is 203. Additionally, the message information in the response body should be confirmed as "No loan."

    Given The API user sets "api/loans/delete/<id>" path parameters
    And The API user records the response from the api loans delete endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No loan."

    Examples:
      | id  |
      | 548 |


  Scenario Outline: When an invalid DELETE request with unauthorized authorization information is sent to
  the 'api/loans/delete/{{id}}' endpoint, the expected status code is 401. Furthermore, the error message
  in the response body should be confirmed as "Unauthorized request"

    Given The API user sets "api/loans/delete/<id>" path parameters
    Then The API user records the response from the api loans delete endpoint with invalid authorization information verifies that the status code is '401' and confirms that the error information is Unauthorized

    Examples:
      | id |
      | 29 |


  Scenario Outline: The deletion of the desired loan record via the API should be verified through the API.
  (It can be confirmed by sending a GET request to the api/loans/details/{{id}} endpoint with the Deleted
  loan id returned in the response body, validating that the record has been deleted.)

    Given The API user sets "api/loans/details/<id>" path parameters
    And The API user records the response from the api loans details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No Loan"

    Examples:
      | id |
      | 29 |
