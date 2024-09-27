/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.guideline;

import DAO.GuidelineDAO;
import Model.GuideDetails;
import Model.Guidelines;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author trung
 */
@WebServlet(name = "GuidelineController", urlPatterns = {"/guideline"})
public class GuidelineController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GuidelineController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuidelineController at " + request.getContextPath() + "</h1>");
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
        // lấy ra list các guide 
        GuidelineDAO guidelineDao = new GuidelineDAO();
        List<Guidelines> listGuideline = guidelineDao.getAllGuideline();
        request.setAttribute("listGuideline", listGuideline);

        // lấy ra toàn bộ detail
        List<GuideDetails> listGuideDetail = guidelineDao.getAllGuideDetail();
        request.setAttribute("listGuideDetail", listGuideDetail);

        request.getRequestDispatcher("/guide/guideline.jsp").forward(request, response);
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

        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("editGuideline")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String category = request.getParameter("category");

            GuidelineDAO guidelineDao = new GuidelineDAO();
            boolean edit = guidelineDao.editGuidelineById(id, title, category);

            if (edit) {
                request.setAttribute("mess", "Update Success!");
            } else {
                request.setAttribute("error", "Update false!");
            }
        } else if (action.equalsIgnoreCase("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            GuidelineDAO guidelineDao = new GuidelineDAO();
            boolean delete = guidelineDao.deleteById(id);

            if (delete) {
                request.setAttribute("mess", "Delete Success!");
            } else {
                request.setAttribute("error", "Delete false!");
            }

        } else if (action.equalsIgnoreCase("editDetail")) {
            int id = Integer.parseInt(request.getParameter("guideDetailId"));
            String stepTitle = request.getParameter("stepTitle");
            String stepDescription = request.getParameter("stepDescription");

            GuidelineDAO guidelineDao = new GuidelineDAO();
            boolean update = guidelineDao.updateGuideDetailById(id, stepTitle, stepDescription);
            if (update) {
                request.setAttribute("mess", "Update Success!");
            } else {
                request.setAttribute("error", "Update false!");
            }

        } else if (action.equalsIgnoreCase("deleteDetail")) {
            int id = Integer.parseInt(request.getParameter("id"));

            GuidelineDAO guidelineDao = new GuidelineDAO();
            boolean delete = guidelineDao.deleteGuideDetailById(id);

            if (delete) {
                request.setAttribute("mess", "Delete Success!");
            } else {
                request.setAttribute("error", "Delete false!");
            }

        } else if (action.equalsIgnoreCase("createDetail")) {
            GuidelineDAO guidelineDao = new GuidelineDAO();
            int step_number = Integer.parseInt(request.getParameter("stepNumber"));
            int id = Integer.parseInt(request.getParameter("guideline_id"));

            String detailTitle = request.getParameter("detailTitle");
            String detailDescription = request.getParameter("detailDescription");

            boolean create = guidelineDao.createNewGuideDetail(id, step_number, detailDescription, detailTitle);
            if (create) {
                request.setAttribute("mess", "Create Success!");
            } else {
                request.setAttribute("error", "Create false!");
            }

        } else if (action.equalsIgnoreCase("createGuideline")) {

            // lấy thông tin admin 
//            HttpSession session = request.getSession();
//            User user = (User) session.getAttribute("user");
// fix cứng tại chưa có login 
            int userId = 1;
            String title = request.getParameter("title");
            String category = request.getParameter("category");

            GuidelineDAO gDao = new GuidelineDAO();
            boolean create = gDao.createNewGuideline(userId, title, category);
            if (create) {
                request.setAttribute("mess", "Create Success!");
            } else {
                request.setAttribute("error", "Create false!");
            }
        } else {
            request.setAttribute("error", "false!");
        }

        doGet(request, response);

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
