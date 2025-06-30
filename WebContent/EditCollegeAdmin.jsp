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
	String name=request.getParameter("adminname");
	String address=request.getParameter("adminaddress");
	String email=request.getParameter("adminemail");
	String mobile=request.getParameter("adminmobile");
	String userid=request.getParameter("userid");
	String collegecode=request.getParameter("collegecode");
    
    Connection con1=null;
    //out.println(collegename);
    //out.println(collegecode);
    //out.println(name);
    //out.println(address);
    //out.println(email);
    //out.println(mobile);
    
    

   PreparedStatement ps=con.prepareStatement("update college_admin_details set Username=?,Email_Id=?,Mobile_No=?,Address=? where Userid=?");
   ps.setString(1,name);
   ps.setString(2,email);
   ps.setString(3,mobile);
   ps.setString(4,address);
   ps.setString(5,userid);
  
   
   int row=ps.executeUpdate();
 
  //out.println(row);
   if (row > 0) {
       //message = "File uploaded and saved into database";
       //out.println(message);
      
         con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegecode,"root",""); 
   PreparedStatement ps1=con1.prepareStatement("update college_admin_details set Username=?,Email_Id=?,Mobile_No=?,Address=? where Userid=?");
   ps1.setString(1,name);
   ps1.setString(2,email);
   ps1.setString(3,mobile);
   ps1.setString(4,address);
   
   ps1.setString(5,userid);
   
   
   int row1=ps1.executeUpdate();
   message="College Admin updated successfully";
       response.sendRedirect("College_Details.jsp?message="+message);
   }
   con1.close();
   con.close();
   
}catch(Exception e){
	
	out.println(e.getMessage());
	 message="Failed to update College Admin details";
     response.sendRedirect("College_Details.jsp?error="+message);
}  

%>

</body>
</html>