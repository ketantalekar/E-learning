<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ page import="java.util.*,java.sql.*" %> 
 <%@ include file="connection.jsp" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="javax.servlet.http.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<%@ page import="java.io.PrintWriter,java.io.StringWriter" %>
<%
String message="";
try{  
	String vendorname=request.getParameter("vendorname");
	String emailid=request.getParameter("emailid");
	String uid=request.getParameter("uid");
	out.println(vendorname);
	out.println(emailid);
	out.println(uid);
	int flag=0;
	PreparedStatement pst=con.prepareStatement("select Email_Id,Userid from admin_details where Email_Id=? and Userid<>?");  
	pst.setString(1,emailid);
	pst.setString(2,uid);
	
	   int row=0;
    ResultSet rs=pst.executeQuery();  
    if(rs.next())
    {
    	
    	flag++;
    	String emid=rs.getString(1);
    	String uuid=rs.getString(2);
    	if(emid.equals(emailid))
    	{
    	message="Email id already exists";
        response.sendRedirect("vendor_reg.jsp?error="+message); 
    	}
    	
    }
    else
    {
    
	 PreparedStatement ps=con.prepareStatement("Update admin_details set Username=? ,Email_Id=? Where Userid=?");
		ps.setString(1,vendorname);
		ps.setString(2,emailid);
		ps.setString(3,uid);
	    
    
   row=ps.executeUpdate();
    }
  //out.println(row);
   if (row > 0) {
       //message = "File uploaded and saved into database";
       //out.println(message);
      
       message="Admin details updated successfully";
           response.sendRedirect("vendor_reg.jsp?message="+message);
   }
   con.close(); 
	//con1.close();
}catch(Exception e){
	
	out.println(e.getMessage());
}  

%>

</body>
</html>