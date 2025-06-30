<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.text.DateFormat,java.text.*,java.util.Calendar" %>
   <%@ page import="java.util.*,com.Data.*,java.sql.*" %>  
<%@ include file="connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Vendor</title>

<link href="Bootstrap/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="Bootstrap/css/style.css" rel="stylesheet" type="text/css"></link>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>


  <style>

#panel1 {
  display:none;
  
}
.otable {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  
  width: 90%;
}

.otable td, .otable th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align:center;
}
.otable td
{
color:black;
}
.otable tr:nth-child(odd){background-color: #EAF2F8;}

.otable tr:hover {background-color: #D1F2EB;}

.otable th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #2980B9;
  color: white;
}
.trout
{
padding:0px;
}
.btn-room
{
background:#2980B9;
float:right;
    color: #fff;
    width: 160px;
    display: inline-block;
padding:10px 20px;
    text-transform: uppercase;
    font-size: 16px;
    font-weight: bold;
   margin-left:30px;
   margin-right:30px;
   margin-top:0px;
   margin-bottom:30px;
border:none;
border-radius:5%;
text-decoration:none;
}
#dis-row
{

margin-left:1120px;
position:absolute;

}
#buttons
{
text-decoration:none;
color:white;
}
.dropdown .dropdown-menu #noti::-webkit-scrollbar {
  width:10px;

}


.dropdown .dropdown-menu #noti::-webkit-scrollbar-track {
  background: #f1f1f1; 
}

.dropdown .dropdown-menu #noti::-webkit-scrollbar-thumb {
  background: #888; 
border-radius:10px;
}


.dropdown .dropdown-menu #noti::-webkit-scrollbar-thumb:hover {
  background: #555; 
}



.dropdown-item {
  display: block;
  width: 100%;
  padding: 0.25rem 1.5rem;
  clear: both;
  font-weight: 400;
  color: #3a3b45;
  text-align: inherit;
  white-space: nowrap;
  background-color: transparent;
  border: 0;
 }
.dropdown .dropdown-menu #noti
{
 max-height:350px;
  overflow-x:hidden;
  overflow-y:scroll;

}
.dropdown .dropdown-menu #unread
{
 max-height:350px;
  overflow-x:hidden;
  overflow-y:scroll;

}
.dropdown .dropdown-menu #unread::-webkit-scrollbar {
  width:10px;

}


.dropdown .dropdown-menu #unread::-webkit-scrollbar-track {
  background: #f1f1f1; 
}

.dropdown .dropdown-menu #unread::-webkit-scrollbar-thumb {
  background: #888; 
border-radius:10px;
}


.dropdown .dropdown-menu #unread::-webkit-scrollbar-thumb:hover {
  background: #555; 
}
.dropdown-header {
  display: block;
  padding: 0.5rem 1.5rem;
  margin-bottom: 0;
  font-size:1rem;
  color: #858796;
  white-space: nowrap;
}


.topbar .dropdown-list .dropdown-header {
  background-color: #4e73df;
  border: 1px solid #4e73df;
  padding-top: 1rem;
  padding-bottom: 0.75rem;
  color: #fff;
}

.dropdown .dropdown-menu .dropdown-header {
  font-weight: 800;
  font-size: 1rem;
  color: white;
}
.dropdown .dropdown-menu {
    font-size: 1rem;
}
.mr-3
 {
  margin-right: 1.5rem !important;
}

