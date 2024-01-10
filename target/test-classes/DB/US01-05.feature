@DB
Feature: US01/US02/US03/US04/US05
  Background: Database connection
    * Database connection is established.
 @DB01
  Scenario:US01 Verify user_ids with "amount" value between $100 and $500 in the "deposits" table in the database
    * Query is prepared and executed.
    * Results are obtained.
    * Database connection is closed
   @DB02
   Scenario: US02 Verify the "remember_token" information
   of the data "email=info@loantechexper.com" in the "admins" table in the database
     * "AdminsTableQuery" is prepared and executed.
     * Verify the "remember_token" information Results are obtained.
     * Database connection is closed
  @DB03
     Scenario: US03 Verify the "name" information of the last 3 records in the "cron_schedules" table in the database
       * cron_schedules_Query is prepared and executed.
       * name Results are obtained.
       * Database connection is closed
    @DB04
    Scenario: US04 In the "Deposits" table in the database,
    verify the "charge" value of the data whose "amount" value is below $500,000
      * deposits_Query is prepared and executed.
      * "charge" value of the data Results are obtained.
      * Database connection is closed
      @DB05
      Scenario: US05 Add multiple data to the "admin_password_resets" table in the database at the same time.

        * admin_password_resets_Query is prepared and executed.
        * Data Results are obtained.
        * Database connection is closed