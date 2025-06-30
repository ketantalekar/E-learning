<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Faculty Dashboard</title>
<link href="Bootstrap/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="Bootstrap/css/style.css" rel="stylesheet" type="text/css"></link>
</head>
<body>
<%
String message="";
int Id=Integer.parseInt(request.getParameter("id"));
try
{
String collegename=(String)session.getAttribute("colcode");

Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
String subject=(String)session.getAttribute("subjectname1");

Statement st=con1.createStatement();

int i=st.executeUpdate("DELETE FROM student_assignments WHERE id="+Id);
if(i>0)
{
	message="Assignment unsubmitted successsfully";
    response.sendRedirect("StudentSubjectAssignment.jsp?message="+message);

}
con1.close();
}
catch(Exception e)
{
	out.println(e.getMessage());
	message="Failed to undo assignemnt";
    response.sendRedirect("StudentSubjectAssignment.jsp?error="+message);
	}
%>
</body>
</html>