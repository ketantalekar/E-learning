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

int Id=Integer.parseInt(request.getParameter("Id"));


PreparedStatement pstmt41=null;
String title="";
 pstmt41=con1.prepareStatement("SELECT Title FROM facultyassignment WHERE Id=?");
 pstmt41.setInt(1,Id);
 ResultSet rs41=pstmt41.executeQuery();
 if(rs41.next())
 {
	 title=rs41.getString(1);
	
 }

Statement st=con1.createStatement();
int i=st.executeUpdate("DELETE FROM facultyassignment WHERE Id="+Id);
Statement st1=con1.createStatement();
int i1=st1.executeUpdate("DELETE FROM student_assignments WHERE Assignment_name='"+title+"'");

String subjectcode=(String)session.getAttribute("subjectname1");
String uid="";
int astatus=0;
int addstatus=0;
int cddstatus=0;
String query4="select Userid,AssignmentStatus from student_subject where Subject_code=?";
PreparedStatement ps5=con1.prepareStatement(query4);
ps5.setString(1,subjectcode);
ResultSet rs5=ps5.executeQuery();
String uuname="",emid="";
while(rs5.next())
{
	 addstatus=1;
	 uid=rs5.getString(1);
	 astatus=rs5.getInt(2);
	 cddstatus=astatus-addstatus;
	
	 PreparedStatement ps6=con1.prepareStatement("Update student_subject set AssignmentStatus=? Where Userid=? and Subject_code=?");
	 ps6.setInt(1,cddstatus);
	   ps6.setString(2,uid);
	   ps6.setString(3,subjectcode);
	  
	   int row3=ps6.executeUpdate();


}
if(i>0)
{
	message="Assignment deleted successfully";
    response.sendRedirect("FacultySubjectAssignment.jsp?message="+message);

}
else
{
	message="Failed to delete Assignment";
    response.sendRedirect("FacultySubjectAssignment.jsp?error="+message);	
}
//con.close(); 
con1.close();
}
catch(Exception e)
{
	out.println(e.getMessage());
	
	}
%>
</body>
</html>