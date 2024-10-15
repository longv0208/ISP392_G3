<%@page import="java.util.List"%>
<%@page import="Model.Transactions"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Transaction History</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">

        <style>
            /* Navbar styling */
            .navbar {
                background-color: #FF8C00; /* Orange color */
            }

            .navbar-brand {
                color: white;
                font-size: 24px;
                font-weight: bold;
            }

            /* Main content styling */
            .main-content {
                margin-top: 50px;
                text-align: center;
                font-family: Arial, sans-serif;
            }

            .header-title {
                font-size: 28px;
                font-weight: bold;
                color: #FF8C00; /* Main color */
                margin-bottom: 30px;
            }

            /* Table styling */
            .table-bordered th, .table-bordered td {
                border: 1px solid #FF8C00;
            }

            th {
                background-color: #FF8C00;
                color: white;
                font-size: 18px;
            }

            td {
                padding: 15px;
                font-size: 16px;
            }

            /* Footer styling */
            .footer {
                background-color: #FFA500;
                padding: 20px;
                text-align: center;
                font-size: 16px;
                color: white;
                margin-top: 40px;
                border-radius: 10px;
            }

            /* Container adjustments */
            .container {
                max-width: 800px;
                margin: 0 auto;
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
        <div class="container main-content">
            <h1 class="header-title">Transaction History</h1>

            <!-- Transaction History Table -->
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Transaction ID</th>
                            <th>Amount (VND)</th>
                            <th>Transaction Type</th>
                            <th>Description</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="transaction" items="${transactionList}">
                            <tr>
                                <td>${transaction.id}</td>
                                <td><fmt:formatNumber value="${transaction.amount}" type="currency" currencySymbol="VND" /></td>
                                <td>${transaction.transaction_type}</td>
                                <td>${transaction.description}</td>
                                <td>${transaction.transaction_date}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Footer -->
            <div class="footer">
                © 2024 University Academic Portal. All rights reserved.
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
