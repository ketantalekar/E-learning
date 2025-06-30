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
int flag=0;
     Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
     //String department=request.getParameter("department");
    String batch=request.getParameter("batch");
    // String facultyname="Shilpa Deshmukh";
     String query1="select Subject_name,Subject_code from subject_details where isAlloted='N' and batch=?";
     PreparedStatement ps4=con1.prepareStatement(query1);
     ps4.setString(1,batch);
     ResultSet rs4=ps4.executeQuery();  
     %>
               
               <% 
     while(rs4.next())
     {
    	 flag++;
    	 //String department=rs4.getString(1);
  	   %>
  	   <option value="<%=rs4.getString(2)%>"><%=rs4.getString(1)%></option>
  	   <% 
               }
           
            if(flag==0)
            {
            %>
             <option value="">No subject to allocate</option>
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