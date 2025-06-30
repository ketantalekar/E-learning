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
     //String department=request.getParameter("department");
    String facultyname=request.getParameter("facultyname");
   // String userid=request.getParameter("iduser");
    
    String department=request.getParameter("department");
    String subject=request.getParameter("subjectname");
    String batch=request.getParameter("batch");
    
    String isAlloted="Y";
    // String facultyname="Shilpa Deshmukh";
     String query1="Update subject_details set Userid=?,isAlloted=? where Subject_code=? and Department=? and batch=?";
     PreparedStatement ps4=con1.prepareStatement(query1);
     ps4.setString(1,facultyname);
     ps4.setString(2,isAlloted);
     ps4.setString(3,subject);
     ps4.setString(4,department);
     ps4.setString(5,batch);
     
     int row=ps4.executeUpdate();
     
     String unan="NAN";
     String query8="Update facultyassignment set Userid=? where Userid=? and Subject_code=?";
     PreparedStatement ps8=con1.prepareStatement(query8);
     ps8.setString(1,facultyname);
     ps8.setString(2,unan);
     
     ps8.setString(3,subject);
     
     int row8=ps8.executeUpdate();
     String query9="Update notices set Faculty_Name=? where Faculty_Name=? and subject=?";
     PreparedStatement ps9=con1.prepareStatement(query9);
     ps9.setString(1,facultyname);
     
     ps9.setString(2,unan);
     ps9.setString(3,subject);
     
     int row9=ps9.executeUpdate();
     
     String query10="Update quiz_info set Faculty_Name=? where Faculty_Name=? and subject=?";
     PreparedStatement ps10=con1.prepareStatement(query10);
     ps10.setString(1,facultyname);
     
     ps10.setString(2,unan);
     ps10.setString(3,subject);
     
     int row10=ps10.executeUpdate();
     String query14="Update upload_file set Userid=? where Userid=? and Subject_Name=?";
     PreparedStatement ps14=con1.prepareStatement(query14);
     ps14.setString(1,facultyname);
     
     ps14.setString(2,unan);
     ps14.setString(3,subject);
     
     int row14=ps14.executeUpdate();
     
    
     if(row>0)
     {
    	 //String department=rs4.getString(1);
    	 String message="Subject alloted to faculty successfully";
    	 response.sendRedirect("CollegeAdminSubject.jsp?message="+message);
  	           }
     con.close();
     con1.close();

     }
     catch(Exception e)
     {
    	 out.println(e.getMessage());
    	 String message="Failed to allocate subject to faculty";
    	 response.sendRedirect("CollegeAdminSubject.jsp?error="+message);
     }
            %>
         
            
            
</body>
</html>