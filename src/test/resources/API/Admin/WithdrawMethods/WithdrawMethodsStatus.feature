Feature: As an administrator, I want to be able to update the status information of registered withdrawal methods through the API connection.

  Scenario Outline: When a valid authorization information and a correct PATCH body containing the id are
  sent to the 'api/withdraw/methods/status/{{id}}' endpoint, it should be verified that the returned status
  code is 200, and the message information in the response body is "Status changed"

    Given The API user sets "api/withdraw/methods/status/<id>" path parameters
    And The API user records the response from the api withdraw methods status endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Status changed"

    Examples:
      | id  |
      | 360 |


  Scenario: When valid authorization information and a PATCH body without the 'id' are sent to the
  'api/withdraw/methods/status/{{id}}' endpoint, it should be verified that the returned status code
  is 203, and the message information in the response body is "No id"

    Given The API user sets "api/withdraw/methods/status" path parameters
    And The API user records the response from the api withdraw methods status endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When valid authorization information and a PATCH body containing a non-existent
  'id' are sent to the 'api/withdraw/methods/status/{{id}}' endpoint, it should be verified that the
  returned status code is 203, and the message information in the response body is "No withdraw method."

    Given The API user sets "api/withdraw/methods/status/<id>" path parameters
    And The API user records the response from the api withdraw methods status endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No withdraw method."

    Examples:
      | id   |
      | 6987 |


  Scenario Outline: When invalid authorization information and a PATCH body containing the 'id' are sent
  to the 'api/withdraw/methods/status/{{id}}' endpoint, it should be verified that the returned status
  code is 401, and the error information in the response body is "Unauthorized request"

    Given The API user sets "api/withdraw/methods/status/<id>" path parameters
    Then The API user records the response from the api withdraw methods status endpoint with invalid authorization information verifies that the status code is '401' and confirms that the error message is Unauthorized

    Examples:
      | id  |
      | 360 |


  Scenario Outline: The update of the withdrawal methods status record through the API should be verified.
  This can be confirmed by sending a GET request to the 'api/withdraw/methods/details/{{id}}' endpoint
  with the Method id returned in the response body

    Given The API user sets "api/withdraw/methods/details/<id>" path parameters
    And The API user saves the response from the api withdraw methods details endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the Status information in the response body is <valueStatus>

    Examples:
      | id  | valueStatus |
      | 360 | 1           |