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
     String collegename=(String)session.getAttribute("colcode");

     Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
     //String department=request.getParameter("department");
    String department=request.getParameter("department");
    // String facultyname="Shilpa Deshmukh";
    String allote="N";
     String query1="select distinct batch from subject_details where Department=?";
     PreparedStatement ps4=con1.prepareStatement(query1);
     ps4.setString(1,department);
     
     ResultSet rs4=ps4.executeQuery(); 
     %>
     <option value="">------- Select --------</option>
               
               <% 
    
     while(rs4.next())
     {
    	 //String department=rs4.getString(1);
  	   %>
  	   <option value="<%=rs4.getString(1)%>"><%=rs4.getString(1)%></option>
  	   <% 
               }
               try
               {
               	con.close(); 
               	con1.close();
               }
               catch(Exception e)
               {
               	out.println(e.getMessage());
               }
            %>
         
            
            
</body>
</html>