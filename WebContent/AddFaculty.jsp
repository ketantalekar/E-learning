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
try{  
	String facultyname=request.getParameter("facultyname");
	String emailid=request.getParameter("emailid");
	String address=request.getParameter("address");
	String mobileno=request.getParameter("mobileno");
	String userid=request.getParameter("userid");
	int flag=0,row1=0;
          //message = "File uploaded and saved into database";
       //out.println(message);
       	     Statement st=con1.createStatement(); 	
  				String bs="select * from faculty_details where Mobile_No='"+mobileno+"' and Email_Id='"+emailid+"' or Userid='"+userid+"'";
  				st.execute(bs);
  				ResultSet rs=st.getResultSet();
  				//ResultSet rs=st.executeQuery("select * from admin_details where Username='"+username+"' and Password='"+password+"'");
  				 while(rs.next())
  				{

  				flag++;

  				}
  				if(flag>0)
 				 {
 					message="Faculty already exists";
 					response.sendRedirect("CollegeAdminFaculty.jsp?error="+message);
 		   
 				 }
  				else  if(flag==0)
  				 {
  					 PreparedStatement pstmt=con1.prepareStatement("insert into faculty_details(Username,Password,College_Code,Email_Id,Mobile_No,Address,Userid) values(?,?,?,?,?,?,?)");
  				   pstmt.setString(1,facultyname);
  				   pstmt.setString(2,password);
  				   pstmt.setString(3,collegename);
  				 pstmt.setString(4,emailid);
  				 pstmt.setString(5,mobileno);
  				 pstmt.setString(6,address);
  				 pstmt.setString(7,userid);
  				  row1=pstmt.executeUpdate();
  				 if(row1>0)
  				 {
  					message="Faculty added successfully";
  					response.sendRedirect("CollegeAdminFaculty.jsp?message="+message);
  		   
  				 }
  				 }
  				 
  				
  				 
  				//con.close(); 
				con1.close();
        
   
}catch(Exception e){
	
	out.println(e.getMessage());
}  

%>

</body>
</html>