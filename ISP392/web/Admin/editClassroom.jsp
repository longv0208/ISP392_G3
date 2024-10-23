<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Classroom</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <h2>Edit Classroom</h2>

            <!-- Hiển thị thông báo lỗi -->
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger" role="alert">
                    ${errorMessage}
                </div>
            </c:if>

            <form action="dashboardClassrooms?action=update" method="POST">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="${classroom.getID()}">

                <!-- Classroom Name -->
                <div class="mb-3">
                    <label for="name" class="form-label">Classroom Name:</label>
                    <input type="text" class="form-control" id="name" name="name" value="${classroom.getName()}" required>
                </div>

                <!-- Classroom Location -->
                <div class="mb-3">
                    <label for="location" class="form-label">Location:</label>
                    <input type="text" class="form-control" id="location" name="location" value="${classroom.getLocation()}" required>
                </div>

                <!-- Classroom Capacity -->
                <div class="mb-3">
                    <label for="capacity" class="form-label">Capacity:</label>
                    <input type="number" class="form-control" id="capacity" name="capacity" value="${classroom.getCapacity()}" required>
                </div>

                <button type="submit" class="btn btn-primary">Save Changes</button>
            </form>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
