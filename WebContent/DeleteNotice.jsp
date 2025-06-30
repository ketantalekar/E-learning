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
try
{
String collegename=(String)session.getAttribute("colcode");

Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
String subject=(String)session.getAttribute("subjectname1");
int Id=Integer.parseInt(request.getParameter("Id"));
Statement st=con1.createStatement();


int nstatus=0;
String uid="";
int addstatus=1;
int cddstatus=0;
String query4="select Userid,NoticeStatus from student_subject where Subject_code=?";
PreparedStatement ps5=con1.prepareStatement(query4);
ps5.setString(1,subject);
ResultSet rs5=ps5.executeQuery();
while(rs5.next())
{
	 addstatus=1;
	 uid=rs5.getString(1);
	 nstatus=rs5.getInt(2);
	 cddstatus=nstatus-addstatus;
	 PreparedStatement ps6=con1.prepareStatement("Update student_subject set NoticeStatus=? Where Userid=? and Subject_code=?");
	 ps6.setInt(1,cddstatus);
	   ps6.setString(2,uid);
	   ps6.setString(3,subject);
	  
	   int row3=ps6.executeUpdate();
	 
}
int i=st.executeUpdate("DELETE FROM notices WHERE Id="+Id);
if(i>0)
{
	message="Notice deleted successfully";
    response.sendRedirect("FacultySubject.jsp?message="+message);

}
//con.close(); 
con1.close();
}
catch(Exception e)
{
	out.println(e.getMessage());
	message="Failed to delete notice";
    response.sendRedirect("FacultySubject.jsp?error="+message);
	}
%>
</body>
</html>