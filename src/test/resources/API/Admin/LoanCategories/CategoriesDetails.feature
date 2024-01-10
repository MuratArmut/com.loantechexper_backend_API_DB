Feature: As an administrator, I want to access the category details of a user with a specified ID via API connection.

  Scenario Outline: When a GET request with valid authorization information and correct data (id) is sent
  to the api/categories/details/{{id}} endpoint, the returned status code should be 200, and the
  response remark should be verified as "success"

    Given The API user sets "api/categories/details/<id>" path parameters
    And The API user records the response from the api categories details endpoint with the valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

    Examples:
      | id    |
      | 10043 |


  Scenario:When a GET request with valid authorization information and no 'id' is sent to the
  api/categories/details/{{id}} endpoint, the returned status code should be 203, and the
  response message should be verified as "No id"

    Given The API user sets "api/categories/details" path parameters
    And The API user records the response from the api categories details endpoint with the valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline:When a GET request with valid authorization information and a non-existent 'id' is sent
  to the api/categories/details/{{id}} endpoint, the returned status code should be 203, and the response
  message should be verified as "No category"

    Given The API user sets "api/categories/details/<id>" path parameters
    And The API user records the response from the api categories details endpoint with the valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No category"

    Examples:
      | id      |
      | 4255487 |


  Scenario Outline: When a GET request with invalid authorization information is sent to the
  api/categories/details/{{id}} endpoint, the returned status code should be 401, and the error
  message in the response body should be verified as "Unauthorized request"

    Given The API user sets "api/categories/details/<id>" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized

    Examples:
      | id    |
      | 10043 |


  Scenario Outline:The contents of data (id, name, image, description, status, created_at, updated_at) in the
  response body should be verified

    Given The API user sets "api/categories/details/<id>" path parameters
    And The API user records the response from the api categories details endpoint with the valid authorization information
    Then The API user verifies that the content of the data field in the response body includes <id>, "<name>", "<description>", <status>, "<created_at>", "<updated_at>"

    Examples:
      | id    | id    | name     | description                                     | status | created_at                  | updated_at                  |
      | 10043 | 10043 | Car Loan | If you want to buy a car, this loan is for you. | 1      | 2024-01-06T17:16:30.000000Z | 2024-01-06T17:16:30.000000Z |
