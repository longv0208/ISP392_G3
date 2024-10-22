<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Deposit Request</title>

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

            /* Balance card styling */
            .balance-card {
                background-color: #FFA500; /* Orange gradient */
                color: white;
                padding: 20px;
                font-size: 30px; /* Larger font size for balance */
                font-weight: bold;
                border-radius: 10px;
                margin-bottom: 20px;
            }

            .header-title {
                font-size: 28px;
                font-weight: bold;
                color: #FF8C00; /* Main color */
                margin-bottom: 30px;
            }

            /* Deposit form styling */
            .deposit-form {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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

            /* Input and button styling */
            .form-control {
                font-size: 16px;
                padding: 10px;
                margin-bottom: 15px;
            }

            .btn-primary {
                background-color: #FF8C00;
                border: none;
                padding: 12px 20px;
                font-size: 18px;
                font-weight: bold;
                color: white;
                border-radius: 5px;
                cursor: pointer;
                width: 100%;
            }

            .btn-primary:hover {
                background-color: #E67E00;
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
            <h1 class="header-title">Create Deposit Request</h1>

            <!-- Balance card -->
            <div class="balance-card">
                Current Account Balance: 
                <fmt:formatNumber value="${studentProfile.wallet}" minFractionDigits="0" /> VND
            </div>

            <!-- Deposit form -->
            <div class="deposit-form">
                <!-- Form to submit to VNPayServlet for processing -->
                <form action="${pageContext.request.contextPath}/addWallet" method="post" id="moneyForm">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Add Money</th>
                                <th>Limits and Fees</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <label for="amount">Amount to Add:</label>
                                    <input type="number" name="amount" class="form-control" id="amount" required placeholder="Enter amount">
                                </td>
                                <td>
                                    <p>Minimum amount: 5,000 VND</p>
                                    <p>Maximum amount: 500,000,000 VND</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <button type="submit" class="btn-primary">Add Money</button>
                                </td>
                                <td>
                                    <p>Transaction fee: 0 VND</p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
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
