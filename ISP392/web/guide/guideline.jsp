<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Guide Line</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">

        <!-- jQuery (required for DataTables) -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- DataTables JS -->
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

        <style>
            .alert-container {
                position: fixed;
                top: 20px;
                right: 20px;
                z-index: 1050;
                width: 300px;
            }
        </style>
    </head>
    <body>

        <!-- in ra table -->
        <div class="container mt-5">
            <h2 class="text-center">List of Guidelines</h2>
            <table id="guideTable" class="table table-bordered mt-4">
                <thead class="table-primary">
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Create At</th>
                        <th>Category</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listGuideline}" var="listGuideline">
                        <tr>
                            <td>${listGuideline.id}</td>
                            <td>${listGuideline.title}</td>
                            <td>${listGuideline.create_date}</td>
                            <td>${listGuideline.category}</td>
                            <td>
                                <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#guideModalGuideDetail${listGuideline.id}">
                                    View
                                </button>
                                <!-- button edit s -->
                                <button class="btn btn-info"
                                        data-bs-toggle="modal"
                                        data-bs-target="#editModal"
                                        data-id="${listGuideline.id}"
                                        data-title="${listGuideline.title}"
                                        data-create-date="${listGuideline.create_date}"
                                        data-category="${listGuideline.category}">
                                    Edit
                                </button>
                                <!-- Form for Deleting a Guideline -->
                                <form id="deleteForm" action="guideline" method="post" class="d-inline">
                                    <input name="action" value="delete" hidden>
                                    <input name="id" value="${listGuideline.id}" hidden>
                                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                                        Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <!-- kết thúc in ra table -->

        <!-- Phân trang bằng javasctip -->
        <script>
            $(document).ready(function () {
                $('#guideTable').DataTable({
                    "pageLength": 10, // Set maximum rows per page
                    "lengthMenu": [5, 10, 20], // Options for page length
                    "order": [[1, "asc"]], // Default sorting by the second column (Title)
                    "searching": true, // Enable search functionality
                    "paging": true, // Enable pagination
                    "info": true, // Show table information (like showing x of y entries)
                    "autoWidth": false // Disable auto column width adjustments
                });
            });
        </script>




        <!-- Hiển thị popup cho detail  -->

        <c:forEach items="${listGuideline}" var="listGuideline">

            <!-- Modal for Guide 1 -->
            <div class="modal fade" id="guideModalGuideDetail${listGuideline.id}" tabindex="-1" aria-labelledby="guideModalLabel1" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div>

                                <h5 class="modal-title" id="guideModalLabel1">Detail: How to Register </h5>
                                <!-- Create New Button -->
                                <!-- Button to Open the Modal -->
                                <!-- Button to Open the Modal -->
                                <button type="button" class="btn btn-primary" id="openModal1${listGuideline.id}">
                                    Create new
                                </button>

                                <!-- The Modal -->
                                <div class="modal fade" id="myModal${listGuideline.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Create New Detail</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="guideline" method="post" id="detailForm${listGuideline.id}">

                                                    <input value="${listGuideline.id}" name="guideline_id" hidden="">
                                                    <input value="createDetail" name="action" hidden="">
                                                    <div class="mb-3">
                                                        <label for="step-number${listGuideline.id}" class="form-label">Step Number</label>
                                                        <input type="number" class="form-control" id="step-number${listGuideline.id}" name="stepNumber" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="detailTitle${listGuideline.id}" class="form-label">Title</label>
                                                        <input type="text" class="form-control" id="detailTitle${listGuideline.id}" name="detailTitle" required>
                                                    </div>

                                                    <div class="mb-3">
                                                        <label for="detailDescription${listGuideline.id}" class="form-label">Description</label>
                                                        <textarea class="form-control" id="detailDescription${listGuideline.id}" name="detailDescription" rows="3" required></textarea>
                                                    </div>

                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary" form="detailForm${listGuideline.id}">Create</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <script>
                                    $(document).ready(function () {
                                        // Show the modal when the button is clicked
                                        $(`#openModal1${listGuideline.id}`).on('click', function () {
                                            $(`#myModal${listGuideline.id}`).modal('show');
                                        });
                                    });
                                </script>










                            </div>


                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                        </div>
                        <div class="modal-body">

                            <c:forEach items="${listGuideDetail}" var="listGuideDetail">
                                <c:if test="${listGuideDetail.guideline_id.id == listGuideline.id}">
                                    <h3>${listGuideDetail.step_title}</h3>
                                    <p>${listGuideDetail.description}</p>
                                    <div class="d-flex align-items-center">
                                        <button type="button" 
                                                class="btn btn-info me-2"  
                                                data-bs-toggle="modal" 
                                                data-bs-target="#editDetailModal"
                                                data-id="${listGuideDetail.id}"
                                                data-title="${listGuideDetail.step_title}"
                                                data-description="${listGuideDetail.description}">
                                            Edit
                                        </button>

                                        <form action="guideline" method="post" onsubmit="return confirmDelete()">
                                            <input value="deleteDetail" name="action" hidden="">
                                            <input value="${listGuideDetail.id}" name="id" hidden="">
                                            <button type="submit" class="btn btn-danger">
                                                Delete
                                            </button>
                                        </form>
                                    </div>

                                    <script>
                                        // Function to display a confirmation dialog
                                        function confirmDelete() {
                                            return confirm("Are you sure you want to delete this step?");
                                        }
                                    </script>





                                </c:if>

                            </c:forEach>



                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <!-- kết thúc Hiển thị popup cho detail  -->











        <!-- Bootstrap JS and dependencies (Popper.js) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
