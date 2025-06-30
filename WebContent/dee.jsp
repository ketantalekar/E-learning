<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*,java.util.Properties,com.email.durgesh.Email" %>
   




<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
  Email email=new Email("ng631005@gmail.com","durgakishore123");
 	 email.setFrom("ng631005@gmail.com","E-learning");
 	 email.setSubject("New Assignment is added in Java");
 	 email.setContent("<h4> Dear Krishna,</h4>New Assignment has been added in Java","text/html");
 	 email.addRecipient("ng631005@gmail.com");
 	 email.send(); 
 	 %>
</body>
</html>