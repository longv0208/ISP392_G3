/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import DAL.ApplicationTypeDAO;
import Model.ApplicationType;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
public class EditApplicationType extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet EditApplicationType</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditApplicationType at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        // Gọi DAO để lấy dữ liệu loại ứng dụng cần chỉnh sửa
        ApplicationTypeDAO dao = new ApplicationTypeDAO();
        ApplicationType applicationType = dao.getApplicationTypeById(id);

        // Đặt loại ứng dụng vào request attribute để chuyển sang JSP
        request.setAttribute("applicationType", applicationType);

        // Điều hướng tới trang EditApplicationType.jsp để hiển thị form chỉnh sửa
        request.getRequestDispatcher("EditApplicationType.jsp").forward(request, response);
    }    

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
 int id = Integer.parseInt(request.getParameter("id"));
        String typeName = request.getParameter("type_name");

        // Tạo đối tượng ApplicationType mới với dữ liệu đã chỉnh sửa
        ApplicationType appType = new ApplicationType(id, typeName);

        // Gọi DAO để cập nhật loại ứng dụng
        ApplicationTypeDAO dao = new ApplicationTypeDAO();
        dao.updateApplicationType(appType);

        // Sau khi cập nhật, chuyển hướng về trang danh sách loại ứng dụng
        response.sendRedirect("ViewListApplicationType.jsp");
    }    

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
