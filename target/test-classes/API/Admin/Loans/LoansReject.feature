Feature: As an administrator, I want to be able to reject the loan information of a user with a given ID through the API connection.

  Scenario Outline: When a POST request with valid authorization information, correct 'id and correct data
  (reason) is sent to the 'api/loans/reject/{{id}}' endpoint, it should be verified that the returned status
  code is 200, the message information in the response body indicates "Loan rejected successfully" and the
  Reason information is "Bank info is wrong."

    Given The API user sets "api/loans/reject/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loans reject endpoint
    When The API user sends a POST request and records the response returned from the api loans reject endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Loan rejected successfully"
    * The API user verifies that the Reason information in the response body is "Bank info is wrong."

    Examples:
      | id  |
      | 351 |


  Scenario Outline: When valid authorization information is provided along with a correct (id) to the
  'api/loans/reject/{{id}}' endpoint, and the POST body does not contain valid data for the reason,
  the expected status code is 200. Additionally, the message information in the response body should
  be confirmed as "Loan rejected successfully" and the Reason information should be verified as null

    Given The API user sets "api/loans/reject/<id>" path parameters
    And The API user prepares a POST request without data to send to the api loans reject endpoint
    When The API user sends a POST request and records the response returned from the api loans reject endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Loan rejected successfully"
    * The API user verifies that the Reason information in the response body is null

    Examples:
      | id  |
      | 352 |


  Scenario Outline:api/loans/reject/{{id}} endpoint'ine gecerli authorization bilgileri ve daha önce reject
  edilen (id) iceren bir POST body (reason) gönderildiginde dönen status code'in 203 oldugu ve response
  body'deki message bilgisinin "No loan or loan status is not pending." oldugu dogrulanmali

    Given The API user sets "api/loans/reject/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loans reject endpoint
    When The API user sends a POST request and records the response returned from the api loans reject endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No loan or loan status is not pending."

    Examples:
      | id  |
      | 351 |


  Scenario: When valid authorization information is provided along with a POST body that lacks the required
  (id) parameter (reason) to the 'api/loans/reject/{{id}}' endpoint, the expected status code is 203.
  Furthermore, the message information in the response body should be confirmed as "No id"

    Given The API user sets "api/loans/reject" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loans reject endpoint
    When The API user sends a POST request and records the response returned from the api loans reject endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When valid authorization information is provided along with a POST body
  containing an invalid (id) for an unregistered record (reason) to the 'api/loans/reject/{{id}}'
  endpoint, the expected status code is 203. Additionally, the message information in the response
  body should be confirmed as "No loan."

    Given The API user sets "api/loans/reject/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loans reject endpoint
    When The API user sends a POST request and records the response returned from the api loans reject endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No loan."

    Examples:
      | id  |
      | 551 |


  Scenario Outline: When invalid authorization information is provided along with a correct (id) and a
  POST body (reason) to the 'api/loans/reject/{{id}}' endpoint, the expected status code is 401.
  Furthermore, the error message in the response body should be confirmed as "Unauthorized request"

    Given The API user sets "api/loans/reject/<id>" path parameters
    And The API user prepares a POST request containing the correct data to send to the api loans reject endpoint
    When The API user sends a POST request and records the response returned from the api loans reject endpoint with invalid authorization information
    Then The API user verifies that the status code is 401
    And The API user verifies that the error information in the response body is "Unauthorized request"

    Examples:
      | id  |
      | 351 |
