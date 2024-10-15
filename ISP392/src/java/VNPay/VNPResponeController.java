package VNPay;

import DAO.TransactionsDAO;
import DAO.ProfileDAO;
import DAO.UserDAO;
import Model.Student_Profile;
import Model.Transactions;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class VNPResponeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<String, String> fields = new HashMap<>();
        for (Enumeration<String> params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = params.nextElement();
            String fieldValue = request.getParameter(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }

        String status = request.getParameter("vnp_TransactionStatus");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }

        String amount = request.getParameter("vnp_Amount");
        String username = request.getParameter("vnp_OrderInfo").substring(23).trim();

        // Sử dụng UserDAO và ProfileDAO để lấy thông tin user và student_profile
        UserDAO userDAO = new UserDAO();
        ProfileDAO profileDAO = new ProfileDAO();
        HttpSession session = request.getSession();

        // Lấy user từ session hoặc từ UserDAO
        User user = userDAO.getUserById((Integer) session.getAttribute("user"));
        if (user == null) {
            user = userDAO.getUserByUsername(username);
        }

        // Lấy hồ sơ sinh viên (Student_Profile) từ ProfileDAO
        Student_Profile studentProfile = profileDAO.getStudentProfile(session);

        String statusDB = "Transaction Failed";

        if (status.equals("00")) {
            statusDB = "Transaction Successful";
            try {
                // Cộng số tiền nạp vào ví của người dùng trong Student_Profile
                BigDecimal newAmount = new BigDecimal(amount).divide(new BigDecimal(100)); // Chuyển đổi số tiền về đơn vị VND
                long updatedWallet = studentProfile.getWallet() + newAmount.longValue();

                // Cập nhật số dư ví trong Student_Profile
                studentProfile.setWallet((int) updatedWallet);

                // Cập nhật lại thông tin trong session
                session.setAttribute("studentProfile", studentProfile);

                // (Nếu cần) Ghi cập nhật vào database
                profileDAO.updateStudentProfile(studentProfile);
            } catch (Exception ex) {
                Logger.getLogger(VNPResponeController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        // Ghi lại giao dịch vào bảng Transactions
        TransactionsDAO transactionsDAO = new TransactionsDAO();
        Transactions transaction = new Transactions(
                0, // ID sẽ tự động tăng trong database
                user.getId(),
                Integer.parseInt(amount) / 100, // Chuyển số tiền về VND
                "Deposit", // Loại giao dịch
                statusDB, // Mô tả giao dịch
                new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) // Ngày giao dịch
        );

        // Thêm giao dịch vào database
        try {
            transactionsDAO.insertTransaction(transaction);
        } catch (SQLException ex) {
            Logger.getLogger(VNPResponeController.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Chuyển hướng về trang chủ hoặc trang thành công
        response.sendRedirect("home");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
