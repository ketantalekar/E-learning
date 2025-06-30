<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
 <%@ page import ="javax.servlet.http.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<%@ page import="java.io.PrintWriter,java.io.StringWriter" %>
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

String message="";
try{  
	String subjectcode=request.getParameter("subcode");
	 String facultyname=request.getParameter("fid");
	 String isAlloted="N";
	   String userid="NULL";
	   out.println(subjectcode);
	   out.println(facultyname);
	   out.println(userid);
	   out.println(isAlloted);
	   String subcode="";
	   
	 String query1="Update subject_details set Userid=?,isAlloted=? where Subject_code=? and Userid=?";
     PreparedStatement ps4=con1.prepareStatement(query1);
     ps4.setString(1,userid);
     ps4.setString(2,isAlloted);
     ps4.setString(3,subjectcode);
     ps4.setString(4,facultyname);
     int row=ps4.executeUpdate();
     out.println(row);
     String unan="NAN";
     String query8="Update facultyassignment set Userid=? where Userid=? and Subject_code=?";
     PreparedStatement ps8=con1.prepareStatement(query8);
     ps8.setString(1,unan);
     ps8.setString(2,facultyname);
    
     ps8.setString(3,subjectcode);
     
     int row8=ps8.executeUpdate();
     String query9="Update notices set Faculty_Name=? where Faculty_Name=? and subject=?";
     PreparedStatement ps9=con1.prepareStatement(query9);
     ps9.setString(1,unan);
     ps9.setString(2,facultyname);
     ps9.setString(3,subjectcode);
     
     int row9=ps9.executeUpdate();
     
     String query10="Update quiz_info set Faculty_Name=? where Faculty_Name=? and subject=?";
     PreparedStatement ps10=con1.prepareStatement(query10);
     ps10.setString(1,unan);
     ps10.setString(2,facultyname);
     ps10.setString(3,subjectcode);
     
     int row10=ps10.executeUpdate();
     String query14="Update upload_file set Userid=? where Userid=? and Subject_Name=?";
     PreparedStatement ps14=con1.prepareStatement(query14);
     ps14.setString(1,unan);
     ps14.setString(2,facultyname);
     ps14.setString(3,subjectcode);
     
     int row14=ps14.executeUpdate();
     
     
     int ns=0,as=0,qs=0,sm=0;
     String query15="Update student_subject set NoticeStatus=?,AssignmentStatus=?,QuizStatus=?,StudyMaterial=? where Subject_code=?";
     PreparedStatement ps15=con1.prepareStatement(query15);
     ps15.setInt(1,ns);
     ps15.setInt(2,as);
     ps15.setInt(3,qs);
     ps15.setInt(4,sm);
     ps15.setString(5,subjectcode);
     
     int row15=ps15.executeUpdate();
     
 	
   
  //out.println(row);
   if (row > 0) {
       //message = "File uploaded and saved into database";
       //out.println(message);
       message="Deallocated faculty successfully";
           response.sendRedirect("CollegeAdminSubject.jsp?message="+message);
   }
  con1.close();
   
   
}catch(Exception e){
	
	out.println(e.getMessage());
	message="Failed to deallocate faculty";
    response.sendRedirect("CollegeAdminSubject.jsp?error="+message);
}  

%>

</body>
</html>