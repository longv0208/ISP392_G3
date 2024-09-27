<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Excel File Upload with Preview</title>
        <style>
            .file-upload-wrapper {
                width: 30%; /* Set the width to 30% */
                margin: auto; /* Center the element horizontally */
                border: 2px dashed #ccc;
                border-radius: 10px;
                padding: 40px;
                text-align: center;
                font-family: Arial, sans-serif;
                font-size: 16px;
                color: #888;
                cursor: pointer;
                position: relative;
                transition: border-color 0.3s ease;
            }

            .file-upload-wrapper:hover {
                border-color: #999;
            }

            .file-upload-wrapper input[type="file"] {
                position: absolute;
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
                opacity: 0;
                cursor: pointer;
            }

            .file-upload-wrapper.dragover {
                border-color: #666;
            }

            .file-preview {
                margin-top: 20px;
                text-align: left;
            }

            .file-preview table {
                width: 100%;
                border-collapse: collapse;
            }

            .file-preview th, .file-preview td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            #confirmButton {
                margin-top: 20px;
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                display: none; /* Initially hidden */
            }

            #confirmButton:disabled {
                background-color: #ccc;
                cursor: not-allowed;
            }

            #confirmButton:hover {
                background-color: #45a049;
            }

            #cancelButton {
                margin-top: 20px;
                padding: 10px 20px;
                background-color: #f44336;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                display: none;
                margin-left: 10px;
            }

            #cancelButton:hover {
                background-color: #e60000;
            }

            /* Return to Home button */
            #homeButton {
                margin-top: 20px;
                padding: 10px 20px;
                background-color: #2196F3;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            #homeButton:hover {
                background-color: #1E88E5;
            }

            /* Add a hidden class */
            .hidden {
                display: none;
            }
        </style>
        <script>
            // Function to show a popup with the error message
            function showErrorPopup(errorMessage) {
                if (errorMessage) {
                    alert("Error: " + errorMessage);  // Simple alert popup
                }
            }
        </script>
    </head>
    <body>
        <c:if test="${sessionScope.role==0}">
            <!-- Form to handle file upload -->
            <form action="upload" method="post" enctype="multipart/form-data">
                <button id="homeButton" type="button">Return to Home</button>
                <div class="file-upload-wrapper" id="fileUploadWrapper">
                    <input type="file" id="fileInput" name="file" accept=".xlsx">
                    <p id="uploadMessage">Click to browse or drag and drop your Excel (.xlsx) file</p>
                </div>

                <!-- Preview area for selected files -->
                <div class="file-preview" id="filePreview"></div>

                <!-- Confirm, Cancel, and Home buttons -->
                <button id="confirmButton" type="submit" disabled>Confirm and Send</button> <!-- Initially disabled -->
                <button id="cancelButton" type="button">Cancel</button>

            </form>
        </c:if>
        <%
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) {
        %>
        <script>
            // Call the showErrorPopup function to display the error message
            showErrorPopup("<%= errorMessage.replace("\"", "\\\"").replace("\n", "\\n") %>");
        </script>
        <%
            }
        %>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.9/xlsx.full.min.js"></script>
        <script>
            const fileUploadWrapper = document.getElementById('fileUploadWrapper');
            const fileInput = document.getElementById('fileInput');
            const filePreview = document.getElementById('filePreview');
            const confirmButton = document.getElementById('confirmButton');
            const cancelButton = document.getElementById('cancelButton');
            const homeButton = document.getElementById('homeButton');

            // Handle drag and drop events
            fileUploadWrapper.addEventListener('dragover', (e) => {
                e.preventDefault();
                fileUploadWrapper.classList.add('dragover');
            });

            fileUploadWrapper.addEventListener('dragleave', () => {
                fileUploadWrapper.classList.remove('dragover');
            });

            fileUploadWrapper.addEventListener('drop', (e) => {
                e.preventDefault();
                fileUploadWrapper.classList.remove('dragover');
                handleFiles(e.dataTransfer.files);
            });

            // Handle file input click
            fileInput.addEventListener('change', () => {
                handleFiles(fileInput.files);
            });

            // Handle file selection and preview
            function handleFiles(files) {
                filePreview.innerHTML = ''; // Clear previous preview
                if (files.length > 0) {
                    const file = files[0];
                    const reader = new FileReader();

                    // File preview handling
                    reader.onload = (e) => {
                        const data = new Uint8Array(e.target.result);
                        const workbook = XLSX.read(data, {type: 'array'});

                        // Select the first sheet
                        const sheetName = workbook.SheetNames[0];
                        const sheet = workbook.Sheets[sheetName];

                        // Convert sheet to JSON
                        const sheetJson = XLSX.utils.sheet_to_json(sheet, {header: 1});

                        // Display as HTML table
                        const table = document.createElement('table');
                        sheetJson.forEach(row => {
                            const tr = document.createElement('tr');
                            row.forEach(cell => {
                                const td = document.createElement('td');
                                td.textContent = cell || ''; // Handle empty cells
                                tr.appendChild(td);
                            });
                            table.appendChild(tr);
                        });
                        filePreview.appendChild(table);

                        // Hide the fileUploadWrapper after successful file load
                        fileUploadWrapper.classList.add('hidden');

                        // Enable the "Confirm and Send" button
                        confirmButton.disabled = false;
                        confirmButton.style.display = 'inline-block';
                        cancelButton.style.display = 'inline-block';
                    };

                    // Read the Excel file
                    reader.readAsArrayBuffer(file);

                } else {
                    confirmButton.disabled = true;
                    confirmButton.style.display = 'none';
                    cancelButton.style.display = 'none';
                }
            }

            // Cancel button event handler
            cancelButton.addEventListener('click', () => {
                // Show the file upload wrapper again
                fileUploadWrapper.classList.remove('hidden');

                // Clear the file preview
                filePreview.innerHTML = '';

                // Hide confirm and cancel buttons
                confirmButton.style.display = 'none';
                cancelButton.style.display = 'none';

                // Clear the file input
                fileInput.value = ''; // This is important to allow re-uploading the same file
            });

            // Home button event handler
            homeButton.addEventListener('click', () => {
                window.location.href = 'home'; // Replace '/' with the URL to your home page
            });
        </script>

    </body>
</html>
