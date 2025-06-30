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
	String collegename=request.getParameter("collegename");
    String collegecode=request.getParameter("collegecode");
    String userid=request.getParameter("userid");
    Connection con1=null;
    //out.println(collegename);
    //out.println(collegecode);
    //out.println(name);
    //out.println(address);
    //out.println(email);
    //out.println(mobile);
    if(collegename==null && collegecode==null)
    {
    	 message="Please Select College in order to add college admin";
    	response.sendRedirect("College_Details.jsp?error="+message);
    }
    else
    {
    Date date = new Date();  
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
    String strDate= formatter.format(date);  
    //out.println(strDate);
    String password="123";
     //out.println(password);
   

   PreparedStatement ps=con.prepareStatement("insert into college_admin_details(Username,Password,Address,Mobile_No,Email_Id,College_name,College_Code,Date_of_Joining,Userid) values(?,?,?,?,?,?,?,?,?)");
   ps.setString(1,name);
   ps.setString(2,password);
   ps.setString(3,address);
   ps.setString(4,mobile);
    ps.setString(5,email);
   ps.setString(6,collegename);
   ps.setString(7,collegecode);
   ps.setString(8,strDate);
   ps.setString(9,userid);
  
   
   int row=ps.executeUpdate();
 
  //out.println(row);
   if (row > 0) {
       //message = "File uploaded and saved into database";
       //out.println(message);
      
         con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegecode,"root",""); 
   PreparedStatement ps1=con1.prepareStatement("insert into college_admin_details(Username,College_name,Email_Id,Mobile_No,Address,College_Code,Password,Date_of_Joining,Userid) values(?,?,?,?,?,?,?,?,?)");
   ps1.setString(1,name);
   ps1.setString(5,address);
   ps1.setString(3,email);
   ps1.setString(4,mobile);
   ps1.setString(2,collegename);
   ps1.setString(6,collegecode);
   ps1.setString(7,password);
   ps1.setString(8,strDate);
   ps1.setString(9,userid);
   
   int row1=ps1.executeUpdate();
   message="College Admin added successfully";
	response.sendRedirect("College_Details.jsp?message="+message);
   }
   con.close(); 
	con1.close();
    }
}catch(Exception e){
	
	out.println(e.getMessage());
}  

%>

</body>
</html>