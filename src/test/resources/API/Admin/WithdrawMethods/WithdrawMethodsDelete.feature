Feature: As an administrator, I should be able to delete the withdrawal methods record in the system through the API connection.

  Scenario Outline: When a valid authorization information and a correct 'id' are sent in a DELETE request
  to the 'api/withdraw/methods/delete/{{id}}' endpoint, it should be verified that the returned status code
  is 200, and the message information in the response body is "Withdraw Method deleted"

    Given The API user sets "api/withdraw/methods/delete/<id>" path parameters
    And The API user records the response from the api withdraw methods delete endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Withdraw Method deleted"

    Examples:
      | id  |
      | 361 |


  Scenario: When valid authorization information and a DELETE request without the 'id' are sent to the
  'api/withdraw/methods/delete/{{id}}' endpoint, it should be verified that the returned status code is 203,
  and the message information in the response body is "No id"

    Given The API user sets "api/withdraw/methods/delete" path parameters
    And The API user records the response from the api withdraw methods delete endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When valid authorization information and a DELETE request containing a non-existent 'id'
  are sent to the 'api/withdraw/methods/delete/{{id}}' endpoint, it should be verified that the returned
  status code is 203, and the message information in the response body is "No Withdraw Method"

    Given The API user sets "api/withdraw/methods/delete/<id>" path parameters
    And The API user records the response from the api withdraw methods delete endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No Withdraw Method"

    Examples:
      | id  |
      | 617 |


  Scenario Outline: When invalid authorization information and a DELETE request body are sent to the
  'api/withdraw/methods/delete/{{id}}' endpoint, it should be verified that the returned status code is 401,
  and the error information in the response body is "Unauthorized request"

    Given The API user sets "api/withdraw/methods/delete/<id>" path parameters
    Then The API user records the response from the api withdraw methods delete endpoint with invalid authorization information verifies that the status code is '401' and confirms that the error message is Unauthorized

    Examples:
      | id  |
      | 361 |


  Scenario Outline: The deletion of the withdrawal methods record through the API should be verified.
  This can be confirmed by sending a GET request to the 'api/withdraw/methods/details/{{id}}' endpoint
  with the Deleted method id returned in the response body

    Given The API user sets "api/withdraw/methods/details/<id>" path parameters
    And The API user saves the response from the api withdraw methods details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No Withdraw Method"

    Examples:
      | id  |
      | 361 |