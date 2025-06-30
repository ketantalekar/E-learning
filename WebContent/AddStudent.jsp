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
String password="123";
int flag=0;
try{  
	String studentname=request.getParameter("studentname");
String emailid=request.getParameter("emailid");
	String address=request.getParameter("address");
	String mobileno=request.getParameter("mobileno");
	String department=request.getParameter("department");
	String batch=request.getParameter("batch");
	String userid=request.getParameter("userid");
	String rollno=request.getParameter("rollno");
	PreparedStatement pst=con1.prepareStatement("select Email_Id,Mobile_no,Userid from student_details");  
    ResultSet rs=pst.executeQuery();  
    while(rs.next())
    {
    if(rs.getString(1).equals(emailid) || rs.getString(2).equals(mobileno) || rs.getString(3).equals(userid))
    {
    	flag++;
    	message="Student already exists";
        response.sendRedirect("CollegeAdminStudent.jsp?error="+message);
    }
    else
    {
    	flag=0;
    }
    	
    }
    if(flag==0)
    {
  
   PreparedStatement ps=con1.prepareStatement("insert into student_details(Username,Password,Email_Id,Mobile_no,Address,Department,Batch,College_Code,Userid,Roll_no) values(?,?,?,?,?,?,?,?,?,?)");
   ps.setString(1,studentname);
   ps.setString(2,password);
   ps.setString(3,emailid);
   ps.setString(4,mobileno);
   ps.setString(5,address);
   ps.setString(6,department);
   ps.setString(7,batch);
   ps.setString(8,collegename);
   ps.setString(9,userid);
   ps.setString(10,rollno);
   int row=ps.executeUpdate();
 
  //out.println(row);
   if (row > 0) {
       message = "Student details Added successfully";
       //out.println(message);
       
           response.sendRedirect("CollegeAdminStudent.jsp?message="+message);
   }
    }
    con1.close();
  
}catch(Exception e){
	
	out.println(e.getMessage());
}  

%>

</body>
</html>