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
String password="123";
int flag=0;
try{  
	String facultyname=request.getParameter("facultyname");
	String emailid=request.getParameter("emailid");
	String address=request.getParameter("address");
	String mobileno=request.getParameter("mobileno");
	String userid=request.getParameter("uid");
	PreparedStatement pst=con1.prepareStatement("select Username,Email_Id,Mobile_no from faculty_details where Userid<>?");  
	pst.setString(1,userid);
	   
    ResultSet rs=pst.executeQuery();  
    while(rs.next())
    {
    if(rs.getString(2).equals(emailid))
    {
    	flag++;
    	message="Faculty already exists with this email id";
        response.sendRedirect("CollegeAdminFaculty.jsp?error="+message);
    }
    if(rs.getString(3).equals(mobileno))
    {
    	flag++;
    	message="Faculty already exists with this contact no";
        response.sendRedirect("CollegeAdminFaculty.jsp?error="+message);
    }
    else
    {
    	flag=0;
    }
    	
    }
    if(flag==0)
    {
    
	      //message = "File uploaded and saved into database";
       //out.println(message);
      // insert into faculty_details(Username,Password,College_Code,Email_Id,Mobile_No,Address,Userid) values(?,?,?,?,?,?,?)
       	      					 PreparedStatement pstmt=con1.prepareStatement("Update faculty_details set Username=?,Email_Id=?,Mobile_No=?,Address=? Where Userid=?");
  				   pstmt.setString(1,facultyname);
  				 pstmt.setString(2,emailid);
  				 pstmt.setString(3,mobileno);
  				 pstmt.setString(4,address);
  				 pstmt.setString(5,userid);
  				int  row1=pstmt.executeUpdate();
  				 
  				 if(row1>0)
  				 {
  					
  					message="Faculty details updated successfully";
  		           response.sendRedirect("CollegeAdminFaculty.jsp?message="+message);
  		   
  				 }

    }
    con1.close();
}catch(Exception e){
	
	out.println(e.getMessage());
}  

%>

</body>
</html>