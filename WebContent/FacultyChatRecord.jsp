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
String collegename=(String)session.getAttribute("colcode");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");

if(request.getParameter("key")!=null)
{
	String key=request.getParameter("key");
	String replaceString=key.replace("'","\\'");
	
	String wild="%"+replaceString+"%";
	String curuser=(String)session.getAttribute("sessname");
	try
	{
		PreparedStatement pstmt=null;
		pstmt=con1.prepareStatement("SELECT * FROM faculty_details WHERE Username LIKE ? AND Username <> ?");
		pstmt.setString(1,wild);
		pstmt.setString(2,curuser);
		ResultSet rs=pstmt.executeQuery();
		while(rs.next())
		{
			%>
			<li class="list-group-item"><%=rs.getString("Username") %></li>
		<%
		}
		con.close();
		con1.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}

}


%>





</body>
</html>