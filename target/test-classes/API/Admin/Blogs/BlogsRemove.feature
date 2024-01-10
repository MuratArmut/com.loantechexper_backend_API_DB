Feature: As an administrator, I should be able to delete the blog record in the system through the API connection.

  Scenario Outline: Verify that when a DELETE request with valid authorization information and the correct
  'id' is sent to the 'api/subscriber/delete/{{id}}' endpoint, the returned status code is 200, and the
  message in the response body is "Blog removed successfully"

    Given The API user sets "api/blogs/remove/<id>" path parameters
    And The API user saves the response returned from the api blogs remove endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Blog removed successfully"

    Examples:
      | id  |
      | 230 |


  Scenario: When a DELETE request with valid authorization information and without the 'id' is sent to the
  'api/blogs/remove/{{id}}' endpoint, it should be verified that the returned status code is 203, and the
  message information in the response body indicates "No id"

    Given The API user sets "api/blogs/remove" path parameters
    And The API user saves the response returned from the api blogs remove endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a DELETE request with valid authorization information and containing a non-existent
  'id' is sent to the 'api/blogs/remove/{{id}}' endpoint, it should be verified that the returned status code
  is 203, and the message information in the response body indicates "No blog."

    Given The API user sets "api/blogs/remove/<id>" path parameters
    And The API user saves the response returned from the api blogs remove endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No blog."

    Examples:
      | id  |
      | 578 |


  Scenario Outline: When an invalid authorization information is used to send a DELETE request body to
  the 'api/blogs/remove/{{id}}' endpoint, it should be verified that the returned status code is 401,
  and the error information in the response body indicates "Unauthorized request"

    Given The API user sets "api/blogs/remove/<id>" path parameters
    Then The API user records the response returned from the api blogs remove endpoint with invalid authorization information and verifies that the status code is '401' and the error message is Unauthorized

    Examples:
      | id  |
      | 230 |


  Scenario Outline: The deletion of the blogs record through the API should be verified. This can be
  confirmed by sending a GET request to the 'api/blogs/details/{{id}}' endpoint with the Removed  blog
  id returned in the response body

    Given The API user sets "api/blogs/details/<id>" path parameters
    And The API user records the response from the api blogs details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No blog"

    Examples:
      | id  |
      | 230 |