.btn-room
{
float:right;
    color: #fff;
    width: 180px;
    display: inline-block;
padding:10px 12px;
    text-transform: uppercase;
    font-size: 16px;
    font-weight: bold;
   margin-left:0px;
   margin-right:70px;
   margin-top:10px;
   margin-bottom:30px;
border:none;
border-radius:5%;
text-decoration:none;
text-align: center;
background:#2980B9;
}
#alertsDropdown:focus
{
color:blue;
}
.icon-circle {
  display: inline-block;
  border-radius: 60px;
  box-shadow: 0px 0px 2px #888;
  padding: 0.5em 0.6em;

}
#messagesDropdown:focus
{
color:blue;
}
a {
  color: lightgrey;
  text-decoration: none;
  background-color: transparent;
}
a:hover {
  color: #909497;
  text-decoration: underline;
}
#capimg
{
border-radius:2px;

font-size:25px;
  width: 40%;
  padding: 25px 50px;
margin: 9px 0px;
 box-sizing: border-box;
margin-left:150px;
border:1px solid white;
color:black;
text-rendering: optimizelegibility;
    text-shadow: 0 0 3px rgba(0, 0, 0, .8);
font-family:Brushstroke, fantasy;
font-weight:bold;
background:#CCCCCC;
text-align:center;
}
#cap:focus
{
border:1px solid white;
}

.container
{
margin-left:200px;
margin-top:80px;
}
.modal-confirm .modal-header {
	border-bottom: none;   
	position: relative;
}
.modal-confirm {		
	color: #636363;
	width: 600px;
}
.modal-confirm .icon-box {
	width: 80px;
	height: 80px;
	margin: 0 auto;
	border-radius: 50%;
	z-index: 9;
	text-align: center;
	border: 3px solid #f15e5e;
}
.modal-confirm .icon-box i {
	color: #f15e5e;
	font-size: 46px;
	display: inline-block;
	margin-top: 13px;
}
.modal-confirm h4 {
	text-align: center;
	font-size: 26px;
	margin: 30px 0 -10px;
}
.modal-confirm .close {
	position: absolute;
	top: 5px;
	right: 15px;
	font-size:30px;
}
.modal-confirm h4 {
	text-align: center;
	font-size: 26px;
	margin: 30px 0 -10px;
}
.modal-confirm .modal-body {
	color: #999;
}
.modal-confirm .modal-footer {
	border: none;
	text-align: center;		
	border-radius: 5px;
	font-size: 13px;
	padding: 10px 15px 25px;
}
.modal-confirm .modal-footer a {
	color: #999;
}
.modal-confirm .modal-content {
	padding: 20px;
	border-radius: 5px;
	border: none;
	text-align: center;
	font-size: 20px;
}
.modal-confirm .btn, .modal-confirm .btn:active{
	color: #fff;
	border-radius: 4px;
	background: #60c7c1;
	text-decoration: none;
	transition: all 0.4s;
	line-height: normal;
	min-width: 120px;
	border: none;
	min-height: 40px;
	border-radius: 3px;
	margin: 0 5px;
}
.modal-confirm .btn-secondary {
	background: #c1c1c1;
}
.modal-confirm .btn-secondary:hover, .modal-confirm .btn-secondary:focus {
	background: #a8a8a8;
}
.modal-confirm .btn-danger {
	background: #f15e5e;
}
.modal-confirm .btn-danger:hover, .modal-confirm .btn-danger:focus {
	background: #ee3535;
}
.trigger-btn {
	display: inline-block;
	margin: 100px auto;
}

</style>
</head>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
        <div class="sidebar-brand-text mx-3">Welcome <%out.println(session.getAttribute("sessname"));%></div>
      </a>

      <hr class="sidebar-divider my-0">

      <li class="nav-item">
        <a class="nav-link" href="VendorDashboard.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

       <li class="nav-item active">
        <a class="nav-link collapsed" href="vendor_reg.jsp">
          <i class="fa fa-user"></i>
          <span>Vendor</span>
        </a>
      </li>
      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="College_Details.jsp">
          <i class="fa fa-graduation-cap"></i>
          <span>Colleges</span>
        </a>
      </li>

