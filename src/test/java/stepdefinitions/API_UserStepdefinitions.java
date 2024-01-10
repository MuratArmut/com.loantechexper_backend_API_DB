package stepdefinitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.json.JSONObject;
import utilities.ReusableMethods;

import java.util.Arrays;

import static hooks.HooksAPI.spec;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.*;

public class API_UserStepdefinitions {
    public static String fullPath;
    JsonPath jsonPath;
    JSONObject requestBody;
    public static String id;
    Response response;

    @Given("The API user sets {string} path parameters")
    public void the_apı_user_sets_path_parameters(String rawPaths) {
        String[] paths = rawPaths.split("/");

        System.out.println(Arrays.toString(paths));

        StringBuilder tempPath = new StringBuilder("/{");


        for (int i = 0; i < paths.length; i++) {

            String key = "pp" + i;
            String value = paths[i].trim();

            spec.pathParam(key, value);

            tempPath.append(key + "}/{");
        }
        tempPath.deleteCharAt(tempPath.lastIndexOf("/"));
        tempPath.deleteCharAt(tempPath.lastIndexOf("{"));

        fullPath = tempPath.toString();
        System.out.println("fullPath = " + fullPath);
    }

    //********************************* user/ticket/list ***********************************************
    @Given("The API user saves the response from the user ticket list endpoint with valid authorization information")
    public void the_apı_user_saves_the_response_from_the_user_ticket_list_endpoint_with_valid_authorization_information() {
        ReusableMethods.getResponse("user");
    }

    @Then("The API user verifies that the status code is {int}")
    public void theAPIUserVerifiesThatTheStatusCodeIs(int code) {

        ReusableMethods.response.then()
                .assertThat()
                .statusCode(code);
    }

    @And("The API user verifies that the remark information in the response body is {string}")
    public void theAPIUserVerifiesThatTheRemarkInformationInTheResponseBodyIs(String remark) {
        ReusableMethods.response.then()
                .assertThat()
                .body("remark", equalTo(remark));
    }

    @Then("Verify the information of the one with the id {int} in the API user response body: {int}, {string}, {string}, {string}, {string}, {int}, {int}, {string}, {string}, {string}")
    public void verify_the_information_of_the_one_with_the_id_in_the_apı_user_response_body(int dataIndex, int user_id, String name, String email, String ticket, String subject, int status, int priority, String last_reply, String created_at, String updated_at) {
        jsonPath = ReusableMethods.response.jsonPath();

        assertEquals(user_id, jsonPath.getInt("data[" + dataIndex + "].user_id"));
        assertEquals(name, jsonPath.getString("data[" + dataIndex + "].name"));
        assertEquals(email, jsonPath.getString("data[" + dataIndex + "].email"));
        assertEquals(ticket, jsonPath.getString("data[" + dataIndex + "].ticket"));
        assertEquals(subject, jsonPath.getString("data[" + dataIndex + "].subject"));
        assertEquals(status, jsonPath.getInt("data[" + dataIndex + "].status"));
        assertEquals(priority, jsonPath.getInt("data[" + dataIndex + "].priority"));
        assertEquals(last_reply, jsonPath.getString("data[" + dataIndex + "].last_reply"));
        assertEquals(created_at, jsonPath.getString("data[" + dataIndex + "].created_at"));
        assertEquals(updated_at, jsonPath.getString("data[" + dataIndex + "].updated_at"));
    }
    //*************************************************************************************************

    //********************************* user/ticket/detail/{{id}} *************************************
    @Given("The API user saves the response from the user ticket detail endpoint with valid authorization information")
    public void the_apı_user_saves_the_response_from_the_user_ticket_detail_endpoint_with_valid_authorization_information() {
        ReusableMethods.getResponse("user");
    }

    @Then("The API user verifies that the success attribute in the response body is true")
    public void the_apı_user_verifies_that_the_success_attribute_in_the_response_body_is_true() {
        jsonPath = ReusableMethods.response.jsonPath();

        assertEquals(true, jsonPath.getBoolean("success"));
    }

    @Then("The API user verifies that the content of the data field in the response body includes {int}, {int}, {string}, {string}, {string}, {string}, {int}, {int}, {string}, {string}, {string}")
    public void the_apı_user_verifies_that_the_content_of_the_data_field_in_the_response_body_includes(int id, int user_id, String name, String email, String ticket, String subject, int status, int priority, String last_reply, String created_at, String updated_at) {
        jsonPath = ReusableMethods.response.jsonPath();

        assertEquals(id, jsonPath.getInt("data.id"));
        assertEquals(user_id, jsonPath.getInt("data.user_id"));
        assertEquals(name, jsonPath.getString("data.name"));
        assertEquals(email, jsonPath.getString("data.email"));
        assertEquals(ticket, jsonPath.getString("data.ticket"));
        assertEquals(subject, jsonPath.getString("data.subject"));
        assertEquals(status, jsonPath.getInt("data.status"));
        assertEquals(priority, jsonPath.getInt("data.priority"));
        assertEquals(last_reply, jsonPath.getString("data.last_reply"));
        assertEquals(created_at, jsonPath.getString("data.created_at"));
        assertEquals(updated_at, jsonPath.getString("data.updated_at"));
    }
    //*************************************************************************************************

