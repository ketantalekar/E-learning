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
  try
  {
               String uname,emailid,doj;
                 uname=request.getParameter("uname");
                 emailid=request.getParameter("emailid");
                 doj=request.getParameter("doj");
                 String pname=(String)session.getAttribute("sessuid");
            	 Statement stmt=con.createStatement();  
            	 int prostatus=1;
			       int i=stmt.executeUpdate("update admin_details set Username='"+uname+"',Email_Id='"+emailid+"',Date_of_Joining='"+doj+"',ProfileStatus="+prostatus+" where Userid='"+pname+"'");
					if(i>0)
					{     
						session.removeAttribute("sessname");
						session.setAttribute("sessname",uname);
						 String error="Profile Successfully Updated";
	          			//session.setAttribute("Error",error);//if
	          			
						response.sendRedirect("Vendorprofile.jsp?message="+error);
					} 
					else
					{
						 String error="Failed to Update Profile";
		          			//session.setAttribute("Error",error);//if
		          			
							response.sendRedirect("Vendorprofile.jsp?error="+error);
						
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