<li class="nav-item">
        <a class="nav-link collapsed" href="Vendorchat.jsp">
          <i class="fa fa-comments"></i>
          <span>Chat</span>
        </a>
        </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="vcourses.jsp">
          <i class="fa fa-book"></i>
          <span>Courses</span>
        </a>
        </li>
        
      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="VendorFeedback.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Feedback</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

       
    </ul>
  <div id="content-wrapper" class="d-flex flex-column">

      <div id="content">
      <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
          E-Learning Portal
           
       <ul class="navbar-nav ml-auto">
        <form class=" d-sm-inline-block form-inline mr-3 mt-1 ml-md-3 my-3 my-md-10 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-silver border-1 small"autocomplete="off" id="myInput6" onkeyup="myFunction()" placeholder="Search for vendor" aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button onclick="myFunction()"class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>
          
      <%
      PreparedStatement pstmt46=null;
      int psstatus=0,proffstatus=0,proffpicstatus=0,totalsta=0;
      pstmt46=con.prepareStatement("SELECT ProfilePicStatus,ProfileStatus,PasswordStatus FROM admin_details WHERE Userid=?");
      pstmt46.setString(1,(String)session.getAttribute("sessuid"));
      ResultSet rs46=pstmt46.executeQuery();
      if(rs46.next())
      {     
    	
    	  proffpicstatus=rs46.getInt(1);
    	  proffstatus=rs46.getInt(2);
    	  psstatus=rs46.getInt(3);
      
      }
      int stt=1;
      int cntfeedbackstt=0,ttlfeedback=0;
      PreparedStatement pstmt47=null;
      pstmt47=con.prepareStatement("SELECT count(Status) FROM feedback_details WHERE Status=?");
      pstmt47.setInt(1,stt);
      ResultSet rs47=pstmt47.executeQuery();
      while(rs47.next())
      {     
    	  cntfeedbackstt=rs47.getInt(1);
    	  ttlfeedback= ttlfeedback+cntfeedbackstt;
    	 
      }
      totalsta=proffpicstatus+proffstatus+psstatus+ttlfeedback;
      
      %>
      <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
               <%
               if(totalsta!=0)
               {
               %>
                  <span class="badge badge-danger badge-counter"><%=totalsta%></span>
             <%
             }
             %>
              </a>
                 <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h4 class="dropdown-header">
                  Notifications
                </h4>
                <div id="noti">
            
                
              
<%
try
{
Date today = new Date();  
SimpleDateFormat formatter6 = new SimpleDateFormat("dd/MM/yyyy"); 
String strDate6= formatter6.format(today); 
if(proffpicstatus!=0) 
{
	%>

<a class="dropdown-item d-flex align-items-center" href="Vsettings.jsp">
<div class="mr-3">
  <div class="icon-circle bg-warning">
    <i class="fas fa-exclamation-triangle text-white"></i>
  </div>
</div>
<div>

<div class="small text-gray-500"><%=today %></div>
You have Successfully Updated Your Profile Picture
</div>
</a>	
<%
}
if(proffstatus!=0) 
{
	%>

<a class="dropdown-item d-flex align-items-center" href="Vendorprofile.jsp">
<div class="mr-3">
  <div class="icon-circle bg-warning">
    <i class="fas fa-exclamation-triangle text-white"></i>
  </div>
</div>
<div>

<div class="small text-gray-500"><%=today %></div>
You have Successfully Updated Your Profile 
</div>
</a>	
<%
}
if(psstatus!=0) 
{
	%>

<a class="dropdown-item d-flex align-items-center" href="Vsettings.jsp">
<div class="mr-3">
  <div class="icon-circle bg-warning">
    <i class="fas fa-exclamation-triangle text-white"></i>
  </div>
</div>
<div>

<div class="small text-gray-500"><%=today %></div>
You have Successfully Updated Your Password
</div>
</a>	
<%
}
if(ttlfeedback!=0) 
{
	%>

<a class="dropdown-item d-flex align-items-center" href="VendorFeedback.jsp">
<div class="mr-3">
  <div class="icon-circle bg-warning">
    <i class="fas fa-exclamation-triangle text-white"></i>
  </div>
</div>
<div>
<% 
if(ttlfeedback>1) 
{
	%>

<b><%=ttlfeedback %></b> people have sent the feedback
<%
}
else if(ttlfeedback==1)
{
	%>
	<b><%=ttlfeedback %></b> person has sent the feedback
	<%
}
%>
</div>
</a>	
<%
}
if(proffpicstatus==0 && psstatus==0 && proffstatus==0 && ttlfeedback==0) 
{
%>
	
	<div style="margin-top:20px;text-align:center;">No Notifications are available right now</div><div style="margin-top:20px;"></div>
	
	<%
}

}
catch(Exception e)
{
	out.println(e.getMessage());
}
%>
</div>
 </div>
            </li>
