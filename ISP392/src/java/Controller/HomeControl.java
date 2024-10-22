/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAO;
import DAO.ProfileDAO;
import Model.Notifications;
import Model.Profile;
import Model.Student_Profile;
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
 * @author khucx
 */
public class HomeControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        } else {
            DAO dao = new DAO();
            ProfileDAO pdao = new ProfileDAO();
            String role="";
            if ((int) session.getAttribute("role") == 1) {
                role = "student";
            } else if ((int) session.getAttribute("role") == 2){
                role = "lecturer";
            }
            
            Student_Profile st_profile;
//            List<Notifications> notifications = dao.getNotificationsByRole(role); // Thay "admin" bằng role bạn muốn lấy
            if (role.equals("student")) {
                Profile profile = pdao.getProfileById(session);
                st_profile = pdao.getStudentProfile(session);
                String rollNumber = pdao.generateRollNumber(st_profile.getStudent_id(), st_profile.getYear_of_study());
                request.setAttribute("rollnumber", rollNumber);
                request.setAttribute("profile", profile);
            } else if (role.equals("lecturer")){
                Profile profile = pdao.getProfileById(session);
                request.setAttribute("lecturer_id", profile.generateLecturerFormattedId());
                request.setAttribute("profile", profile);
            }
            // Gán danh sách thông báo vào request
//            request.setAttribute("notifications", notifications);
            //            
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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

}
