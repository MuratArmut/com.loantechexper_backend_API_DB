package utilities;

public class Manage {

    //01->Database içindeki "deposits" toblosunda  "amount" değeri 100$ ile 500$ arasında olan user_idleri hazırlayan Query
    private String Query01 = "SELECT user_id FROM deposits Where amount > 100 And amount <500;";

    //02->Database içindeki "admins" tablosunda "email=info@loantechexper.com"  olan datanın "remember_token" bilgisini döndüren Query
    private String Query02 = "SELECT remember_token FROM admins Where email='info@loantechexper.com';";

    //03->Database içindeki "cron_schedules" tablosunda son 2 kaydın "name" bilgisini donduren Query
    private String Query03 = "SELECT name from cron_schedules Order By created_at  LIMIT 2;";
    //04->Database içindeki "Deposits" tablosunda "amount" değeri 500.000$ altında olan dataların "charge" değerini dondurenQuery
    private String Query04 = "Select charge from deposits Where amount<500.000 And trx='4GC9SMZUS69S';";
    //05->Database içindeki "admin_password_resets" tablosuna  aynı anda birden fazla veriyi  ekleyen Query
    private String Query05 = "Insert into admin_password_resets (id,email,token,status,created_at) Values(?,?,?,?,?);";
    //06->Database içindeki "Support_messages" tablosunda "message" bilgisi "deneme_message" olan datanın "support_ticket_id" Query.
    private String Query06 = "select support_ticket_id from support_messages Where message='Tickett';";
    //07->Database içindeki "support_tickets" tablosunda  "ticket" değeri  4 ile başlayan dataların "subject" bilgisini doğrulayınız.
    private String Query07 = "select subject from support_tickets Where ticket Like '4%';";
    //08->"Users" tablosunda "country_code=TR" olmayan ve "id=2" olan datanın "firstname" ve "lastname" bilgilerini döndüren Query.
    private String Query08 = "select firstname,lastname from users Where country_code Not Like'%TR%' and id=11;";
    //09-1->Loans Table insert Query(Database üzerinden "loans" tablosunda "loan_number" girerek istenen datayı siliniz ve silindiğini doğrulayınız.)
    private String Query09 = "Insert into loans (loan_number,user_id,plan_id) Values(?,?,?);";
    //09-2 Database üzerinden "loans" tablosunda "loan_number" girerek istenen datayı siliniz ve silindiğini doğrulayınız.
    private String Query09delete = "Delete  from loans Where loan_number=?;";
    //10->Database üzerinde "divice_tokens" tablosuna istenen veriyi tek sorguda ekleyiniz.
    private String Query10 = "Insert into device_tokens (id,user_id,is_app,token,created_at) Values(?,?,?,?,now());";
    //11->"admin_notifications" tablosunda "user id= 1" ve "is_read=0"olan kullanıcı sayılarının adedi
    private String Query11 = "SELECT COUNT(*) FROM admin_notifications WHERE user_id = 1 AND is_read = 0;";
    //12->"admin_notifications" tablosunda "user id =2 " olan kullanıcıların "id numarası 20 den büyük olanları"
    private String Query12 = "SELECT COUNT(*) FROM admin_notifications WHERE user_id = 2 AND id> 20;";
    //13->"cron_job_logs" tablosuna veri girişi
    private String Query13 = "insert into cron_job_logs(id,cron_job_id,start_at,end_at,duration,error,created_at)Values(?,?,?,?,?,?,?);";
    //14->"Gateways" tablosunda en yüksek 5 "code"
    private String Query14 = "select code from gateways order by code Desc Limit 5;";
    private String Query15 = "Select * from subscribers where email Not Like '%a%';";
    private String Query16 = "select user_id,user_ip,city,COUNT(*) from user_logins group by city;";
    private String Query17 = "UPDATE users set mobile =? where username LIKE '%e_';";
    private String Query18 = "Insert into categories (id,name,description)Values(?,?,?);";
    private String Query21 = "SELECT COUNT(*) FROM admin_notifications WHERE user_id = 1 AND is_read=1;";
    private String Query22 = "UPDATE admin_password_resets SET status = ? WHERE email = ?;";
    private String depositsTotalAmount = "SELECT SUM(final_amo) AS total_amount FROM deposits WHERE status = 1 AND created_at BETWEEN '2023-01-01' AND '2023-12-25';";

