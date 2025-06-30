<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ include file="connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
     <%
     try
     {
        //String department=request.getParameter("department");
    String clgname=request.getParameter("clgname");
    // String facultyname="Shilpa Deshmukh";
    String allote="N";
     String query1="select college_code from college_details where college_name=?";
     PreparedStatement ps4=con.prepareStatement(query1);
     ps4.setString(1,clgname);
     
     ResultSet rs4=ps4.executeQuery();  
     while(rs4.next())
     {
    	 //String department=rs4.getString(1);
  	   %>
  	   <option value="<%=rs4.getString(1)%>"><%=rs4.getString(1)%></option>
  	   <% 
               }
     con.close();
     }
     catch(Exception e)
     {
    	 out.println(e.getMessage());
     }
            %>
         
            
            
</body>
</html>