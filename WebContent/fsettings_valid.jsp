<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
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
                		String collegename=(String)session.getAttribute("colcode");
                        Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
        			String pass="";
        			Statement st=con1.createStatement(); 
        			String bs="select Password from faculty_details where Userid='"+session.getAttribute("sessuid")+"'";
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
             			
             			response.sendRedirect("Fsettings.jsp?error="+message);
                 	}
        		 else if(newpass.length()>8)
        			{
        			 String message="Password should not contain more than 8 characters";
        				
        				response.sendRedirect("Fsettings.jsp?error="+message);
        			}
        		 else if(!pass.equals(currpass))
      			 {
        			 String message="Invalid Password";
        			 response.sendRedirect("Fsettings.jsp?error="+message);
      			 }
        		 else
        		 {
        			 Statement stmt=con1.createStatement();  
        			 int passtatus=1;
  			       int i=stmt.executeUpdate("update faculty_details set Password='"+newpass+"',PasswordStatus="+passtatus+" where Userid='"+session.getAttribute("sessuid")+"'");
  					if(i>0)
  					{     
  						 String message="Password Updated Successfully";
  						response.sendRedirect("Fsettings.jsp?message="+message);
  					} 
  					con1.close(); 
        		 }
        		 
        			}
                	catch(Exception e)
        			{
        			//out.println("failed"+e.getMessage());
        				
        			}
                	
                	
                	
            	}
                %>
</body>
</html>