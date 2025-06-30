<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
 <%@ include file="connection.jsp" %>

 <%@ page import ="javax.servlet.http.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

//con=null;
String message="";
try{  
	//Connection con1=null;
	String name=request.getParameter("collegename");
	String address=request.getParameter("collegeadd");
	String college_code=request.getParameter("collegeid");
	String old=request.getParameter("olddb");
	String db_old="e"+old;
	String db_new="e"+college_code;
	PreparedStatement pst=con.prepareStatement("select college_code,college_name,college_address from college_details where college_code<>?");  
	   pst.setString(1,old);
	    
    ResultSet rs=pst.executeQuery(); 
    String ccode="",cname="",add="";
    int flag=0;
    while(rs.next())
    {
    	ccode=rs.getString(1);
    	cname=rs.getString(2);
    	add=rs.getString(3);
    	if(ccode.equals(college_code) || cname.equals(name) || add.equals(address) )
    	{
    		flag++;
    	message="College has been already registered";
     response.sendRedirect("College_Details.jsp?error="+message);
    	}
    	else
    	{
    		flag=0;
    	}
    }
  
    
    if(flag==0)
    {
	  	PreparedStatement ps=con.prepareStatement("update college_details set college_name=?,college_address=?,college_code=? where college_code=?");
    	   ps.setString(1,name);
    	   
    	   ps.setString(2,address);
    	   ps.setString(3,college_code);
    	   ps.setString(4,old);
    	   int row=ps.executeUpdate();
    	   if (row > 0) {
    		   Statement stmt = con.createStatement();;
    	       //message = "File uploaded and saved into database";
    	       //out.println(message);
    	      //String sql = "RENAME database "+db_old+" TO "+db_new;
    	      //String sql = "alter database "+db_old+" modify Name="+db_new;
            //stmt.executeUpdate(sql);
            String sql1="CREATE DATABASE "+db_new+" DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci";
	stmt.executeUpdate(sql1);
	
	String sql2="RENAME TABLE "+db_old+".assignment_email TO "+db_new+".assignment_email";
	stmt.executeUpdate(sql2);
	
	
	String sql3="RENAME TABLE "+db_old+".college_admin_details TO "+db_new+".college_admin_details";
	stmt.executeUpdate(sql3);
	
	
	String sql4="RENAME TABLE "+db_old+".departments TO "+db_new+".departments";
	stmt.executeUpdate(sql4);
	
	
	String sql5="RENAME TABLE "+db_old+".downloads TO "+db_new+".downloads";
	stmt.executeUpdate(sql5);
	
	
	String sql6="RENAME TABLE "+db_old+".dummy_private_chat TO "+db_new+".dummy_private_chat";
	stmt.executeUpdate(sql6);
	
	
	String sql7="RENAME TABLE "+db_old+".dummy_quiz_title TO "+db_new+".dummy_quiz_title";
	stmt.executeUpdate(sql7);
	
	
	String sql8="RENAME TABLE "+db_old+".facultyassignment TO "+db_new+".facultyassignment";
	stmt.executeUpdate(sql8);
	
	
	String sql9="RENAME TABLE "+db_old+".faculty_details TO "+db_new+".faculty_details";
	stmt.executeUpdate(sql9);
	
	
	String sql10="RENAME TABLE "+db_old+".final_quiz TO "+db_new+".final_quiz";
	stmt.executeUpdate(sql10);
	
	
	String sql11="RENAME TABLE "+db_old+".group_chat TO "+db_new+".group_chat";
	stmt.executeUpdate(sql11);
	
	
	String sql12="RENAME TABLE "+db_old+".group_details TO "+db_new+".group_details";
	stmt.executeUpdate(sql12);
	
	
	String sql13="RENAME TABLE "+db_old+".group_notifications TO "+db_new+".group_notifications";
	stmt.executeUpdate(sql13);
	
	
	String sql14="RENAME TABLE "+db_old+".notices TO "+db_new+".`notices`";
	stmt.executeUpdate(sql14);
	
	
	String sql15="RENAME TABLE "+db_old+".private_chat TO "+db_new+".private_chat";
	stmt.executeUpdate(sql15);
	
	
	String sql16="RENAME TABLE "+db_old+".quizresult TO "+db_new+".quizresult";
	stmt.executeUpdate(sql16);
	
	
	String sql17="RENAME TABLE "+db_old+".quiz_info TO "+db_new+".quiz_info";
	stmt.executeUpdate(sql17);
	
	
	String sql18="RENAME TABLE "+db_old+".quiz_questions TO "+db_new+".quiz_questions";
	stmt.executeUpdate(sql18);
	
	
	String sql19="RENAME TABLE "+db_old+".student_assignments TO "+db_new+".student_assignments";
	stmt.executeUpdate(sql19);
	
	
	String sql20="RENAME TABLE "+db_old+".student_details TO "+db_new+".student_details";
	stmt.executeUpdate(sql20);
	
	
	String sql21="RENAME TABLE "+db_old+".student_subject TO "+db_new+".student_subject";
	stmt.executeUpdate(sql21);
	

	String sql22="RENAME TABLE "+db_old+".subject_details TO "+db_new+".subject_details";
	stmt.executeUpdate(sql22);
	
	
	String sql23="RENAME TABLE "+db_old+".upload_file TO "+db_new+".upload_file";
	stmt.executeUpdate(sql23);


String sql24="DROP DATABASE "+db_old;
stmt.executeUpdate(sql24);

            PreparedStatement ps2=con.prepareStatement("update college_admin_details set College_name=?,College_Code=? where College_Code=?");
     	   ps2.setString(1,name);
     	   ps2.setString(2,college_code);
     	  ps2.setString(3,old);
    	  
     	   int row2=ps2.executeUpdate();
     	  

     	 Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db_new,"root","");
         PreparedStatement ps3=con1.prepareStatement("update college_admin_details set College_name=?,College_Code=? where College_Code=?");
  	   ps3.setString(1,name);
  	   ps3.setString(2,college_code);
  	 ps3.setString(3,old);
	  
  	   int row3=ps3.executeUpdate();
  	   
  	   PreparedStatement ps4=con1.prepareStatement("update faculty_details set College_Code=? where College_Code=?");
  	   ps4.setString(1,college_code);
  	 ps4.setString(2,old);
	  
  	   int row4=ps4.executeUpdate();
  	 PreparedStatement ps5=con1.prepareStatement("update student_details set College_Code=? where College_Code=?");
	   ps5.setString(1,college_code);
	 ps5.setString(2,old);
	  
	   int row5=ps5.executeUpdate();
    
            //out.println(college_code);
  	 message="College details updated successfully";
     response.sendRedirect("College_Details.jsp?message="+message);
     con1.close();
    	   }
    	  
    }
    con.close(); 
	
 }catch(Exception e){out.println(e.getMessage());}  


%>

</body>
</html>