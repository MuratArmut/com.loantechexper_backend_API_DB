Feature: As an administrator, I want to be able to update the information of registered blogs in the system through the API connection.

  Scenario Outline: Verify that when a PATCH request with valid authorization information, the correct 'id,'
  and accurate data (title, description) is sent to the 'api/blogs/update/{{id}}' endpoint, the returned
  status code is 200, and the message in the response body is "Blog updated successfully"

    Given The API user sets "api/blogs/update/<id>" path parameters
    And The API user prepares a PATCH request with the correct data to send to the api blogs update endpoint
    When The API user sends a PATCH request and records the response from the api blogs update endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Blog updated successfully"

    Examples:
      | id  |
      | 227 |


  Scenario Outline: Verify that when a PATCH request with valid authorization information, the correct 'id,'
  and a body lacking data (title, description) is sent to the 'api/blogs/update/{{id}}' endpoint, the returned
  status code is 203, and the remark information in the response body is "failed"

    Given The API user sets "api/blogs/update/<id>" path parameters
    And The API user prepares a PATCH request without data to send to the api blogs update endpoint
    When The API user sends a PATCH request and records the response from the api blogs update endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API user verifies that the remark information in the response body is "failed"

    Examples:
      | id  |
      | 227 |


  Scenario Outline: Verify that when a PATCH request with valid authorization information, the correct 'id,'
  and incomplete data (title, description) is sent to the 'api/blogs/update/{{id}}' endpoint, the returned
  status code is 203, and the remark information in the response body is "failed"

    Given The API user sets "api/blogs/update/<id>" path parameters
    And The API user prepares a PATCH request with missing data to send to the api blogs update endpoint
    When The API user sends a PATCH request and records the response from the api blogs update endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API user verifies that the remark information in the response body is "failed"

    Examples:
      | id  |
      | 227 |


  Scenario: Verify that when a PATCH request with valid authorization information and a body lacking the
  'id' field but containing data fields (title, description) is sent to the 'api/blogs/update/{{id}}'
  endpoint, the returned status code is 203, and the message in the response body is "No id."

    Given The API user sets "api/blogs/update" path parameters
    And The API user prepares a PATCH request with the correct data to send to the api blogs update endpoint
    When The API user sends a PATCH request and records the response from the api blogs update endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id."


  Scenario Outline: Verify that when a PATCH request with valid authorization information and a body
  containing an (id) that does not exist in the records, along with data fields (title, description),
  is sent to the 'api/blogs/update/{{id}}' endpoint, the returned status code is 203, and the message
  in the response body is "There is no blog with this id to be updated"

    Given The API user sets "api/blogs/update/<id>" path parameters
    And The API user prepares a PATCH request with the correct data to send to the api blogs update endpoint
    When The API user sends a PATCH request and records the response from the api blogs update endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "There is no blog with this id to be updated"

    Examples:
      | id  |
      | 701 |


  Scenario Outline: Verify that when a PATCH request with invalid authorization information but with
  the correct 'id' and a PATCH body containing data fields (title, description) is sent to the
  'api/blogs/update/{{id}}' endpoint, the returned status code is 401, and the error message in
  the response body is "Unauthorized request'"

    Given The API user sets "api/blogs/update/<id>" path parameters
    And The API user prepares a PATCH request with the correct data to send to the api blogs update endpoint
    Then The API user records the response from the api blogs update endpoint with invalid authorization information verifies that the status code is '401' and confirms that the error message is Unauthorized

    Examples:
      | id  |
      | 227 |


  Scenario Outline: The update of the blog record through the API should be verified. This can be confirmed
  by sending a GET request to the 'api/blogs/details/{{id}}' endpoint with the Updated blog id returned in
  the response body, thus validating that the record has been updated

    Given The API user sets "api/blogs/details/<id>" path parameters
    And The API user records the response from the api blogs details endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the title information in the response body is "<valueTitle>"

    Examples:
      | id  | valueTitle        |
      | 227 | Test Blog Updated |

