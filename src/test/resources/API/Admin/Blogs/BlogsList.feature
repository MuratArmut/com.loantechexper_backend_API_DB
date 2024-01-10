Feature: As an administrator, I want to be able to access the list of blogs through the API connection.

  Scenario: When a GET request is sent to the 'api/blogs/list' endpoint with valid authorization information,
  it should be verified that the returned status code is 200, and the remark information in the response
  indicates "success"

    Given The API user sets "api/blogs/list" path parameters
    And The API user records the response from the api blogs list endpoint with valid authorization information.
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: When a GET request is sent to the 'api/blogs/list' endpoint with invalid authorization information,
  it should be verified that the returned status code is 401, and the error information in the response
  indicates "Unauthorized request"

    Given The API user sets "api/blogs/list" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline: Verify the information (data_keys, has_image, title, description_nic, image, created_at,
  updated_at) of the id(x) returned in the Response.

    Given The API user sets "api/blogs/list" path parameters
    And The API user records the response from the api blogs list endpoint with valid authorization information.
    Then Verify the information of the one with the index <dataIndex> in the API user response body: "<data_keys>", "<has_image>", "<title>", "<description_nic>", "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | data_keys    | has_image | title       | description_nic | created_at                  | updated_at                  |
      | 1         | blog.element | 1         | Test Blog 3 | Test            | 2024-01-06T11:59:30.000000Z | 2024-01-06T11:59:30.000000Z |