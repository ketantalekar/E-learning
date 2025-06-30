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
String subject=(String)session.getAttribute("studsubject1");
String subject2=(String)session.getAttribute("subjectname");
String studentuid=(String)session.getAttribute("sessuid");
String type1="check1";
String type2="check2";
String type3="check3";
String type4="check4";
String type5="singlechoice";
String type6="truefalse";
String type7="oneword";
String type8="singleline";
String type9="descriptive";
String type10="mult";
String type11="sincho";
String type12="trufal";
String type13="onew";
String type14="singline";
String type15="descr";
String type16="mult1";
String type17="sincho1";
String type18="trufal1";
String type19="onew1";
String type20="singline1";
String type21="descr1";
String type22="singlechoice4";
String type23="truefalse4";
String type=request.getParameter("type");
//out.println(type);

if(type1.equals(type))
{
	String check1=request.getParameter("check1");
if(!check1.equals("N"))
{
	
	//check1=request.getParameter("check1");
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Checkbox1=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,check1);
	   ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);

}
else if(check1.equals("N"))
{
	check1="N";
	//check1=request.getParameter("check1");
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Checkbox1=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,check1);
	   ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);

}
}



if(type2.equals(type))
{
	String check2=request.getParameter("check2");
if(!check2.equals("N"))
{
	
	//check1=request.getParameter("check1");
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Checkbox2=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,check2);
	   ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);

}
else if(check2.equals("N"))
{
	check2="N";
	//check1=request.getParameter("check1");
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Checkbox2=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,check2);
	   ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);

}
}
if(type3.equals(type))
{
	String check3=request.getParameter("check3");
if(!check3.equals("N"))
{
	
	//check1=request.getParameter("check1");
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Checkbox3=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,check3);
	   ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);

}
else if(check3.equals("N"))
{
	check3="N";
	//check1=request.getParameter("check1");
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Checkbox3=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,check3);
	   ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);

}
}
if(type4.equals(type))
{
	String check4=request.getParameter("check4");
if(!check4.equals("N"))
{
	
	//check1=request.getParameter("check1");
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Checkbox4=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,check4);
	   ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);

}
else if(check4.equals("N"))
{
	check4="N";
	//check1=request.getParameter("check1");
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Checkbox4=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,check4);
	   ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);

}
}
if(type5.equals(type))
{
	
	String singlechoice2=request.getParameter("singlechoice2");
if(!singlechoice2.equals("N"))
{
	
	//check1=request.getParameter("check1");
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Answer=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	ps.setString(1,singlechoice2);
	   ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);
}
}

if(type22.equals(type))
{
	
	String singlechoice1=request.getParameter("singlechoice1");
if(!singlechoice1.equals("N"))
{
	
	//check1=request.getParameter("check1");
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Answer=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	ps.setString(1,singlechoice1);
	   ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);

}

}

if(type6.equals(type))
{
	String truefalse1=request.getParameter("truefalse1");
if(!truefalse1.equals("N"))
{
	
	//check1=request.getParameter("check1");
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Answer=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,truefalse1);
	   ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);

}
}

if(type23.equals(type))
{
	String truefalse2=request.getParameter("truefalse2");
if(!truefalse2.equals("N"))
{
	
	//check1=request.getParameter("check1");
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Answer=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,truefalse2);
	   ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);

}
}
if(type7.equals(type))
{
	String oneword=request.getParameter("oneword");
if(!oneword.equals("N"))
{
//out.println("hi");

oneword=request.getParameter("oneword");
//check1=request.getParameter("check1");
int qid=Integer.parseInt(request.getParameter("id"));
int pageno=Integer.parseInt(request.getParameter("page"));
int count3=Integer.parseInt(request.getParameter("count"));
String question=request.getParameter("question");
String qtype=request.getParameter("qtype");
String sql = "Select title from quiz_info where Id=?";
PreparedStatement pstm = con1.prepareStatement(sql);
pstm.setInt(1,qid);
String title="";
ResultSet rs = pstm.executeQuery();

while(rs.next()) 
{
	 
	 title=rs.getString("title");
}
PreparedStatement ps=con1.prepareStatement("Update finalquiz set Answer=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
ps.setString(1,oneword);
 ps.setString(2,title);
 ps.setString(3,studentuid);
 ps.setString(4,subject);
 ps.setString(5,question);
 ps.setString(6,qtype);
 int row=ps.executeUpdate();
 response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);

}
else if(oneword.equals("N"))
{
	oneword=request.getParameter("oneword");
	//out.println(oneword);
//check1=request.getParameter("check1");
int qid=Integer.parseInt(request.getParameter("id"));
int pageno=Integer.parseInt(request.getParameter("page"));
int count3=Integer.parseInt(request.getParameter("count"));
String question=request.getParameter("question");
String qtype=request.getParameter("qtype");
String sql = "Select title from quiz_info where Id=?";
PreparedStatement pstm = con1.prepareStatement(sql);
pstm.setInt(1,qid);
String title="";
ResultSet rs = pstm.executeQuery();

while(rs.next()) 
{
	 
	 title=rs.getString("title");
}
 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Answer=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
 ps.setString(1,oneword);
   ps.setString(2,title);
   ps.setString(3,studentuid);
   ps.setString(4,subject);
   ps.setString(5,question);
   ps.setString(6,qtype);
   int row=ps.executeUpdate();
   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);

}
}
if(type8.equals(type))
{
	String singleliness = request.getParameter("singleline");
if(!singleliness.equals("N"))
{
	singleliness = request.getParameter("singleline");
	int qid=Integer.parseInt(request.getParameter("id"));
int pageno=Integer.parseInt(request.getParameter("page"));
int count3=Integer.parseInt(request.getParameter("count"));
String question=request.getParameter("question");
String qtype=request.getParameter("qtype");
String sql = "Select title from quiz_info where Id=?";
PreparedStatement pstm = con1.prepareStatement(sql);
pstm.setInt(1,qid);
String title="";
ResultSet rs = pstm.executeQuery();

while(rs.next()) 
{
	 
	 title=rs.getString("title");
}
 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Answer=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
 ps.setString(1,singleliness);
   ps.setString(2,title);
   ps.setString(3,studentuid);
   ps.setString(4,subject);
   ps.setString(5,question);
   ps.setString(6,qtype);
   int row=ps.executeUpdate();
   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);
}
else if(singleliness.equals("N"))
{
	singleliness = request.getParameter("singleline");
	int qid=Integer.parseInt(request.getParameter("id"));
int pageno=Integer.parseInt(request.getParameter("page"));
int count3=Integer.parseInt(request.getParameter("count"));
String question=request.getParameter("question");
String qtype=request.getParameter("qtype");
String sql = "Select title from quiz_info where Id=?";
PreparedStatement pstm = con1.prepareStatement(sql);
pstm.setInt(1,qid);
String title="";
ResultSet rs = pstm.executeQuery();

while(rs.next()) 
{
	 
	 title=rs.getString("title");
}
 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Answer=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
 ps.setString(1,singleliness);
   ps.setString(2,title);
   ps.setString(3,studentuid);
   ps.setString(4,subject);
   ps.setString(5,question);
   ps.setString(6,qtype);
   int row=ps.executeUpdate();
  // response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);
}
}



