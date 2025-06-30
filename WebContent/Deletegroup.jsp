<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
 <%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
<%@ page import ="javax.servlet.http.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<%@ page import="java.io.PrintWriter,java.io.StringWriter,java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
String collegename=(String)session.getAttribute("colcode");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
String grpalias=(String)session.getAttribute("searchgrpname");
String sql = "delete from group_details where Group_alias=?";
PreparedStatement pstm = con1.prepareStatement(sql);
pstm.setString(1,grpalias);
pstm.execute();

String sql1 = "delete from group_notifications where Group_alias=?";
PreparedStatement pstm1 = con1.prepareStatement(sql1);
pstm1.setString(1,grpalias);
pstm1.execute();

String sql2 = "delete from group_notifications where Group_name=?";
PreparedStatement pstm2 = con1.prepareStatement(sql2);
pstm2.setString(1,grpalias);
pstm2.execute();
session.removeAttribute("searchgrpname");


//response.sendRedirect("Facultychats.jsp");
String utype = (String) session.getAttribute("utype");
	
       if(utype.equals("Faculty"))
		{
			response.sendRedirect("Facultychats.jsp");
			
		}
		else if(utype.equals("Student"))
		{
			response.sendRedirect("Studentchats.jsp");
			
			
		}
		else if(utype.equals("College Admin"))
		{
			response.sendRedirect("CollegeAdminchats.jsp");

		}

con1.close();
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>