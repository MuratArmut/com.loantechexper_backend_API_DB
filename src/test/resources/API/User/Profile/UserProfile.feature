Feature: As a user, I want to be able to update the user profile information in the system through API connection.

  Scenario: When a PATCH request with valid authorization information and correct data
  (firstname, lastname, address, state, zip, city) is sent to the user/profile
  endpoint, the returned status code should be 200, and the message in the
  response body should be verified as "Profile updated successfully"

    Given The API user sets "user/profile" path parameters
    And The API user prepares a PATCH request containing the correct data to send to the user profile endpoint
    When The API user sends a PATCH request and saves the response from the user profile endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the message information in the response body is "Profile updated successfully"


  Scenario: Verify that when a PATCH request with valid authorization information and incomplete data
  (address, state, zip, city) is sent to the 'user/profile' endpoint, the returned status code is 203,
  and the remark information in the response body is "failed"

    Given The API user sets "user/profile" path parameters
    And The API user prepares a PATCH request with missing data to send to the user profile endpoint
    When The API user sends a PATCH request and saves the response from the user profile endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API user verifies that the remark information in the response body is "failed"


  Scenario: Verify that when a PATCH request with valid authorization information and an empty body
  (firstname, lastname, address, state, zip, city) is sent to the 'user/profile' endpoint, the returned
  status code is 203, and the remark information in the response body is "failed"

    Given The API user sets "user/profile" path parameters
    And The API user prepares a PATCH request without data to send to the user profile endpoint
    When The API user sends a PATCH request and saves the response from the user profile endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API user verifies that the remark information in the response body is "failed"


  Scenario: Verify that when a PATCH request with invalid authorization information and correct data
  (firstname, lastname, address, state, zip, city) is sent to the 'user/profile' endpoint, the returned status
  code is 401, and the error message in the response body is "Unauthorized request"

    Given The API user sets "user/profile" path parameters
    And The API user prepares a PATCH request containing the correct data to send to the user profile endpoint
    Then The API user saves the response from the user profile endpoint with invalid authorization information and verifies that the status code is '401' and the error message is Unauthorized

