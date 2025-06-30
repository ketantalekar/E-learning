<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
 <%@ include file="connection.jsp" %>
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

String message="";
try{  
	int id=Integer.parseInt(request.getParameter("id"));
	
   PreparedStatement ps=con.prepareStatement("DELETE  FROM feedback_details where Id=?");
   ps.setInt(1,id);
    
   int row=ps.executeUpdate();
 
  //out.println(row);
   if (row > 0) {
       //message = "File uploaded and saved into database";
       //out.println(message);
      
            message="Feedback Deleted successfully";
       response.sendRedirect("VendorFeedback.jsp?message="+message);
   }
   else
   {
	   message="Failed to delete feedback";
       response.sendRedirect("VendorFeedback.jsp?error="+message);
   }
   con.close();
   
}catch(Exception e){
	
	out.println(e.getMessage());
}  

%>

</body>
</html>