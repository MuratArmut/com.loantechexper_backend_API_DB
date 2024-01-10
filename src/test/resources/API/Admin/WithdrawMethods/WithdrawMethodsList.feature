Feature: As an administrator, I want to access the withdrawal methods list through the API connection.

  Scenario: When a valid GET request is sent to the 'api/withdraw/methods/list' endpoint with proper
  authorization information, the expected behavior is that the status code in the response is 200.
  Additionally, the remark information in the response should be confirmed as "success"

    Given The API user sets "api/withdraw/methods/list" path parameters
    And The API user saves the response from the api withdraw methods list endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: When an invalid GET request with unauthorized authorization information is sent to the
  'api/withdraw/methods/list' endpoint, the expected behavior is that the status code in the response
  is 401. Furthermore, the error information in the response body should be confirmed as "Unauthorized request"

    Given The API user sets "api/withdraw/methods/list" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline: Verify the information returned in the response body for the one with ID (x)
  (form_id, name, min_limit, max_limit, fixed_charge, rate, percent_charge, currency, description,
  status, created_at, updated_at)

    Given The API user sets "api/withdraw/methods/list" path parameters
    And The API user saves the response from the api withdraw methods list endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: <form_id>, "<name>", "<min_limit>", "<max_limit>", "<fixed_charge>", "<rate>", "<percent_charge>", "<currency>", "<description>", <status>, "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | form_id | name   | min_limit            | max_limit             | fixed_charge | rate        | percent_charge | currency | description | status | created_at                  | updated_at                  |
      | 0         | 97      | 00wx00 | 40000000032.00000000 | 800000000000.00000000 | 5.00000000   | 20.00000000 | 7.00           | Kulce    | Moin Moin   | 1      | 2023-12-20T08:18:50.000000Z | 2024-01-06T18:54:03.000000Z |
