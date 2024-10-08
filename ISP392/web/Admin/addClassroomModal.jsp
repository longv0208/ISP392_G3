<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<link rel="icon" href="${pageContext.request.contextPath}/assets/img/logo/logo100.jpg" sizes="32x32">
<style>
    body {
        font-family: 'Be Vietnam Pro', sans-serif !important;
    }
</style>

<div class="modal fade" id="addClassroomModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addClassroomModalLabel">Add Classroom</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>

            </div>
            <div class="modal-body">
                <form id="addClassroomForm" action="dashboardClassrooms?action=add" method="POST">
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger">${errorMessage}</div>
                    </c:if>

                    <!-- Classroom Name -->
                    <div class="form-group">
                        <label for="classroomNameInput">Classroom Name:</label>
                        <input type="text" class="form-control" id="classroomNameInput" name="name" required>
                        <div id="classroomNameError" class="error-message"></div>
                    </div>

                    <!-- Classroom Location -->
                    <div class="form-group">
                        <label for="classroomLocationInput">Location:</label>
                        <input type="text" class="form-control" id="classroomLocationInput" name="location" required>
                        <div id="classroomLocationError" class="error-message"></div>
                    </div>

                    <!-- Classroom Capacity -->
                    <div class="form-group">
                        <label for="classroomCapacityInput">Capacity:</label>
                        <input type="number" class="form-control" id="classroomCapacityInput" name="capacity" min="1" required>
                        <div id="classroomCapacityError" class="error-message"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
<!--                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button     >-->
                <button type="button" class="btn btn-primary" onclick="validateClassroomForm()">Add</button>
            </div>
        </div>
    </div>
</div>

<script>
    function validateClassroomForm() {
        let name = $('#classroomNameInput').val();
        let location = $('#classroomLocationInput').val();
        let capacity = $('#classroomCapacityInput').val();

        // Clear current error messages
        $('.error-message').html('');

        let hasError = false;

        if (name === '') {
            $('#classroomNameError').html('Classroom name is required.');
            hasError = true;
        }

        if (location === '') {
            $('#classroomLocationError').html('Location is required.');
            hasError = true;
        }

        if (capacity === '' || capacity <= 0) {
            $('#classroomCapacityError').html('Capacity must be greater than 0.');
            hasError = true;
        }

        // Submit form if there are no errors
        if (!hasError) {
            $('#addClassroomForm').submit();
        }
    }
</script>
