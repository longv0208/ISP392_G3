/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Transactions;
import Context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TransactionsDAO extends DBContext {

    // Thêm một giao dịch mới vào database
    public void insertTransaction(Transactions transaction) throws SQLException {
        String sql = "INSERT INTO Transactions (user_id, amount, transaction_type, description, transaction_date) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, transaction.getUser_id());
            statement.setInt(2, transaction.getAmount());
            statement.setString(3, transaction.getTransaction_type());
            statement.setString(4, transaction.getDescription());
            statement.setString(5, transaction.getTransaction_date()); // Định dạng là yyyy-MM-dd HH:mm:ss
            statement.executeUpdate();
        }
    }
}