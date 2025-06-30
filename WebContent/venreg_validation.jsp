<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.*" %>
<%@ include file="connection.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vendor Registration Validation</title>
</head>
<body>
<%
String signup,email,username,password,confpass,capimg1,cap,cancel,userid;
	signup=request.getParameter("signup");
	email=request.getParameter("email");
	username=request.getParameter("username");
	password="123";
	capimg1=request.getParameter("capimgs");
	userid=request.getParameter("userid");
	cap=request.getParameter("cap");
	                                                            //main if
		
    if(!cap.equals(capimg1))
		{															//captche if
			//String name="Please Match Captcha";
			//session.setAttribute("Name",name);
			
			response.sendRedirect("vendor_reg.jsp?error=Please+match+Captcha");
			}															//close captche if
		else
		{														//insert else
			
			try
			{                                                   //try block
				int flag=0; 
				
				
				Statement stmt=con.createStatement(); 
				String bs="select * from admin_details where Email_Id='"+email+"' or Userid='"+userid+"'";
				stmt.execute(bs);
				ResultSet rs=stmt.getResultSet();
				 while(rs.next())
				{                                            //while

				flag++;

				}                                             //close while
				 if(flag==1)
				 {                                            //flag if
					
					
						
						response.sendRedirect("vendor_reg.jsp?error=Vendor+Already+Registered");
						
				 }                                                        //close flag if
				 else
				 {                                                         //flag else
			  Date date = new Date();  
				    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
				    String strDate= formatter.format(date);
				    //InputStream inputStream = null; 
					//Part filePart = request.getPart("images/user.JPG");
			          Statement st=con.createStatement();  
			       int i=st.executeUpdate("insert into admin_details(Email_Id,Username,Password,Date_of_Joining,Userid)values('"+email+"','"+username+"','"+password+"','"+strDate+"','"+userid+"')");
					if(i>0)
					{                                                  //if
						response.sendRedirect("vendor_reg.jsp?message=Vendor+Added+Successfully");
					}                                                   //close if
					con.close();
			}                                                      //close flag else
			}                                                 //end try 
			catch(Exception e){  

				    	} 
			}                                                  //close insert else
			
			                                                 //close main if
	
	
	%>
</body>
</html>