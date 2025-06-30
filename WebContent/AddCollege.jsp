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
	Connection con1=null;
	String name=request.getParameter("collegename");
	String address=request.getParameter("address");
	String college_code=request.getParameter("collegecode");
	Date date = new Date();  
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
    String strDate= formatter.format(date);  
    out.println(name);
    out.println(address);
    out.println(college_code);
    out.println(strDate);
    PreparedStatement pst=con.prepareStatement("select college_code,college_name from college_details Where college_code='"+college_code+"' or college_name='"+name+"'");  
    ResultSet rs=pst.executeQuery(); 
    String ccode="",cname="";
    if(rs.next())
    {
    	ccode=rs.getString(1);
    	cname=rs.getString(2);
    	if((ccode.equals(college_code) && cname.equals(name)) || ccode.equals(college_code))
    	{
    	message="College has been already registered";
     response.sendRedirect("College_Details.jsp?error="+message);
    	}
    
  
    
    else
    {
   PreparedStatement ps=con.prepareStatement("insert into college_details(college_name,college_address,college_code,created_at) values(?,?,?,?)");
   ps.setString(1,name);
   ps.setString(2,address);
   ps.setString(3,college_code);
   ps.setString(4,strDate);
   int row=ps.executeUpdate();
   if (row > 0) {
       //message = "File uploaded and saved into database";
       //out.println(message);
       out.println(college_code);
       Statement statement = con.createStatement();
       String query = "CREATE DATABASE "+"E"+college_code;
       statement.executeUpdate(query);
       con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+college_code,"root","");
       Statement statement2 = con1.createStatement();
       String query2 = "CREATE TABLE college_admin_details(Id int NOT NULL AUTO_INCREMENT,Username varchar(50),Userid varchar(10),Password varchar(8),College_name varchar(50),Email_Id varchar(50),Mobile_No varchar(10),Address varchar(100),College_Code varchar(20),Date_of_Joining varchar(20),ProfilePic longblob NULL,PRIMARY KEY (Id),PasswordStatus int Default '0',ProfilePicStatus int Default '0',ProfileStatus int Default '0')";
       statement2.executeUpdate(query2);
       Statement statement3 = con1.createStatement();
       String query3 = "CREATE TABLE faculty_details(Id int NOT NULL AUTO_INCREMENT,Username varchar(50),Userid varchar(10),Password varchar(8),Email_Id varchar(50),Mobile_No varchar(10),Address varchar(100),College_Code varchar(20),ProfilePic longblob NULL,PRIMARY KEY (Id),PasswordStatus int Default '0',ProfilePicStatus int Default '0',ProfileStatus int Default '0')";
       statement3.executeUpdate(query3);
       Statement statement4 = con1.createStatement();
       String query4 = "CREATE TABLE student_details(Id int NOT NULL AUTO_INCREMENT,Username varchar(50),Userid varchar(10),Password varchar(8),Email_Id varchar(50),Mobile_No varchar(10),Address varchar(100),Department varchar(40),Batch varchar(20),Roll_no varchar(20),College_Code varchar(20),ProfilePic longblob NULL,PRIMARY KEY (Id),PasswordStatus int Default '0',ProfilePicStatus int Default '0',ProfileStatus int Default '0')";
       statement4.executeUpdate(query4);
       Statement statement5 = con1.createStatement();
       String query5 = "CREATE TABLE subject_details(Id int NOT NULL AUTO_INCREMENT,Department varchar(40),Subject_name varchar(40),Batch varchar(20),isAlloted varchar(2) Default 'N',Userid varchar(10),PRIMARY KEY (Id),Subject_code varchar(20))";
       statement5.executeUpdate(query5);
       Statement statement6 = con1.createStatement();
       String query6 = "CREATE TABLE private_chat(Id int NOT NULL AUTO_INCREMENT,Sender varchar(40),Reciever varchar(40),Message varchar(200),Date varchar(20),Time varchar(20),PRIMARY KEY (Id),Status int Default '0')";
       statement6.executeUpdate(query6);
       Statement statement7 = con1.createStatement();
       String query7 = "CREATE TABLE dummy_private_chat(Id int NOT NULL AUTO_INCREMENT,Sender varchar(40),Reciever varchar(40),Message varchar(200),Date varchar(20),Time varchar(20),PRIMARY KEY (Id))";
       statement7.executeUpdate(query7);
       Statement statement8 = con1.createStatement();
       String query8 = "CREATE TABLE notices(Id int NOT NULL AUTO_INCREMENT,Notice_title varchar(100),Notice varchar(255),Department varchar(50),subject varchar(50),Faculty_Name varchar(50),Date varchar(20),Status int,PRIMARY KEY (Id))";
       statement8.executeUpdate(query8);
       Statement statement9 = con1.createStatement();
       String query9 = "CREATE TABLE departments(Id int NOT NULL AUTO_INCREMENT,department_name varchar(50),PRIMARY KEY (Id))";
       statement9.executeUpdate(query9);
       Statement statement10 = con1.createStatement();
       String query10 = "CREATE TABLE downloads(Id int NOT NULL AUTO_INCREMENT,Userid varchar(30),Download_date varchar(30),File_Name varchar(255),PRIMARY KEY (Id))";
       statement10.executeUpdate(query10);
       Statement statement11= con1.createStatement();
       String query11 = "CREATE TABLE dummy_quiz_title(i int NOT NULL AUTO_INCREMENT,id int,title varchar(50),Userid varchar(10),PRIMARY KEY (i))";
       statement11.executeUpdate(query11);
       Statement statement12= con1.createStatement();
       String query12 = "CREATE TABLE facultyassignment(Id int NOT NULL AUTO_INCREMENT,Userid varchar(50),Subject varchar(50),Subject_code varchar(20),Title varchar(50),Description varchar(50),Department varchar(20),File_name varchar(255),File_data longblob,Date varchar(20),Time varchar(20),DueDate varchar(20),DueTime varchar(20),PRIMARY KEY (Id))";
       statement12.executeUpdate(query12);
       Statement statement13= con1.createStatement();
       String query13 = "CREATE TABLE finalquiz(id int NOT NULL AUTO_INCREMENT,Userid varchar(20),Subject_code varchar(20),title varchar(80),Question_type varchar(50),Question varchar(255),Checkbox1 varchar(200) Default 'N',Checkbox2 varchar(200) Default 'N',Checkbox3 varchar(200) Default 'N',Checkbox4 varchar(200) Default 'N',Answer varchar(255) Default 'N',Marks int NULL,Markreview varchar(5) Default 'N',PRIMARY KEY (id))";
       statement13.executeUpdate(query13);
       Statement statement35= con1.createStatement();
       String query35 = "CREATE TABLE group_chat(Id int NOT NULL AUTO_INCREMENT,Group_name varchar(255) NULL,Sender varchar(20) NULL,Message varchar(255) NULL,Date varchar(20) NULL,Time varchar(20) NULL,Highlight int NULL,Sendername varchar(50) NULL,PRIMARY KEY (Id))";
       statement35.executeUpdate(query35); 
       Statement statement15= con1.createStatement();
       String query15 = "CREATE TABLE group_details(Id int NOT NULL AUTO_INCREMENT,Group_name varchar(255),Members text,Date varchar(20),Time varchar(20),Createdby varchar(20),Group_alias varchar(255) NULL,PRIMARY KEY (Id))";
       statement15.executeUpdate(query15);
       
       Statement statement16= con1.createStatement();
       String query16 = "CREATE TABLE group_notifications(Id int NOT NULL AUTO_INCREMENT,Group_name varchar(255),Member varchar(20),Date varchar(20),Time varchar(20),Group_count int Default '0',Group_alias varchar(255),Status int Default '0',PRIMARY KEY (Id))";
       statement16.executeUpdate(query16);
       Statement statement17= con1.createStatement();
       String query17 = "CREATE TABLE quizresult(id int NOT NULL AUTO_INCREMENT,Userid varchar(20),Subject_code varchar(20),title varchar(255),Totalmarks int Default '0',Start_time varchar(20),Submitted_time varchar(20) NULL,PRIMARY KEY (id),Updated varchar(5) Default 'N',Status int Default '0')";
       statement17.executeUpdate(query17);
       Statement statement18= con1.createStatement();
       String query18 = "CREATE TABLE quiz_info(Id int NOT NULL AUTO_INCREMENT,title varchar(100),created_date varchar(20),quiz_date varchar(20),quiz_time varchar(20),time_limit varchar(20),description varchar(255) NULL,subject varchar(50),PRIMARY KEY (Id),Faculty_Name varchar(100),Department varchar(100),Preview varchar(5) NULL)";
       statement18.executeUpdate(query18);
       Statement statement19= con1.createStatement();
       String query19 = "CREATE TABLE quiz_questions(Id int NOT NULL AUTO_INCREMENT,title varchar(100),Question_type varchar(60),Question varchar(255),Option1 varchar(100) NULL,Option2 varchar(100) NULL,Option3 varchar(100) NULL,Option4 varchar(100) NULL,correct_ans varchar(100),Marks int NULL,Status varchar(2) Default 'N',Subject_code varchar(20),Question_no int,PRIMARY KEY (Id))";
       statement19.executeUpdate(query19);
       
       Statement statement20= con1.createStatement();
       String query20 = "CREATE TABLE student_assignments(id int NOT NULL AUTO_INCREMENT,Name varchar(50),Assignment_name varchar(100),Assignment_file varchar(255),File_data longblob,Submitted_date varchar(20),Submitted_time varchar(20),Feedback varchar(255) NULL,subject_code varchar(100),Status int Default '0',PRIMARY KEY (id))";
       statement20.executeUpdate(query20); 
       Statement statement21= con1.createStatement();
       String query21 = "CREATE TABLE student_subject(id int NOT NULL AUTO_INCREMENT,Subject_code varchar(50),Userid varchar(20),Department varchar(50),Subject_name varchar(50),Batch varchar(10),NoticeStatus int Default '0',AssignmentStatus int Default '0',QuizStatus int Default '0',StudyMaterial int Default '0',PRIMARY KEY (id))";
       statement21.executeUpdate(query21); 
       Statement statement22= con1.createStatement();
       String query22 = "CREATE TABLE upload_file(Id int NOT NULL AUTO_INCREMENT,Subject_Name varchar(100),Userid varchar(50),File_name varchar(255),File_data longblob,Upload_date varchar(50),PRIMARY KEY (Id))";
       statement22.executeUpdate(query22); 
       Statement statement23= con1.createStatement();
       String query23 = "CREATE TABLE assignment_email(Id int NOT NULL AUTO_INCREMENT,Userid varchar(20),Subject_code varchar(50),Assignment_name varchar(200),Assignment_date varchar(20),PRIMARY KEY (Id))";
       statement23.executeUpdate(query23); 
       message="College added successfully";
       response.sendRedirect("College_Details.jsp?message="+message);
       
       
   }
    }
    }
    	
    		else
    	    {
    	   PreparedStatement ps=con.prepareStatement("insert into college_details(college_name,college_address,college_code,created_at) values(?,?,?,?)");
    	   ps.setString(1,name);
    	   ps.setString(2,address);
    	   ps.setString(3,college_code);
    	   ps.setString(4,strDate);
    	   int row=ps.executeUpdate();
    	   if (row > 0) {
    	       //message = "File uploaded and saved into database";
    	       //out.println(message);
    	       out.println(college_code);
    	       Statement statement = con.createStatement();
    	       String query = "CREATE DATABASE "+"E"+college_code;
    	       statement.executeUpdate(query);
    	       con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+college_code,"root","");
    	       Statement statement2 = con1.createStatement();
    	       String query2 = "CREATE TABLE college_admin_details(Id int NOT NULL AUTO_INCREMENT,Username varchar(50),Userid varchar(10),Password varchar(8),College_name varchar(50),Email_Id varchar(50),Mobile_No varchar(10),Address varchar(100),College_Code varchar(20),Date_of_Joining varchar(20),ProfilePic longblob NULL,PRIMARY KEY (Id),PasswordStatus int Default '0',ProfilePicStatus int Default '0',ProfileStatus int Default '0')";
    	       statement2.executeUpdate(query2);
    	       Statement statement3 = con1.createStatement();
    	       String query3 = "CREATE TABLE faculty_details(Id int NOT NULL AUTO_INCREMENT,Username varchar(50),Userid varchar(10),Password varchar(8),Email_Id varchar(50),Mobile_No varchar(10),Address varchar(100),College_Code varchar(20),ProfilePic longblob NULL,PRIMARY KEY (Id),PasswordStatus int Default '0',ProfilePicStatus int Default '0',ProfileStatus int Default '0')";
    	       statement3.executeUpdate(query3);
    	       Statement statement4 = con1.createStatement();
    	       String query4 = "CREATE TABLE student_details(Id int NOT NULL AUTO_INCREMENT,Username varchar(50),Userid varchar(10),Password varchar(8),Email_Id varchar(50),Mobile_No varchar(10),Address varchar(100),Department varchar(40),Batch varchar(20),Roll_no varchar(20),College_Code varchar(20),ProfilePic longblob NULL,PRIMARY KEY (Id),PasswordStatus int Default '0',ProfilePicStatus int Default '0',ProfileStatus int Default '0')";
    	       statement4.executeUpdate(query4);
    	       Statement statement5 = con1.createStatement();
    	       String query5 = "CREATE TABLE subject_details(Id int NOT NULL AUTO_INCREMENT,Department varchar(40),Subject_name varchar(40),Batch varchar(20),isAlloted varchar(2) Default 'N',Userid varchar(10),PRIMARY KEY (Id),Subject_code varchar(20))";
    	       statement5.executeUpdate(query5);
    	       Statement statement6 = con1.createStatement();
    	       String query6 = "CREATE TABLE private_chat(Id int NOT NULL AUTO_INCREMENT,Sender varchar(40),Reciever varchar(40),Message varchar(200),Date varchar(20),Time varchar(20),PRIMARY KEY (Id),Status int Default '0')";
    	       statement6.executeUpdate(query6);
    	       Statement statement7 = con1.createStatement();
    	       String query7 = "CREATE TABLE dummy_private_chat(Id int NOT NULL AUTO_INCREMENT,Sender varchar(40),Reciever varchar(40),Message varchar(200),Date varchar(20),Time varchar(20),PRIMARY KEY (Id))";
    	       statement7.executeUpdate(query7);
    	       Statement statement8 = con1.createStatement();
    	       String query8 = "CREATE TABLE notices(Id int NOT NULL AUTO_INCREMENT,Notice_title varchar(100),Notice varchar(255),Department varchar(50),subject varchar(50),Faculty_Name varchar(50),Date varchar(20),Status int,PRIMARY KEY (Id))";
    	       statement8.executeUpdate(query8);
    	       Statement statement9 = con1.createStatement();
    	       String query9 = "CREATE TABLE departments(Id int NOT NULL AUTO_INCREMENT,department_name varchar(50),PRIMARY KEY (Id))";
    	       statement9.executeUpdate(query9);
    	       Statement statement10 = con1.createStatement();
    	       String query10 = "CREATE TABLE downloads(Id int NOT NULL AUTO_INCREMENT,Userid varchar(30),Download_date varchar(30),File_Name varchar(255),PRIMARY KEY (Id))";
    	       statement10.executeUpdate(query10);
    	       Statement statement11= con1.createStatement();
    	       String query11 = "CREATE TABLE dummy_quiz_title(i int NOT NULL AUTO_INCREMENT,id int,title varchar(50),Userid varchar(10),PRIMARY KEY (i))";
    	       statement11.executeUpdate(query11);
    	       Statement statement12= con1.createStatement();
    	       String query12 = "CREATE TABLE facultyassignment(Id int NOT NULL AUTO_INCREMENT,Userid varchar(50),Subject varchar(50),Subject_code varchar(20),Title varchar(50),Description varchar(50),Department varchar(20),File_name varchar(255),File_data longblob,Date varchar(20),Time varchar(20),DueDate varchar(20),DueTime varchar(20),PRIMARY KEY (Id))";
    	       statement12.executeUpdate(query12);
    	       Statement statement13= con1.createStatement();
    	       String query13 = "CREATE TABLE finalquiz(id int NOT NULL AUTO_INCREMENT,Userid varchar(20),Subject_code varchar(20),title varchar(80),Question_type varchar(50),Question varchar(255),Checkbox1 varchar(200) Default 'N',Checkbox2 varchar(200) Default 'N',Checkbox3 varchar(200) Default 'N',Checkbox4 varchar(200) Default 'N',Answer varchar(255) Default 'N',Marks int NULL,Markreview varchar(5) Default 'N',PRIMARY KEY (id))";
    	       statement13.executeUpdate(query13);
    	       Statement statement14= con1.createStatement();
    	       String query14 = "CREATE TABLE group_chat(Id int NOT NULL AUTO_INCREMENT,Group_name varchar(255),Sender varchar(20),Message varchar(255),Date varchar(20),Time varchar(20),Highlight int NULL,Sendername varchar(50) NULL,PRIMARY KEY (Id))";
    	       statement14.executeUpdate(query14); 
    	       Statement statement15= con1.createStatement();
    	       String query15 = "CREATE TABLE group_details(Id int NOT NULL AUTO_INCREMENT,Group_name varchar(255),Members text,Date varchar(20),Time varchar(20),Createdby varchar(20),Group_alias varchar(255) NULL,PRIMARY KEY (Id))";
    	       statement15.executeUpdate(query15);
    	       
    	       Statement statement16= con1.createStatement();
    	       String query16 = "CREATE TABLE group_notifications(Id int NOT NULL AUTO_INCREMENT,Group_name varchar(255),Member varchar(20),Date varchar(20),Time varchar(20),Group_count int Default '0',Group_alias varchar(255),Status int Default '0',PRIMARY KEY (Id))";
    	       statement16.executeUpdate(query16);
    	       Statement statement17= con1.createStatement();
    	       String query17 = "CREATE TABLE quizresult(id int NOT NULL AUTO_INCREMENT,Userid varchar(20),Subject_code varchar(20),title varchar(255),Totalmarks int Default '0',Start_time varchar(20),Submitted_time varchar(20) NULL,PRIMARY KEY (id),Updated varchar(5) Default 'N',Status int Default '0')";
    	       statement17.executeUpdate(query17);
    	       Statement statement18= con1.createStatement();
    	       String query18 = "CREATE TABLE quiz_info(Id int NOT NULL AUTO_INCREMENT,title varchar(100),created_date varchar(20),quiz_date varchar(20),quiz_time varchar(20),time_limit varchar(20),description varchar(255) NULL,subject varchar(50),PRIMARY KEY (Id),Faculty_Name varchar(100),Department varchar(100),Preview varchar(5) NULL)";
    	       statement18.executeUpdate(query18);
    	       Statement statement19= con1.createStatement();
    	       String query19 = "CREATE TABLE quiz_questions(Id int NOT NULL AUTO_INCREMENT,title varchar(100),Question_type varchar(60),Question varchar(255),Option1 varchar(100) NULL,Option2 varchar(100) NULL,Option3 varchar(100) NULL,Option4 varchar(100) NULL,correct_ans varchar(100),Marks int NULL,Status varchar(2) Default 'N',Subject_code varchar(20),Question_no int,PRIMARY KEY (Id))";
    	       statement19.executeUpdate(query19);
    	       
    	       Statement statement20= con1.createStatement();
    	       String query20 = "CREATE TABLE student_assignments(id int NOT NULL AUTO_INCREMENT,Name varchar(50),Assignment_name varchar(100),Assignment_file varchar(255),File_data longblob,Submitted_date varchar(20),Submitted_time varchar(20),Feedback varchar(255) NULL,subject_code varchar(100),Status int Default '0',PRIMARY KEY (id))";
    	       statement20.executeUpdate(query20); 
    	       Statement statement21= con1.createStatement();
    	       String query21 = "CREATE TABLE student_subject(id int NOT NULL AUTO_INCREMENT,Subject_code varchar(50),Userid varchar(20),Department varchar(50),Subject_name varchar(50),Batch varchar(10),NoticeStatus int Default '0',AssignmentStatus int Default '0',QuizStatus int Default '0',StudyMaterial int Default '0',PRIMARY KEY (id))";
    	       statement21.executeUpdate(query21); 
    	       Statement statement22= con1.createStatement();
    	       String query22 = "CREATE TABLE upload_file(Id int NOT NULL AUTO_INCREMENT,Subject_Name varchar(100),Userid varchar(50),File_name varchar(255),File_data longblob,Upload_date varchar(50),PRIMARY KEY (Id))";
    	       statement22.executeUpdate(query22); 
    	       Statement statement23= con1.createStatement();
    	       String query23 = "CREATE TABLE assignment_email(Id int NOT NULL AUTO_INCREMENT,Userid varchar(20),Subject_code varchar(50),Assignment_name varchar(200),Assignment_date varchar(20),PRIMARY KEY (Id))";
    	       statement23.executeUpdate(query23); 
    	       message="College added successfully";
    	       response.sendRedirect("College_Details.jsp?message="+message);
    	       
    	   }
    	    
    	    }
    	
    con.close(); 
	con1.close();
   
}catch(Exception e){out.println(e.getMessage());}  





%>

</body>
</html>