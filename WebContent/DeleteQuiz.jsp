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
try
{
String collegename=(String)session.getAttribute("colcode");
String message="";
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
String subject1=(String)session.getAttribute("subjectname1");

int Id=Integer.parseInt(request.getParameter("id"));
String sql2="Select title from quiz_info where Id=?";
PreparedStatement pstm2 = con1.prepareStatement(sql2);
pstm2.setInt(1,Id);
//Long id = this.getMaxAttachmentId(con) + 1;
//pstm2.setString(1,quiztitle);
String qtitle="";
//int flag=0;
 ResultSet rs2=pstm2.executeQuery();
 while(rs2.next())
 {
	 qtitle=rs2.getString("title");
 }
Statement st=con1.createStatement();
int i=st.executeUpdate("DELETE FROM quiz_info WHERE Id="+Id);
Statement st2=con1.createStatement();
int i2=st2.executeUpdate("DELETE FROM quizresult WHERE title='"+qtitle+"' and Subject_code='"+subject1+"'");
Statement st3=con1.createStatement();
int i3=st3.executeUpdate("DELETE FROM finalquiz WHERE title='"+qtitle+"' and Subject_code='"+subject1+"'");
Statement st4=con1.createStatement();
int i4=st4.executeUpdate("DELETE FROM quiz_questions WHERE title='"+qtitle+"' and Subject_code='"+subject1+"'");

String uid1="";
 int qstatus=0;
 int addstatus=0;
 int cddstatus=0;
 String query4="select Userid,QuizStatus from student_subject where Subject_code=?";
PreparedStatement ps5=con1.prepareStatement(query4);
ps5.setString(1,subject1);
ResultSet rs5=ps5.executeQuery();
while(rs5.next())
{
	 addstatus=1;
	 uid1=rs5.getString(1);
	 qstatus=rs5.getInt(2);
	 cddstatus=qstatus-addstatus;
	 PreparedStatement ps6=con1.prepareStatement("Update student_subject set QuizStatus=? Where Userid=? and Subject_code=?");
	 ps6.setInt(1,cddstatus);
	   ps6.setString(2,uid1);
	   ps6.setString(3,subject1);
	  
	   int row3=ps6.executeUpdate();
	 
}

if(i>0)
{
	message="Quiz deleted successfully";
    response.sendRedirect("FacultySubjectQuiz.jsp?message="+message);

}
else
{
	message="Failed to delete Quiz";
    response.sendRedirect("FacultySubjectQuiz.jsp?error="+message);
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