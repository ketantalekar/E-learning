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
int flag=0;
try{  
	String department=request.getParameter("department");
	String dname=request.getParameter("dname");
	int deptid=Integer.parseInt(request.getParameter("did"));
	
	
	PreparedStatement pst=con1.prepareStatement("select department_name from departments where department_name=?");  
	pst.setString(1,department);
	   int row=0;
    ResultSet rs=pst.executeQuery();  
    if(rs.next())
    {
    	flag++;
    	message="Department already exists";
        response.sendRedirect("CollegeAdminDepartment.jsp?error="+message);
    }
    else
    {
    	PreparedStatement ps=con1.prepareStatement("Update departments set department_name=? Where Id=?");
		ps.setString(1,department);
		ps.setInt(2,deptid);
	    
    
   row=ps.executeUpdate();
   
    }
    	
    
    if(row>0)
    {
    
	      //message = "File uploaded and saved into database";
       //out.println(message);
      // insert into faculty_details(Username,Password,College_Code,Email_Id,Mobile_No,Address,Userid) values(?,?,?,?,?,?,?)
    	PreparedStatement pst1=con1.prepareStatement("select Id from facultyassignment where Department=?");  
    	pst1.setString(1,dname);
    	  out.println(dname);
        ResultSet rs1=pst1.executeQuery();  
		while(rs1.next())
		{
			int faid=rs1.getInt(1);
			out.println(faid);
			 PreparedStatement ps2=con1.prepareStatement("Update facultyassignment set Department=? Where Id=?");
				ps2.setString(1,department);
				ps2.setInt(2,faid);
				int row2=ps2.executeUpdate();
				  
		}
	 	PreparedStatement pst2=con1.prepareStatement("select Id from notices where Department=?");  
    	pst2.setString(1,dname);
    	  out.println(dname);
        ResultSet rs3=pst2.executeQuery();  
		while(rs3.next())
		{
			int faid=rs3.getInt(1);
			out.println(faid);
			 PreparedStatement ps2=con1.prepareStatement("Update notices set Department=? Where Id=?");
				ps2.setString(1,department);
				ps2.setInt(2,faid);
				int row2=ps2.executeUpdate();
				  
		}
		PreparedStatement pst3=con1.prepareStatement("select Id from quiz_info where Department=?");  
    	pst3.setString(1,dname);
    	  out.println(dname);
        ResultSet rs4=pst3.executeQuery();  
		while(rs4.next())
		{
			int faid=rs4.getInt(1);
			out.println(faid);
			 PreparedStatement ps2=con1.prepareStatement("Update quiz_info set Department=? Where Id=?");
				ps2.setString(1,department);
				ps2.setInt(2,faid);
				int row2=ps2.executeUpdate();
				  
		}
		PreparedStatement pst4=con1.prepareStatement("select Id from student_details where Department=?");  
    	pst4.setString(1,dname);
    	  out.println(dname);
        ResultSet rs5=pst4.executeQuery();  
		while(rs5.next())
		{
			int faid=rs5.getInt(1);
			out.println(faid);
			 PreparedStatement ps2=con1.prepareStatement("Update student_details set Department=? Where Id=?");
				ps2.setString(1,department);
				ps2.setInt(2,faid);
				int row2=ps2.executeUpdate();
				  
		}
		PreparedStatement pst5=con1.prepareStatement("select Id from student_subject where Department=?");  
    	pst5.setString(1,dname);
    	  out.println(dname);
        ResultSet rs6=pst5.executeQuery();  
		while(rs6.next())
		{
			int faid=rs6.getInt(1);
			out.println(faid);
			 PreparedStatement ps2=con1.prepareStatement("Update student_subject set Department=? Where Id=?");
				ps2.setString(1,department);
				ps2.setInt(2,faid);
				int row2=ps2.executeUpdate();
				  
		}
		PreparedStatement pst6=con1.prepareStatement("select Id from subject_details where Department=?");  
    	pst6.setString(1,dname);
    	  out.println(dname);
        ResultSet rs7=pst6.executeQuery();  
		while(rs7.next())
		{
			int faid=rs7.getInt(1);
			out.println(faid);
			 PreparedStatement ps2=con1.prepareStatement("Update subject_details set Department=? Where Id=?");
				ps2.setString(1,department);
				ps2.setInt(2,faid);
				int row2=ps2.executeUpdate();
				  
		}
      
       message="Department updated successfully";
           response.sendRedirect("CollegeAdminDepartment.jsp?message="+message);

    }
    con1.close();
}catch(Exception e){
	
	out.println(e.getMessage());
}  

%>

</body>
</html>