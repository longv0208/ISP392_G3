<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Subject</title>
            
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
                width: 80%;
                margin: 50px auto;
                padding: 20px;
                background-color: white;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
            }

            h1 {
                text-align: center;
                color: #333;
            }

            a.button {
                display: inline-block;
                padding: 10px 20px;
                margin-bottom: 20px;
                background-color: #007bff;
                color: white;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            a.button:hover {
                background-color: #0056b3;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            table, th, td {
                border: 1px solid #ccc;
            }

            th, td {
                padding: 12px 15px;
                text-align: left;
            }

            th {
                background-color: #007bff;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tr:hover {
                background-color: #f1f1f1;
            }

            td a {
                color: #007bff;
                text-decoration: none;
                transition: color 0.2s ease;
            }

            td a:hover {
                color: #0056b3;
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
            <h1>List Subject</h1>

            <br><a href="subject?mod=1" class="button">Create new Subject</a>

            <table>
                <tr>
                    <th>ID</th>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Credits</th>
                    <th>Description</th>
                    <th>Semester</th>
                    <th>Lecturer ID</th>
                    <th>Delete</th>
                </tr>
                <c:forEach items="${data}" var="s">
                    <tr>
                        <td><a href="subject?mod=3&id=${s.getId()}">${s.getId()}</a></td>
                        <td>${s.getCode()}</td>
                        <td>${s.getName()}</td>
                        <td>${s.getCredits()}</td>
                        <td>${s.getDescription()}</td>
                        <td>${s.getSemester()}</td>
                        <td>${s.getLecturer_id()}</td>
                        <td><a href="subject?mod=2&id=${s.getId()}" onclick="return confirm('Are you sure you want to delete this subject?');">Delete</a></td>

                    </tr>
                </c:forEach>
            </table>
        </div>   
    </body>
</html>
