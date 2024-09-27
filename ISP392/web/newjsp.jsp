<%-- 
    Document   : newjsp
    Created on : Sep 25, 2024, 3:20:51 AM
    Author     : khucx
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="upload" method="post" enctype="multipart/form-data">
            <input type="file" name="file" accept="xlsx/*">
            <input type="submit" value="upload">
            
        </form>
    </body>
</html>
