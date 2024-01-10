Feature: As an administrator, I want to be able to access the with-balance-user information of a user with a given ID through the API connection.

  Scenario Outline: When a GET request with valid authorization information and correct data (id) is sent to the
  'api/users/with-balance-user/{{id}}' endpoint, it should be verified that the returned status code is 200,
  and the 'remark' information in the response indicates "success"

    Given The API user sets "api/users/with-balance-user/<id>" path parameters
    And The API user saves the response from the api users with-balance-user endpoint with valid authorization information
    Then The API user verifies that the status code is 200
    And The API user verifies that the remark information in the response body is "success"

    Examples:
      | id  |
      | 296 |


  Scenario: When a GET request with valid authorization information and without the 'id' is sent to the
  'api/users/with-balance-user/{{id}}' endpoint, it should be verified that the returned status
  code is 203, and the message information in the response indicates "No id"

    Given The API user sets "api/users/with-balance-user" path parameters
    And The API user saves the response from the api users with-balance-user endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a GET request with valid authorization information and containing a non-existent 'id' is
  sent to the 'api/users/with-balance-user/{{id}}' endpoint, it should be verified that the returned status
  code is 203, and the message information in the response indicates "There is no users with this id."

    Given The API user sets "api/users/with-balance-user/<id>" path parameters
    And The API user saves the response from the api users with-balance-user endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "There is no users with this id."

    Examples:
      | id  |
      | 961 |


  Scenario Outline: When an invalid authorization information is used to send a GET request to the
  'api/users/with-balance-user/{{id}}' endpoint, it should be verified that the returned status code
  is 401, and the error information in the response body indicates "Unauthorized request"

    Given The API user sets "api/users/with-balance-user/<id>" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized

    Examples:
      | id  |
      | 296 |


  Scenario Outline: The content of the data (id, firstname, lastname, username, image, email, country_code,
  mobile, ref_by, balance) within the response body should be verified

    Given The API user sets "api/users/with-balance-user/<id>" path parameters
    And The API user saves the response from the api users with-balance-user endpoint with valid authorization information
    Then The API user verifies the content of the data in the response body which includes <id>, "<firstname>", "<lastname>", "<username>", "<image>", "<email>", "<country_code>", "<mobile>", <ref_by>, "<balance>"

    Examples:
      | id  | id  | firstname                | lastname       | username | image                       | email                     | country_code | mobile          | ref_by | balance      |
      | 296 | 296 | LESSIE FEESTAUDRY SENGER | TREUTELKOVACEK | aj641m   | 65863efbbf4cf1703296763.png | renaldo.witting@yahoo.com | FR           | 053222222222222 | 0      | 100.00000000 |