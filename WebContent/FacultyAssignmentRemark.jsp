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
     try
     {
     Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
    String userid=request.getParameter("auserid");
    String title=request.getParameter("atitle");
    String id=request.getParameter("aid");
    
    String subject=(String)session.getAttribute("subjectname");
    String remark=request.getParameter("message");
    
    String subjectcode="";
    String query="Select Subject_code from subject_details where Subject_name=?";
    PreparedStatement ps4=con1.prepareStatement(query);
    ps4.setString(1, subject);
    ResultSet rs4=ps4.executeQuery();
    while(rs4.next())
    {
    //out.println();
    subjectcode=rs4.getString(1);
    }
   
 
     String query1="Update student_assignments set Feedback=? where Subject_code=? and Name=? and Assignment_name=?";
     PreparedStatement ps5=con1.prepareStatement(query1);
     ps5.setString(1,remark);
     ps5.setString(2,subjectcode);
     ps5.setString(3,userid);
     ps5.setString(4,title);
     int row=ps5.executeUpdate();
     
     if(row>0)
     {
    	 //String department=rs4.getString(1);
    	 String message="Added Remark Successfully";
    	 response.sendRedirect("FacultyShowAssignment.jsp?id="+id+"&message="+message);
  	           }
     else
     {
    	 String message="Failed to add remark";
    	 response.sendRedirect("FacultyShowAssignment.jsp?id="+id+"&error="+message);
     }
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