<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*,java.sql.*,javax.mail.*,javax.mail.internet.*,javax.activation.*,java.util.Properties,com.email.durgesh.Email" %> 
<%@ include file="connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try
{
String userid="",email1="",colcode="",pass="";
String name="";
String username="",message="",error="";

	userid=request.getParameter("userid");
	colcode=request.getParameter("colcode");
	out.println(userid);
	if(userid!=null && colcode.equals("-"))
	{
		Statement st=con.createStatement(); 
		String bs="select Email_Id,Username,Password from admin_details where Userid='"+userid+"'";
		st.execute(bs);
		ResultSet rs=st.getResultSet();
		//ResultSet rs=st.executeQuery("select * from admin_details where Username='"+username+"' and Password='"+password+"'");
		 if(rs.next())
		{
			 email1=rs.getString(1);
			 username=rs.getString(2);
			 pass=rs.getString(3);
			 Email email=new Email("ketz1767@gmail.com","Xyzabc@123");
				email.setFrom("ketz1767@gmail.com","E-learning");
				email.setSubject("Recovered Password");
				email.setContent("<h4> Dear "+username+",</h4>Your Password is successfully Recovered,your password is"+pass,"text/html");
				email.addRecipient(email1);
				email.send(); 
				message="Your Password is successfully sent to your mail";
				response.sendRedirect("forget.jsp?message="+message);
		}
		 else
		 {
			 error="Failed to Recover your password";
				response.sendRedirect("forget.jsp?error="+error);
		 }
			 
		
		
	}
	else
	{
		Statement st1=con.createStatement(); 
	int flag=0;
		String bs1="select college_code from college_details where college_code='"+colcode+"'";
		st1.execute(bs1);
		ResultSet rs1=st1.getResultSet();
		//ResultSet rs=st.executeQuery("select * from admin_details where Username='"+username+"' and Password='"+password+"'");
		 while(rs1.next())
		{
			 flag++;
		}
		 if(flag>0)
		 {
		Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+colcode,"root","");
		Statement st=con1.createStatement(); 
		String bs="select Email_Id,Username,Password from college_admin_details where Userid='"+userid+"' union all select Email_Id,Username,Password from faculty_details where Userid='"+userid+"' union all select Email_Id,Username,Password from student_details where Userid='"+userid+"' union all ";
		st.execute(bs);
		ResultSet rs=st.getResultSet();
		//ResultSet rs=st.executeQuery("select * from admin_details where Username='"+username+"' and Password='"+password+"'");
		 if(rs.next())
		{
			 email1=rs.getString(1);
			 username=rs.getString(2);
			 pass=rs.getString(3);
			 Email email=new Email("ketz1767@gmail.com","Xyzabc@123");
				email.setFrom("ketz1767@gmail.com","E-learning");
				email.setSubject("Recovered Password");
				email.setContent("<h4> Dear "+username+",</h4>Your Password is successfully Recovered,your password is"+pass,"text/html");
				email.addRecipient(email1);
				email.send(); 
				message="Your Password is successfully sent to your mail";
				response.sendRedirect("forget.jsp?message="+message);
		}
		 else
		 {
			 error="Failed to Recover your password";
				response.sendRedirect("forget.jsp?error="+error);
		 }
		
	}
		 else
		 {
			 error="Failed to Recover your password";
				response.sendRedirect("forget.jsp?error="+error);
		 }
	}
	con.close(); 
	//con1.close();
}
catch(Exception e)
{
	out.println(e.getMessage());
	}
%>
</body>
</html>