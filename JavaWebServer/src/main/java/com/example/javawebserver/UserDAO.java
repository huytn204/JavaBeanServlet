package com.example.javawebserver;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDAO {
    public boolean registerUser(User user) {
        boolean status = false;
        try (Connection connection = DatabaseUtil.getConnection()) {
            String query = "INSERT INTO users (firstName,lastName, dateOfBirth, email) VALUES (?, ?, ?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setString(3, user.getDateOfBirth());
            preparedStatement.setString(4, user.getEmail());

            int rows = preparedStatement.executeUpdate();
            if (rows > 0) {
                status = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
}
