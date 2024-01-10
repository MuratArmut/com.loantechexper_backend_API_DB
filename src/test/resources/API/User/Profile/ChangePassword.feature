Feature: As a user, I want to be able to update the change password information for a registered user in the system through API connection.

  Scenario: When a PATCH request with valid authorization information and correct data (current_password,
  password) is sent to the user/changepassword endpoint, the returned status code should be 200,
  and the message in the response body should be verified as "Password changes successfully"

    Given The API user sets "user/changepassword" path parameters
    And The API user prepares a PATCH request containing the correct data to send to the user change password endpoint
    When The API user sends a PATCH request and saves the response from the user change password endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the message information in the response body is "Password changes successfully"


  Scenario: When a PATCH request with valid authorization information and a new password containing only digits
  (current_password, password) is sent to the user/changepassword endpoint, the returned status code should be 203,
  and the message in the response body should be verified as "The password must contain at least one uppercase
  and one lowercase letter. (and 1 more error)"

    Given The API user sets "user/changepassword" path parameters
    And The API user prepares a PATCH request to send to the user change password endpoint with a new password containing only numbers
    When The API user sends a PATCH request and saves the response from the user change password endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API user verifies that the message information in the response body is "The password must contain at least one uppercase and one lowercase letter. (and 1 more error)"


  Scenario: When a PATCH request with valid authorization information and a new password containing at least
  one uppercase letter, one lowercase letter, and a digit (current_password, password) is sent to the
  user/changepassword endpoint, the returned status code should be 203, and the message in the response
  body should be verified as "The password must contain at least one symbol."

    Given The API user sets "user/changepassword" path parameters
    And The API user prepares a PATCH request to send to the user change password endpoint with a new password containing at least one uppercase letter, one lowercase letter, and a number
    When The API user sends a PATCH request and saves the response from the user change password endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API user verifies that the message information in the response body is "The password must contain at least one symbol."


  Scenario: Verify that when a PATCH request with invalid authorization information and correct data
  (current_password, password) is sent to the 'user/changepassword' endpoint, the returned status code is 401,
  and the error message in the response body is "Unauthorized request"

    Given The API user sets "user/changepassword" path parameters
    And The API user prepares a PATCH request containing the correct data to send to the user change password endpoint
    Then The API user saves the response from the user change password endpoint with invalid authorization information and confirms that the status code is '401' and the error message is Unauthorized
