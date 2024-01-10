@DB
Feature: US06-11

  Background: Database connection
    * Database connection is established.

  @DB06
  Scenario: In the "Support_messages" table in the database,
  verify the "support_ticket_id" of the data whose "message" information is "Tickett".
    * Query06 is prepared and executed.
    * Verify the support_ticket_id information Results are obtained.
    * Database connection is closed

  @DB07
  Scenario: In the "support_tickets" table in the database,
  verify the "subject" information of the data whose "ticket" value starts with 4.
    * Query07 is prepared and executed.
    * Verify the subject information Results are obtained.
    * Database connection is closed

  @DB08
  Scenario: Verify the "firstname" and "lastname" information of the data
  without "country_code=TR"and "id=2" in the "Users" table.
    * Query08 is prepared and executed.
    * Verify the firstname,lastname information Results are obtained.
    * Database connection is closed
  @DB09
  Scenario: Delete the requested data by entering
  "loan_number" in the "loans" table on the database and verify that it has been deleted.
    * Query09 is prepared and updated.
    * Loan_number is prepared and deleted
    * Verifies that the query information has been deleted.
    * Database connection is closed

  @DB10
  Scenario: Add the desired data to the "divice_tokens" table on the database in a single query.
    * Query10 is prepared and updated.
    * Data Results are obtained.
    * Database connection is closed


