Feature: As an administrator, I want to access the loan plan details of a user with a specified ID via API connection.

  Scenario Outline: When a GET request with valid authorization information and correct data (id) is sent to
  the api/loanplans/details/{{id}} endpoint, the returned status code should be 200, and the response remark
  should be verified as "success"

    Given The API user sets "api/loanplans/details/<id>" path parameters
    And The API user records the response from the api loanplans details endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

    Examples:
      | id  |
      | 261 |


  Scenario:When a GET request with valid authorization information and no 'id' is sent to the
  api/loanplans/details/{{id}} endpoint, the returned status code should be 203, and the
  response message should be verified as "No id"

    Given The API user sets "api/loanplans/details" path parameters
    And The API user records the response from the api loanplans details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a GET request with valid authorization information and a non-existent 'id' is
  sent to the api/loanplans/details/{{id}} endpoint, the returned status code should be 203, and the
  response message should be verified as "No loanplans."

    Given The API user sets "api/loanplans/details/<id>" path parameters
    And The API user records the response from the api loanplans details endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No loanplans."

    Examples:
      | id  |
      | 500 |


  Scenario Outline: When a GET request with invalid authorization information is sent to the
  api/loanplans/details/{{id}} endpoint, the returned status code should be 401, and the error
  message in the response body should be verified as "Unauthorized request"

    Given The API user sets "api/loanplans/details/<id>" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized

    Examples:
      | id  |
      | 261 |


  Scenario Outline: The contents of data (id, category_id, form_id, name, title, minimum_amount, maximum_amount,
  per_installment, installment_interval, total_installment, application_fixed_charge, application_percent_charge,
  instruction, delay_value, fixed_charge, percent_charge, is_featured, status, created_at, updated_at) in the
  response body should be verified

    Given The API user sets "api/loanplans/details/<id>" path parameters
    And The API user records the response from the api loanplans details endpoint with valid authorization information
    Then The API user verifies that the content of the data field in the response body includes <id>, <category_id>, <form_id>, "<name>", "<title>", "<minimum_amount>", "<maximum_amount>", "<per_installment>", <installment_interval>, <total_installment>, "<application_fixed_charge>", "<application_percent_charge>", "<instruction>", <delay_value>, "<fixed_charge>", "<percent_charge>", <is_featured>, <status>, "<created_at>", "<updated_at>"

    Examples:
      | id  | id  | category_id | form_id | name       | title      | minimum_amount | maximum_amount | per_installment | installment_interval | total_installment | application_fixed_charge | application_percent_charge | instruction     | delay_value | fixed_charge | percent_charge | is_featured | status | created_at                  | updated_at                  |
      | 261 | 261 | 1           | 638     | Car Loan 9 | Car Loan 9 | 2000.00000000  | 5000.00000000  | 4.00            | 20                   | 20                | 20.00000000              | 3.00000000                 | Car Loan Plan 9 | 25          | 100.00000000 | 1.00000000     | 0           | 1      | 2024-01-06T17:31:29.000000Z | 2024-01-06T17:31:29.000000Z |


