Feature: As an administrator, I want to access the ticket information of a user with a specified ID via API connection.

  Scenario Outline: When a valid GET request with appropriate authorization credentials and correct data (id)
  is sent to the 'api/tickets/details/{{id}}' endpoint, it should return a status code of 200, and the response
  remark should be "success"

    Given The API user sets "api/tickets/details/<id>" path parameters
    And The API user records the response from the api tickets details endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

    Examples:
      | id |
      | 2  |


  Scenario: When a GET request with valid authorization credentials and without the required data (id)
  is sent to the 'api/tickets/details/{{id}}' endpoint, it should return a status code of 203, and the
  response message should be "No id"

    Given The API user sets "api/tickets/details" path parameters
    And The API user records the response from the api tickets details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Template: When a GET request with valid authorization credentials and an (id) that does not
  correspond to an existing record is sent to the 'api/tickets/details/{{id}}' endpoint, it should
  return a status code of 203, and the response message should be "No ticket."

    Given The API user sets "api/tickets/details/<id>" path parameters
    And The API user records the response from the api tickets details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No ticket."

    Examples:
      | id    |
      | 25469 |


  Scenario Outline: When an invalid GET request with unauthorized credentials is sent to the
  'api/tickets/details/{{id}}' endpoint, it should return a status code of 401, and the error
  message in the response body should be "Unauthorized request"

    Given The API user sets "api/tickets/details/<id>" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized

    Examples:
      | id |
      | 2  |

  Scenario Outline: Verify the contents of the data (id, user_id, name, email, ticket, subject, status,
  priority, last_reply, created_at, updated_at) in the response body

    Given The API user sets "api/tickets/details/<id>" path parameters
    And The API user records the response from the api tickets details endpoint with valid authorization information
    Then The API user verifies the content of the data in the response body which includes <id>, <user_id>, "<name>", "<email>", "<ticket>", "<subject>", <status>, <priority>, "<last_reply>", "<created_at>", "<updated_at>"

    Examples:
      | id | id | user_id | name  | email           | ticket | subject | status | priority | last_reply          | created_at                  | updated_at                  |
      | 2  | 2  | 1       | Elf F | agenc@gmail.com | 187898 | Test    | 3      | 3        | 2023-11-02 11:16:58 | 2023-10-16T10:08:01.000000Z | 2023-12-29T13:50:10.000000Z |