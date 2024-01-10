package utilities;

import io.restassured.http.ContentType;
import io.restassured.response.Response;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static stepdefinitions.API_UserStepdefinitions.fullPath;

public class ReusableMethods {

    public static Response response;

    public static Response getResponse(String user) {
        response = given()
                    .spec(spec)
                    .header("Accept", "application/json")
                    .headers("Authorization", "Bearer " + Authentication.generateToken(user))
                 .when()
                   .get(fullPath);

        response.prettyPrint();

        return response;
    }

    public static Response postResponse(String user, Object requestBody) {

        if (user.equals("admin") || user.equals("user")) {
            response = given()
                        .spec(spec)
                        .contentType(ContentType.JSON)
                        .header("Accept", "application/json")
                        .headers("Authorization", "Bearer " + Authentication.generateToken(user))
                     .when()
                        .body(requestBody)
                        .post(fullPath);

            response.prettyPrint();

        } else if (user.equals("invalidToken")) {
            response = given()
                        .spec(spec)
                        .contentType(ContentType.JSON)
                        .header("Accept", "application/json")
                        .headers("Authorization", "Bearer " + ConfigReader.getProperty("invalidToken"))
                     .when()
                        .body(requestBody)
                        .post(fullPath);

            response.prettyPrint();
        }

        return response;
    }

    public static Response patchResponse(String user) {

        response = given()
                   .spec(spec)
                   .header("Accept", "application/json")
                   .headers("Authorization", "Bearer " + Authentication.generateToken(user))
                 .when()
                   .patch(fullPath);

        response.prettyPrint();

        return response;
    }

    public static Response patchResponseBody(String user, Object requestBody) {

        response = given()
                    .spec(spec)
                    .contentType(ContentType.JSON)
                    .header("Accept", "application/json")
                    .headers("Authorization", "Bearer " + Authentication.generateToken(user))
                 .when()
                    .body(requestBody)
                    .patch(fullPath);

        response.prettyPrint();

        return response;
    }

    public static Response deleteResponse(String user) {

        response = given()
                    .spec(spec)
                    .header("Accept", "application/json")
                    .headers("Authorization", "Bearer " + Authentication.generateToken(user))
                 .when()
                    .delete(fullPath);

        response.prettyPrint();

        return response;
    }

    public static String tryCatchGet() {
        String exceptionMesaj = null;
        try {
            response = given()
                        .spec(spec)
                        .header("Accept", "application/json")
                        .headers("Authorization", "Bearer " + ConfigReader.getProperty("invalidToken"))
                     .when()
                        .get(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        System.out.println("Exception Mesaj : " + exceptionMesaj);

        return exceptionMesaj;
    }

    public static String tryCatchPatch() {
        String exceptionMesaj = null;
        try {
            response = given()
                        .spec(spec)
                        .header("Accept", "application/json")
                        .headers("Authorization", "Bearer " + ConfigReader.getProperty("invalidToken"))
                     .when()
                        .patch(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        System.out.println("Exception Mesaj : " + exceptionMesaj);

        return exceptionMesaj;
    }

    public static String tryCatchPatchBody(Object requestBody) {
        String exceptionMesaj = null;
        try {
            response = given()
                        .spec(spec)
                        .contentType(ContentType.JSON)
                        .header("Accept", "application/json")
                        .headers("Authorization", "Bearer " + ConfigReader.getProperty("invalidToken"))
                     .when()
                        .body(requestBody)
                        .patch(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        System.out.println("Exception Mesaj : " + exceptionMesaj);

        return exceptionMesaj;
    }

    public static String tryCatchDelete() {
        String exceptionMesaj = null;
        try {
            response = given()
                        .spec(spec)
                        .header("Accept", "application/json")
                        .headers("Authorization", "Bearer " + ConfigReader.getProperty("invalidToken"))
                    .when()
                        .delete(fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        System.out.println("Exception Mesaj : " + exceptionMesaj);

        return exceptionMesaj;
    }
}
