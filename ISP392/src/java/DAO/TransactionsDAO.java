// TransactionsDAO.java
package DAO;

import Context.DBContext;
import Model.Transactions;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
}
