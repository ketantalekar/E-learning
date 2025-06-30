<%@ page language="java" contentType="text/html; charset=UTF-8"%>
     <%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
     <%@ include file="connection.jsp" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="Bootstrap/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="Bootstrap/css/style.css" rel="stylesheet" type="text/css"></link>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>

</head>
<body>
<%
try
{
	String collegename=(String)session.getAttribute("colcode");
    Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
if(request.getParameter("groupname")!=null)	
{
	
    String grpname="";
    int grpid=0;
    String grpalias="";
    int flag=0;
	String uname=request.getParameter("groupname");
	String replaceString=uname.replace("'","\\'");
	String userid=(String)session.getAttribute("sessuid");
	String uidwild="%"+userid+"%";
	String bs1="select Group_name,Group_alias,Id from group_details where Group_name=? and Members Like ?";
	PreparedStatement ps5=con1.prepareStatement(bs1);
    ps5.setString(1,replaceString);
    ps5.setString(2,uidwild);
    ResultSet rs5=ps5.executeQuery();
    if(rs5.next())
    {
    grpname=rs5.getString(1);
    grpalias=rs5.getString(2);
    grpid=rs5.getInt(3);
    flag++;
    }
  
	String utype=(String)session.getAttribute("utype");
	
		 if(flag==1)
	 {
			 
			 int gstatus=0;
			 PreparedStatement ps6=con1.prepareStatement("Update group_notifications set Status=? Where Group_alias=? and Member=?");
			 ps6.setInt(1,gstatus);
			  ps6.setString(2,grpalias);
			   ps6.setString(3,(String)session.getAttribute("sessuid"));
			   int row3=ps6.executeUpdate();
		session.setAttribute("searchgrpname",grpalias);
		if(utype.equals("Faculty"))
		{
			response.sendRedirect("Facultychats.jsp?ok=ok&uname1="+grpalias);

		}
		else if(utype.equals("Student"))
		{
			response.sendRedirect("Studentchats.jsp?ok=ok&uname1="+grpalias);

		}
		else if(utype.equals("College Admin"))
		{
			response.sendRedirect("CollegeAdminchats.jsp?ok=ok&uname1="+grpalias);

		}
	
	 }
	 else
	 {
		 
		 String name="Group not found";
			if(utype.equals("Faculty"))
			{
				response.sendRedirect("Facultychats.jsp?ok=ok&grperrormsg="+name);

			}
			else if(utype.equals("Student"))
			{
				response.sendRedirect("Studentchats.jsp?ok=ok&grperrormsg="+name);

			}
			else if(utype.equals("College Admin"))
			{
				response.sendRedirect("CollegeAdminchats.jsp?ok=ok&grperrormsg="+name);

			}
			

	 }
	
}
con.close();
con1.close();
	}
	catch(Exception e)
	{
	out.println("failed"+e.getMessage());
		
	}
	
	

	//out.println(uname);




%>
</body>
</html>