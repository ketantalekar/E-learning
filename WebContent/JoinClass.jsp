<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
<%@ page import ="javax.servlet.http.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<%@ page import="java.io.PrintWriter,java.io.StringWriter" %>
<%
String collegename=(String)session.getAttribute("colcode");

Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");

String message="";
try{  
	String subjectcode=request.getParameter("subjectcode");
	String subjectname="";
	String department="";
	String batch="";
	
	String query3="select Subject_name,Department,Batch from subject_details where Subject_code=?";
    PreparedStatement ps4=con1.prepareStatement(query3);
    ps4.setString(1,subjectcode);
    ResultSet rs4=ps4.executeQuery();
    while(rs4.next())
    {
    	subjectname=rs4.getString(1);
    	department=rs4.getString(2);
    	batch=rs4.getString(3);
    }
   
	String username=(String)session.getAttribute("sessuid");
   PreparedStatement ps=con1.prepareStatement("insert into Student_Subject(Department,Subject_name,Batch,Subject_code,Userid) values(?,?,?,?,?)");
   ps.setString(1,department);
   ps.setString(2,subjectname);
   ps.setString(3,batch);
   ps.setString(4,subjectcode); 
   
   ps.setString(5,username); 
   
   int row=ps.executeUpdate();
 
  //out.println(row);
   if (row > 0) {
       //message = "File uploaded and saved into database";
       //out.println(message);
       message="Joined class successfully";
           response.sendRedirect("StudentClass.jsp?message="+message);
   }
   else
   {
	   message="Failed to join class";
       response.sendRedirect("StudentClass.jsp?error="+message);
   }
   con1.close();
}catch(Exception e){
	
	out.println(e.getMessage());
}  

%>

</body>
</html>