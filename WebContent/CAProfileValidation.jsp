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
  String collegename=(String)session.getAttribute("colcode");
  Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
  
               String uname,emailid,address,mobileno,rollno;
                 uname=request.getParameter("uname");
                 emailid=request.getParameter("emailid");
                 address=request.getParameter("address");
                 mobileno=request.getParameter("mobileno");
                 
                 String pname=(String)session.getAttribute("sessuid");
            	 Statement stmt=con1.createStatement(); 
            	 int prostatus=1;
			       int i=stmt.executeUpdate("update college_admin_details set Username='"+uname+"',Email_Id='"+emailid+"',Address='"+address+"',Mobile_no='"+mobileno+"',ProfileStatus="+prostatus+"  where Userid='"+pname+"'");
			       Statement stmt2=con.createStatement();  
			       int j=stmt2.executeUpdate("update college_admin_details set Username='"+uname+"',Email_Id='"+emailid+"',Address='"+address+"',Mobile_no='"+mobileno+"',ProfileStatus="+prostatus+"  where Userid='"+pname+"'");
				
			       if(i>0)
					{     
						session.removeAttribute("sessname");
						session.setAttribute("sessname",uname);
						 String error="Profile Successfully Updated";
	          			session.setAttribute("Error",error);//if
	          			
						response.sendRedirect("CollegeAdminProfile.jsp?message="+error);
					} 
			       else
					{
						 String error="Failed to Update Profile";
		          			//session.setAttribute("Error",error);//if
		          			
						 response.sendRedirect("CollegeAdminProfile.jsp?error="+error);
						
					}
					con.close(); 
					con1.close();
  }
  catch(Exception e)
  {
  	out.println(e.getMessage());
  }
      		
              %>
</body>
</html>