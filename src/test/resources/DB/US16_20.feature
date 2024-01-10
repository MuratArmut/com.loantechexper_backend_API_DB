@DB
Feature: US17_Users tablosunda sondan bir önceki harfi e olan usernamelerin mobile numarasını update ediniz

  Background:Database connection
    * Database connection is established.

  @DB16
  Scenario: In the "user_logins" table, separate "user id and user ip" by cities.
    * User_logins_Query prapered and executed
    * Verify separate "user_id , user_ip and city" by cities
    * Database connection is closed

  @DB17
  Scenario: User tablosunda Update data testi
    * Update the "905432121212" of the usernames with the penultimate letter e in the Users table
    * Database connection is closed
  @DB18
  Scenario: Add only the data containing "id, name, discription" to the Catagories table.
    * Catagories_table insertQuery is prepared and updated
    * Data Results are obtained.
    * Database connection is closed
    @DB19
    Scenario: List all records in the "users" table with "lastname" in reverse order and "firstname" in reverse order.
      * List all records in the "users" table with "lastname" in reverse order and "firstname" in reverse order.
      * the first lastname of the list is verified
      * Database connection is closed
      @DB20
      Scenario: "Transactions" tablosunda "remark" türüne göre "amount" değerleri toplamını bulup 1000 $dan yüksek olanları doğrulayınız.
        * In the "transactions" table, find the sum of the "amount" values according to the "remark" type and verify the ones higher than $1000
        * "total_amount" values list is verified
        * Database connection is closed
