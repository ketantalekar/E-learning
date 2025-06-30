<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ include file="connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vendor Settings Validation</title>
</head>
<body>

                <%
               String currpass,newpass,repass,updat;
                 currpass=request.getParameter("currpass");
                 newpass=request.getParameter("newpass");
                 repass=request.getParameter("repass");
                 updat=request.getParameter("updat");
                if(updat.equals("Save Changes"))
            	{
                	try
        			{
        			String pass="";
        			Statement st=con.createStatement(); 
        			String bs="select Password from admin_details where Userid='"+session.getAttribute("sessuid")+"'";
        			st.execute(bs);
        			ResultSet rs=st.getResultSet();
        			//ResultSet rs=st.executeQuery("select * from admin_details where Username='"+username+"' and Password='"+password+"'");
        			 while(rs.next())
        			{
                      
                     pass=rs.getString("Password");
                      
        			}
        			
        		 if(!newpass.equals(repass))
           {
                 		String message="Password is not matched";
             			
             			response.sendRedirect("Vsettings.jsp?error="+message);
                 	}
        		 else if(newpass.length()>8)
     			{
     			 String message="Password should not contain more than 8 characters";
     				
     			response.sendRedirect("Vsettings.jsp?error="+message);
     			}
        		 else if(!pass.equals(currpass))
      			 {
        			 String message="Invalid Password";
        			 response.sendRedirect("Vsettings.jsp?error="+message);
      			 }
        		 else
        		 {
        			 int passtatus=1;
        			 Statement stmt=con.createStatement();  
  			       int i=stmt.executeUpdate("update admin_details set Password='"+newpass+"',PasswordStatus="+passtatus+" where Userid='"+session.getAttribute("sessuid")+"'");
  					if(i>0)
  					{     
  						 String message="Password Updated Successfully";
  						response.sendRedirect("Vsettings.jsp?message="+message);
  					} 
  					con.close(); 
        		 }
        			}
                	catch(Exception e)
        			{
        			out.println(e.getMessage());
        				
        			}
                	
                	
                	
            	}
                %>
</body>
</html>