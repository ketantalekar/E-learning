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
	String question=request.getParameter("question");
	String quiztype=request.getParameter("quizetype");
	out.println(quiztype);
	String title=(String)session.getAttribute("sessquiztitle");
	String checkoption1=request.getParameter("answercheck1");
	String checkoption2=request.getParameter("answercheck2");
	String checkoption3=request.getParameter("answercheck3");
	String checkoption4=request.getParameter("answercheck4");
	
	String radoption1=request.getParameter("answerradio1");
	String radoption2=request.getParameter("answerradio2");
	String radoption3=request.getParameter("answerradio3");
	String radoption4=request.getParameter("answerradio4");
	String correctans=request.getParameter("correctans");
	String correctans1=request.getParameter("correctans1");
	String correctans2=request.getParameter("correctans2");
	String correctans3=request.getParameter("correctans3");
	int marks=0;
    int marks1=0;
    int marks2=0;
    int marks3=0;
    int marks4=0;
    int marks5=0;
    String subject1=(String)session.getAttribute("subjectname1");
    
    
    String cntdata="Select count(Question) from quiz_questions where title=? and Subject_code=?";
    PreparedStatement ps8=con1.prepareStatement(cntdata);
    ps8.setString(1,title);
    ps8.setString(2,subject1);
    ResultSet rs8=ps8.executeQuery();
    int totalrow=0;
    while(rs8.next()){
    totalrow = rs8.getInt(1);
    //out.println(totalrow);

    //out.println("<div id='dis-row'>" +totalrow+"</div>");
    }

    
    
    
	//out.println(marks5);
	if(quiztype.equals("Multiple Choice"))
	{
		totalrow++;
		marks=Integer.parseInt(request.getParameter("marks"));
		
	 PreparedStatement ps=con1.prepareStatement("insert into quiz_questions(title,Question_type,Question,Option1,Option2,Option3,Option4,correct_ans,Marks,Subject_code,Question_no) values(?,?,?,?,?,?,?,?,?,?,?)");
	   ps.setString(1,title);
	   ps.setString(2,quiztype);
	   ps.setString(3,question);
	   ps.setString(4,checkoption1);
	   ps.setString(5,checkoption2);
	   ps.setString(6,checkoption3);
	   ps.setString(7,checkoption4);
	   ps.setString(8,correctans);
	   ps.setInt(9,marks);
	   ps.setString(10,subject1);
	   ps.setInt(11,totalrow);
	   int row=ps.executeUpdate();
		
	  //out.println(row);
	   if (row > 0) {
	       //message = "File uploaded and saved into database";
	       //out.println(message);
	       
	       message="Question added successfully";
	           response.sendRedirect("addquizquestions.jsp?message="+message);
	   }
		
	}
	else if(quiztype.equals("Single Choice"))
	{  
		totalrow++;
		marks=0;
		marks1=Integer.parseInt(request.getParameter("marks1"));
		if(radoption1.equals(correctans3) || radoption2.equals(correctans3) || radoption3.equals(correctans3) || radoption4.equals(correctans3))
		{
		 PreparedStatement ps=con1.prepareStatement("insert into quiz_questions(title,Question_type,Question,Option1,Option2,Option3,Option4,correct_ans,Marks,Subject_code,Question_no) values(?,?,?,?,?,?,?,?,?,?,?)");
		   ps.setString(1,title);
		   ps.setString(2,quiztype);
		   ps.setString(3,question);
		   ps.setString(4,radoption1);
		   ps.setString(5,radoption2);
		   ps.setString(6,radoption3);
		   ps.setString(7,radoption4);
		   ps.setString(8,correctans3);
		  ps.setInt(9,marks1);
		  ps.setString(10,subject1);
		  ps.setInt(11,totalrow);
		  
		   int row=ps.executeUpdate();
		 
		  //out.println(row);
		   if (row > 0) {
		       //message = "File uploaded and saved into database";
		       //out.println(message);
		       
		       message="Question added successfully";
		           response.sendRedirect("addquizquestions.jsp?message="+message);
		   }    
		}
		else
		{
			 message="Please enter valid answer";
	           response.sendRedirect("addquizquestions.jsp?error="+message);
		}
	}
	else if(quiztype.equals("True or False"))
	{
		totalrow++;
		marks=0;
		marks2=Integer.parseInt(request.getParameter("marks2"));
		 PreparedStatement ps=con1.prepareStatement("insert into quiz_questions(title,Question_type,Question,correct_ans,Marks,Subject_code,Question_no) values(?,?,?,?,?,?,?)");
		   ps.setString(1,title);
		   ps.setString(2,quiztype);
		   ps.setString(3,question);
		   ps.setString(4,correctans1);
		   ps.setInt(5,marks2);
		   ps.setString(6,subject1);
		   ps.setInt(7,totalrow);
		   int row=ps.executeUpdate();
		 
		  //out.println(row);
		   if (row > 0) {
		       //message = "File uploaded and saved into database";
		       //out.println(message);
		       
		       message="Question added successfully";
		           response.sendRedirect("addquizquestions.jsp?message="+message);
		   }
	}
	else if(quiztype.equals("One Word"))
	{
		totalrow++;
		marks=0;
	marks5=Integer.parseInt(request.getParameter("marks5"));
		 PreparedStatement ps=con1.prepareStatement("insert into quiz_questions(title,Question_type,Question,correct_ans,Marks,Subject_code,Question_no) values(?,?,?,?,?,?,?)");
		   ps.setString(1,title);
		   ps.setString(2,quiztype);
		   ps.setString(3,question);
		   ps.setString(4,correctans2);
		   ps.setInt(5,marks5);
		   ps.setString(6,subject1);
		   ps.setInt(7,totalrow);
		   int row=ps.executeUpdate();
		 
		  //out.println(row);
		   if (row > 0) {
		       //message = "File uploaded and saved into database";
		       //out.println(message);
		       
		       message="Question added successfully";
		           response.sendRedirect("addquizquestions.jsp?message="+message);
		   }
	}
	else if(quiztype.equals("Single Line"))
	{
		totalrow++;
		marks=0;
		marks3=Integer.parseInt(request.getParameter("marks3"));
		 PreparedStatement ps=con1.prepareStatement("insert into quiz_questions(title,Question_type,Question,Marks,Subject_code,Question_no) values(?,?,?,?,?,?)");
		   ps.setString(1,title);
		   ps.setString(2,quiztype);
		   ps.setString(3,question);
		   ps.setInt(4,marks3);
		   ps.setString(5,subject1);
		   ps.setInt(6,totalrow);
		
		   int row=ps.executeUpdate();
		 
		  //out.println(row);
		   if (row > 0) {
		       //message = "File uploaded and saved into database";
		       //out.println(message);
		       
		       message="Question added successfully";
		           response.sendRedirect("addquizquestions.jsp?message="+message);
		   }
	}
	else if(quiztype.equals("Descriptive"))
	{
		totalrow++;
		marks=0;
		marks4=Integer.parseInt(request.getParameter("marks4"));
		 PreparedStatement ps=con1.prepareStatement("insert into quiz_questions(title,Question_type,Question,Marks,Subject_code,Question_no) values(?,?,?,?,?,?)");
		   ps.setString(1,title);
		   ps.setString(2,quiztype);
		   ps.setString(3,question);
		   ps.setInt(4,marks4);
		   ps.setString(5,subject1);
		   ps.setInt(6,totalrow);
		   int row=ps.executeUpdate();
		 
		  //out.println(row);
		   if (row > 0) {
		       //message = "File uploaded and saved into database";
		       //out.println(message);
		       
		       message="Question added successfully";
		           response.sendRedirect("addquizquestions.jsp?message="+message);
		   }
	}
	else
	{

	       message="Failed to add question";
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