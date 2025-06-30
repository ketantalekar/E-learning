<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String utype=(String)session.getAttribute("utype");
try
{
	
    
	int uploadId=Integer.parseInt(request.getParameter("id"));
   String collegename=(String)session.getAttribute("colcode");
	  Class.forName("com.mysql.jdbc.Driver");  
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");

String sql = "delete from upload_file where Id=?";
PreparedStatement pstm = con1.prepareStatement(sql);
pstm.setInt(1,uploadId);
pstm.execute();
if(utype.equals("Faculty"))
{
	String subject=(String)session.getAttribute("subjectname1");
	String uid="";
	int fstatus=0;
	int addstatus=0;
	int cddstatus=0;
	String query4="select Userid,StudyMaterial from student_subject where Subject_code=?";
	PreparedStatement ps5=con1.prepareStatement(query4);
	ps5.setString(1,subject);
	ResultSet rs5=ps5.executeQuery();
	while(rs5.next())
	{
		 addstatus=1;
		 uid=rs5.getString(1);
		 fstatus=rs5.getInt(2);
		 cddstatus=fstatus-addstatus;
		 PreparedStatement ps6=con1.prepareStatement("Update student_subject set StudyMaterial=? Where Userid=? and Subject_code=?");
		 ps6.setInt(1,cddstatus);
		   ps6.setString(2,uid);
		   ps6.setString(3,subject);
		  
		   int row3=ps6.executeUpdate();
		 
	}
	response.sendRedirect("FacultySubjectFile.jsp?message=File+Delete+Successfully");

    
}
else if(utype.equals("Student"))
{
	response.sendRedirect("StudentSubjectFile.jsp?message=File+Deleted+Successfully");
    	
}

//RequestDispatcher dispatcher= request.getServletContext().getRequestDispatcher("/FacultySubjectFile.jsp?message=Delete+Successful");

//dispatcher.forward(request, response);
//con.close(); 
con1.close();
}
catch(Exception e)
{
	if(utype.equals("Faculty"))
	{
		response.sendRedirect("FacultySubjectFile.jsp?error=Failed+to+delete+file");

	    
	}
	else if(utype.equals("Student"))
	{
		response.sendRedirect("StudentSubjectFile.jsp?error=Failed+to+delete+file");
	    	
	}
	

	//RequestDispatcher dispatcher= request.getServletContext().getRequestDispatcher("/FacultySubjectFile.jsp?message=Delete+UnSuccessful");

	//dispatcher.forward(request, response);

	}

%>
</body>
</html>