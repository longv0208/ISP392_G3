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
                                <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#guideModal${listGuideline.id}">
                                    View
                                </button>
                                <!-- button edit  -->
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












        <!-- Bootstrap JS and dependencies (Popper.js) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