if(type9.equals(type))
{
	
	String descriptive = request.getParameter("descriptive");
	if(!descriptive.equals("N"))
	{
		descriptive = request.getParameter("descriptive");
		int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	//out.println(qid);
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
	String title="";
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	PreparedStatement ps=con1.prepareStatement("Update finalquiz set Answer=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,descriptive);
	   ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   //out.println(descriptive);
	   //out.println(title);
	   //out.println(studentuid);
	  // out.println(subject);
	   //out.println(question);
	   //out.println(qtype);
	  
	  response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);
 
	}
	else if(descriptive.equals("N"))
	{
		descriptive = request.getParameter("descriptive");
		int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	//out.println(qid);
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
	String title="";
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Answer=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,descriptive);
	   ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	  response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);
	}

}

if(type10.equals(type))
{
	String yes="Y";
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Markreview=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,yes);  
	 ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);


}
if(type11.equals(type))
{
	String yes="Y";
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Markreview=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,yes);  
	 ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);


}
if(type12.equals(type))
{
	String yes="Y";
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Markreview=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,yes);  
	 ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);


}
if(type13.equals(type))
{
	String yes="Y";
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Markreview=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,yes);  
	 ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);


}
if(type14.equals(type))
{
	String yes="Y";
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Markreview=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,yes);  
	 ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);


}
if(type15.equals(type))
{
	String yes="Y";
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Markreview=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,yes);  
	 ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);


}

if(type16.equals(type))
{
	String no="N";
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Markreview=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,no);  
	 ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);


}
if(type17.equals(type))
{
	String no="N";
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Markreview=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,no);  
	 ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);


}
if(type18.equals(type))
{
	String no="N";
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Markreview=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,no);  
	 ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);


}
if(type19.equals(type))
{
	String no="N";
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Markreview=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,no);  
	 ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);


}
if(type20.equals(type))
{
	String no="N";
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Markreview=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,no);  
	 ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);


}
if(type21.equals(type))
{
	String no="N";
int qid=Integer.parseInt(request.getParameter("id"));
	int pageno=Integer.parseInt(request.getParameter("page"));
	int count3=Integer.parseInt(request.getParameter("count"));
	String question=request.getParameter("question");
	String qtype=request.getParameter("qtype");
	String sql = "Select title from quiz_info where Id=?";
	PreparedStatement pstm = con1.prepareStatement(sql);
	pstm.setInt(1,qid);
 String title="";
	
	ResultSet rs = pstm.executeQuery();

	while(rs.next()) 
	{
		 
		 title=rs.getString("title");
	}
	 PreparedStatement ps=con1.prepareStatement("Update finalquiz set Markreview=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
	 ps.setString(1,no);  
	 ps.setString(2,title);
	   ps.setString(3,studentuid);
	   ps.setString(4,subject);
	   ps.setString(5,question);
	   ps.setString(6,qtype);
	   int row=ps.executeUpdate();
	   response.sendRedirect("finalexam.jsp?id="+qid+"&page="+pageno+"&cnt="+count3);


}
con1.close();

}
catch(Exception e)
{
	out.println(e.getMessage());
}
%>
</body>
</html>