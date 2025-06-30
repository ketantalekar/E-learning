<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.text.DateFormat,java.text.*,java.util.Calendar" %>
 <%@ include file="connection.jsp" %>

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
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>

<style>
tr:hover
{
background:lightgrey;
}
</style>
</head>
<body>
<%
String collegename=(String)session.getAttribute("colcode");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
String subjectname=request.getParameter("q");
String str3="Select Userid,Id from student_subject where Subject_code=?";
String studid="";
int sid=0,cnt=0;
 PreparedStatement ps8=con1.prepareStatement(str3);
 ps8.setString(1,subjectname);
 ResultSet rs8=ps8.executeQuery();
 %>
 <table cellspacing="6" cellpadding="25"id="myUL">
  <tr id="tk"><th>#</th><th>Student Name</th><th>Action</th></tr>
  
 <%
 while(rs8.next())
 {
	 cnt++;
 
	 studid=rs8.getString(1);
	sid=rs8.getInt(2);
 String str4="Select Username from student_details where Userid=?";
// String studid="";
  PreparedStatement ps9=con1.prepareStatement(str4);
  ps9.setString(1,studid);
  ResultSet rs9=ps9.executeQuery();
  while(rs9.next())
  {
%>
<tr>

<td><%=cnt %></td>
<td><%=rs9.getString(1) %></td>

<td><a href="ShowStudentStats.jsp?name=<%=studid%>&subcode=<%=subjectname%>"class="btn btn-primary btn-md"><i class="fa fa-eye" aria-hidden="true"></i> View</a></td>
</tr>
<%
  }
 }
%>
</table>
<script src="Bootstrap/jquery/jquery.min.js"></script>
  
<script src="Bootstrap/js/bootstrap.bundle.min.js"></script>
 <script src="Bootstrap/js/script_file.js"></script>

<%
try
{
	con1.close();
	con.close();
}
catch(Exception e)
{
	
	out.println(e.getMessage());
}



%>
</body>
</html>