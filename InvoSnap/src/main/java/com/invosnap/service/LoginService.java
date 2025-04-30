package com.invosnap.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.invosnap.config.DbConfig;
import com.invosnap.model.UserModel;
import com.invosnap.util.PasswordUtil;

public class LoginService {
    private Connection dbConn;
    private boolean isConnectionError = false;

    /**
     * Constructor initializes database connection.
     */
    public LoginService() {
        try {
            this.dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            isConnectionError = true;
        }
    }

    /**
     * Authenticates the user by verifying username and password.
     *
     * @param userModel The UserModel object containing user credentials.
     * @return true if the user credentials are valid, false otherwise; 
     *         null if a connection error occurs.
     */
    public Boolean loginUser(UserModel userModel) {
        if (isConnectionError) {
            System.out.println("Connection Error!");
            return null;
        }

        String query = "SELECT user_name, password FROM user WHERE user_name = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, userModel.getUsername());
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                return validatePassword(result, userModel);
            } else {
                System.out.println("User not found: " + userModel.getUsername());
                return false;
            }
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Validates the password by decrypting the stored password and comparing it.
     *
     * @param result    The ResultSet containing the username and password from the database.
     * @param userModel The UserModel object containing user credentials.
     * @return true if the password matches, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    private boolean validatePassword(ResultSet result, UserModel userModel) throws SQLException {
        String dbUsername = result.getString("user_name");
        String dbPassword = result.getString("password");
        String decryptedPassword = PasswordUtil.decrypt(dbPassword, dbUsername);

        System.out.println("DB Username: " + dbUsername);
        System.out.println("Input Username: " + userModel.getUsername());
        System.out.println("DB Password (decrypted): " + decryptedPassword);
        System.out.println("Input Password: " + userModel.getPassword());

        return dbUsername.equals(userModel.getUsername()) &&
               decryptedPassword != null &&
               decryptedPassword.equals(userModel.getPassword());
    }
}
