<!DOCTYPE html>
<html lang="en">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>University Academic Portal - Classrooms</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
        <style>
            /* Custom header styling */
            .navbar {
                background-color: #FF8C00; /* Dark orange color */
            }

            .navbar-brand {
                color: white;
                font-size: 24px;
            }

            .logout-btn {
                background-color: white;
                color: #FF8C00;
                border: 2px solid #FF8C00;
                font-size: 14px;
            }

            /* Center the content */
            .main-content {
                margin: 50px auto;
                width: 70%;
                text-align: center;
            }

            /* Table styles */
            .table-responsive {
                margin-top: 20px;
            }

            th {
                background-color: #007bff;
                color: white;
            }

            /* Add New Classroom button aligned right */
            .add-btn {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 8px 15px;
                margin-bottom: 20px;
                border-radius: 5px;
                float: right;
            }

            /* Pagination styles */
            .pagination {
                justify-content: center;
            }

            /* Buttons for update and delete */
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
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">University Academic Portal</a>
            </div>
        </nav>

        <!-- Main content -->
        <div class="main-content">
            <h2>List of Classrooms</h2>

            <div class="d-flex justify-content-end mb-3">
                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addClassroomModal">
                    Add new classroom
                </button>

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
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listClassrooms}" var="classroom" varStatus="status">
                        <tr>
                            <td>${classroom.getID()}</td>
                            <td>${classroom.getname()}</td>
                            <td>${classroom.getlocation()}</td>
                            <td>${classroom.getcapacity()}</td>
                            <td>
                                <button class="btn btn-update action-btn" data-classroom-id="${classroom.getID()}">Update</button>
                                <button class="btn btn-delete action-btn" onclick="deleteClassroomModal(this)" data-toggle="modal" data-target="#deleteClassroomModal">Xóa</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <jsp:include page="addClassroomModal.jsp"></jsp:include>
        <jsp:include page="deleteClassroomModal.jsp"></jsp:include>
        <!-- Bootstrap JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

        <script>
        $(document).ready(function () {
            $('#classroomTable').DataTable({
                "paging": true, // Enable pagination
                "searching": true, // Enable search
                "ordering": true, // Enable ordering
                "info": true       // Show page info
            });
        });
        </script>

    </body>

</html>
