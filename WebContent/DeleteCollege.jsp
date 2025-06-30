<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
 <%@ include file="connection.jsp" %>

 <%@ page import ="javax.servlet.http.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
//con=null;
String message="";
try{  
	String college_code=request.getParameter("collegeid");
	String db_new="e"+college_code;
	  Statement stmt = con.createStatement();;
	     
	String sql24="DROP DATABASE "+db_new;
	stmt.executeUpdate(sql24);
	
	
	  PreparedStatement pstmt41=null;
     String useri="";
      pstmt41=con.prepareStatement("SELECT Userid FROM college_admin_details WHERE College_Code=?");
      pstmt41.setString(1,college_code);
      ResultSet rs41=pstmt41.executeQuery();
      while(rs41.next())
      {
    	  useri=rs41.getString(1);
    	  Statement st2=con.createStatement();
    	  int i2=st2.executeUpdate("DELETE FROM private_chat WHERE Sender='"+useri+"' or Reciever='"+useri+"'");
    	  Statement st3=con.createStatement();
    	  int i3=st3.executeUpdate("DELETE FROM dummy_private_chat WHERE Sender='"+useri+"' or Reciever='"+useri+"'");
    	
      }
      //Statement st4=con.createStatement();
	  //int i4=st4.executeUpdate("DELETE FROM feedback_details WHERE College_Code="+college_code);
      Statement st=con.createStatement();
	int i=st.executeUpdate("DELETE FROM college_admin_details WHERE College_Code="+college_code);
		Statement st1=con.createStatement();
	int i1=st1.executeUpdate("DELETE FROM college_details WHERE college_code="+college_code);
	message="College deleted successfully";
	response.sendRedirect("College_Details.jsp?message="+message);
	
		con.close(); 
	
}
catch(Exception e)
{
	out.println(e.getMessage());
	message="Failed to delete College";
	response.sendRedirect("College_Details.jsp?error="+message);
	}
%>
</body>
</html>