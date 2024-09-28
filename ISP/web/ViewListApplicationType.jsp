<%-- 
    Document   : ViewListApplicationType
    Created on : Sep 28, 2024, 2:27:27 AM
    Author     : Dell
--%>

<%@ page import="java.util.List" %>
<%@ page import="Model.ApplicationType" %>
<%@ page import="DAL.ApplicationTypeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List of Application Types</title>
        
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        
        <!-- Custom styles for this page -->
        <style>
            body {
                background-color: #f8f9fa;
            }
            .container {
                margin-top: 50px;
            }
            .table th {
                background-color: #ff9800;
                color: white;
            }
            .btn-custom {
                background-color: #ff9800;
                color: white;
            }
        </style>
        <script type="text/javascript">
    function confirmDelete(id) {
        var result = confirm("Are you sure you want to delete this application type?");
        if (result) {
            window.location.href = 'deleteapplicationtype?id=' + id;
        } else {
            return false;
        }
    }
</script>

    </head>
    <body>

        <!-- Navigation bar -->
        <nav class="navbar navbar-light bg-warning mb-4">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">University Academic Portal</a>
                <div class="d-flex">
                    <img src="path_to_avatar_image" alt="Avatar" class="rounded-circle" width="40" height="40">
                    <span class="navbar-text mx-3">Khúc Xuân Hào</span>
                    <a href="logout" class="btn btn-outline-dark">Log out</a>
                </div>
            </div>
        </nav>

        <!-- Main content -->
        <div class="container">
            <div class="card">
                <div class="card-header bg-warning text-white text-center">
                    <h4>List of Application Types</h4>
                </div>
                <div class="card-body">
                    <a href="AddApplicationType.jsp" class="btn btn-custom mb-3">Add New Application Type</a>
                    
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <!-- <th>ID</th> -->
                                <th>Type Name</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                // Lấy dữ liệu từ DAO
                                ApplicationTypeDAO dao = new ApplicationTypeDAO();
                                List<ApplicationType> applicationTypes = dao.getAllApplicationTypes();
                                request.setAttribute("applicationTypes", applicationTypes);
                            %>

                            <c:forEach var="applicationType" items="${applicationTypes}">
                                <tr>
                                 <!--   <td>${applicationType.id}</td>-->
                                    <td>${applicationType.typeName}</td>
                                    <td>
                                        <a href="editapplicationtype?id=${applicationType.id}" class="btn btn-primary btn-sm">Edit</a>
                                        <a href="deleteapplicationtype?id=${applicationType.id}" class="btn btn-danger btn-sm" onclick="confirmDelete(${applicationType.id})">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS (Optional if you need JS for dropdowns, modals, etc.) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
