<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ page import="java.util.*,com.Data.*,java.sql.*,java.text.SimpleDateFormat,java.util.Date,java.io.*" %> 
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
	int qid=Integer.parseInt(request.getParameter("qid"));
	
	String question=request.getParameter("quizquestion");
	String quiztype=request.getParameter("quiztypee");
	out.println(quiztype);
	String title=(String)session.getAttribute("sessquiztitle");
	String checkoption1=request.getParameter("optionn1");
	String checkoption2=request.getParameter("optionn2");
	String checkoption3=request.getParameter("optionn3");
	String checkoption4=request.getParameter("optionn4");
	
	String correctans=request.getParameter("correctanss");
	int marks=Integer.parseInt(request.getParameter("marksss"));
    
	//out.println(marks5);
	if(quiztype.equals("Multiple Choice")|| quiztype.equals("Single Choice"))
	{
		
	 PreparedStatement ps=con1.prepareStatement("Update quiz_questions set Question=?,Option1=?,Option2=?,Option3=?,Option4=?,correct_ans=?,Marks=? Where Id=? and title=? and Question_type=? ");
	   ps.setString(1,question);
	   ps.setString(2,checkoption1);
	   ps.setString(3,checkoption2);
	   ps.setString(4,checkoption3);
	   ps.setString(5,checkoption4);
	   ps.setString(6,correctans);
	   ps.setInt(7,marks);
	   ps.setInt(8,qid);
	   ps.setString(9,title);
	   ps.setString(10,quiztype);
	   
	   int row=ps.executeUpdate();
	 
	  //out.println(row);
	   if (row > 0) {
	       //message = "File uploaded and saved into database";
	       //out.println(message);
	       
	       message="Question updated successfully";
	           response.sendRedirect("addquizquestions.jsp?message="+message);
	   }
	}
	else if(quiztype.equals("True or False") || quiztype.equals("One Word"))
	{
		 PreparedStatement ps=con1.prepareStatement("Update quiz_questions set Question=?,correct_ans=?,Marks=? where Id=? and title=? and Question_type=?");
		   ps.setString(1,question);
		   ps.setString(2,correctans);
		   ps.setInt(3,marks);
		   ps.setInt(4,qid);
		   
		   ps.setString(5,title);
		   ps.setString(6,quiztype);
		   
		   int row=ps.executeUpdate();
		 
		  //out.println(row);
		   if (row > 0) {
		       //message = "File uploaded and saved into database";
		       //out.println(message);
		       
		       message="Question updated successfully";
		           response.sendRedirect("addquizquestions.jsp?message="+message);
		   }
	}
	
	else if(quiztype.equals("Descriptive") || quiztype.equals("Single Line"))
	{
		 PreparedStatement ps=con1.prepareStatement("Update quiz_questions set Question=?,Marks=? Where Id=? and title=? and Question_type=?");
		   ps.setString(1,question);
		   ps.setInt(2,marks);
		   ps.setInt(3,qid);
			  
		   ps.setString(4,title);
		   ps.setString(5,quiztype);
		   
		   int row=ps.executeUpdate();
		 
		  //out.println(row);
		   if (row > 0) {
		       //message = "File uploaded and saved into database";
		       //out.println(message);
		       
		       message="Question updated successfully";
		           response.sendRedirect("addquizquestions.jsp?message="+message);
		   }
	}
	else
	{
		message="Failed to update Question";
        response.sendRedirect("addquizquestions.jsp?error="+message);
	}
	//con.close(); 
	con1.close();
	}catch(Exception e){
		
		out.println(e.getMessage());
	}  

%>

</body>
</html>