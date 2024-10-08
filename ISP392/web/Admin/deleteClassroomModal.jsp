<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="icon" href="${pageContext.request.contextPath}/assets/img/logo/logo100.jpg" sizes="32x32">

<div class="modal fade" id="deleteClassroomModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteClassroomModalLabel">Delete Classroom</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="deleteClassroomForm" action="${pageContext.request.contextPath}/Admin/dashboardClassrooms?action=delete" method="POST">
                    <!-- ID -->
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="classroomIdDeleteInput" name="id">
                    </div>
                    <p>Are you sure you want to delete this classroom?</p>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-danger" form="deleteClassroomForm">Delete</button>
            </div>
        </div>
    </div>
</div>

<script>
    function deleteClassroomModal(button) {
        let id = $(button).closest('tr').find('td[name="id"]').text().trim();
        $('#classroomIdDeleteInput').val(id);
    }
</script>