<%
PreparedStatement pstmt40=null;
int privatestat=1;
int countprivat=0;

pstmt40=con.prepareStatement("SELECT count(Status) FROM private_chat WHERE Reciever=? and Status=? order by id desc");
pstmt40.setString(1,(String)session.getAttribute("sessuid"));
pstmt40.setInt(2,privatestat);
ResultSet rs40=pstmt40.executeQuery();
if(rs40.next())
{
	countprivat=rs40.getInt(1);
}


%>

  <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- Counter - Messages -->
                <%
                if(countprivat!=0)
                {
                %>
                <span class="badge badge-danger badge-counter"><%=countprivat %></span>
                <%
                }
                %>
              </a>
          <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                <h4 class="dropdown-header">
                  Unread Messages
                </h4>
                <div id="unread">
                <%
                try
                {
                	
                    PreparedStatement pstmt41=null;
                    String chatmessage="",privatesende="",privatedat="",privatetim="";
                    int privatestatu=1;
                    pstmt41=con.prepareStatement("SELECT Sender,Message,Date,Time FROM private_chat WHERE Reciever=? and Status=? order by id desc");
                    pstmt41.setString(1,(String)session.getAttribute("sessuid"));
                    pstmt41.setInt(2,privatestatu);
                    ResultSet rs41=pstmt41.executeQuery();
                    while(rs41.next())
                    {
                    	privatesende=rs41.getString(1);
                    	chatmessage=rs41.getString(2);
                    	privatedat=rs41.getString(3);
                    	privatetim=rs41.getString(4);
                    	 
                    	 PreparedStatement pstmt42=null;
                    	 String privatesendernam="";
                    	 pstmt42=con.prepareStatement("SELECT Username FROM admin_details WHERE Userid = ? union all SELECT Username FROM college_admin_details WHERE Userid = ?");
                    	 pstmt42.setString(1,privatesende);
                    	 pstmt42.setString(2,privatesende);
                    	 
                    	 ResultSet rs42=pstmt42.executeQuery();
                    	 if(rs42.next())
                    	 {
                    		 privatesendernam=rs42.getString(1);
                    	 }
                    	 if(!chatmessage.equals(""))
                    	 {
                    %>
                    
                   <a class="dropdown-item d-flex align-items-center" href="chat.jsp?people=<%=privatesendernam %>">
                      <div class="dropdown-list-image mr-3">
                        <img class="rounded-circle" src="CollegeAdminViewImage.jsp?name=<%=privatesende %>" alt="">
                        <div class="status-indicator bg-success"></div>
                      </div>
                      <div class="font-weight-bold">
                      <div class="small text-gray-500"><%=privatedat %></div>
                      <div class="small text-gray-500"><%=privatesendernam %> <%=privatetim %></div>
                    <div class="text-truncate"><%=chatmessage %></div>
                        
                      </div>
                    </a>
                    <% 
                    	 }
                    }
                   
          
                if(chatmessage.equals("") )
                {
                	%>
                	<div style="margin-top:20px;text-align:center;">No Messages are available right now</div><div style="margin-top:20px;"></div>
                <%
                }
                }
                catch(Exception e)
                {
                	out.println(e.getMessage());
                }
                %>                
                
                 </div>
                 </div>
            </li>
             <div class="topbar-divider d-none d-sm-block"></div>
            
             <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%out.println(session.getAttribute("sessname"));%></span>
                <% String pname=(String)session.getAttribute("sessuid"); %>
                <img class="img-profile rounded-circle" src="viewimage.jsp?name=<%=pname%>">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="Vendorprofile.jsp">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="Vsettings.jsp">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="logout1.jsp">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>
           
  </nav>
 
                <%  String message=request.getParameter("message");
                String error=request.getParameter("error");
              session.setMaxInactiveInterval(2*60*60);
