Feature: As an administrator, I want to access the tickets that are in the 'answered' status via API connection.

  Scenario: When a GET request with valid authorization information is sent to the
  'api/tickets/answered' endpoint, it should be verified that the returned status
  code is 200, and the remark information in the response indicates "success"

    Given The API user sets "api/tickets/answered" path parameters
    And The API user records the response from the api tickets answered endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: When an invalid GET request with unauthorized credentials is sent to the
  'api/tickets/answered' endpoint, it should return a status code of 401, and the
  response error message should be "Unauthorized request"

    Given The API user sets "api/tickets/answered" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline: Verify the information (user_id, name, email, ticket, subject, status,
  priority, last_reply, created_at, updated_at) returned in the response for Id(x)

    Given The API user sets "api/tickets/answered" path parameters
    And The API user records the response from the api tickets answered endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: <user_id>, "<name>", "<email>", "<ticket>", "<subject>", <status>, <priority>, "<last_reply>", "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | user_id | name        | email                | ticket | subject     | status | priority | last_reply          | created_at                  | updated_at                  |
      | 0         | 60      | osman guler | osmanguler@gmail.com | 722910 | By By Proje | 1      | 3        | 2023-12-22 11:38:37 | 2023-12-22T16:38:24.000000Z | 2023-12-22T16:38:37.000000Z |