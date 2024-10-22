/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Model.Payments;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author FPTSHOP
 */
public class PaymentsDAO extends DBContext {

    public List<Payments> findAll() {
        List<Payments> payments = new ArrayList<>();
        String sql = "SELECT * FROM Payments";
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet rs = statement.executeQuery()) {

            while (rs.next()) {
                Payments payment = new Payments();
                payment.setID(rs.getInt("id"));
                payment.setUserID(rs.getInt("user_id"));
                payment.setAmount(rs.getInt("amount"));
                payment.setPaymentType(rs.getString("payment_type"));
                payments.add(payment);
            }
            System.out.println("Payments loaded successfully: " + payments.size());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return payments;
    }

    public void recordPayment(int userID, int amount) {
        String sql = "INSERT INTO Payments (userID, amount, paymentDate, paymentType) VALUES (?, ?, NOW(), 'online')";

        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, userID);
            statement.setInt(2, amount);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addMoney(int userID, BigDecimal amount) throws SQLException {
        String sql = "UPDATE Wallet SET balance = balance + ? WHERE userID = ?";

        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setBigDecimal(1, amount);
            statement.setInt(2, userID);

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error while adding money to wallet.");
        }
    }

    public void insertPayment(Payments payment) throws SQLException {
        String sql = "INSERT INTO Payments (userID, amount, paymentDate, paymentType) VALUES (?, ?, ?, ?)";
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, payment.getUserID());
            statement.setInt(2, payment.getAmount());
            statement.setDate(3, new java.sql.Date(payment.getPaymentDate().getTime()));
            statement.setString(4, payment.getPaymentType());
            statement.executeUpdate();
        }
    }

}