if(message!=null)
{
	%>
	 <nav style="margin-left:20px;line-height:45px;width:1270px;background:#A9DFBF;color:#229954;">
	<%
	out.println("<center><i class='fa fa-check' aria-hidden='true'></i> "+message+"</center>");
	%>
	</nav>
	<%
}
if(error!=null)
{
	%>
	 <nav style="margin-left:20px;line-height:45px;width:1270px;background:#E6B0AA;color:#C0392B;">
	<%
	out.println("<center><i class='fa fa-times' aria-hidden='true'></i> "+error+"</center>");
	%>
	</nav>
	<%
}
%>

     <a id="buttons"href="" data-toggle="modal" data-target="#addvendor" class="btn-room">Add Vendor</a>
     <div style="margin-left:70px;color:black;margin-top:10px;position:absolute;"><h3><i class="fa fa-user" aria-hidden="true"></i>&nbsp;Vendors</h3></div>
   
      
      <div id="addvendor" class="modal" tabindex="-1" role="dialog">
   <div class="modal-dialog" role="document"> 
    
     <!-- login modal content -->
        <div class="modal-content" id="login-modal-content">        
          <div class="modal-header">
          <h4 class="modal-title">Add Vendor</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>            
          </div>
          <div class="modal-body">
          <form method="post" action="venreg_validation.jsp">

            <div class="form-group">
            <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-envelope" ></span>
                    
                </span>                    
            </div> 
            <input type="email"name="email"autocomplete="off"placeholder="Enter Email Id"pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"title="Valid Email Id required" class="form-control" required>        
         </div>                      
            </div>
            <div class="form-group">
                <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-user"></span>
                </span>                    
            </div>
    <input type="text"id="uname"name="username"autocomplete="off"pattern="^[a-zA-Z ]+$"title="This field contains only alphabets"placeholder="Enter Name" class="form-control" required>
     </div>                      
            </div>      
                       <p id="msg"></p>
            
            <div class="form-group">
            <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-user"></span>
                </span>                    
            </div>
                  
      <input type="text"name="userid"id="userid" pattern="[A-Za-z]{4}[0-9]{2}"title="Alphanumeric characters required"autocomplete="off"placeholder="Enter User Id" class="form-control" required>
              <button type="button" onclick="generatefacultyid()"title="Generate Userid"style="background:#2980B9;color:white;border:0px;width:40px;outline:none;" ><i class="fa fa-refresh" aria-hidden="true" ></i></button>
              
   </div>                      
            </div>  
            
            <div class="form-group">
            <input type="text"id="capimg" autocomplete="off"name="capimgs" value="<% Random rand = new Random();
out.println(rand.nextInt(10000));%>" readonly="readonly">
</div>
<!--<button type="button"id="button">pp</button>-->
   <div class="form-group">
    <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-key"></span>
                </span>                    
            </div>
            
            
           
    <input autocomplete="off"type="text"pattern="^[0-9]+$"title="Match above Captcha"name="cap"placeholder="Enter Captcha" class="form-control"  required>
                  </div>
                 </div>
   <input type="submit" style="background:#2980B9;color:white;"name="signup"value="&#43; Add Vendor" class="btn btn-block btn-lg">
       </form>
        </div>
        
       </div>
 </div>
</div>
  <%
