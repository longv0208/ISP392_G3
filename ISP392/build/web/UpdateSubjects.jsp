<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Subject</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f5;
                margin: 0;
                padding: 0;
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
                height: 45px;
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
                width: 40%;
                margin: 50px auto;
                padding: 20px;
                background-color: white;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
            }

            h2 {
                text-align: center;
                color: #333;
            }

            label {
                display: block;
                margin-bottom: 10px;
                font-weight: bold;
                color: #555;
            }

            input[type="text"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            input[type="submit"] {
                width: 100%;
                background-color: #28a745;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
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
            <h2>Update Subject</h2>
            <form action="subject" method="post">
                <label for="id">ID:</label>
                <input type="text" id="id" name="id" value="${s.getId()}"><br>
                <label for="code">Code:</label>
                <input type="text" id="code" name="code" value="${s.getCode()}"><br>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${s.getName()}"><br>
                <label for="credits">Credits:</label>
                <input type="text" id="credits" name="credits" value="${s.getCredits()}"><br>
                <label for="description">Description:</label>
                <input type="text" id="description" name="description" value="${s.getDescription()}"><br>
                <label for="semester">Semester:</label>
                <input type="text" id="semester" name="semester" value="${s.getSemester()}"><br>
                <label for="lecturer_id">Lecturer_id:</label>
                <input type="text" id="lecturer_id" name="lecturer_id" value="${s.getLecturer_id()}"><br>

                <input type="submit" name="update" value="UPDATE" />
            </form>
        </div>
    </body>
</html>
