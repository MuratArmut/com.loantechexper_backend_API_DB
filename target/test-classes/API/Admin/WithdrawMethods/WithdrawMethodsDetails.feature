Feature: As an administrator, I want to access the withdrawal methods information of a user with a specific ID through the API connection.

  Scenario Outline: When a valid GET request is sent to the 'api/withdraw/methods/details/{{id}}' endpoint
  with proper authorization information and the correct (id) included in the data, the expected behavior is
  that the status code in the response is 200. Additionally, the remark information in the response should
  be confirmed as "success"

    Given The API user sets "api/withdraw/methods/details/<id>" path parameters
    And The API user saves the response from the api withdraw methods details endpoint with valid authorization information
    #Apı kulanıcısı api withdraw methods details endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

    Examples:
      | id  |
      | 145 |


  Scenario: When a valid GET request is sent to the 'api/withdraw/methods/details/{{id}}' endpoint with
  proper authorization information but without including the (id) in the data, the expected behavior is
  that the status code in the response is 203. Additionally, the message information in the response
  should be confirmed as "No id"

    Given The API user sets "api/withdraw/methods/details" path parameters
    And The API user saves the response from the api withdraw methods details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a valid GET request is sent to the 'api/withdraw/methods/details/{{id}}' endpoint
  with proper authorization information and an (id) that does not exist in the records, the expected behavior
  is that the status code in the response is 203. Additionally, the message information in the response
  should be confirmed as "No Withdraw Method"

    Given The API user sets "api/withdraw/methods/details/<id>" path parameters
    And The API user saves the response from the api withdraw methods details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No Withdraw Method"

    Examples:
      | id  |
      | 745 |


  Scenario Outline: When an invalid GET request is sent to the 'api/withdraw/methods/details/{{id}}'
  endpoint with unauthorized or invalid authorization information, the expected behavior is that the
  status code in the response is 401. Additionally, the error information in the response body should
  be confirmed as "Unauthorized request"

    Given The API user sets "api/withdraw/methods/details/<id>" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized

    Examples:
      | id  |
      | 145 |


  Scenario Outline: The contents of the data (id, form_id, name, min_limit, max_limit, fixed_charge, rate,
  percent_charge, currency, description, status, created_at, updated_at) in the response body should be
  verified.

    Given The API user sets "api/withdraw/methods/details/<id>" path parameters
    And The API user saves the response from the api withdraw methods details endpoint with valid authorization information
    Then The API user verifies that the content of the data field in the response body includes <id>, <form_id>, "<name>", "<min_limit>", "<max_limit>", "<fixed_charge>", "<rate>", "<percent_charge>", "<currency>", "<description>", <status>, "<created_at>", "<updated_at>"
    #API kullanicisi response bodydeki data <id>, "<email>", "<created_at>", "<updated_at>"t>" içeriklerini doğrular

    Examples:
      | id  | id  | form_id | name | min_limit    | max_limit     | fixed_charge | rate        | percent_charge | currency | description | status | created_at                  | updated_at                  |
      | 145 | 145 | 246     | 21   | 200.00000000 | 1000.00000000 | 21.00000000  | 12.00000000 | 12.00          | 21       | 21          | 1      | 2023-12-23T10:42:42.000000Z | 2023-12-23T15:39:19.000000Z |

