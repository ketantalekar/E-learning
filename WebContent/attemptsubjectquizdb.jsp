<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.text.DateFormat,java.text.*,java.util.Calendar" %>
 <%@ include file="connection.jsp" %>
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
  int qid=Integer.parseInt(request.getParameter("id"));
  String sql = "Select title from quiz_info where Id=?";
  PreparedStatement pstm = con1.prepareStatement(sql);
  pstm.setInt(1,qid);
  String title="";
  ResultSet rs = pstm.executeQuery();
  while(rs.next()) 
  {
  	  	 title = rs.getString("title");
 }

  DateFormat dateFormat = new SimpleDateFormat("hh:mm aa");
  String dateString = dateFormat.format(new Date()).toString();  
  String subject=(String)session.getAttribute("studsubject1");
  String subject2=(String)session.getAttribute("subjectname");
 //String studentname=(String)session.getAttribute("sessname");
 String studentuid=(String)session.getAttribute("sessuid");
 /*String rollno="";
 String sql1 = "Select Roll_no from student_details where Username=? and Userid=?" ;
 PreparedStatement pstm1 = con1.prepareStatement(sql1);
 pstm1.setString(1,studentname);
 pstm1.setString(2,studentuid);
 
 ResultSet rs1 = pstm1.executeQuery();
 while(rs1.next()) 
 {
 	  	 rollno = rs.getString("Roll_no");
}*/

 String qtype="";
 String question="";
 String sql2 = "Select Question_type,Question from quiz_questions where title=? and Subject_code=?" ;
 PreparedStatement pstm2 = con1.prepareStatement(sql2);
 pstm2.setString(1,title);
 pstm2.setString(2,subject);
 int row=0;
 ResultSet rs2 = pstm2.executeQuery();
 int flag=0;

while(rs2.next()) 
 {
	
 	  	 qtype = rs2.getString("Question_type");
 	  	question = rs2.getString("Question");
 	  	
 	  	String sql3 = "Select title,Userid,Subject_code,Question_type,Question from finalquiz where title=? and Subject_code=? and Userid=? and Question_type=? and Question=?" ;
 	   PreparedStatement pstm3 = con1.prepareStatement(sql3);
 	   pstm3.setString(1,title);
 	   pstm3.setString(2,subject);
 	  pstm3.setString(3,studentuid);
	   pstm3.setString(4,qtype);
	   pstm3.setString(5,question);
 	   ResultSet rs3 = pstm3.executeQuery();
 	   if(rs3.next())
 	   {
 		 flag++;  
 	   }
 	   else
 	   {
 		 
 		   PreparedStatement ps=con1.prepareStatement("insert into finalquiz(Userid,Subject_code,title,Question_type,Question) values(?,?,?,?,?)");
 	   ps.setString(1,studentuid);
 	  ps.setString(2,subject);
 	 ps.setString(3,title);
 	 ps.setString(4,qtype);
 	 ps.setString(5,question);
 	    row=ps.executeUpdate();
 	    
 	    
 	  	   
 	   }
}
 if(flag>0)
 {
	 response.sendRedirect("finalexam.jsp?id="+qid+"&page=1&cnt=0");
 }

 if(row>0)
 {
	 int row1=0;
		PreparedStatement ps1=con1.prepareStatement("insert into quizresult(Userid,Subject_code,title,Start_time) values(?,?,?,?)");
	   ps1.setString(1,studentuid);
	  ps1.setString(2,subject);
	 ps1.setString(3,title);
	 ps1.setString(4,dateString);
	 
	    row1=ps1.executeUpdate(); 
 response.sendRedirect("finalexam.jsp?id="+qid+"&page=1&cnt=0");
 }
 con1.close();
 con.close();
  }
  catch(Exception e)
  {
	  out.println(e.getMessage());
  }
  
 

   %>
</body>
</html>