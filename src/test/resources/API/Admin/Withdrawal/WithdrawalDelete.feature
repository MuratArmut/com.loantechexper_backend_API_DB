Feature: As an administrator, I should be able to delete a withdrawal record in the system through the API connection.

  Scenario Outline: When a valid DELETE request is sent to the 'api/withdrawal/delete/{{id}}' endpoint with
  proper authorization information and the correct (id), the expected behavior is that the status code in
  the response is 200. Additionally, the message information in the response body should be confirmed as
  "withdrawal deleted"

    Given The API user sets "api/withdrawal/delete/<id>" path parameters
    And The API user records the response returned from the api withdrawal delete endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "withdrawal deleted"

    Examples:
      | id |
      | 2  |


  Scenario: When a valid DELETE request is sent to the 'api/withdrawal/delete/{{id}}' endpoint with
  proper authorization information but without including the required (id), the expected behavior is
  that the status code in the response is 203. Additionally, the message information in the response
  body should be confirmed as "No id"

    Given The API user sets "api/withdrawal/delete" path parameters
    And The API user records the response returned from the api withdrawal delete endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a valid DELETE request is sent to the 'api/withdrawal/delete/{{id}}' endpoint
  with proper authorization information and an (id) that corresponds to a non-existent record,
  the expected behavior is that the status code in the response is 203. Additionally, the message
  information in the response body should be confirmed as "No withdrawal"

    Given The API user sets "api/withdrawal/delete/<id>" path parameters
    And The API user records the response returned from the api withdrawal delete endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No withdrawal"

    Examples:
      | id  |
      | 687 |


  Scenario Outline: When an invalid DELETE request with unauthorized authorization information is sent to
  the 'api/withdrawal/delete/{{id}}' endpoint, the expected behavior is that the status code in the response
  is 401. Furthermore, the error information in the response body should be confirmed as "Unauthorized request"

    Given The API user sets "api/withdrawal/delete/<id>" path parameters
    Then The API user records the response returned from the api withdrawal delete endpoint with invalid authorization information verifies that the status code is '401' and confirms that the error message is Unauthorized

    Examples:
      | id |
      | 2  |

  @API
  Scenario Outline: The deletion of the withdrawal record through the API should be confirmed by sending
  a GET request to the 'api/withdrawal/details/{{id}}' endpoint with the Deleted withdrawal id from the
  response body. This action verifies that the record has been deleted

    Given The API user sets "api/withdrawal/details/<id>" path parameters
    And The API user records the response from the api withdrawal details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No withdraw."

    Examples:
      | id |
      | 2  |