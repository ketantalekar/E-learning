<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ include file="connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Panel</title>

 <style>
body
{
background-image:url("images/firstpage_cover.jpg");
background-repeat: no-repeat;
width:98%;
background-size: cover;
 }
 .container1{
  margin-top:120px;
  margin-left:31%;
  background: rgb(0, 0, 0); /* Fallback color */
  background: rgba(0, 0, 0, 0.5); /* Black background with 0.5 opacity */
  color: #f1f1f1;
  width: 448px;
height:430px;
  padding: 20px;
}
#title
{
color:white;
font-size:21px;
}
#title1
{
color:white;
font-size:21px;

margin-left:50px;
}
#titl
{
color:orange;
font-size:21px;
text-decoration:underline;
}
#titl1
{
color:orange;
font-size:23px;
margin-left:133px;
}
input[type="text"] {
border-radius:2px;
font-family:Times New Roman;
font-size:20px;
  width: 80%;
  padding: 10px 65px;
margin: 9px 0px;
 box-sizing: border-box;
margin-left:40px;
border:1px solid white;
}
input[type="text"]:focus{
  border: 2px solid #1DA1F2;
box-shadow:0 0 8px 0 #1DA1F2;
outline:none;
}
input[type="checkbox"] {
width:15px;
height:15px;
margin-top:10px;
}
input[type="password"] {
border-radius:2px;
font-family:Times New Roman;
font-size:20px;
  width: 80%;
  padding: 10px 65px;
margin: 9px 0px;
 box-sizing: border-box;
margin-left:40px;
border:1px solid white;
}
input[type="password"]:focus{
  border: 2px solid #1DA1F2;
box-shadow:0 0 8px 0 #1DA1F2;
outline:none;
}
#side
{
width:50px;
height:41px;
position:absolute;
margin-top:11.1px;
margin-left:40.8px;
}
 .bo
{
border-radius:2px;
font-size:20px;
width: 80%;
  padding:10px 65px;
font-family:Times New Roman;
margin: 9px 0px;
margin-left:40px;
}
.bo:focus{
  border: 2px solid #1DA1F2;
box-shadow:0 0 8px 0 #1DA1F2;
outline:none;
}
#left
{

color:white;

margin-left:40px;
}
#size
{
font-size:21px;
}
.button{
border-radius:2px;
  display: block;
  width:20%;
  margin-top:20px;
font-size: 18px;
height:35px;
  border: none;
  outline: none;
  cursor: pointer;
  color:black;
margin-left:170px;
background-image:url("images/tt.JPG");
}
a
{
text-decoration:none;
}
 .container2{
  margin-left:31%;
  background: rgb(0, 0, 0); /* Fallback color */
  background: rgba(0, 0, 0, 0.5); /* Black background with 0.5 opacity */
  color: red;
  width: 448px;
height:auto;
  padding: 20px;
}
#remark
{
color:red;
font-size:21px;
font-weight:bold;
background:white;
}
 </style> 

</head>
<body onload="validate1();">

<div class="container1">
<span id="title">Sign In</span><br><br>
<form action="login_validation.jsp"method="post">
<img id="side"src="images/logas.jpg"></img><select onchange="validate2();"id="login_as"name="loginas" class="bo">
 <option value="--Select Login Type--">--Select Login Type--</option>
<option value="Vendor">Vendor</option>
<option value="College Admin">College Admin</option>
<option value="Faculty">Faculty</option>
<option value="Student">Student</option>
</select><br>
<img id="side"src="images/user.JPG"></img><input type="text"name="username"autocomplete="off"placeholder="User Id" required><br>
<img id="side"src="images/lock.JPG"></img><input type="password"name="password"placeholder="Password" required><br>
<img id="side"src="images/college.JPG"></img><input id="cname"type="text"autocomplete="off"name="collegename"placeholder="College Code" required><br>
   <input id="left"type="checkbox" id="remember_me" name="_remember_me" />
     <label id="size" for="remember_me">Remember Me</label><br>
    <input class="button"type="submit"name="signin"value="Sign In"><br>
   <!--  <span id="title1">Don't have an account?</span><a href="vendor_reg.jsp"><span id="titl"> Sign Up</span></a><br> -->
    <a href="forget.jsp"><span id="titl1"> Forgot Password?</span></a><br>
    
</form>
<script>
function validate1()
{

	 //document.getElementById("cname").disabled=false;
	 var login=document.getElementById("login_as").value;
if(login=="Vendor")
	{
	 document.getElementById("cname").disabled=true;
	}
else
	{
	document.getElementById("cname").disabled=false;
	
	}
}
function validate2()
{
var login=document.getElementById("login_as").value;
if(login=="Vendor")
	{
	 document.getElementById("cname").disabled=true;
	}
else
	{
	document.getElementById("cname").disabled=false;
	
	}
}
</script>
</div><br>
<div class="container2">
<center><span id="remark"><%out.println(session.getAttribute("Name"));%></span></center>
</div>

</body>
</html>