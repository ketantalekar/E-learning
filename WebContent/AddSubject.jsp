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
	
	String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            + "0123456789"
            + "abcdefghijklmnopqrstuvxyz"; 

StringBuilder sb = new StringBuilder(6); 

for (int i = 0; i < 6; i++) 
{ 

int index = (int)(AlphaNumericString.length() * Math.random()); 
sb.append(AlphaNumericString.charAt(index)); 
} 
String code=sb.toString();
   PreparedStatement ps=con1.prepareStatement("insert into subject_details(Department,Subject_name,Batch,Subject_code) values(?,?,?,?)");
   ps.setString(1,department);
   ps.setString(2,subjectname);
   ps.setString(3,batch);
   ps.setString(4,code); 
   
   int row=ps.executeUpdate();
 
  //out.println(row);
   if (row > 0) {
       //message = "File uploaded and saved into database";
       //out.println(message);
       message="Subject added successfully";
           response.sendRedirect("CollegeAdminSubject.jsp?message="+message);
   }
  // con.close(); 
	con1.close();
}catch(Exception e){
	
	out.println(e.getMessage());
	 message="Failed to add Subject";
     response.sendRedirect("CollegeAdminSubject.jsp?error="+message);
}  

%>

</body>
</html>