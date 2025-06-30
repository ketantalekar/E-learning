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
	String subjectname=request.getParameter("subjectname");
	String department=request.getParameter("department");
	String batch=request.getParameter("batch");
	String subcode=request.getParameter("subcode");
	
	 String query1="Update subject_details set Subject_name=?,Department=?,batch=? where Subject_code=?";
     PreparedStatement ps4=con1.prepareStatement(query1);
     ps4.setString(1,subjectname);
     ps4.setString(2,department);
     ps4.setString(3,batch);
     ps4.setString(4,subcode);
     
     int row=ps4.executeUpdate();
     
     
   
  //out.println(row);
   if (row > 0) {
       //message = "File uploaded and saved into database";
       //out.println(message);
       String query2="Update facultyassignment set Subject=? where Subject_code=?";
     PreparedStatement ps5=con1.prepareStatement(query2);
     ps5.setString(1,subjectname);
     ps5.setString(2,subcode);
     int row2=ps5.executeUpdate();
    	  String query3="Update student_subject set Subject_name=? where Subject_code=?";
    	     PreparedStatement ps6=con1.prepareStatement(query3);
    	     ps6.setString(1,subjectname);
    	     ps6.setString(2,subcode);
    	     int row3=ps6.executeUpdate();
    	        message="Subject updated successfully";
           response.sendRedirect("CollegeAdminSubject.jsp?message="+message);
   }
  // con.close(); 
	con1.close();
   
}catch(Exception e){
	
	out.println(e.getMessage());
	  message="Failed to update subject details";
      response.sendRedirect("CollegeAdminSubject.jsp?error="+message);
}  

%>

</body>
</html>