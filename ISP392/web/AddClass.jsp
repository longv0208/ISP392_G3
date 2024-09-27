<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Class</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: white; /* Đổi nền thành màu trắng */
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 33vh;
            }

            /* Taskbar */
            .taskbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: #ff6600;
                padding: 10px 20px;
                width: 100%;
                box-sizing: border-box;
                height: 45px; /* Set the height to 45px */
            }

            .taskbar h1 {
                margin: 0;
                font-size: 18px;
                color: white;
                text-shadow: 1px 1px 2px black;
            }

            .logout-button {
                background-color: white;
                border: 2px solid white;
                padding: 5px 15px;
                border-radius: 20px;
                font-size: 14px;
                color: #333;
                text-decoration: none;
                display: flex;
                align-items: center;
            }

            .logout-button:hover {
                background-color: #e6e6e6;
                border-color: #e6e6e6;
            }

            .container {
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                width: 300px;
            }

            h2 {
                text-align: center;
                color: #333;
            }

            form {
                display: flex;
                flex-direction: column;
            }

            label {
                margin-bottom: 5px;
                color: #555;
            }

            input[type="text"] {
                padding: 8px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 14px;
            }

            input[type="submit"] {
                padding: 10px;
                background-color: #28a745;
                border: none;
                color: white;
                font-size: 16px;
                cursor: pointer;
                border-radius: 4px;
            }

            input[type="submit"]:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>
        <!-- Taskbar -->
        <div class="taskbar">
            <h1>University Academic Portal</h1>
            <a href="#" class="logout-button">
                <img src="https://img.icons8.com/ios-filled/20/000000/logout-rounded--v1.png" alt="Logout Icon"> Log out
            </a>
        </div>

        <div class="container">
            <h2>Add Class</h2>
            <form action="class" method="post">
                <label for="class_name">Class Name:</label>
                <input type="text" id="class_name" name="class_name" required>

                <input type="submit" name="add" value="ADD">
            </form>
        </div>
    </body>
</html>
