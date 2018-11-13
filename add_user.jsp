<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add user</title>
    </head>
    <body>
    <center>
        <form action="create_user">
        <h3>Enter the Username: <input type="text" name="username" id="username" required></h3>
        <h3>Enter the Password: <input type="password" name="password" id="password" required></h3>
        <input type="submit" name="submit" id="submit" value="Create" >
        <input type ="button" value="cancel" onclick="window.location.href='http://localhost:8080/ARSurveys/admin_dash.jsp';">
        </form>
    </center>
    </body>
</html>
