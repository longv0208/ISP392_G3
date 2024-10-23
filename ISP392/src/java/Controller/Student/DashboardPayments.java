package Controller.Student;

import DAO.PaymentsDAO;
import DAO.ProfileDAO;
import DAO.TransactionsDAO;
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
import org.apache.jasper.tagplugins.jstl.core.ForEach;

public class DashboardPayments extends HttpServlet {

    private PaymentsDAO paymentsDAO = new PaymentsDAO();
    private ProfileDAO profileDAO = new ProfileDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        HttpSession session = request.getSession();
        int idUser = (Integer) session.getAttribute("user");

        // Kiểm tra nếu có lỗi từ session
        String errorMessage = (String) session.getAttribute("error");
        if (errorMessage != null) {
            request.setAttribute("error", errorMessage);
            session.removeAttribute("error"); // Xóa lỗi sau khi hiển thị
        }
        // Kiểm tra nếu có thông báo thành công từ session
        String successMessage = (String) session.getAttribute("success");
        if (successMessage != null) {
            request.setAttribute("success", successMessage);
            session.removeAttribute("success"); // Xóa thông báo thành công sau khi hiển thị
        }

        Student_Profile studentProfile = (Student_Profile) request.getAttribute("profile");
        if (studentProfile == null) {
            studentProfile = profileDAO.getStudentProfile(session);
            session.setAttribute("studentProfile", studentProfile);  // Lưu vào session nếu cần dùng lại
        }
        // Chỉ lấy các khoản thanh toán có trạng thái Pending cho người dùng
        List<Payments> listPayments = paymentsDAO.findPendingPayments(idUser);
        request.setAttribute("listPayments", listPayments);

        int wallet = studentProfile.getWallet();
        request.setAttribute("wallet", wallet);

        request.getRequestDispatcher("Student/dashboardPayments.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        switch (action) {
            case "pay":
                pay(request, response);
                break;
            default:
                response.sendRedirect("dashboardPayments");
        }
    }

    private void pay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int idUser = (Integer) session.getAttribute("user");

        if (idUser < 0) {
            // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
            response.sendRedirect(request.getContextPath() + "/authen?action=login");
            return;
        }

        // Lấy thông tin người dùng
        Student_Profile studentProfile = (Student_Profile) session.getAttribute("studentProfile");
        if (studentProfile == null) {
            studentProfile = profileDAO.getStudentProfile(session);
        }

        // Lấy danh sách các khoản thanh toán "Pending"
        List<Payments> listPayments = paymentsDAO.findPendingPayments(idUser);
        request.setAttribute("studentProfile", studentProfile);

        // Lấy tổng số tiền từ biểu mẫu
        int totalAmount = Integer.parseInt(request.getParameter("totalAmount"));

        // Kiểm tra số dư ví
        int wallet = studentProfile.getWallet();
        String[] selectedPayments = request.getParameterValues("payment");

        if (wallet >= totalAmount) {
            // Số dư đủ, tiến hành trừ số dư và ghi lại vào database
            studentProfile.setWallet(wallet - totalAmount);

            // Cập nhật ví vào cơ sở dữ liệu
            try {
                profileDAO.updateStudentProfile(studentProfile);

                // Ghi lại giao dịch vào lịch sử
                TransactionsDAO transactionsDAO = new TransactionsDAO();
                for (String paymentId : selectedPayments) {
                    // Lấy thông tin payment từ bảng Payments
                    Payments payment = paymentsDAO.findPaymentById(Integer.parseInt(paymentId));

                    if (payment != null) {
                        // Cập nhật trạng thái thanh toán thành "Paid Successfully"
                        paymentsDAO.updatePaymentStatus(payment.getID(), "Paid Successfully");

                        // Ghi lại lịch sử giao dịch với payment_type
                        transactionsDAO.recordTransaction(idUser, payment.getID(), payment.getAmount(), payment.getPaymentType());
                    }
                }
                // Đặt thông báo thành công vào session
                session.setAttribute("success", "Thanh toán thành công!");

                // Cập nhật lại session và chuyển hướng đến trang thanh toán thành công
                session.setAttribute("studentProfile", studentProfile);
                response.sendRedirect(request.getContextPath() + "/dashboardPayments");

            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "Có lỗi xảy ra khi cập nhật ví.");
                request.getRequestDispatcher("Student/dashboardPayments.jsp").forward(request, response);
            }
        } else {
            // Số dư không đủ, đặt thuộc tính lỗi vào session để thông báo khi chuyển về servlet
            session.setAttribute("error", "Số dư trong ví không đủ để thanh toán.");

            // Chuyển hướng về servlet xử lý hiển thị trang thanh toán (dashboardPayments)
            response.sendRedirect(request.getContextPath() + "/dashboardPayments");
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles payments on the student dashboard";
    }
}
