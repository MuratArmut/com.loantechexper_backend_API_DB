@DB
Feature: US21_30

  Background:Database connection
    * Database connection is established.

  @DB21
  Scenario: Verify the number of users with "is_read=1" and "user_id = 1" in the "admin_notifications" table.
    * admin_notifications_table Query is prepared and executed
    * User result values are validated
    * Database connection is closed

  @DB22
  Scenario: admin_password_resets tablosunda status=0 olan Kullanıcının Şifre Sıfırlama İsteğini "email" bilgisini girerek Update ediniz.
    * admin_password_resets_Query is prepared and executed.
    * Data Results are obtained.
    * e_mail is prepared for admin_password_resets query and status is updated.
    * Data Results are validate.
    * Database connection is closed

  @DB23
  Scenario: Belirli Bir "created_at" aralığındaki "status=1" olan Depozitleri Toplam Tutarları ile Birlikte listeleyiniz
    * depositsTable is prepared and executed.
    * Deposits result values are validated
    * Database connection is closed

  @DB24
  Scenario: "id=?" olan kullanıcının "is_read=0" olan bildirimlerini '1' Olarak Update edip doğrulayınız.
    * UpdateQuery is prepared
    * Data Results are validate.
    * Database connection is closed

  @DB25
  Scenario: "currency=USD" Calculate the Total Amount of Deposits from "gateway_currencies" table
    * gateway_currenciesQuery is prepared
    * Database connection is closed

  @DB26
  Scenario: Calculate the "total_delay_charge" for loans with "loan_id=1" by grouping them according to the "loan_id" value.
    * Prepare the Query that groups the "total_delay_charge" cost of the Loans with "loan_id=1" according to the "loan_id" value
    * Verifies the "total_delay_charge" cost of credits
    * Database connection is closed

  @DB27
  Scenario: "delay_value" ve "fixed_charge ya da percent_charge" değerlerine göre loan_plans tablosundaki ilk 3 "name" bilgisini doğrulayınız.
    * Query is prepared in the loan_plans table according to the values "delay_value" ve "fixed_charge ya da percent_charge"
    * Verifies the "name" Results
    * Database connection is closed

  @DB28
  Scenario: Update and verify the "update_log" value of the data with "version=?" in the "update_logs" table.
    * update_log tables insert Query prepared
    * Data Results are validate.
    * Update_log tables Query prepared and updated.
    * Data Results are obtained.
    * Database connection is closed

  @DB29
  Scenario: Delete a data according to the "id" value in the update_logs table and verify that it has been deleted
    * update_log tables insert Query prepared
    * Data Results are validate.
    * Prepares update_log Query to be deleted
    * Data Results are obtained.
    * Database connection is closed

  @DB30
  Scenario: Delete a file according to the "support_message_id=?" value in the "support_attachments" table and verify that it has been deleted.
    * support_attachments tables delete Query prepared
    * Data Results are obtained.
    * Database connection is closed
