<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
 <%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
<%@ page import ="javax.servlet.http.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<%@ page import="java.io.PrintWriter,java.io.StringWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int highlight=1;
Date date = new Date();  
SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
String strDate= formatter.format(date);  
DateFormat dateFormat = new SimpleDateFormat("hh.mm aa");
String dateString = dateFormat.format(new Date()).toString();
String collegename=(String)session.getAttribute("colcode");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
String grpalias=(String)session.getAttribute("searchgrpname");
String username=(String)session.getAttribute("sessname");
String userid=(String)session.getAttribute("sessuid");
String mess="";
String grpname=request.getParameter("editgrpname");
out.println(grpalias);
PreparedStatement ps=con1.prepareStatement("Update group_details set Group_name=? Where Group_alias=?");
ps.setString(1,grpname);
  ps.setString(2,grpalias);
  int row=ps.executeUpdate();
  PreparedStatement ps1=con1.prepareStatement("Update group_notifications set Group_name=? Where Group_alias=?");
  ps1.setString(1,grpname);
    ps1.setString(2,grpalias);
    int row1=ps1.executeUpdate();
mess=username+" changed group name to "+grpname;
PreparedStatement ps10=con1.prepareStatement("insert into group_chat(Group_name,Sender,Message,Date,Time,Highlight) values(?,?,?,?,?,?)");
ps10.setString(1,grpalias);
ps10.setString(2,userid);
ps10.setString(3,mess);
ps10.setString(4,strDate);
ps10.setString(5,dateString);
ps10.setInt(6,highlight);
int row10=ps10.executeUpdate();

//response.sendRedirect("Facultychats.jsp?ok=ok&uname1="+grpalias);
String utype=(String)session.getAttribute("utype");
	
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
	try
	{
		//con.close(); 
		con1.close();
	}
	catch(Exception e)
	{
		out.println(e.getMessage());
	}
%>
</body>
</html>