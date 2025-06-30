<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.text.DateFormat,java.text.*,java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
try
{
String collegename=(String)session.getAttribute("colcode");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
String subject=(String)session.getAttribute("subjectname1");
String subject2=(String)session.getAttribute("subjectname");
String type8="check20";
String type=request.getParameter("type");
int qid=Integer.parseInt(request.getParameter("id"));
String sql = "Select title from quiz_info where Id=?";
PreparedStatement pstm = con1.prepareStatement(sql);
pstm.setInt(1,qid);
String title="";
String type1="mult";
String type2="sing";
String type3="trufal";
String type4="onew";
String type5="sline";
String type6="desc";
String type7="button";
String message="Please enter valid marks";
String message1="Please enter valid marks";
String message2="Please enter valid marks";
String message3="Please enter valid marks";
String message4="Please enter valid marks";
String message5="Please enter valid marks";


ResultSet rs = pstm.executeQuery();

while(rs.next()) 
{
	 
	 title=rs.getString("title");
}



if(type8.equals(type))
{
	
String check1=request.getParameter("check1");


	PreparedStatement ps=con1.prepareStatement("Update quiz_info set Preview=? Where title=? and Id=? and subject=?");
	 ps.setString(1,check1);
	   ps.setString(2,title);
	   ps.setInt(3,qid);
	   ps.setString(4,subject);
	   
	  
	   int row=ps.executeUpdate();
	   response.sendRedirect("QuizResponse.jsp?id="+qid);

	 

}
else
{
int quizresultid=Integer.parseInt(request.getParameter("qrid"));;
String question=request.getParameter("question");
String qtype=request.getParameter("qtype");

String sql6 = "Select Userid from quizresult where Id=?";
PreparedStatement pstm6 = con1.prepareStatement(sql6);
pstm6.setInt(1,quizresultid);
String userid="";
ResultSet rs6 = pstm6.executeQuery();
if(rs6.next())
{
	userid=rs6.getString("Userid");
}

if(type1.equals(type))
{
if(Integer.parseInt(request.getParameter("marks"))!=0 || Integer.parseInt(request.getParameter("marks"))==0)
{
int marks=Integer.parseInt(request.getParameter("marks"));
int mainmarks=Integer.parseInt(request.getParameter("mainmarks"));
int qno=Integer.parseInt(request.getParameter("qno"));
if(mainmarks<marks)
{
	response.sendRedirect("ViewResponses.jsp?id="+qid+"&qrid="+quizresultid+"&message="+message+"&qno="+qno);
}
else
{
	PreparedStatement ps=con1.prepareStatement("Update finalquiz set Marks=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setInt(1,marks);
	   ps.setString(2,title);
	   ps.setString(3,userid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("ViewResponses.jsp?id="+qid+"&qrid="+quizresultid);
}

}
}
if(type2.equals(type))
{
if(Integer.parseInt(request.getParameter("marks1"))!=0 || Integer.parseInt(request.getParameter("marks1"))==0)
{
	int marks=Integer.parseInt(request.getParameter("marks1"));
	int mainmarks=Integer.parseInt(request.getParameter("mainmarks"));
	int qno=Integer.parseInt(request.getParameter("qno"));
	if(mainmarks<marks)
	{
		response.sendRedirect("ViewResponses.jsp?id="+qid+"&qrid="+quizresultid+"&message1="+message1+"&qno1="+qno);
	}
	else
	{
	PreparedStatement ps=con1.prepareStatement("Update finalquiz set Marks=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setInt(1,marks);
	   ps.setString(2,title);
	   ps.setString(3,userid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	  
		
	   response.sendRedirect("ViewResponses.jsp?id="+qid+"&qrid="+quizresultid);

	}
}
}
if(type3.equals(type))
{
if(Integer.parseInt(request.getParameter("marks2"))!=0 || Integer.parseInt(request.getParameter("marks2"))==0)
{
	
	int marks=Integer.parseInt(request.getParameter("marks2"));
	int mainmarks=Integer.parseInt(request.getParameter("mainmarks"));
	int qno=Integer.parseInt(request.getParameter("qno"));
	if(mainmarks<marks)
	{
		response.sendRedirect("ViewResponses.jsp?id="+qid+"&qrid="+quizresultid+"&message2="+message2+"&qno2="+qno);
	}
	else
	{
	PreparedStatement ps=con1.prepareStatement("Update finalquiz set Marks=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setInt(1,marks);
	   ps.setString(2,title);
	   ps.setString(3,userid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	  
		
	   response.sendRedirect("ViewResponses.jsp?id="+qid+"&qrid="+quizresultid);

	}
}
}
if(type4.equals(type))
{
if(Integer.parseInt(request.getParameter("marks3"))!=0 || Integer.parseInt(request.getParameter("marks3"))==0)
{
	
	int marks=Integer.parseInt(request.getParameter("marks3"));
	int mainmarks=Integer.parseInt(request.getParameter("mainmarks"));
	int qno=Integer.parseInt(request.getParameter("qno"));
	if(mainmarks<marks)
	{
		response.sendRedirect("ViewResponses.jsp?id="+qid+"&qrid="+quizresultid+"&message3="+message3+"&qno3="+qno);
	}
	else
	{
	PreparedStatement ps=con1.prepareStatement("Update finalquiz set Marks=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setInt(1,marks);
	   ps.setString(2,title);
	   ps.setString(3,userid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	  
		
	   response.sendRedirect("ViewResponses.jsp?id="+qid+"&qrid="+quizresultid);
	}
	 
}
}
if(type5.equals(type))
{
if(Integer.parseInt(request.getParameter("marks4"))!=0 || Integer.parseInt(request.getParameter("marks4"))==0)
{
	
	int marks=Integer.parseInt(request.getParameter("marks4"));
	int mainmarks=Integer.parseInt(request.getParameter("mainmarks"));
	int qno=Integer.parseInt(request.getParameter("qno"));
	if(mainmarks<marks)
	{
		response.sendRedirect("ViewResponses.jsp?id="+qid+"&qrid="+quizresultid+"&message4="+message4+"&qno4="+qno);
	}
	else
	{
	PreparedStatement ps=con1.prepareStatement("Update finalquiz set Marks=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setInt(1,marks);
	   ps.setString(2,title);
	   ps.setString(3,userid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	  
		
	  
	   response.sendRedirect("ViewResponses.jsp?id="+qid+"&qrid="+quizresultid);

	} 
}
}
if(type6.equals(type))
{
if(Integer.parseInt(request.getParameter("marks5"))!=0 || Integer.parseInt(request.getParameter("marks5"))==0)
{
	int marks=Integer.parseInt(request.getParameter("marks5"));
	int mainmarks=Integer.parseInt(request.getParameter("mainmarks"));
	int qno=Integer.parseInt(request.getParameter("qno"));
	if(mainmarks<marks)
	{
		response.sendRedirect("ViewResponses.jsp?id="+qid+"&qrid="+quizresultid+"&message5="+message5+"&qno5="+qno);
	}
	else
	{
	PreparedStatement ps=con1.prepareStatement("Update finalquiz set Marks=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setInt(1,marks);
	   ps.setString(2,title);
	   ps.setString(3,userid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	  
	  response.sendRedirect("ViewResponses.jsp?id="+qid+"&qrid="+quizresultid);

	} 
}
}
if(type7.equals(type))
{
String update="Y";
	PreparedStatement ps=con1.prepareStatement("Update quizresult set Updated=? Where title=? and Userid=? and Subject_code=? and Id=?");
	 ps.setString(1,update);
	   ps.setString(2,title);
	   ps.setString(3,userid);
	   ps.setString(4,subject);
	   ps.setInt(5,quizresultid);
	  
	   int row=ps.executeUpdate();
	 
		
	  
	   response.sendRedirect("ViewResponses.jsp?id="+qid+"&qrid="+quizresultid);

	 

}
}

con1.close();
}
catch(Exception e)
{
	out.println(e.getMessage());
	e.printStackTrace();
}
%>
</body>
</html>