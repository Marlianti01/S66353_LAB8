<%-- 
    Document   : error
    Created on : Jun 16, 2024, 1:34:49 PM
    Author     : marli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
        <h1>Error</h1>
        <h2><%=exception.getMessage()%><br/></h2>
    </body>
</html>
