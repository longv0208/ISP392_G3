<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Class</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }

            body {
                background-color: white;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 45vh;
            }

            .taskbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: #ff6600;
                padding: 10px 20px;
                width: 100%;
                box-sizing: border-box;
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
                background-color: #fff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                width: 100%;
            }

            h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }

            label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
                color: #555;
            }

            input[type="text"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 14px;
                transition: border-color 0.3s;
            }

            input[type="text"]:focus {
                border-color: #007bff;
                outline: none;
            }

            input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

            .container form {
                margin-top: 20px;
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
            <h2>Update Class</h2>
            <form action="class" method="post">
                <label for="class_id">Class ID:</label>
                <input type="text" id="id" name="id" value="${c.getClass_id()}">
                <label for="class_name">Class Name:</label>
                <input type="text" id="class_name" name="class_name" value="${c.getClass_name()}">
                <input type="submit" name="update" value="UPDATE">
            </form>
        </div>
    </body>
</html>