    private String loan_plansQuery = "SELECT name FROM loan_plans WHERE delay_value > 0 AND (fixed_charge > 0 OR percent_charge > 0) Limit 3;";

    public String deleteUpdateLog = "DELETE FROM update_logs WHERE id = ?;";

    private String updateLogs = "UPDATE update_logs SET update_log = ? WHERE version = ? And id= ?;";
    private String insertupdate_Logs = "Insert into update_logs (id,version,update_log,created_at) values(?,?,?,?);";

    private String depositsGatewaysCalculater = "  SELECT g.currency,SUM(amount) AS total_amount FROM deposits d JOIN gateway_currencies g ON d.method_code = g.method_code GROUP BY g.currency;";

    private String support_attachments = "DELETE FROM support_attachments WHERE support_message_id = ?;";
    private String support_attachmentsInsertQuery="insert into support_attachments(id,support_message_id,attachment)Values(?,?,'658401a61409c1703149990.png');";

    private String admin_notificationsTableQuery = "UPDATE admin_notifications SET is_read = ? WHERE id = ? ;";

    public String getSupport_attachmentsInsertQuery() {
        return support_attachmentsInsertQuery;
    }

    private String loansCalculate = "SELECT loan_id, SUM(delay_charge) AS total_delay_charge FROM installments WHERE loan_id = 1 GROUP BY loan_id;";
    private String Query19 = "SELECT * FROM users ORDER BY lastname, firstname DESC;";
    private String transectionTable = "SELECT remark, SUM(amount) AS total_amount FROM transactions GROUP BY remark HAVING total_amount > 1000;";

    public String getDepositsGatewaysCalculater() {
        return depositsGatewaysCalculater;
    }

    public String getLoan_plansQuery() {
        return loan_plansQuery;
    }

    public String getUpdateLogs() {
        return updateLogs;
    }

    public String getDeleteUpdateLog() {
        return deleteUpdateLog;
    }

    public String getInsertupdate_Logs() {
        return insertupdate_Logs;
    }

    public String getAdmin_notificationsTableQuery() {
        return admin_notificationsTableQuery;
    }

    public String getSupport_attachments() {
        return support_attachments;
    }

    public String getLoansCalculate() {
        return loansCalculate;
    }

    public String getQuery01() {
        return Query01;
    }

    public String getQuery02() {
        return Query02;
    }

    public String getQuery03() {
        return Query03;
    }

    public String getQuery04() {
        return Query04;
    }

    public String getQuery05() {
        return Query05;
    }

    public String getQuery06() {
        return Query06;
    }

    public String getQuery07() {
        return Query07;
    }

    public String getQuery08() {
        return Query08;
    }

    public String getQuery09() {
        return Query09;
    }

    public String getQuery11() {
        return Query11;
    }

    public String getQuery14() {
        return Query14;
    }

    public String getQuery12() {
        return Query12;
    }

    public String getQuery13() {
        return Query13;
    }

    public String getQuery10() {
        return Query10;
    }

    public String getQuery15() {
        return Query15;
    }

    public String getQuery16() {
        return Query16;
    }


    public String getQuery17() {
        return Query17;
    }

    public String getQuery18() {
        return Query18;
    }

    public String getQuery21() {
        return Query21;
    }

    public String getQuery19() {
        return Query19;
    }

    public String getQuery22() {
        return Query22;
    }

    public String getQuery09delete() {
        return Query09delete;
    }

    public String getDepositsTotalAmount() {
        return depositsTotalAmount;
    }

    public String getTransactionTable() {
        return transectionTable;
    }


}
