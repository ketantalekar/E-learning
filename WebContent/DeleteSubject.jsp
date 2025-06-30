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

int uid=Integer.parseInt(request.getParameter("id"));
PreparedStatement pstmt22=null;
pstmt22=con1.prepareStatement("SELECT Subject_code FROM subject_details WHERE Id=?");
pstmt22.setInt(1,uid);
ResultSet rs22=pstmt22.executeQuery();
String subcode="";
if(rs22.next())
{
	subcode=rs22.getString(1);

}
Statement st5=con1.createStatement();
int i5=st5.executeUpdate("DELETE FROM assignment_email WHERE Subject_code='"+subcode+"'");
Statement st6=con1.createStatement();
int i6=st6.executeUpdate("DELETE FROM finalquiz WHERE Subject_code='"+subcode+"'");
Statement st7=con1.createStatement();
int i7=st7.executeUpdate("DELETE FROM notices WHERE subject='"+subcode+"'");
Statement st8=con1.createStatement();
int i8=st8.executeUpdate("DELETE FROM quizresult WHERE Subject_code='"+subcode+"'");
Statement st4=con1.createStatement();
int i4=st4.executeUpdate("DELETE FROM facultyassignment WHERE Subject_code='"+subcode+"'");
Statement st9=con1.createStatement();
int i9=st9.executeUpdate("DELETE FROM quiz_info WHERE subject='"+subcode+"'");
Statement st10=con1.createStatement();
int i10=st10.executeUpdate("DELETE FROM quiz_questions WHERE Subject_code='"+subcode+"'");

Statement st11=con1.createStatement();
int i11=st11.executeUpdate("DELETE FROM student_assignments WHERE subject_code='"+subcode+"'");
Statement st13=con1.createStatement();
int i13=st13.executeUpdate("DELETE FROM student_subject WHERE Subject_code='"+subcode+"'");
Statement st15=con1.createStatement();
int i15=st15.executeUpdate("DELETE FROM upload_file WHERE Subject_Name='"+subcode+"'");

Statement st=con1.createStatement();
int i=st.executeUpdate("DELETE FROM subject_details WHERE Id="+uid);
if(i>0)
{
	message="Subject details deleted successfully";
	   response.sendRedirect("CollegeAdminSubject.jsp?message="+message);
		   
}
con1.close();

}
catch(Exception e)
{
	out.println(e.getMessage());
	message="Failed to delete subject details";
	  response.sendRedirect("CollegeAdminSubject.jsp?error="+message);
	}
%>
</body>
</html>