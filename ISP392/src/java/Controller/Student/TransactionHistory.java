package Controller.Student;

import DAO.TransactionsDAO;
import Model.Transactions;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Servlet to handle transaction history requests
 */
public class TransactionHistory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy user ID từ session
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("user");

        // Sử dụng TransactionsDAO để lấy lịch sử giao dịch
        TransactionsDAO transactionsDAO = new TransactionsDAO();
        List<Transactions> transactionList = transactionsDAO.getTransactionsByUserId(userId);

        // Đặt danh sách giao dịch vào request
        request.setAttribute("transactionList", transactionList);

        // Chuyển hướng đến trang JSP hiển thị lịch sử giao dịch
        request.getRequestDispatcher("/Student/transactionHistory.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles requests for displaying the transaction history.";
    }
}
