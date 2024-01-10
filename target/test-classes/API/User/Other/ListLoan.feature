Feature: As a user, I want to access the list of loans via API connection.

  Scenario: When a valid GET request is sent to the 'user/list/loan' endpoint with the appropriate
  authorization credentials, it should return a status code of 200, and the response remark should be "success"

    Given The API user sets "user/list/loan" path parameters
    And The API user saves the response from the user list loan endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"


  Scenario: Verify that when a GET request is sent to the 'user/list/loan' endpoint with invalid
  authorization information, the returned status code is 401, and the error message in the response
  body is "Unauthorized request"

    Given The API user sets "user/list/loan" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized


  Scenario Outline: Verify the information returned in the response for the entity with id(x) (loan_number,
  user_id, plan_id, amount, per_installment, installment_interval, delay_value, charge_per_installment,
  delay_charge, given_installment, total_installment, admin_feedback, status,
  due_notification_sent, approved_at, created_at, updated_at)

    Given The API user sets "user/list/loan" path parameters
    And The API user saves the response from the user list loan endpoint with valid authorization information
    Then Verify the information of the one with the index <dataIndex> in the API user response body "<loan_number>", <user_id>, <plan_id>, "<amount>", "<per_installment>", <installment_interval>, <delay_value>, "<charge_per_installment>", "<delay_charge>", <given_installment>, <total_installment>, <status>, "<approved_at>", "<created_at>", "<updated_at>"

    Examples:
      | dataIndex | loan_number  | user_id | plan_id | amount        | per_installment | installment_interval | delay_value | charge_per_installment | delay_charge | given_installment | total_installment | status | approved_at                 | created_at                  | updated_at                  |
      | 0         | WCCZ6VQXG3TV | 11      | 15      | 3000.00000000 | 180.00000000    | 20                   | 2           | 100.60000000           | 0.00000000   | 0                 | 20                | 1      | 2023-12-14T15:06:50.000000Z | 2023-12-14T15:06:10.000000Z | 2023-12-14T15:06:50.000000Z |