    //********************************* user/ticket/add ***********************************************
    @And("The API user prepares a POST request containing the correct data to send to the user ticket add endpoint")
    public void theAPIUserPreparesAPOSTRequestContainingTheCorrectDataToSendToTheUserTicketAddEndpoint() {
        requestBody = new JSONObject();
        requestBody.put("subject", "Test Ticket");
        requestBody.put("priority", "Medium");
        requestBody.put("message", "Test Ticket Message-");
    }

    @When("The API user sends a POST request and saves the response from the user ticket add endpoint with valid authorization information")
    public void the_apı_user_sends_a_post_request_and_saves_the_response_from_the_user_ticket_add_endpoint_with_valid_authorization_information() {
        ReusableMethods.postResponse("user", requestBody.toString());
    }

    @And("The API user verifies that the message information in the response body is {string}")
    public void theAPIUserVerifiesThatTheMessageInformationInTheResponseBodyIs(String message) {
        ReusableMethods.response.then()
                .assertThat()
                .body("message", equalTo(message));
    }

    @And("The API user prepares a POST request without data to send to the user ticket add endpoint")
    public void theAPIUserPreparesAPOSTRequestWithoutDataToSendToTheUserTicketAddEndpoint() {
        requestBody = new JSONObject();
    }

    @And("The API user prepares a POST request with missing data to send to the user ticket add endpoint.")
    public void theAPIUserPreparesAPOSTRequestWithMissingDataToSendToTheUserTicketAddEndpoint() {
        requestBody = new JSONObject();
        requestBody.put("subject", "Test Ticket");
    }

    @When("The API user sends a POST request and saves the response from the user ticket add endpoint with invalid authorization information")
    public void the_apı_user_sends_a_post_request_and_saves_the_response_from_the_user_ticket_add_endpoint_with_invalid_authorization_information() {
        ReusableMethods.postResponse("invalidToken", requestBody.toString());
    }
    //***********************************************************************************************

    //********************************* user/ticket/close/{{id}} *******************************************
    @And("The API user saves the response from the user ticket close endpoint with valid authorization information")
    public void theAPIUserSavesTheResponseFromTheUserTicketCloseEndpointWithValidAuthorizationInformation() {
        ReusableMethods.patchResponse("user");
    }

    @Then("The API user saves the response from the user ticket close endpoint with invalid authorization information and verifies that the status code is '401' and the error message is Unauthorized")
    public void the_apı_user_saves_the_response_from_the_user_ticket_close_endpoint_with_invalid_authorization_information_and_verifies_that_the_status_code_is_and_the_error_message_is_unauthorized() {
        assertTrue(ReusableMethods.tryCatchPatch().contains("status code: 401, reason phrase: Unauthorized"));
    }
    @Then("The API user Verifies that the status information in the response body is {int}")
    public void the_apı_user_verifies_that_the_status_information_in_the_response_body_is(int status) {
        jsonPath=ReusableMethods.response.jsonPath();

        assertEquals(status,jsonPath.getInt("data.status"));
    }
    //************************************************************************************************

    //********************************* user/ticket/delete/{{id}} *******************************************
    @Given("The API user saves the response from the user ticket delete endpoint with valid authorization information")
    public void the_apı_user_saves_the_response_from_the_user_ticket_delete_endpoint_with_valid_authorization_information() {
        ReusableMethods.deleteResponse("user");
    }

    @Then("The API user saves the response from the user ticket delete endpoint with invalid authorization information and confirms that the status code is '401' and the error message is Unauthorized")
    public void the_apı_user_saves_the_response_from_the_user_ticket_delete_endpoint_with_invalid_authorization_information_and_confirms_that_the_status_code_is_and_the_error_message_is_unauthorized() {
        assertTrue(ReusableMethods.tryCatchDelete().contains("status code: 401, reason phrase: Unauthorized"));
    }

    @Then("The API User verifies that the message information in the response body is {string}")
    public void the_apı_user_verifies_that_the_message_information_in_the_response_body_is(String message) {
        ReusableMethods.response.then()
                .assertThat()
                .body("data.message", equalTo(message));
    }

    //*************************************************************************************************

