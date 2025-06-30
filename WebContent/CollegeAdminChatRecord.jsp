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
if(request.getParameter("key")!=null)
{
	String key=request.getParameter("key");
	String replaceString=key.replace("'","\\'");
	
	String wild=replaceString+"%";
	String curuser=(String)session.getAttribute("sessname");
	try
	{
		PreparedStatement pstmt=null;
		pstmt=con.prepareStatement("SELECT * FROM admin_details WHERE Username LIKE ? AND Username <> ?");
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
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}

}


%>





</body>
</html>