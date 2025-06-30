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
if(request.getParameter("subjectcode")!=null)
{
String subject1=request.getParameter("subjectcode");
session.setAttribute("subjectname1",subject1);

response.sendRedirect("FacultySubject.jsp?Subject="+subject1);
}
else if(request.getParameter("studsubject")!=null)
{
	String subject2=request.getParameter("studsubject");
	session.setAttribute("studsubject1",subject2);
	response.sendRedirect("StudentSubject.jsp?Subject="+subject2);

	}
else if(request.getParameter("id")!=null)
{
	Integer assignid=new Integer(request.getParameter("id"));
	out.println(assignid);
	session.setAttribute("sessassginid",assignid);
	response.sendRedirect("StudentUploadAssignment.jsp?id="+assignid);

	}

else if(request.getParameter("facassign")!=null)
{
	String subject2=request.getParameter("facassign");
	session.setAttribute("studsubject1",subject2);
	response.sendRedirect("StudentSubjectAssignment.jsp?Subject="+subject2);

	}
else if(request.getParameter("quizup")!=null)
{
	String subject2=request.getParameter("quizup");
	session.setAttribute("studsubject1",subject2);
	response.sendRedirect("StudentSubjectQuiz.jsp?Subject="+subject2);

	}
else if(request.getParameter("sfiles")!=null)
{
	String subject2=request.getParameter("sfiles");
	session.setAttribute("studsubject1",subject2);
	response.sendRedirect("StudentSubjectFile.jsp?Subject="+subject2);

	}
else if(request.getParameter("sfassign")!=null && Integer.parseInt(request.getParameter("ide"))!=0)
{
	String subject2=request.getParameter("sfassign");
	int id=Integer.parseInt(request.getParameter("ide"));
	session.setAttribute("subjectname1",subject2);

	response.sendRedirect("FacultyShowAssignment.jsp?Subject="+subject2+"&id="+id);

	}
else if(request.getParameter("sfquiz")!=null && Integer.parseInt(request.getParameter("idf"))!=0)
{
	String subject2=request.getParameter("sfquiz");
	int id=Integer.parseInt(request.getParameter("idf"));
	session.setAttribute("subjectname1",subject2);

	response.sendRedirect("QuizResponse.jsp?Subject="+subject2+"&id="+id);

	}

%>
</body>
</html>