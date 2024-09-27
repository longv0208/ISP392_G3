/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import models.ClassDAO;
import models.Classes;
import models.Subjects;
import models.SubjectsDAO;

/**
 *
 * @author admin
 */
public class SubjectsController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        SubjectsDAO d = new SubjectsDAO();
        
        if (request.getParameter("mod") != null && request.getParameter("mod").equals("1")) {
            request.getRequestDispatcher("AddSubjects.jsp").forward(request, response);
        }
        
        if (request.getParameter("mod") != null && request.getParameter("mod").equals("2")) {
            String id = request.getParameter("id");
            d.delete(id);
        }
        if (request.getParameter("mod") != null && request.getParameter("mod").equals("3")) {
            String id = request.getParameter("id");
            Subjects s = d.getSubjectsById(id);
            request.setAttribute("s", s);
            request.getRequestDispatcher("UpdateSubjects.jsp").forward(request, response);
        }
        ArrayList<Subjects> data = d.getSubjects();
        //search

        request.setAttribute("data", data);
        request.getRequestDispatcher("ListSubjects.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String credits = request.getParameter("credits");
        String description = request.getParameter("description");
        String semester = request.getParameter("semester");
        String lecturer_id = request.getParameter("lecturer_id");
        
        SubjectsDAO d = new SubjectsDAO();
        
        if (request.getParameter("add") != null) {
            d.insert(new Subjects("", code, name, credits, description, semester, lecturer_id));
        }
        if (request.getParameter("update") != null) {
            String id1 = request.getParameter("id");
            d.update(new Subjects(id1, code, name, credits, description, semester, lecturer_id));
        }
        doGet(request, response);
    }
    
}
