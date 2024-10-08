/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.ClassroomsDAO;
import Model.Classrooms;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DashboardClassrooms extends HttpServlet {

    private ClassroomsDAO classroomsDAO = new ClassroomsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        List<Classrooms> listClassrooms = classroomsDAO.findAll();

        request.setAttribute("listClassrooms", listClassrooms);

        request.getRequestDispatcher("Admin/dashboardClassrooms.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String action = request.getParameter("action") == null ? "" : request.getParameter("action");

        switch (action) {
            case "add":
                addClassroom(request, response);
                response.sendRedirect("dashboardClassrooms");
                break;
//            case "edit":
//                editClassroom(request, response);
//                response.sendRedirect("dashboardClassrooms");  
//                break;
            case "delete":
                deleteClassroom(request, response);
                response.sendRedirect("dashboardClassrooms");
                break;
            default:
                response.sendRedirect("dashboardClassrooms");
        }
    }

    private void addClassroom(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String location = request.getParameter("location");
        int capacity = Integer.parseInt(request.getParameter("capacity"));

        Classrooms classroom = new Classrooms();
        classroom.setName(name);
        classroom.setCapacity(capacity);
        classroom.setLocation(location);
        classroomsDAO.insert(classroom);
    }

    private void editClassroom(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String location = request.getParameter("location");
        int capacity = Integer.parseInt(request.getParameter("capacity"));

        Classrooms classroom = new Classrooms();
        classroom.setID(id);
        classroom.setName(name);
        classroom.setCapacity(capacity);
        classroom.setLocation(location);

        classroomsDAO.update(classroom);

        response.sendRedirect("dashboardClassrooms");
    }

    private void deleteClassroom(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        classroomsDAO.deleteById(id);
    }
}
