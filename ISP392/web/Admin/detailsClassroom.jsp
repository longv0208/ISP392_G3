<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Classroom Facilities Details</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Preconnect -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <!-- Custom styles -->
        <style>
            body {
                font-family: 'Be Vietnam Pro', sans-serif;
            }

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

            h2 {
                margin-bottom: 20px;
                color: #333;
            }

            .table-responsive {
                margin-top: 20px;
            }

            th {
                background-color: #007bff;
                color: white;
            }

            .btn-back {
                background-color: #FF8C00;
                color: white;
                border: none;
                padding: 10px 20px;
                margin-top: 20px;
                border-radius: 5px;
                cursor: pointer;
            }

            .btn-back:hover {
                background-color: #e67e22;
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
            <h2>Classroom Facilities Details</h2>

            <!-- Classroom Facilities Table -->
            <div class="table-responsive">
                <table id="facilitiesTable" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Tables</th>
                            <th>Chairs</th>
                            <th>Lights</th>
                            <th>Projectors</th>
                            <th>Condition</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${facilities.numberOfTables}</td>
                            <td>${facilities.numberOfChairs}</td>
                            <td>${facilities.numberOfLights}</td>
                            <td>${facilities.numberOfProjectors}</td>
                            <td>${facilities.condition}</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Back Button -->
            <a href="dashboardClassrooms" class="btn btn-back">Back to Classrooms</a>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
