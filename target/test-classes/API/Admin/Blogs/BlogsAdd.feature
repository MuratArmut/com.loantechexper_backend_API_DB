Feature: As an administrator, I want to be able to create a new blog record through the API connection.

  Scenario: When a valid authorization information and correct data (title, description) are sent in a
  POST body to the 'api/blogs/add' endpoint, it should be verified that the returned status code is 200,
  and the remark information in the response body indicates "success"

    Given The API user sets "api/blogs/add" path parameters
    And The API user prepares a POST request with the correct data to send to the api blogs add endpoint
    When The API user sends a POST request and records the response from the api blogs add endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: When valid authorization information and incomplete data (title, description) are sent in a
  POST body to the 'api/blogs/add' endpoint, it should be verified that the returned status code is 203,
  and the remark information in the response body indicates "failed"

    Given The API user sets "api/blogs/add" path parameters
    And The API user prepares a POST request with incomplete data to send to the api blogs add endpoint
    When The API user sends a POST request and records the response from the api blogs add endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API user verifies that the remark information in the response body is "failed"


  Scenario: When valid authorization information and an empty data (title, description) POST body are sent
  to the 'api/blogs/add' endpoint, it should be verified that the returned status code is 203, and the remark
  information in the response body indicates "failed"

    Given The API user sets "api/blogs/add" path parameters
    And The API user prepares a POST request with no data to send to the api blogs add endpoint
    When The API user sends a POST request and records the response from the api blogs add endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API user verifies that the remark information in the response body is "failed"


  Scenario: When invalid authorization information and a POST body (title, description) are sent to the
  'api/blogs/add' endpoint, it should be verified that the returned status code is 401, and the error
  information in the response body indicates "Unauthorized request"

    Given The API user sets "api/blogs/add" path parameters
    And The API user prepares a POST request with the correct data to send to the api blogs add endpoint
    When The API user sends a POST request, records the response from the api blogs add endpoint and saves it with invalid authorization information
    Then The API user verifies that the status code is 401
    And The API user verifies that the error information in the response body is "Unauthorized request"


  Scenario Outline: The creation of a new blog record through the API should be verified. This can be
  confirmed by sending a GET request to the 'api/blogs/details/{{id}}' endpoint with the Added blog id
  returned in the response body

    Given The API user sets "api/blogs/details/<id>" path parameters
    And The API user records the response from the api blogs details endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"
    Then The API user verifies that the id information in the response body is <valueId>

    Examples:
      | id  | valueId |
      | 228 | 228     |