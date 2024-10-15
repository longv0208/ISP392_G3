package Controller.Student;

import DAO.PaymentsDAO;
import DAO.ProfileDAO;
import Model.Payments;
import Model.Student_Profile;
import Model.User;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;

/**
 *
 * @author FPTSHOP
 */
public class DashboardPayments extends HttpServlet {

    private PaymentsDAO paymentsDAO = new PaymentsDAO();
    private ProfileDAO profileDAO = new ProfileDAO(); // Sử dụng ProfileDAO để lấy Student_Profile

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // Lấy tất cả các khoản thanh toán từ DAO
        List<Payments> listPayments = paymentsDAO.findAll();

        // Đặt danh sách thanh toán vào request và chuyển tiếp đến JSP
        request.setAttribute("listPayments", listPayments);
        request.getRequestDispatcher("Student/dashboardPayment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") != null
                ? request.getParameter("action")
                : "";
        switch (action) {
            case "pay":
                pay(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    // Phương thức xử lý thanh toán
    private void pay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            // Chuyển hướng đến trang đăng nhập nếu người dùng chưa đăng nhập
            response.sendRedirect(request.getContextPath() + "/authen?action=login");
            return;
        }

        int userID = user.getId();
        PaymentsDAO paymentsDAO = new PaymentsDAO();

        // Lấy thông tin Student_Profile từ session hoặc từ ProfileDAO
        Student_Profile studentProfile = (Student_Profile) session.getAttribute("studentProfile");
        if (studentProfile == null) {
            studentProfile = profileDAO.getStudentProfile(session);
        }

        // Lấy tổng số tiền cần thanh toán từ request
        int totalAmount = Integer.parseInt(request.getParameter("totalAmount"));

        // Lấy số dư ví từ Student_Profile
        int wallet = studentProfile.getWallet();  // Lấy số dư ví từ Student_Profile

        if (wallet >= totalAmount) {
            // Nếu số dư đủ, trừ tiền và cập nhật ví
            studentProfile.setWallet(wallet - totalAmount);  // Cập nhật số dư ví

            // Ghi lại lịch sử giao dịch
            paymentsDAO.recordPayment(userID, totalAmount);

            // Cập nhật lại thông tin Student_Profile trong session
            session.setAttribute("studentProfile", studentProfile);

            // Cập nhật vào cơ sở dữ liệu, bọc bên trong try-catch
            try {
                profileDAO.updateStudentProfile(studentProfile);
            } catch (SQLException e) {
                e.printStackTrace(); // In ngoại lệ ra console, có thể ghi log hoặc xử lý thêm nếu cần
                // Bạn cũng có thể đặt một thông báo lỗi hoặc chuyển hướng đến trang lỗi tùy chọn
                request.setAttribute("error", "Failed to update wallet information.");
                request.getRequestDispatcher("Student/dashboardPayment.jsp").forward(request, response);
                return;
            }

            // Chuyển hướng về trang thành công
            response.sendRedirect(request.getContextPath() + "/Student/dashboardPayment.jsp?success=true");
        } else {
            // Nếu số dư không đủ, thông báo lỗi
            request.setAttribute("error", "Your wallet balance is insufficient to complete the payment.");
            request.getRequestDispatcher("Student/dashboardPayment.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "DashboardPayment Servlet";
    }
}
