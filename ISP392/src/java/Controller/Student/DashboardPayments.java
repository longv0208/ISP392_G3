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
 * Servlet to handle payments and dashboard display
 */
public class DashboardPayments extends HttpServlet {

    private PaymentsDAO paymentsDAO = new PaymentsDAO();
    private ProfileDAO profileDAO = new ProfileDAO(); // Use ProfileDAO to get Student_Profile

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // Retrieve all payment items from DAO
        List<Payments> listPayments = paymentsDAO.findAll();

        // Set the list of payments as an attribute to be displayed on JSP
        request.setAttribute("listPayments", listPayments);
        request.getRequestDispatcher("Student/dashboardPayment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") != null ? request.getParameter("action") : "";
        switch (action) {
            case "pay":
                pay(request, response);
                break;
            default:
                throw new ServletException("Unknown action: " + action);
        }
    }

    // Method to handle payment action
    private void pay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            // Redirect to login page if the user is not logged in
            response.sendRedirect(request.getContextPath() + "/authen?action=login");
            return;
        }

        int userID = user.getId();
        PaymentsDAO paymentsDAO = new PaymentsDAO();

        // Get Student_Profile from session or ProfileDAO
        Student_Profile studentProfile = (Student_Profile) session.getAttribute("studentProfile");
        if (studentProfile == null) {
            studentProfile = profileDAO.getStudentProfile(session);
        }

        // Retrieve the total amount from the form submission
        int totalAmount = Integer.parseInt(request.getParameter("totalAmount"));

        // Retrieve the wallet balance from Student_Profile
        int wallet = studentProfile.getWallet();

        if (wallet >= totalAmount) {
            // If balance is sufficient, deduct the amount and update the wallet
            studentProfile.setWallet(wallet - totalAmount);

            // Record the payment in the database
            paymentsDAO.recordPayment(userID, totalAmount);

            // Update the session with the new wallet balance
            session.setAttribute("studentProfile", studentProfile);

            // Update the database with the new wallet balance
            try {
                profileDAO.updateStudentProfile(studentProfile);
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "Failed to update wallet information.");
                request.getRequestDispatcher("Student/dashboardPayment.jsp").forward(request, response);
                return;
            }

            // Redirect to success page
            response.sendRedirect(request.getContextPath() + "/Student/dashboardPayment.jsp?success=true");
        } else {
            // If balance is insufficient, display an error
            request.setAttribute("error", "Your wallet balance is insufficient to complete the payment.");
            request.getRequestDispatcher("Student/dashboardPayment.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles payments on the student dashboard";
    }
}
