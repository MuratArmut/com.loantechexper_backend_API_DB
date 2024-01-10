Feature: As an administrator, I want to be able to access the blog details information of a user with a given ID through the API connection.

  Scenario Outline: When a GET request with valid authorization information and correct data (id) is sent to
  the 'api/blogs/details/{{id}}' endpoint, it should be verified that the returned status code is 200, and
  the remark information in the response indicates "success"

    Given The API user sets "api/blogs/details/<id>" path parameters
    And The API user records the response from the api blogs details endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

    Examples:
      | id  |
      | 227 |
      | 228 |


  Scenario: When a GET request with valid authorization information and without the 'id' is sent to the
  'api/blogs/details/{{id}}' endpoint, it should be verified that the returned status code is 203, and
  the message information in the response indicates "No id"

    Given The API user sets "api/blogs/details" path parameters
    And The API user records the response from the api blogs details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a GET request with valid authorization information and containing a non-existent
  'id' is sent to the 'api/blogs/details/{{id}}' endpoint, it should be verified that the returned status
  code is 203, and the message information in the response indicates "No blog"

    Given The API user sets "api/blogs/details/<id>" path parameters
    And The API user records the response from the api blogs details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No blog"

    Examples:
      | id  |
      | 911 |


  Scenario Outline: When an invalid authorization information is used to send a GET request to the
  'api/blogs/details/{{id}}' endpoint, it should be verified that the returned status code is 401,
  and the error information in the response body indicates "Unauthorized request"

    Given The API user sets "api/blogs/details/<id>" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized

    Examples:
      | id  |
      | 227 |


  Scenario Outline: The contents of the data (id, data_keys, has_image, title, description_nic, created_at,
  updated_at) in the response body should be verified

    Given The API user sets "api/blogs/details/<id>" path parameters
    And The API user records the response from the api blogs details endpoint with valid authorization information
    Then The API user verifies the content of the data in the response body which includes <id>, "<data_keys>", "<has_image>", "<title>", "<description_nic>", "<created_at>", "<updated_at>"

    Examples:
      | id  | id  | data_keys    | has_image | title       | description_nic | created_at                  | updated_at                  |
      | 227 | 227 | blog.element | 1         | Test Blog 3 | Test açıklama 3 | 2024-01-06T15:57:15.000000Z | 2024-01-06T15:57:15.000000Z |
      | 228 | 228 | blog.element | 1         | Test Blog 3 | Test açıklama 3 | 2024-01-06T15:57:48.000000Z | 2024-01-06T15:57:48.000000Z |
