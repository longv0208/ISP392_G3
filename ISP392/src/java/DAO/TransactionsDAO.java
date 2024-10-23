// TransactionsDAO.java
package DAO;

import Context.DBContext;
import Model.Transactions;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;

public class TransactionsDAO extends DBContext {

    // Phương thức lấy danh sách giao dịch theo user_id
    public List<Transactions> getTransactionsByUserId(int userId) {
        List<Transactions> transactionList = new ArrayList<>();

        String sql = "SELECT * FROM Transactions WHERE user_id = ?";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Transactions transaction = new Transactions(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getInt("amount"),
                        rs.getString("transaction_type"),
                        rs.getString("description"),
                        rs.getString("transaction_date")
                );
                transactionList.add(transaction);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return transactionList;
    }

    public static void main(String[] args) {
        new TransactionsDAO().getTransactionsByUserId(2).stream().forEach(item -> {
            System.out.println(item.getAmount());
        });
    }

    public void recordTransaction(int userId, int paymentId, int paymentAmount, String paymentType) {
        String sql = "INSERT INTO Transactions (user_id, amount, transaction_date, transaction_type) VALUES (?, ?, GETDATE(), ?)";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, paymentAmount);
            stmt.setString(3, paymentType); // Thêm transaction_type từ payment_type
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
