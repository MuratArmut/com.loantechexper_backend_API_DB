Feature: As a user, I want to access the user plan through API connection.

  Scenario: When a GET request with valid authorization information is sent to the user/plan endpoint,
  the returned status code should be 200, and the response remark should be verified as "success"

    Given The API user sets "user/plan" path parameters
    And The API user saves the response from the user plan endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: Verify that when a GET request is sent to the 'user/plan' endpoint with invalid authorization
  information, the returned status code is 401, and the error message in the response body is
  "Unauthorized request"

    Given The API user sets "user/plan" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline: Verify the information returned in the response for the entity with id(x)
  (name, image, description, status, created_at, updated_at)

    Given The API user sets "user/plan" path parameters
    And The API user saves the response from the user plan endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: "<name>", "<description>", <status>, "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | name       | description | status | created_at                  | updated_at                  |
      | 2         | super team | hello       | 1      | 2023-12-22T08:06:43.000000Z | 2023-12-22T08:06:57.000000Z |

