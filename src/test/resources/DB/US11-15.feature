@DB
Feature: US11-15

  Background: Database connection
    * Database connection is established.
  @DB11
  Scenario:Verify the number of users with "user id= 1" in the "admin_notifications" table.
    * Query11 is prepared and executed.
    * Verify the number of users with "user_id= 1"
    * Database connection is closed
  @DB12
  Scenario:In the "admin_notifications" table,
  verify the "id number greater than 20" of users with "user_id =2".
    * Query12 is prepared and executed.
    * Verify the "id number greater than 20" of users with "user_id =2"
    * Database connection is closed
@DB13
  Scenario: Enter data to the "cron_job_logs" table and verify that it is added to the table.
    * Query13 is prepared and updated
    * Data Results are obtained.
  * Database connection is closed

  @DB14
  Scenario: List the 5 highest "code" values in the "Gateways" table
    * Query14 is prepared and executed
    * Verify the  List the 5 highest "code" values
    * Database connection is closed
  @DB15
  Scenario: In the "Subscribers" table, list the data that does not contain "a" in the "email" data.
    * Query15 is prepared and executed
    * Verify list the data that does not contain "a" in the "email"
    * Database connection is closed
