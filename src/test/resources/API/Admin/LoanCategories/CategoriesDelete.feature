Feature: As an administrator, I should be able to delete a category record in the system through API connection.

  Scenario Outline: When a DELETE request with valid authorization information and correct 'id' is sent to
  the api/categories/delete/{{id}} endpoint, the returned status code should be 200, and the message in the
  response body should be verified as "category deleted"
  "
    Given The API user sets "api/categories/delete/<id>" path parameters
    And The API user records the response from the api categories delete endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "category deleted"

    Examples:
      | id    |
      | 10045 |

  Scenario: When a DELETE request with valid authorization information and no 'id' is sent to the
  api/categories/delete/{{id}} endpoint, the returned status code should be 203, and the message in the
  response body should be verified as "No id"

    Given The API user sets "api/categories/delete" path parameters
    And The API user records the response from the api categories delete endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a DELETE request with valid authorization information and a non-existent 'id'
  is sent to the api/categories/delete/{{id}} endpoint, the returned status code should be 203, and
  the message in the response body should be verified as "No category"

    Given The API user sets "api/categories/delete/<id>" path parameters
    And The API user records the response from the api categories delete endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No category"

    Examples:
      | id     |
      | 457789 |


  Scenario Outline: When a DELETE request with invalid authorization information and correct 'id' is sent
  to the api/categories/delete/{{id}} endpoint, the returned status code should be 401, and the error
  message in the response body should be verified as "Unauthorized request"

    Given The API user sets "api/categories/delete/<id>" path parameters
    Then The API user records the response from the api categories delete endpoint with invalid authorization information verifies that the status code is '401' and confirms that the error information is Unauthorized

    Examples:
      | id    |
      | 10045 |


  Scenario Outline: The deletion of the desired category record through the API should be verified. This can
  be confirmed by sending a GET request to the api/categories/details/{{id}} endpoint with the Deleted
  category ID returned in the response body to ensure that the record has been successfully deleted

    Given The API user sets "api/categories/details/<id>" path parameters
    And The API user records the response from the api categories details endpoint with the valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No category"

    Examples:
      | id    |
      | 10045 |