    //********************************* user/profile **************************************************
    @And("The API user prepares a PATCH request containing the correct data to send to the user profile endpoint")
    public void theAPIUserPreparesAPATCHRequestContainingTheCorrectDataToSendToTheUserProfileEndpoint() {
        requestBody = new JSONObject();
        requestBody.put("firstname", "Mehmet");
        requestBody.put("lastname", "Genç");
        requestBody.put("address", "New York");
        requestBody.put("state", "New York City");
        requestBody.put("zip", "125874");
        requestBody.put("city", "New York City");
    }

    @When("The API user sends a PATCH request and saves the response from the user profile endpoint with valid authorization information")
    public void theAPIUserSendsAPATCHRequestAndSavesTheResponseFromTheUserProfileEndpointWithValidAuthorizationInformation() {
        ReusableMethods.patchResponseBody("user", requestBody.toString());
    }

    @And("The API user prepares a PATCH request with missing data to send to the user profile endpoint")
    public void theAPIUserPreparesAPATCHRequestWithMissingDataToSendToTheUserProfileEndpoint() {
        requestBody = new JSONObject();
        requestBody.put("address", "New York");
        requestBody.put("state", "New York City");
        requestBody.put("zip", "125874");
        requestBody.put("city", "New York City");

    }

    @And("The API user prepares a PATCH request without data to send to the user profile endpoint")
    public void theAPIUserPreparesAPATCHRequestWithoutDataToSendToTheUserProfileEndpoint() {
        requestBody = new JSONObject();
    }

    @Then("The API user saves the response from the user profile endpoint with invalid authorization information and verifies that the status code is '401' and the error message is Unauthorized")
    public void the_apı_user_saves_the_response_from_the_user_profile_endpoint_with_invalid_authorization_information_and_verifies_that_the_status_code_is_and_the_error_message_is_unauthorized() {
        assertTrue(ReusableMethods.tryCatchPatchBody(requestBody.toString()).contains("status code: 401, reason phrase: Unauthorized"));
    }

    //*********************************************************************************************

    //********************************* user/changepassword ****************************************
    @And("The API user prepares a PATCH request containing the correct data to send to the user change password endpoint")
    public void theAPIUserPreparesAPATCHRequestContainingTheCorrectDataToSendToTheUserChangePasswordEndpoint() {
        requestBody = new JSONObject();
        requestBody.put("current_password", "Loan.741");
        requestBody.put("password", "{ASd125}");
    }


    @When("The API user sends a PATCH request and saves the response from the user change password endpoint with valid authorization information")
    public void the_apı_user_sends_a_patch_request_and_saves_the_response_from_the_user_change_password_endpoint_with_valid_authorization_information() {
        ReusableMethods.patchResponseBody("user", requestBody.toString());
    }

    @And("The API user prepares a PATCH request to send to the user change password endpoint with a new password containing only numbers")
    public void theAPIUserPreparesAPATCHRequestToSendToTheUserChangePasswordEndpointWithANewPasswordContainingOnlyNumbers() {
        requestBody = new JSONObject();
        requestBody.put("current_password", "Loan.741");
        requestBody.put("password", "123123123");
    }

    @And("The API user prepares a PATCH request to send to the user change password endpoint with a new password containing at least one uppercase letter, one lowercase letter, and a number")
    public void theAPIUserPreparesAPATCHRequestToSendToTheUserChangePasswordEndpointWithANewPasswordContainingAtLeastOneUppercaseLetterOneLowercaseLetterAndANumber() {
        requestBody = new JSONObject();
        requestBody.put("current_password", "Loan.741");
        requestBody.put("password", "12345Aa");
    }

    @Then("The API user saves the response from the user change password endpoint with invalid authorization information and confirms that the status code is '401' and the error message is Unauthorized")
    public void the_apı_user_saves_the_response_from_the_user_change_password_endpoint_with_invalid_authorization_information_and_confirms_that_the_status_code_is_and_the_error_message_is_unauthorized() {
        assertTrue(ReusableMethods.tryCatchPatchBody(requestBody.toString()).contains("status code: 401, reason phrase: Unauthorized"));
    }
    //**********************************************************************************************

    //********************************* user/plan **************************************************
    @Given("The API user saves the response from the user plan endpoint with valid authorization information")
    public void the_apı_user_saves_the_response_from_the_user_plan_endpoint_with_valid_authorization_information() {
        ReusableMethods.getResponse("user");
    }

    @Then("Verify the information of the one with the index {int} in the API user response body: {string}, {string}, {int}, {string}, {string}")
    public void verify_the_information_of_the_one_with_the_index_in_the_apı_user_response_body(int dataIndex, String name, String description, int status, String created_at, String updated_at) {
        jsonPath = ReusableMethods.response.jsonPath();

        assertEquals(name, jsonPath.getString("data[" + dataIndex + "].name"));
        assertNull(jsonPath.get("data[2].image"));
        assertEquals(description, jsonPath.getString("data[" + dataIndex + "].description"));
        assertEquals(status, jsonPath.getInt("data[" + dataIndex + "].status"));
        assertEquals(created_at, jsonPath.getString("data[" + dataIndex + "].created_at"));
        assertEquals(updated_at, jsonPath.getString("data[" + dataIndex + "].updated_at"));
    }
    //************************************************************************************************

