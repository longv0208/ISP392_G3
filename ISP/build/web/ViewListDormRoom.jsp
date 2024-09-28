<%@ page import="java.util.List" %>
<%@ page import="Model.DormRooms" %>
<%@ page import="DAL.DormRoomsDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List of Dorm Rooms</title>
        
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
        
        <!-- JavaScript để xác nhận việc xóa -->
        <script type="text/javascript">
            function confirmDelete(id) {
                var result = confirm("Are you sure you want to delete this dorm room?");
                if (result) {
                    // Nếu người dùng chọn "OK", điều hướng tới URL để xóa
                    window.location.href = 'deletedorm?id=' + id;
                } else {
                    // Nếu người dùng chọn "Cancel", không làm gì cả
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
                    <h4>List of Dorm Rooms</h4>
                </div>
                <div class="card-body">
                    <a href="AddDormRoom.jsp" class="btn btn-custom mb-3">Add New Dorm Room</a>
                    
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Room Number</th>
                                <th>Capacity</th>
                                <th>Available Capacity</th>
                                <th>Building</th>
                                <th>Room Type</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                // Lấy dữ liệu từ DAO
                                DormRoomsDAO dao = new DormRoomsDAO();
                                List<DormRooms> dormRooms = dao.getAllDormRooms();
                                request.setAttribute("dormRooms", dormRooms);
                            %>

                            <c:forEach var="dormRoom" items="${dormRooms}">
                                <tr>
                                    <td>${dormRoom.roomNumber}</td>
                                    <td>${dormRoom.capacity}</td>
                                    <td>${dormRoom.availableCapacity}</td>
                                    <td>${dormRoom.building}</td>
                                    <td>${dormRoom.roomType}</td>
                                    <td>
                                        <a href="editdorm?id=${dormRoom.id}" class="btn btn-primary btn-sm">Edit</a>
                                        <!-- Nút xóa với xác nhận -->
                                        <a href="javascript:void(0)" class="btn btn-danger btn-sm" onclick="return confirmDelete(${dormRoom.id})">Delete</a>
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
