<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.text.DateFormat,java.text.*,java.util.Calendar,java.util.Arrays" %>
<%@ include file="connection.jsp" %>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="Bootstrap/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="Bootstrap/css/style.css" rel="stylesheet" type="text/css"></link>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <title>Feedback</title>
</head>
<body>
<%
try
{
	
String userid=(String)session.getAttribute("sessuid");
String collegename=(String)session.getAttribute("colcode");
String q1=request.getParameter("question1");
String q2=request.getParameter("question2");
String q3=request.getParameter("question3");
String q4=request.getParameter("question4");
String q5=request.getParameter("question5");
String q6=request.getParameter("question6");
String q7=request.getParameter("question7");
String q8=request.getParameter("question8");
String q9=request.getParameter("question9");
String q10=request.getParameter("question10");
String q11=request.getParameter("question11");
String q12=request.getParameter("question12");
int st=1;
PreparedStatement ps=con.prepareStatement("insert into feedback_details(College_code,Userid,Question1,Question2,Question3,Question4,Question5,Question6,Question7,Question8,Question9,Question10,Question11,Question12,Status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
ps.setString(1,collegename);
ps.setString(2,userid);
ps.setString(3,q1);
ps.setString(4,q2);
ps.setString(5,q3);
ps.setString(6,q4);
ps.setString(7,q5);
ps.setString(8,q6);
ps.setString(9,q7);
ps.setString(10,q8);
ps.setString(11,q9);
ps.setString(12,q10);
ps.setString(13,q11);
ps.setString(14,q12);
ps.setInt(15,st);
int row=ps.executeUpdate();
String utype = (String) session.getAttribute("utype");

if (row > 0) 
{
	  if(utype.equals("Faculty"))
			{
		
	out.println("<script type=\"text/javascript\">");
	   out.println("alert('Feedback submimtted successfully');");
	   out.println("location='FacultyFeedback.jsp';");
	   out.println("</script>");
			}
	  else if(utype.equals("Student"))
		{
		  out.println("<script type=\"text/javascript\">");
		   out.println("alert('Feedback submimtted successfully');");
		   out.println("location='StudentFeedback.jsp';");
		   out.println("</script>");
		
		}
	  else if(utype.equals("College Admin"))
		{
		  out.println("<script type=\"text/javascript\">");
		   out.println("alert('Feedback submimtted successfully');");
		   out.println("location='CollegeAdminFeedback.jsp';");
		   out.println("</script>");
		
		}
	//response.sendRedirect("StudentFeedback.jsp");
}
else
{
	out.println("error");
}
con.close();
}
catch(Exception e)
{
	out.println(e.getMessage());
}
%>
</body>
</html>