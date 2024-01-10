Feature: As a user, I want to access the Ticket List through an API connection.

  Scenario: When a GET request is sent to the user/ticket/list endpoint with valid authorization information,
  the returned status code should be 200, and the response remark should be verified as "success".

    Given The API user sets "user/ticket/list" path parameters
    And The API user saves the response from the user ticket list endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: Verify that when a GET request is sent to the 'user/ticket/list' endpoint with invalid
  authorization information, the returned status code is 401, and the error message in the response
  indicates "Unauthorized request"

    Given The API user sets "user/ticket/list" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline: Verify the information returned in the response for the entity with id(x)
  (user_id, name, email, ticket, subject, status, priority, last_reply, created_at, updated_at)

    Given The API user sets "user/ticket/list" path parameters
    And The API user saves the response from the user ticket list endpoint with valid authorization information
    Then Verify the information of the one with the id <dataIndex> in the API user response body: <user_id>, "<name>", "<email>", "<ticket>", "<subject>", <status>, <priority>, "<last_reply>", "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | user_id | name                 | email                   | ticket | subject     | status | priority | last_reply          | created_at                  | updated_at                  |
      | 0         | 11      | suphi atilim celikoz | aliulvigirgin@gmail.com | 482302 | Test Ticket | 0      | 0        | 2024-01-06 04:47:15 | 2024-01-06T09:47:15.000000Z | 2024-01-06T09:47:15.000000Z |
      | 1         | 11      | suphi atilim celikoz | aliulvigirgin@gmail.com | 281767 | Test Ticket | 0      | 0        | 2024-01-06 04:47:11 | 2024-01-06T09:47:11.000000Z | 2024-01-06T09:47:11.000000Z |

