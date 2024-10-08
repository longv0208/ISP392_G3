<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<link rel="icon" href="${pageContext.request.contextPath}/assets/img/logo/logo100.jpg" sizes="32x32">
<style>
    body {
        font-family: 'Be Vietnam Pro', sans-serif !important;
    }
</style>

<div class="modal fade" id="editClassroomModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editClassroomModalLabel">Update classroom</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editClassroomForm" action="${pageContext.request.contextPath}/dashboardClassrooms?action=edit" method="POST">
                    <!-- ID -->
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idEditClassroomInput" name="id">
                    </div>

                    <!-- Classroom Name -->
                    <div class="form-group">
                        <label for="nameEditClassroomInput">Classroom:</label>
                        <input type="text" class="form-control" id="nameEditClassroomInput" name="name">
                        <div id="nameEditClassroomError" class="error"></div>
                    </div>

                    <!-- Location -->
                    <div class="form-group">
                        <label for="locationEditClassroomInput">Location:</label>
                        <input type="text" class="form-control" id="locationEditClassroomInput" name="location">
                        <div id="locationEditClassroomError" class="error"></div>
                    </div>

                    <!-- Capacity -->
                    <div class="form-group">
                        <label for="capacityEditClassroomInput">Capacity:</label>
                        <input type="number" class="form-control" id="capacityEditClassroomInput" name="capacity">
                        <div id="capacityEditClassroomError" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="editClassroomForm" onclick="validateClassroomForm()">Update</button>
            </div>
        </div>
    </div>
</div>

<script>
    // Function to open the modal and fill the form with existing data
    function editClassroomModal(button) {
        let id = $(button).closest('tr').find('td[name="id"]').text().trim();
        let name = $(button).closest('tr').find('td[name="name"]').text().trim();
        let location = $(button).closest('tr').find('td[name="location"]').text().trim();
        let capacity = $(button).closest('tr').find('td[name="capacity"]').text().trim();

        $('#idEditClassroomInput').val(id);
        $('#nameEditClassroomInput').val(name);
        $('#locationEditClassroomInput').val(location);
        $('#capacityEditClassroomInput').val(capacity);
    }

    // Form validation
    function validateClassroomForm() {
        let name = $('#nameEditClassroomInput').val();
        let location = $('#locationEditClassroomInput').val();
        let capacity = $('#capacityEditClassroomInput').val();

        // Clear current error messages
        $('.error').html('');

        if (name === '') {
            $('#nameEditClassroomError').html('Tên phòng học không được để trống');
        }

        if (location === '') {
            $('#locationEditClassroomError').html('Vị trí phòng học không được để trống');
        }

        if (capacity === '') {
            $('#capacityEditClassroomError').html('Sức chứa không được để trống');
        } else if (!$.isNumeric(capacity) || parseInt(capacity) <= 0) {
            $('#capacityEditClassroomError').html('Sức chứa phải là số lớn hơn 0');
        }

        // Check if there are any errors before submitting the form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });

        if (error === '') {
            $('#editClassroomForm').submit();
        } else {
            event.preventDefault();
        }
    }
</script>
