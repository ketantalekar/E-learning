<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
<%@ page import ="javax.servlet.http.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<%@ page import="java.io.PrintWriter,java.io.StringWriter" %>
<%
String collegename=(String)session.getAttribute("colcode");

Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");

String message="";
try{  
	String department=request.getParameter("department");
	int flag=0;
	Statement st=con1.createStatement();
	String bs="select * from departments where department_name='"+department+"'";
	st.execute(bs);
	ResultSet rs=st.getResultSet();
	while(rs.next())
	{
		flag++;
	}
	if(flag==0)
	{
    
   PreparedStatement ps=con1.prepareStatement("insert into departments(department_name) values(?)");
   ps.setString(1,department);
    
   
   int row=ps.executeUpdate();
 
  //out.println(row);
   if (row > 0) {
       //message = "File uploaded and saved into database";
       //out.println(message);
       message="Department added successfully";
           response.sendRedirect("CollegeAdminDepartment.jsp?message="+message);
   }
	}
	else
	{
		   message="Department already exists";
           response.sendRedirect("CollegeAdminDepartment.jsp?error="+message);
  
	}
	//con.close(); 
	con1.close();
}catch(Exception e){
	
	out.println(e.getMessage());
}  

%>

</body>
</html>