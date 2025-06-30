<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body>
<%
//String name="";
Class.forName("com.mysql.jdbc.cj.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/management","root",""); 


%>
</body>
</html>