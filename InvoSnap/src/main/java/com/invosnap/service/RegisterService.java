package com.invosnap.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.invosnap.config.DbConfig;
import com.invosnap.model.UserModel;

public class RegisterService {
    private Connection dbConn;
    private boolean isConnectionError = false;

    public RegisterService() {
        try {
            this.dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            isConnectionError = true;
        }
    }

    public Boolean registerUser(UserModel userModel) {
        if (isConnectionError) {
            System.out.println("Connection Error!");
            return null;
        }

        String query = "INSERT INTO user (user_name, password, full_name, email, phone_number, role_id, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, userModel.getUsername());
            stmt.setString(2, userModel.getPassword()); // Plaintext
            stmt.setString(3, userModel.getFullName());
            stmt.setString(4, userModel.getEmail());
            stmt.setString(5, userModel.getPhoneNumber());
            stmt.setInt(6, userModel.getRoleId());
            stmt.setTimestamp(7, userModel.getCreatedAt());
            stmt.setTimestamp(8, userModel.getUpdatedAt());
            int rowsAffected = stmt.executeUpdate();
            System.out.println("User registered: " + userModel.getUsername() + ", Rows affected: " + rowsAffected);
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}