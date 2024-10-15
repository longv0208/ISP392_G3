/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Model.Payments;
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

            // Lặp qua kết quả truy vấn và gán giá trị cho các đối tượng Payments
            while (rs.next()) {
                Payments payment = new Payments();
                payment.setID(rs.getInt("ID"));
                payment.setUserID(rs.getInt("userID"));
                payment.setAmount(rs.getInt("amount"));
                payment.setPaymentDate(rs.getDate("paymentDate"));
                payment.setPaymentType(rs.getString("paymentType"));
                payment.setStatus(rs.getString("status"));
                payments.add(payment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return payments;
    }
}
