<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ include file="connection.jsp" %>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Delete Vendor</title>
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
String message="",error="";

int uid=Integer.parseInt(request.getParameter("id"));



PreparedStatement pstmt41=null;
String useri="";
 pstmt41=con.prepareStatement("SELECT Userid FROM admin_details WHERE Id=?");
 pstmt41.setInt(1,uid);
 ResultSet rs41=pstmt41.executeQuery();
 while(rs41.next())
 {
	 useri=rs41.getString(1);
 }
 Statement st2=con.createStatement();
 int i2=st2.executeUpdate("DELETE FROM private_chat WHERE Sender='"+useri+"' or Reciever='"+useri+"'");
 Statement st3=con.createStatement();
 int i3=st3.executeUpdate("DELETE FROM dummy_private_chat WHERE Sender='"+useri+"' or Reciever='"+useri+"'");
Statement st=con.createStatement();
int i=st.executeUpdate("DELETE FROM admin_details WHERE Id="+uid);
if(i>0)
{
	message="Vendor deleted successfully";
	response.sendRedirect("vendor_reg.jsp?message="+message);	   
}
else
{
	error="Failed to delete vendor";
	response.sendRedirect("vendor_reg.jsp?error="+error);
}
con.close(); 
//con1.close();
}
catch(Exception e)
{
	out.println(e.getMessage());
	}
%>
</body>
</html>