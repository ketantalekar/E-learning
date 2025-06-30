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
if(request.getParameter("people")!=null)	
{
	String collegename=(String)session.getAttribute("colcode");
    Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
    String userid="";
	String uname=request.getParameter("people");
	String bs1="select Userid from faculty_details where Username=?";
	PreparedStatement ps5=con1.prepareStatement(bs1);
    ps5.setString(1,uname);
    ResultSet rs5=ps5.executeQuery();
    while(rs5.next())
    {
    userid=rs5.getString(1);
    }
  
	String me=(String)session.getAttribute("sessuid");
	String replaceString=userid.replace("'","\\'");
	
	int flag=0; 
	try
	{
		
	Statement st=con1.createStatement(); 
	String bs="select * from faculty_details where Userid='"+replaceString+"' and  Userid <>'"+me+"'";
	st.execute(bs);
	ResultSet rs=st.getResultSet();
	//ResultSet rs=st.executeQuery("select * from admin_details where Username='"+username+"' and Password='"+password+"'");
	 while(rs.next())
	{

	flag++;
	}
	 if(flag==1)
	 {
		session.setAttribute("searchuname",userid);
			response.sendRedirect("FacultyChat.jsp?uname="+userid);

	 }
	 else
	 {
		 String name="User not found";
			response.sendRedirect("FacultyChat.jsp?unam="+name);

	 }
	con.close();
	con1.close();
	}
	catch(Exception e)
	{
	out.println("failed"+e.getMessage());
		
	}
	
	

	//out.println(uname);
}



%>
</body>
</html>