<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try
{
	int uploadId=Integer.parseInt(request.getParameter("id"));
   Connection con=null;
Class.forName("com.mysql.jdbc.Driver");  
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-learning","root","");  
String sql = "delete from courses where courseid=?";
PreparedStatement pstm = con.prepareStatement(sql);
pstm.setInt(1,uploadId);
pstm.execute();
RequestDispatcher dispatcher= request.getServletContext().getRequestDispatcher("/vcourses.jsp?message=Delete+Successful");

dispatcher.forward(request, response);
con.close();
}
catch(Exception e)
{
	RequestDispatcher dispatcher= request.getServletContext().getRequestDispatcher("/vcourses.jsp?error=Failed+to+delete");

	dispatcher.forward(request, response);

	}

%>
</body>
</html>