<%@ page language="java" contentType="text/html; charset=UTF-8"%>
     <%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
     <%@ include file="connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int profpicst=0,passt=0,profst=0;
Statement stmt=con.createStatement();  
  int i=stmt.executeUpdate("update admin_details set ProfilePicStatus="+profpicst+",PasswordStatus="+passt+",ProfileStatus="+passt+" where Userid='"+session.getAttribute("sessuid")+"'");
session.invalidate();

response.sendRedirect("login.html");
try
{
	con.close(); 
	
}
catch(Exception e)
{
	out.println(e.getMessage());
}
%>
</body>
</html>