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
        System.out.println(idUser);
        System.out.println("Đã lấy đc session");

        Student_Profile studentProfile = (Student_Profile) request.getAttribute("profile");
        if (studentProfile == null) {
            studentProfile = profileDAO.getStudentProfile(session);
            session.setAttribute("studentProfile", studentProfile);  // Lưu vào session nếu cần dùng lại
        }

        List<Payments> listPayments = paymentsDAO.findAll();
        for (Payments payment : listPayments) {
            System.out.println("PaymentId: " + payment.getID());
        }
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
            response.sendRedirect(request.getContextPath() + "/authen?action=login");
            return;
        }

        PaymentsDAO paymentsDAO = new PaymentsDAO();

        Student_Profile studentProfile = (Student_Profile) session.getAttribute("studentProfile");
        if (studentProfile == null) {
            studentProfile = profileDAO.getStudentProfile(session);
        }

        int totalAmount = Integer.parseInt(request.getParameter("totalAmount"));

        int wallet = studentProfile.getWallet();

        String[] selectedPayments = request.getParameterValues("payment");

        if (wallet >= totalAmount) {
            studentProfile.setWallet(wallet - totalAmount);

            paymentsDAO.recordPayment(idUser, totalAmount);

            session.setAttribute("studentProfile", studentProfile);

            try {
                profileDAO.updateStudentProfile(studentProfile);
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "Failed to update wallet information.");
                request.getRequestDispatcher("Student/dashboardPayments.jsp").forward(request, response);
                return;
            }

            response.sendRedirect(request.getContextPath() + "/Student/dashboardPayments.jsp?success=true");
        } else {
            request.setAttribute("error", "Your wallet balance is insufficient to complete the payment.");

            request.setAttribute("selectedPayments", selectedPayments);

            request.getRequestDispatcher("Student/dashboardPayments.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles payments on the student dashboard";
    }
}
