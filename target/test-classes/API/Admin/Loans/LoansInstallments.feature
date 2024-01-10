Feature: As an administrator, I want to access information about loans installments with a given ID through the AP.

  Scenario Outline: When a valid GET request is sent to the "api/loans/installments/{{id}}" endpoint with proper
  authorization credentials and correct data (ID), it should be verified that the returned status code
  is 200, and the response remark message is "success"

    Given The API user sets "api/loans/installments/<id>" path parameters
    And The API user records the response from the api loans installments endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

    Examples:
      | id |
      | 1  |


  Scenario: When a valid GET request is sent to the "api/loans/installments/{{id}}" endpoint with proper
  authorization credentials but without including the ID, it should be verified that the returned status
  code is 203, and the response message is "No id"

    Given The API user sets "api/loans/installments" path parameters
    And The API user records the response from the api loans installments endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a valid GET request is sent to the "api/loans/installments/{{id}}" endpoint with
  proper authorization credentials and an ID that does not correspond to an existing loan, it should be
  verified that the returned status code is 203, and the response message is "No Loan"

    Given The API user sets "api/loans/installments/<id>" path parameters
    And The API user records the response from the api loans installments endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No Loan"

    Examples:
      | id  |
      | 456 |


  Scenario Outline: When an invalid authorization is used to send a GET request to the
  "api/loans/installments/{{id}}" endpoint, it should be verified that the returned status
  code is 401, and the response body contains an error message indicating "Unauthorized request"

    Given The API user sets "api/loans/installments/<id>" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized

    Examples:
      | id |
      | 1  |


  Scenario Outline: Verify the information returned in the response body for the loan installment with ID (x):
  (loan_id, delay_charge, installment_date, given_at)

    Given The API user sets "api/loans/installments/<id>" path parameters
    And The API user records the response from the api loans installments endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: <loan_id>, "<delay_charge>", "<installment_date>"

    Examples:
      | id | dataIndex | loan_id | delay_charge | installment_date            |
      | 1  | 1         | 1       | 0.00000000   | 2023-12-15T05:00:00.000000Z |