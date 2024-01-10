Feature: As an administrator, I want to update the existing category information via API connection.

  Scenario Outline: When a POST request with valid authorization information, correct 'id', and valid data
  (name, description) is sent to the api/categories/update/{{id}} endpoint, the returned status code should
  be 200, and the message in the response body should be verified as "Category updated successfully"

    Given The API user sets "api/categories/update/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api categories update endpoint
    When The API user sends a POST request and records the response returned from the api categories update endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Category updated successfully"

    Examples:
      | id    |
      | 10044 |


  Scenario Outline: When a POST request with valid authorization information, correct 'id', and valid
  data (name) is sent to the api/categories/update/{{id}} endpoint, the returned status code should be
  200, and the message in the response body should be verified as "Category updated successfully"

    Given The API user sets "api/categories/update/<id>" path parameters
    And The API user prepares a POST request containing the name data to send to the api categories update endpoint
    When The API user sends a POST request and records the response returned from the api categories update endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Category updated successfully"

    Examples:
      | id    |
      | 10044 |


  Scenario Outline: When a POST request with valid authorization information, correct 'id', and no data
  (name, description) is sent to the api/categories/update/{{id}} endpoint, the returned status code s
  hould be 203, and the remark in the response body should be verified as "failed"

    Given The API user sets "api/categories/update/<id>" path parameters
    And The API user prepares a POST request without data to send to the api categories update endpoint
    When The API user sends a POST request and records the response returned from the api categories update endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API user verifies that the remark information in the response body is "failed"

    Examples:
      | id    |
      | 10044 |


  Scenario: When a POST request with valid authorization information and no 'id' is sent to the api/
  categories/update/{{id}} endpoint with a POST body containing data (name, description), the returned
  status code should be 203, and the message in the response body should be verified as "No id."

    Given The API user sets "api/categories/update" path parameters
    And The API user prepares a POST request containing the correct data to send to the api categories update endpoint
    When The API user sends a POST request and records the response returned from the api categories update endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id."


  Scenario Outline: When a POST request with valid authorization information and a non-existent 'id' is sent to
  the api/categories/update/{{id}} endpoint with a POST body containing data (name, description), the
  returned status code should be 203, and the message in the response body should be verified as "There
  is no category with this id to be updated"

    Given The API user sets "api/categories/update/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api categories update endpoint
    When The API user sends a POST request and records the response returned from the api categories update endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "There is no category with this id to be updated"

    Examples:
      | id     |
      | 457789 |


  Scenario Outline: When a POST request with invalid authorization information, correct 'id', and a POST body
  (name, description) is sent to the api/categories/update/{{id}} endpoint, the returned status code should be
  401, and the error message in the response body should be verified as "Unauthorized request"

    Given The API user sets "api/categories/update/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api categories update endpoint
    When The API user sends a POST request and records the response returned from the api categories update endpoint with invalid authorization information
    Then The API user verifies that the status code is 401
    And The API user verifies that the error information in the response body is "Unauthorized request"

    Examples:
      | id    |
      | 10044 |


  Scenario Outline: The update of the desired category record through the API should be verified. This can be
  confirmed by sending a GET request to the api/categories/details/{{id}} endpoint with the Updated Category Id
  returned in the response body to ensure that the record has been successfully updated

    Given The API user sets "api/categories/details/<id>" path parameters
    And The API user records the response from the api categories details endpoint with the valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the name information in the response body is "<valueName>"

    Examples:
      | id    | valueName   |
      | 10044 | Car Loan 35 |
