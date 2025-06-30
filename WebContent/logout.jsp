<%@ page language="java" contentType="text/html; charset=UTF-8"%>
     <%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
     <%@ include file="connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>

localStorage.setItem('show', 'false');
</script>

</head>
<body>
<%
String collegename=(String)session.getAttribute("colcode");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
String userid=(String)session.getAttribute("sessuid");
String sql = "delete from dummy_quiz_title where Userid=?";
PreparedStatement pstm = con1.prepareStatement(sql);
pstm.setString(1,userid);
pstm.execute();
int profpicst=0,passt=0,profst=0;
String utype=(String)session.getAttribute("utype");
if(utype.equals("Student"))
{
  Statement stmt2=con1.createStatement();  
  int i2=stmt2.executeUpdate("update student_details set ProfilePicStatus="+profpicst+",PasswordStatus="+passt+",ProfileStatus="+passt+" where Userid='"+session.getAttribute("sessuid")+"'"); 
}
else if(utype.equals("College Admin"))
{
  Statement stmt=con1.createStatement();  
  int i=stmt.executeUpdate("update college_admin_details set ProfilePicStatus="+profpicst+",PasswordStatus="+passt+",ProfileStatus="+passt+" where Userid='"+session.getAttribute("sessuid")+"'"); 
  Statement stmt1=con.createStatement();  
  int i1=stmt1.executeUpdate("update college_admin_details set ProfilePicStatus="+profpicst+",PasswordStatus="+passt+",ProfileStatus="+passt+" where Userid='"+session.getAttribute("sessuid")+"'"); 
}
else if(utype.equals("Faculty"))
{
  Statement stmt1=con1.createStatement();  
  int i1=stmt1.executeUpdate("update faculty_details set ProfilePicStatus="+profpicst+",PasswordStatus="+passt+",ProfileStatus="+passt+" where Userid='"+session.getAttribute("sessuid")+"'"); 
}
  session.invalidate();

response.sendRedirect("login.html");
try
{
con1.close();
}
catch(Exception e)
{
	out.println(e.getMessage());
	}
%>
</body>
</html>