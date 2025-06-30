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
int id=Integer.parseInt(request.getParameter("id"));


String sql1 = "delete from quiz_questions where Id=?";
PreparedStatement pstm1 = con1.prepareStatement(sql1);
pstm1.setInt(1,id);
pstm1.execute();

	response.sendRedirect("addquizquestions.jsp?message=Deleted+Question+Successfully");
 

con1.close();
}
catch(Exception e)
{
	out.println(e);
	response.sendRedirect("addquizquestions.jsp?error=Failed+to+delete+Question");
}
%>
</body>
</html>