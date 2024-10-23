<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>University Academic Portal - Classrooms</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">

        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- Bootstrap JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">

        <!-- DataTables JS -->
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

        <style>
            .navbar {
                background-color: #FF8C00;
            }

            .navbar-brand {
                color: white;
                font-size: 24px;
            }

            .main-content {
                margin: 50px auto;
                width: 70%;
                text-align: center;
            }

            .table-responsive {
                margin-top: 20px;
            }

            th {
                background-color: #007bff;
                color: white;
            }

            .add-btn {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 8px 15px;
                margin-bottom: 20px;
                border-radius: 5px;
                float: right;
            }

            .action-btn {
                padding: 5px 10px;
                font-size: 12px;
            }

            .btn-update {
                background-color: #ffc107;
                color: white;
            }

            .btn-delete {
                background-color: #dc3545;
                color: white;
            }
        </style>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="">University Academic Portal</a>
            </div>
        </nav>

        <!-- Main content -->
        <div class="main-content">
            <h2>List of Classrooms</h2>

            <div class="row mb-4">
                <div class="col text-start">
                    <button type="button" class="btn btn-success add-btn" data-bs-toggle="modal" data-bs-target="#addClassroomModal">
                        Add New Classroom
                    </button>
                </div>
            </div>

            <div class="table-responsive">
                <table id="classroomTable" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Classroom</th>
                            <th>Location</th>
                            <th>Capacity</th>
                            <th>Actions</th>
                            <th>Classroom Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listClassrooms}" var="classroom">
                            <tr>
                                <td>${classroom.getID()}</td>
                                <td>${classroom.getName()}</td>
                                <td>${classroom.getLocation()}</td>
                                <td>${classroom.getCapacity()}</td>
                                <td>
                                    <!-- Update button - gửi yêu cầu POST với action="edit" -->
                                    <form action="dashboardClassrooms" method="POST" style="display:inline;">
                                        <input type="hidden" name="action" value="edit">
                                        <input type="hidden" name="id" value="${classroom.getID()}">
                                        <button type="submit" class="btn btn-update action-btn">Update</button>
                                    </form>

                                    <!-- Delete button - hiển thị xác nhận trước khi xóa -->
                                    <form action="dashboardClassrooms" method="POST" style="display:inline;">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="${classroom.getID()}">
                                        <button type="submit" class="btn btn-delete action-btn" onclick="return confirm('Are you sure you want to delete this classroom?');">Delete</button>
                                    </form>

                                </td>
                                <td>

                                    <!-- View Details button -->
                                    <form action="dashboardClassrooms" method="POST" style="display:inline;">
                                        <input type="hidden" name="action" value="detail">
                                        <input type="hidden" name="id" value="${classroom.getID()}">
                                        <button type="submit" class="btn btn-info action-btn">View Details</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Add Classroom Modal -->
        <jsp:include page="addClassroomModal.jsp"></jsp:include>

        <!-- Script to initialize DataTable -->
        <script>
            $(document).ready(function () {
                $('#classroomTable').DataTable({
                    "paging": true,
                    "searching": true,
                    "ordering": true,
                    "info": true
                });
            });
        </script>

    </body>

</html>
