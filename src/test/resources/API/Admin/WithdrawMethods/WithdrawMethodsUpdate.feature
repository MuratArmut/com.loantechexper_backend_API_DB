Feature: As an administrator, I want to be able to update the information of registered withdrawal methods in the system through the API connection.

  Scenario Outline: When valid authorization information, correct 'id', and accurate data (name, min_limit,
  max_limit) are sent in a PATCH body to the 'api/withdraw/methods/update/{{id}}' endpoint, it should be
  verified that the returned status code is 200, and the message information in the response body is
  "Withdraw method updated successfully"

    Given The API user sets "api/withdraw/methods/update/<id>" path parameters
    And The API user prepares a PATCH request with the correct data to send to the api withdraw methods update endpoint
    When The API user sends a PATCH request and records the response from the api withdraw methods update endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Withdraw method updated successfully"

    Examples:
      | id  |
      | 360 |


  Scenario Outline: Verify that when a PATCH request is sent to the 'api/withdraw/methods/update/{{id}}'
  endpoint with valid authorization information, and the request body does not contain the correct 'id'
  and data fields (name, min_limit, max_limit), the returned status code is 200, and the message
  in the response body is "Withdraw method updated successfully"

    Given The API user sets "api/withdraw/methods/update/<id>" path parameters
    And The API user prepares a PATCH request without including data to send to the api withdraw methods update endpoint
    When The API user sends a PATCH request and records the response from the api withdraw methods update endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Withdraw method updated successfully"

    Examples:
      | id  |
      | 360 |


  Scenario: Verify that when a PATCH request is sent to the 'api/withdraw/methods/update/{{id}}' endpoint
  with valid authorization information and a body lacking the 'id' field but containing data fields (name,
  min_limit, max_limit), the returned status code is 203, and the message in the response body is "No id."

    Given The API user sets "api/withdraw/methods/update" path parameters
    And The API user prepares a PATCH request with the correct data to send to the api withdraw methods update endpoint
    When The API user sends a PATCH request and records the response from the api withdraw methods update endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id."


  Scenario Outline: Verify that when a PATCH request is sent to the 'api/withdraw/methods/update/{{id}}'
  endpoint with valid authorization information and a body containing an (id) that does not exist in the
  records, along with data fields (name, min_limit, max_limit), the returned status code is 203, and the
  message in the response body is "There is no method with this id to be updated"

    Given The API user sets "api/withdraw/methods/update/<id>" path parameters
    And The API user prepares a PATCH request with the correct data to send to the api withdraw methods update endpoint
    When The API user sends a PATCH request and records the response from the api withdraw methods update endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "There is no method with this id to be updated"

    Examples:
      | id  |
      | 963 |


  Scenario Outline: Verify that when a PATCH request is sent to the 'api/withdraw/methods/update/{{id}}'
  endpoint with invalid authorization information but with the correct 'id' and a PATCH body containing
  data fields (name, min_limit, max_limit), the returned status code is 401, and the error message in
  the response body is "Unauthorized request"

    Given The API user sets "api/withdraw/methods/update/<id>" path parameters
    And The API user prepares a PATCH request with the correct data to send to the api withdraw methods update endpoint
    Then The API user records the response from the api withdraw methods update endpoint with invalid authorization information and verifies that the status code is '401' and the error message is Unauthorized

    Examples:
      | id  |
      | 360 |


  Scenario Outline: The update of the withdrawal methods record through the API should be verified.
  This can be confirmed by sending a GET request to the 'api/withdraw/methods/details/{{id}}' endpoint
  with the Updated method id returned in the response body

    Given The API user sets "api/withdraw/methods/details/<id>" path parameters
    And The API user saves the response from the api withdraw methods details endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the Name information in the response body is "<valueName>"

    Examples:
      | id  | valueName        |
      | 360 | Method 5 Updated |