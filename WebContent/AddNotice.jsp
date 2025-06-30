<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ page import="java.util.*,com.Data.*,java.sql.*,java.text.SimpleDateFormat,java.util.Date,java.io.*" %> 
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
String collegename=(String)session.getAttribute("colcode");

Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");

String message="";

try{  
	String noticetitle=request.getParameter("noticetitle");
	String department="";
	String noticee=request.getParameter("noticee");
	   String faculty_name=(String)session.getAttribute("sessname");
	   String userid=(String)session.getAttribute("sessuid");
	   String subject=(String)session.getAttribute("subjectname1");
	 //String subject=(String)session.getAttribute("subjectname");
	 Date date = new Date();  
	    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
	    String strDate= formatter.format(date);
	    int status=0,flag=0;
	   String query3="select Department from subject_details where Userid=? and Subject_code=?";
	     PreparedStatement ps4=con1.prepareStatement(query3);
	     ps4.setString(1,userid);
	     ps4.setString(2,subject);
	     ResultSet rs4=ps4.executeQuery();
	     while(rs4.next())
	     {
	     department=rs4.getString(1);
	     PreparedStatement pst=con1.prepareStatement("select Notice_title from notices where Subject=? and Department=?");
	     pst.setString(1,subject);
	     pst.setString(2,department);
		 ResultSet rs=pst.executeQuery();  
	     while(rs.next())
	     {
	     if(rs.getString(1).equals(noticetitle))
	     {
	     	flag++;
	     
	     }
	     }
	     }
	     if(flag==0)
	     {
	
	
		
	   PreparedStatement ps=con1.prepareStatement("insert into notices(Notice_title,Notice,Department,Subject,Faculty_Name,Date,Status) values(?,?,?,?,?,?,?)");
	   ps.setString(1,noticetitle);
	   ps.setString(2,noticee);
	   ps.setString(3,department);
	   ps.setString(4,subject);
	   ps.setString(5,userid);
	   ps.setString(6,strDate);
	   ps.setInt(7,status);
	   int row=ps.executeUpdate();
	 
	  //out.println(row);
	   if (row > 0) {
	       //message = "File uploaded and saved into database";
	       //out.println(message);
	       String uid="";
	       int nstatus=0;
	       int addstatus=0;
	       String query4="select Userid,NoticeStatus from student_subject where Subject_code=?";
	     PreparedStatement ps5=con1.prepareStatement(query4);
	     ps5.setString(1,subject);
	     ResultSet rs5=ps5.executeQuery();
	     while(rs5.next())
	     {
	    	 addstatus=1;
	    	 uid=rs5.getString(1);
	    	 nstatus=rs5.getInt(2);
	    	 addstatus=addstatus+nstatus;
	    	 PreparedStatement ps6=con1.prepareStatement("Update student_subject set NoticeStatus=? Where Userid=? and Subject_code=?");
	    	 ps6.setInt(1,addstatus);
	    	   ps6.setString(2,uid);
	    	   ps6.setString(3,subject);
	    	  
	    	   int row3=ps6.executeUpdate();
	    	 
	     }
	       message="Notice added successfully";
	           response.sendRedirect("FacultySubject.jsp?message="+message);
	   }
	   
	     }
	     else
	     {
	    	 message="Notice with same title already exists";
	         response.sendRedirect("FacultySubject.jsp?error="+message);
		
	     }
	    // con.close(); 
			con1.close();
	}catch(Exception e){
		
		out.println(e.getMessage());
		 message="Failed to add notice";
         response.sendRedirect("FacultySubject.jsp?error="+message);
	}  

%>

</body>
</html>