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

/**
 *
 * @author admin
 */
public class ClassController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ClassDAO d = new ClassDAO();

        if (request.getParameter("mod") != null && request.getParameter("mod").equals("1")) {
            request.getRequestDispatcher("AddClass.jsp").forward(request, response);
        }

        if (request.getParameter("mod") != null && request.getParameter("mod").equals("2")) {
            String id = request.getParameter("id");
            d.delete(id);
        }
        if (request.getParameter("mod") != null && request.getParameter("mod").equals("3")) {
            String id = request.getParameter("id");
            Classes c = d.getClassesById(id);
            request.setAttribute("c", c);
            request.getRequestDispatcher("UpdateClass.jsp").forward(request, response);
        }
        ArrayList<Classes> data = d.getClasses();
        //search

        request.setAttribute("data", data);
        request.getRequestDispatcher("ListClass.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String class_name = request.getParameter("class_name");
        ClassDAO d = new ClassDAO();

        if (request.getParameter("add") != null) {
            d.insert(new Classes("", class_name));
        }
        if (request.getParameter("update") != null) {
            String id1 = request.getParameter("id");
            d.update(new Classes(id1, class_name));
        }
        doGet(request, response);
    }

}
