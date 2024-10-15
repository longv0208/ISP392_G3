/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Student;

import DAO.PaymentsDAO;
import Model.Classrooms;
import Model.Payments;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author FPTSHOP
 */
public class DashboardPayment extends HttpServlet {

    private PaymentsDAO paymentsDAO = new PaymentsDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DashboardPayment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DashboardPayment at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        List<Payments> listPayments = paymentsDAO.findAll();

        request.getRequestDispatcher("Student/dashboardPayment.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    // Phương thức pay được cập nhật
    private void pay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/authen?action=login");
            return;
        }

        int userID = user.getId();
        PaymentsDAO paymentsDAO = new PaymentsDAO();
        int totalAmount = Integer.parseInt(request.getParameter("totalAmount")); // Lấy tổng số tiền cần thanh toán

        // Lấy số dư ví của người dùng từ session (giả sử số dư ví là thuộc tính của User)
        int userBalance = user.getBalance();

        if (userBalance >= totalAmount) {
            // Nếu số dư đủ, trừ tiền và cập nhật ví
            user.setBalance(userBalance - totalAmount);

            // Ghi lại lịch sử giao dịch
            paymentsDAO.recordPayment(userID, totalAmount);

            // Cập nhật lại thông tin người dùng trong session
            session.setAttribute("user", user);

            // Chuyển hướng về trang thành công
            response.sendRedirect(request.getContextPath() + "/Student/dashboardPayment.jsp?success=true");
        } else {
            // Nếu số dư không đủ, thông báo lỗi
            request.setAttribute("error", "Số dư của bạn không đủ để thực hiện thanh toán.");
            request.getRequestDispatcher("Student/dashboardPayment.jsp").forward(request, response);
        }
    }

}
