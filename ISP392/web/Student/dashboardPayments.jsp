<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html lang="en">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>University Academic Portal - Payments</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
        <style>
            /* Navbar styling */
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

            /* Main content styling */
            .main-content {
                margin: 50px auto;
                width: 70%;
                text-align: center;
            }

            .account-balance {
                background-color: #00A2FF;
                color: white;
                padding: 10px;
                margin-bottom: 20px;
                font-size: 18px;
            }

            h2 {
                margin-bottom: 20px;
                color: #333;
            }

            /* Table styles */
            .table-responsive {
                margin-top: 20px;
            }

            th {
                background-color: #007bff;
                color: white;
            }

            td, th {
                text-align: center;
                vertical-align: middle;
            }

            /* Button styles */
            .pay-btn {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px 20px;
                margin-top: 20px;
                border-radius: 5px;
                cursor: pointer;
            }

            .pay-btn:disabled {
                background-color: grey;
            }

            /* Checkbox and total amount styles */
            .checkbox {
                width: 20px;
                height: 20px;
            }

            .total-amount {
                margin-top: 20px;
                font-size: 18px;
                font-weight: bold;
            }
        </style>
    </head>

    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="home">University Academic Portal</a>
            </div>
        </nav>
        <div class="container">
            <!-- Thông báo lỗi -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">
                    ${error}
                </div>
            </c:if>

            <!-- Thông báo thành công -->
            <c:if test="${not empty success}">
                <div class="alert alert-success" role="alert">
                    ${success}
                </div>
            </c:if>
            <!-- Main content -->
            <div class="main-content">
                <h2>Choose Paid Items</h2>

                <!-- Account balance display -->
                <div class="account-balance">
                    Account balance: <fmt:formatNumber value="${studentProfile.wallet}" minFractionDigits="0" /> VND
                </div>

                <!-- Payment Table -->
                <form action="${pageContext.request.contextPath}/dashboardPayments" method="post">
                    <input type="hidden" name="action" value="pay">
                    <input type="hidden" id="totalAmount" name="totalAmount" value="0"> 

                    <div class="table-responsive">
                        <table id="paymentTable" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>Fee type</th>
                                    <th>Amount (VND)</th>
                                    <th>Select</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listPayments}" var="payment">
                                    <tr>
                                        <td>${payment.paymentType}</td>
                                        <td>${payment.amount}</td>
                                        <td>
                                            <input type="checkbox" name="payment" value="${payment.ID}" data-amount="${payment.amount}" onclick="updateTotal()">
                                        </td>
                                    </tr>
                                </c:forEach>




                            </tbody>
                        </table>
                    </div>

                    <!-- Total Amount -->
                    <div class="total-amount">
                        Total amount:<span id="total">0</span> VND
                    </div>

                    <!-- Pay Button -->
                    <button type="submit" class="pay-btn" id="payButton" disabled>Pay choosed items</button>
                </form>

            </div>

            <!-- Bootstrap JS -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
            <script>
                                                $(document).ready(function () {
                                                    $('#paymentTable').DataTable({
                                                        "paging": false, // Disable pagination
                                                        "searching": false, // Disable search
                                                        "ordering": false, // Disable ordering
                                                        "info": false       // Disable page info
                                                    });
                                                });

                                                // Update total payable amount based on selected items
                                                function updateTotal() {
                                                    let checkboxes = document.querySelectorAll('input[type="checkbox"]');
                                                    let total = 0;
                                                    let isAnyChecked = false;

                                                    checkboxes.forEach((checkbox) => {
                                                        if (checkbox.checked) {
                                                            let amount = checkbox.getAttribute("data-amount");
                                                            if (!isNaN(amount)) {
                                                                total += parseInt(amount);
                                                                isAnyChecked = true;
                                                            }
                                                        }
                                                    });

                                                    document.getElementById('total').innerText = total.toLocaleString();
                                                    document.getElementById('totalAmount').value = total;

                                                    // Disable the Pay button if no items are selected or total is zero
                                                    document.getElementById('payButton').disabled = !isAnyChecked || total === 0;
                                                }


            </script>


    </body>
</html>