    //********************************* user/list/transaction ****************************************
    @And("The API user saves the response from the user list transaction endpoint with valid authorization information")
    public void theAPIUserSavesTheResponseFromTheUserListTransactionEndpointWithValidAuthorizationInformation() {
        ReusableMethods.getResponse("user");
    }

    @Then("Verify the information of the one with the index {int} in the API user response body: {int}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}")
    public void verify_the_information_of_the_one_with_the_index_in_the_apı_user_response_body(int dataIndex, int user_id, String amount, String charge, String post_balance, String trx_type, String trx, String details, String remark, String created_at, String updated_at) {
        jsonPath = ReusableMethods.response.jsonPath();

        assertEquals(user_id, jsonPath.getInt("data[" + dataIndex + "].user_id"));
        assertEquals(amount, jsonPath.getString("data[" + dataIndex + "].amount"));
        assertEquals(charge, jsonPath.getString("data[" + dataIndex + "].charge"));
        assertEquals(post_balance, jsonPath.getString("data[" + dataIndex + "].post_balance"));
        assertEquals(post_balance, jsonPath.getString("data[" + dataIndex + "].post_balance"));
        assertEquals(trx_type, jsonPath.getString("data[" + dataIndex + "].trx_type"));
        assertEquals(trx, jsonPath.getString("data[" + dataIndex + "].trx"));
        assertEquals(details, jsonPath.getString("data[" + dataIndex + "].details"));
        assertEquals(remark, jsonPath.getString("data[" + dataIndex + "].remark"));
        assertEquals(created_at, jsonPath.getString("data[" + dataIndex + "].created_at"));
        assertEquals(updated_at, jsonPath.getString("data[" + dataIndex + "].updated_at"));

    }
    //*************************************************************************************************

    //********************************* user/list/loan ************************************************
    @And("The API user saves the response from the user list loan endpoint with valid authorization information")
    public void theAPIUserSavesTheResponseFromTheUserListLoanEndpointWithValidAuthorizationInformation() {
        ReusableMethods.getResponse("user");
    }

    @Then("Verify the information of the one with the index {int} in the API user response body {string}, {int}, {int}, {string}, {string}, {int}, {int}, {string}, {string}, {int}, {int}, {int}, {string}, {string}, {string}")
    public void verify_the_information_of_the_one_with_the_index_in_the_apı_user_response_body(int dataIndex, String loan_number, int user_id, int plan_id, String amount, String per_installment, int installment_interval, int delay_value, String charge_per_installment, String delay_charge, int given_installment, int total_installment, int status, String approved_at, String created_at, String updated_at) {
        jsonPath = ReusableMethods.response.jsonPath();

        assertEquals(loan_number, jsonPath.getString("data[" + dataIndex + "].loan_number"));
        assertEquals(user_id, jsonPath.getInt("data[" + dataIndex + "].user_id"));
        assertEquals(plan_id, jsonPath.getInt("data[" + dataIndex + "].plan_id"));
        assertEquals(amount, jsonPath.getString("data[" + dataIndex + "].amount"));
        assertEquals(per_installment, jsonPath.getString("data[" + dataIndex + "].per_installment"));
        assertEquals(installment_interval, jsonPath.getInt("data[" + dataIndex + "].installment_interval"));
        assertEquals(delay_value, jsonPath.getInt("data[" + dataIndex + "].delay_value"));
        assertEquals(charge_per_installment, jsonPath.getString("data[" + dataIndex + "].charge_per_installment"));
        assertEquals(delay_charge, jsonPath.getString("data[" + dataIndex + "].delay_charge"));
        assertEquals(given_installment, jsonPath.getInt("data[" + dataIndex + "].given_installment"));
        assertEquals(total_installment, jsonPath.getInt("data[" + dataIndex + "].total_installment"));
        assertNull(jsonPath.get("data[" + dataIndex + "].admin_feedback"));
        assertEquals(status, jsonPath.getInt("data[" + dataIndex + "].status"));
        assertNull(jsonPath.get("data[" + dataIndex + "].due_notification_sent"));
        assertEquals(approved_at, jsonPath.getString("data[" + dataIndex + "].approved_at"));
        assertEquals(created_at, jsonPath.getString("data[" + dataIndex + "].created_at"));
        assertEquals(updated_at, jsonPath.getString("data[" + dataIndex + "].updated_at"));
    }
    //*************************************************************************************************

}
