<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
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
int flag=0;
try
{  
	String studentname=request.getParameter("studentname");
	String emailid=request.getParameter("emailid");
	String address=request.getParameter("address");
	String mobileno=request.getParameter("mobileno");
	String department=request.getParameter("department");
	String batch=request.getParameter("batch");
	String userid=request.getParameter("uid");
	String rollno=request.getParameter("rollno");
	PreparedStatement pst=con1.prepareStatement("select Username,Email_Id,Mobile_no from student_details where Userid<>?");  
	pst.setString(1,userid);
	   
    ResultSet rs=pst.executeQuery();  
    while(rs.next())
    {
    if(rs.getString(1).equals(studentname) || rs.getString(2).equals(emailid) || rs.getString(3).equals(mobileno))
    {
    	flag++;
    	message="Student has been already added";
        response.sendRedirect("CollegeAdminStudent.jsp?error="+message);
    }
    else
    {
    	flag=0;
    }
    	
    }
    if(flag==0)
    {
    	//insert into student_details(Username,Password,Email_Id,Mobile_no,Address,Department,Batch,College_Code,Userid,Roll_no) values(?,?,?,?,?,?,?,?,?,?)
   PreparedStatement ps=con1.prepareStatement("Update student_details set Username=?,Email_Id=?,Mobile_No=?,Address=?,Department=?,Batch=?,Roll_no=? Where Userid=?");
   ps.setString(1,studentname);
   ps.setString(2,emailid);
   ps.setString(3,mobileno);
   ps.setString(4,address);
   ps.setString(5,department);
   ps.setString(6,batch);
   ps.setString(7,rollno);
   ps.setString(8,userid);

   int row=ps.executeUpdate();
 
  //out.println(row);
   if (row > 0) {
       message = "Student details updated successfully";
       //out.println(message);
       
           response.sendRedirect("CollegeAdminStudent.jsp?message="+message);
   }
    }
   // con.close(); 
	con1.close();
}catch(Exception e){
	
	out.println(e.getMessage());
}  

%>

</body>
</html>