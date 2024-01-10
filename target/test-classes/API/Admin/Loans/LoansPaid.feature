Feature: As an administrator, I want to access the list of paid loans via API connection.

  Scenario: When a valid GET request with appropriate authorization credentials is sent to the
  'api/loans/paid' endpoint, it should return a status code of 200, and the response remark
  should be "success"

    Given The API user sets "api/loans/paid" path parameters
    And The API user records the response from the api loans paid endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: When an invalid GET request with unauthorized credentials is sent to the
  'api/loans/paid' endpoint, it should return a status code of 401, and the response
  error message should be "Unauthorized request"

    Given The API user sets "api/loans/paid" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline: Verify the information returned in the response for the loan with ID (x)
  in terms of (loan_number, user_id, plan_id, amount, per_installment, installment_interval,
  delay_value, charge_per_installment, delay_charge, given_installment, total_installment,
  application_form, admin_feedback, status, due_notification_sent, approved_at, created_at, updated_at)

    Given The API user sets "api/loans/paid" path parameters
    And The API user records the response from the api loans paid endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body: "<loan_number>", <user_id>, <plan_id>, "<amount>", "<per_installment>", <installment_interval>, <delay_value>, "<charge_per_installment>", "<delay_charge>", <given_installment>, <total_installment>, <status>, "<approved_at>", "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | loan_number  | user_id | plan_id | amount        | per_installment | installment_interval | delay_value | charge_per_installment | delay_charge | given_installment | total_installment | status | approved_at                 | created_at                  | updated_at                  |
      | 1         | E78MDDT4N7OV | 22      | 55      | 1000.00000000 | 30.00000000     | 30                   | 1           | 100.30000000           | 0.00000000   | 0                 | 10                | 1      | 2023-12-22T09:48:20.000000Z | 2023-12-22T09:32:19.000000Z | 2023-12-22T09:48:20.000000Z |