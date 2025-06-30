<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ include file="connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Validation</title>
</head>
<body>
<%
try
{
String signin,loginas,userid,password,collegecode;
String name="";
String username="";
	signin=request.getParameter("signin");
	userid=request.getParameter("username");
	password=request.getParameter("password");
	collegecode=request.getParameter("collegename");
	loginas=request.getParameter("loginas");
	
	if(signin.equals("Sign In"))
	{
	
		if(loginas.equals("--Select Login Type--"))
		{
		
			name="Please Select one Option";
			session.setAttribute("Name",name);
			response.sendRedirect("login_error.jsp");
		}
		else if(password.length()>8)
		{
			name="Please Enter valid Password";
			session.setAttribute("Name",name);
			response.sendRedirect("login_error.jsp");
		}
		else if(loginas.equals("Vendor"))
		{
			
			int flag=0; 
			try
			{
				
			Statement st=con.createStatement(); 
			String bs="select * from admin_details where Userid='"+userid+"' and Password='"+password+"'";
			st.execute(bs);
			ResultSet rs=st.getResultSet();
			//ResultSet rs=st.executeQuery("select * from admin_details where Username='"+username+"' and Password='"+password+"'");
			 while(rs.next())
			{
username=rs.getString(3);
userid=rs.getString(4);
			flag++;

			}
			 if(flag==1)
			 {
				 session.setAttribute("sessuid",userid);
				 session.setAttribute("sessname",username);
				 session.setAttribute("utype",loginas);
				 response.sendRedirect("VendorDashboard.jsp");
				
			 }
			 else
			 {
				  name="Login Failed...Please try again";
					session.setAttribute("Name",name);
				 response.sendRedirect("login_error.jsp");
			 }
			con.close();
			}
			catch(Exception e)
			{
			out.println("failed"+e.getMessage());
				
			}
			
			
		}
		else if(loginas.equals("College Admin"))
		{
			
			int flag=0; 
			try
			{
				
			Statement st=con.createStatement(); 	
			String bs="select * from college_admin_details where Userid='"+userid+"' and Password='"+password+"' and College_Code='"+collegecode+"'";
			st.execute(bs);
			ResultSet rs=st.getResultSet();
			//ResultSet rs=st.executeQuery("select * from admin_details where Username='"+username+"' and Password='"+password+"'");
			 while(rs.next())
			{
				 username=rs.getString(2);
				 userid=rs.getString(3);
			flag++;

			}
			 if(flag==1)
			 {
				 session.setAttribute("sessuid",userid);
				 session.setAttribute("sessname",username);
				 session.setAttribute("utype",loginas);
				 session.setAttribute("colcode",collegecode);
				 response.sendRedirect("CollegeAdminDashboard.jsp");
			 }
			 else
			 {
				 name="Login Failed...Please try again";
					session.setAttribute("Name",name);
				 response.sendRedirect("login_error.jsp");
			 }
			con.close();
			}
			catch(Exception e)
			{
			out.println("failed"+e.getMessage());
			}
			
			
		}
		else if(loginas.equals("Faculty"))
		{
			
			int flag=0,flag1=0; 
			try
			{
				
				Statement stmt=con.createStatement(); 	
				String bss="select * from college_details where college_code='"+collegecode+"'";
				stmt.execute(bss);
				ResultSet rs1=stmt.getResultSet();
				//ResultSet rs=st.executeQuery("select * from admin_details where Username='"+username+"' and Password='"+password+"'");
				 while(rs1.next())
				{
					
					 flag1++;
				}
				 if(flag1==0)
				 {
					 name="Please Enter valid college code";
						session.setAttribute("Name",name);
					 response.sendRedirect("login_error.jsp");
				 }
				 else
				 {
				Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegecode,"root","");
			Statement st=con1.createStatement(); 	
			String bs="select * from faculty_details where Userid='"+userid+"' and Password='"+password+"' and College_Code='"+collegecode+"'";
			st.execute(bs);
			ResultSet rs=st.getResultSet();
			//ResultSet rs=st.executeQuery("select * from admin_details where Username='"+username+"' and Password='"+password+"'");
			 while(rs.next())
			{
				 username=rs.getString(2);
				 userid=rs.getString(3);
			flag++;

			}
			 if(flag==1)
			 {
				 session.setAttribute("sessuid",userid);
				 session.setAttribute("sessname",username);
				 session.setAttribute("colcode",collegecode);
				 session.setAttribute("utype",loginas);
					
				 response.sendRedirect("FacultyDashboard.jsp");
			 }
			 else
			 {
				 name="Login Failed...Please try again";
					session.setAttribute("Name",name);
				 response.sendRedirect("login_error.jsp");
			 }
			con.close();
			con1.close();
			}
			}
			catch(Exception e)
			{
			//out.println("failed"+e.getMessage());
			}
			
			
		}
		else if(loginas.equals("Student"))
		{
			
			int flag=0,flag1=0; 
			try
			{
				
				Statement stmt=con.createStatement(); 	
				String bss="select * from college_details where college_code='"+collegecode+"'";
				stmt.execute(bss);
				ResultSet rs1=stmt.getResultSet();
				//ResultSet rs=st.executeQuery("select * from admin_details where Username='"+username+"' and Password='"+password+"'");
				 while(rs1.next())
				{
				
					 flag1++;
				}
				 if(flag1==0)
				 {
					 name="Please Enter valid college code";
						session.setAttribute("Name",name);
					 response.sendRedirect("login_error.jsp");
				 }
				 else
				 {

				Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegecode,"root","");
			Statement st=con1.createStatement(); 
			String bs="select * from student_details where Userid='"+userid+"' and Password='"+password+"' and College_Code='"+collegecode+"'";
			st.execute(bs);
			ResultSet rs=st.getResultSet();
			//ResultSet rs=st.executeQuery("select * from admin_details where Username='"+username+"' and Password='"+password+"'");
			 while(rs.next())
			{
				 username=rs.getString(2);
				 userid=rs.getString(3);
			flag++;

			}
			 if(flag==1)
			 {
				 session.setAttribute("sessuid",userid);
				 session.setAttribute("sessname",username);
				 session.setAttribute("colcode",collegecode);
				 session.setAttribute("utype",loginas);
					
				 response.sendRedirect("StudentDashboard.jsp");
			 }
			 else
			 {
				 response.sendRedirect("login_error.jsp");
			 }
			con.close();
			con1.close();
			}
			}
			catch(Exception e)
			{
			//out.println("failed"+e.getMessage());
			}
			
			
		}
		else
		{
			name="Login Failed...Please try again";
			session.setAttribute("Name",name);
			response.sendRedirect("login_error.jsp");
		}
	}
	con.close();
				
}
catch(Exception e)
{
out.println(e.getMessage());	
}
	%>
</body>
</html>