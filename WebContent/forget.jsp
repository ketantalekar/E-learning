<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Forgot Password?</title>
 <style>
 #const
{
    display:none;
}
body{
   height: 97vh;
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: sans-serif;
  
  background: url(images/bg.jpg);
  background-size: cover;
  background-position: center;
}
.container{
  position: relative;
  width: 650px;
  background: white;
  padding: 10px 40px;
height:300px;
margin-top:-100px;
}
#heading
{
font-weight:bold;
font-size:22px;
margin-top:8px;
}
#content
{
font-size:20px;
}

.input-field, form .button{
  margin: 25px 0;
  position: relative;
  height: 50px;
  width: 100%;
}
.input-field input{
  height: 100%;
  width: 100%;
  border: 2px solid silver;
  padding-left: 15px;
  outline: none;
  font-size: 19px;
  transition: .4s;
}
input:focus{
  border: 2px solid #1DA1F2;
box-shadow:0 0 8px 0 #1DA1F2;
}


.input-field label{
  left: 15px;
  pointer-events: none;
  color: grey;
  font-size: 18px;
  transition: .4s;
}


form .button{
  margin-top: 30px;
  overflow: hidden;
  z-index: 111;
}
.button .inner{
  position: absolute;
  height: 100%;
  width: 300%;
  left: -100%;
  z-index: -1;
  transition: all .4s;
background:-webkit-linear-gradient(right,#ff5f6d,#ffc371,#ff5f6d,#ffc371);
 }
.button:hover .inner{
  left: 0;
}
.button .button1{
  width: 100%;
  height: 100%;
  border: none;
  background: none;
  outline: none;
  color: white;
  font-size: 20px;
  cursor: pointer;
  font-family: 'Montserrat', sans-serif;

}

.container .auth{
  margin: 35px 0 20px 0;
  font-size: 19px;
  color: grey;
}
.links{
  display: flex;
  cursor: pointer;
}
.links i{
  font-size: 23px;
  line-height: 40px;
  margin-left: -90px;
}
.links span{
  position: absolute;
  font-size: 17px;
  font-weight: bold;
  padding-left: 8px;
  font-family: 'Open Sans', sans-serif;
}
.signup{
border-radius:2px;
  margin-top: 20px;
  font-family: 'Noto Sans', sans-serif;
}
.signup a{
  color: #665ed0;
  text-decoration: none;
font-weight:bold;
font-size:19px;
}
.signup a:hover{
color:#3498db;

}
.sign
{
margin-top:0px;
margin-left:38%;
position:fixed;
color: #4b4f56;;
font-family:inherit;
font-weight:100;
font-size:20px;
text-align:center;
border:solid 1px #4b4f56;;
border-radius:1%;
padding:7px 20px;
text-decoration:none;
}
.sign:hover
{
background-color:#E8E8E8;


}
.j
{
margin-top:0px;
margin-left:30%;
position:fixed;
color:white;
font-family:inherit;
font-weight:100;
font-size:20px;
text-align:center;
border:solid 0px #0073b1;
border-radius:1%;
padding:8px 20px;
text-decoration:none;
background-color:#0073b1;
}
.j:hover
{
background-color:#1E90FF;
color:white;
}
</style>
</head>
<body>

<form action="forgot_valid.jsp"method="post">
<div class="container">
<div id="heading">Find Your Account</div>
<hr>
<div id="content">Please enter your Userid and College Code to search for your account.
</div>
<div class="input-field">
          <input type="text"name="userid"placeholder="Userid"autocomplete="off"id="contact" required>
          
        </div>  
<div class="input-field">
          <input type="text"placeholder="College Code"name="colcode"autocomplete="off"id="contact">
          
        </div>  

<% 
if(request.getParameter("message")!=null)
{
	String message=request.getParameter("message");
	out.println("<span style='color:blue;position:absolute;font-weight:bold;'>"+message+"</span>");
	}
else if(request.getParameter("error")!=null)
{
	String error=request.getParameter("error");
	out.println("<span style='color:red;position:absolute;font-weight:bold;'>"+error+"</span>");
	}
%>
<input type="submit" class="j"name="search"value="Search">
<a class="sign"href="login.html">Back</a>
</div>
</form>
</body>
</html>