try
{
  %>    
   <div class="table-responsive">
  
  
  <table border=1 align='center' id="myUL"class='otable' border="1" cellspacing=0>
<tr>
<th> User Name</th><th>Email Id</th><th>Date of Joining</th><th>Action</th></tr>

<%
String query6="Select Email_Id,Username,Date_of_Joining,id,Userid from admin_details";
PreparedStatement ps6=con.prepareStatement(query6);
ResultSet rs6=ps6.executeQuery();  
String uid="";
int id=0;

while(rs6.next())
{
	uid=rs6.getString(5);
	id=rs6.getInt(4);
	
	
	%>
	<tr><td><% out.println(rs6.getString(2)); %></td><td><% out.println(rs6.getString(1)); %></td>
	<td><% out.println(rs6.getString(3)); %></td>
	<%
	if(uid.equals(session.getAttribute("sessuid")))
	{
		%>
	<td></td>
	<%
	}
	else
	{
	%>
	<td><a href="" class="btn btn-md"  style="background:#186A3B;color:white;"data-toggle="modal" data-target="#E<%=uid%>">Edit</a> 
	<a href="" class="btn btn-md"style="background:#C0392B;color:white;" data-toggle="modal" data-target="#D<%=uid%>">Remove</a></td></tr>
	
	 <div id="E<%=uid%>" class="modal" tabindex="-1" role="dialog">
   <div class="modal-dialog" role="document"> 
    
     <!-- login modal content -->
        <div class="modal-content" id="login-modal-content">        
          <div class="modal-header">
          <h4 class="modal-title">Edit Vendor</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>            
          </div>
          <div class="modal-body">
          
          <form method="post" action="EditVendor.jsp">
            <div class="form-group">
            <label for="vendorname">Vendor Name:</label>
             <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-user"></span>
                </span>                    
            </div>
                <input name="vendorname" id="vendorname" pattern="^[a-zA-Z ]+$"title="This field contains only alphabets"type="text" class="form-control" value="<%=rs6.getString(2) %>" required>
                </div>                      
               </div>
            <div class="form-group">
             <label for="emailid">Email Id:</label>
             <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-envelope" ></span>
                    
                </span>                    
            </div>
               <input name="emailid" id="emailid" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"title="Valid Email Id required"class="form-control" value="<%=rs6.getString(1) %>" required>
                </div>                  
                </div>    
            
                      
                 <input name="uid" type="hidden"  value="<%=uid%>" required>
           
            <button style="background:#186A3B;color:white;"type="submit"class="btn btn-block btn-lg"><i class="fas fa-edit"></i> Modify</button>
          </form>
        </div>
        
       </div>
 </div>

  </div>
	<div id="D<%=uid%>" class="modal" tabindex="-1" role="dialog">
   <div class="modal-dialog modal-confirm" role="document"> 
    
     <!-- login modal content -->
        <div class="modal-content" id="login-modal-content">        
          <div class="modal-header flex-column">
          <div class="icon-box">
					<i class="fa fa-times" aria-hidden="true"></i>
				</div>						
				<h4 class="modal-title w-100">Are you sure?</h4>	
                
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>            
          </div>
          <div class="modal-body">
          <p>Do you really want to delete these records? This process cannot be undone.</p>
      </div>
      <div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				<a href="DeleteVendor.jsp?id=<%=id%>" style="color:white;padding-top:10px;"class="btn btn-danger">Delete</a>
			</div>
        
       </div>
 </div>

  </div>
    
	<% 
	}
}
%>



</table>
  </div>
  <%
  con.close();

  }
  catch(Exception e)
  {
  	out.println(e.getMessage());
  }

  %>
<script>
    $(document).ready(function(){
        $("#button").click(function(){
            location.reload(true);
        });
    });
</script>
  <script>
  function generatefacultyid()
  {
	  
	  var uname=document.getElementById("uname").value;
	  if(uname=="")
		  {
		  var x = document.getElementById("msg")
		  x.innerHTML ="<nav style='margin-left:0px;line-height:40px;width:467px;background:#E6B0AA;color:#C0392B;text-align:center;font-size:17px;'><i class='fa fa-times' aria-hidden='true'></i> Please enter Vendor name</nav>";
		} 
	  else
		  {
		  var x = document.getElementById("msg")
		  x.innerHTML ="";
	  var res = uname.substring(0, 4);
	  var rand=Math.floor((Math.random() * 90) + 10);
	 var userid=res+rand;
	 document.getElementById('userid').value = userid;
	   }
  }
  </script>
<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput6");
  filter = input.value.toUpperCase();
  table = document.getElementById("myUL");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
  <script src="Bootstrap/jquery/jquery.min.js"></script>
  
<script src="Bootstrap/js/bootstrap.bundle.min.js"></script>
 <script src="Bootstrap/js/script_file.js"></script>

  
</body>
</html>