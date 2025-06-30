<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.text.DateFormat,java.text.*,java.util.Calendar" %>
   <%@ page import="java.util.*,com.Data.*,java.sql.*" %>  
<%@ include file="connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage College Details</title>



<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
.otable{
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  
  width: 97%;
}

.otable td, .otable th{
  border: 1px solid #ddd;
  padding: 8px;
  text-align:center;
}
.admindiv .col {
  border: 1px solid #ddd;
  padding-left: 3px;
  padding-right:3px;
  padding-bottom:10px;
  padding-top:10px;
}


.otable tr:nth-child(even){background-color: #EAF2F8;}

.otable tr:hover {background-color: #D1F2EB;}
.otable td
{
color:black;
}
.otable th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color:#2980B9;
  color: white;
}
.trout
{
padding:0px;
}
.btn-room
{
background: #2980B9;
float:right;
    color: #fff;
    width: 160px;
    display: inline-block;
padding:10px 20px;
    text-transform: uppercase;
    font-size: 16px;
    font-weight: bold;
   margin-left:30px;
   margin-right:20px;
  margin-top:10px;
   margin-bottom:30px;
border:none;
border-radius:5%;
text-decoration:none;
}
#dis-row
{

margin-left:720px;
position:absolute;
color:black;
margin-top:15px;

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
tr.hide-table-padding td {
  padding: 0;
}

.expand-button {
	position: relative;
}

.expand-button:after
{
  position: absolute;
  left:.75rem;
  top: 50%;
  transform: translate(0, -50%);
  content: '-';
}
.expand-button:after
{
  content: '+';
}

.gap{ 
    height: 10px;
}
.hide{ 
      display: none;
}
#search{ 
      padding-right: 15px;
}
.form-group span{ 
      position: relative; 
      left: -1px; 
      top: 0px; 
      cursor: pointer; 
      display: flex;
}
.form-group span:hover{ 
      color: red;
 }
 .admindiv .row .col 
 {
 border: 1px solid #ddd;
 word-wrap: break-word;
 }
 
.admindiv #rid {
  font-weight: bold;
background-color:#2980B9;
color:white;

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
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    console.log(value);
    $('#myTable tr').not('thead tr');
    
    $("#myTable tbody").filter(function() {
    	$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
      console.log($(this).text().toLowerCase().indexOf(value));
    });
  });
});
</script>
<script>
$(document).ready(function() {
	  $("#sel1").change(function() {
	    var clgname = $(this).val();
	    if(clgname != "") {
	      $.ajax({
	        url:"get_collegecode.jsp",
	        data:{clgname:clgname},
	        type:'POST',
	        success:function(response) {
	          var resp = $.trim(response);
	          $("#sel2").html(resp);
	        }
	      });
	    } else {
	      $("#sel2").html("<option value=''>------- Select --------</option>");
		   
	    }
	  });
	});



</script>
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

       <li class="nav-item">
        <a class="nav-link collapsed" href="vendor_reg.jsp">
          <i class="fa fa-user"></i>
          <span>Vendor</span>
        </a>
      </li>
      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item active">
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
       <form class="navbar-search mt-3 float-right">
            <div class="input-group">
              <input type="text" class="form-control bg-silver border-1 small" autocomplete="off"id="myInput" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">
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
    <a id="buttons"href="" data-toggle="modal" data-target="#addadmin" class="btn-room">Add Admin</a>

<a id="buttons"href="" data-toggle="modal" data-target="#addcollege" class="btn-room">Add College</a> 
<div style="margin-left:20px;color:black;margin-top:10px;position:absolute;"><h3><i class="fa fa-graduation-cap" aria-hidden="true"></i>&nbsp;Colleges</h3></div>
   

<div id="addcollege" class="modal" tabindex="-1" role="dialog">
   <div class="modal-dialog" role="document"> 
    
     <!-- login modal content -->
        <div class="modal-content" id="login-modal-content">        
          <div class="modal-header">
          <h4 class="modal-title">Add College</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>            
          </div>
          <div class="modal-body">
          <form method="post" action="AddCollege.jsp">
            <div class="form-group">
                         <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-university" ></span>
                    
                </span>                    
            </div>
                <input name="collegename" id="collegename" autocomplete="off"type="text" class="form-control input-lg" placeholder="Enter College Name" required>
                </div>                      
            </div>
            <div class="form-group">
                      <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span style="font-size:24px;"class="fa fa-map-marker" ></span>
                    
                </span>                    
            </div>
                <input name="address" id="address" type="text"autocomplete="off" class="form-control input-lg" placeholder="Enter College Address" required>
                 </div>                      
            </div>       
            <div class="form-group">
                  <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-university" ></span>
                    
                </span>                    
            </div>
                <input name="collegecode" id="collegecode" type="text"autocomplete="off" class="form-control input-lg" placeholder="Enter College Code" required>
                 </div>                      
            </div>         
              
            <input type="submit" style="background:#2980B9;color:white;"value="&#43; Add College"class="btn btn-block btn-lg">
          </form>
        </div>
        
       </div>
 </div>
</div>
<div id="addadmin" class="modal" tabindex="-1" role="dialog">
   <div class="modal-dialog" role="document"> 
    
     <!-- login modal content -->
        <div class="modal-content" id="login-modal-content">        
          <div class="modal-header">
          <h4 class="modal-title">Add College Admin</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>            
          </div>
          <div class="modal-body">
          <form method="post" action="AddAdmin.jsp">
          <div class="form-group">
                      <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-user" ></span>
                    
                </span>                    
            </div>
                <input name="adminname" id="adminname" pattern="^[a-zA-Z ]+$"title="This field contains only alphabets"autocomplete="off"type="text" class="form-control input-lg" placeholder="Enter Admin Name" required>
                </div>                      
            </div>
            <p id="msg"></p>
            
                 <div class="form-group">
                        <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-user" ></span>
                    
                </span>                    
            </div>
                <input name="userid" id="userid" autocomplete="off"pattern="[A-Za-z]{4}[0-9]{2}"title="Alphanumeric characters required"type="text" class="form-control input-lg" placeholder="Enter User Id" required>
                 <button type="button" onclick="generatefacultyid()"title="Generate Userid"style="background:#2980B9;color:white;border:0px;width:40px;outline:none;" ><i class="fa fa-refresh" aria-hidden="true" ></i></button>
                </div>                      
            </div>
  
            <div class="form-group">
                             <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span style="font-size:24px;"class="fa fa-map-marker" ></span>
                    
                </span>                    
            </div>
                <input name="adminaddress" autocomplete="off"id="adminaddress" type="text" class="form-control input-lg" placeholder="Enter Admin Address" required>
                </div>                      
            </div>
            <div class="form-group">
                         <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-envelope" ></span>
                    
                </span>                    
            </div>
                <input name="adminemail" id="adminemail" autocomplete="off"type="email" class="form-control input-lg"pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"title="Valid Email Id required" placeholder="Enter Admin Email" required>
                </div>                      
            </div>
            <div class="form-group">
                       <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span style="font-size:24px;"class="fa fa-mobile" ></span>
                    
                </span>                    
            </div> 
                <input name="adminmobile" id="adminmobile" autocomplete="off"type="text" class="form-control input-lg"  pattern="[0-9]{10}"title="Valid Contact no required"placeholder="Enter Admin Mobile number" required>
                </div>                      
            </div>
            <%
            String query="select college_name from college_details";
            PreparedStatement ps3=con.prepareStatement(query);
            ResultSet rs3=ps3.executeQuery();  
            
            
            %>
            
                <label for="sel1">Select College Name:</label>
                  <div class="form-group">
                             <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-university" ></span>
                    
                </span>                    
            </div>
                <select name="collegename" id="sel1" class="form-control input-lg"required>
                 <option value="">------- Select --------</option>
               <%
               while(rs3.next())
               {
            	   %>
            	   <option value="<%=rs3.getString(1)%>"><%=rs3.getString(1)%></option>
            	   <% 
               }
               %>
                </select>
                 </div>                 
            </div>
           
            <label for="sel2">Select College Code:</label>
            <div class="form-group">
                           <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-university" ></span>
                    
                </span>                    
            </div>
                
               
                <select name="collegecode" id="sel2" class="form-control input-lg"required>
                <option value="">------- Select --------</option>
              </select>
                                      
            </div>
            </div>
            <input type="submit" style="background:#2980B9;color:white;"value="&#43; Add College Admin"class="btn btn-block btn-lg">
          </form>
        </div>
        
       </div>
 </div>
</div>


<%
String  spageid=request.getParameter("page");
if(spageid!=null)
{	
	spageid=request.getParameter("page");
}
else
{
	spageid=String.valueOf(1);

}
int pageid=Integer.parseInt(spageid);

int total=4;  
if(pageid==1){}  
else{  
    pageid=pageid-1;  
    pageid=pageid*total+1;  
}  
//con=null;
Statement st=con.createStatement();
String cntdata="Select count(college_id) from college_details";
ResultSet res=st.executeQuery(cntdata);
double totalrow=0;
while(res.next()){
totalrow = res.getInt(1);
out.println("<div id='dis-row'>Total Colleges :" +(int)totalrow+"</div>");
}
try
{

List<College> list=CollegeDao.getRecords(pageid,total);  
int cnt=0;
//out.print("<h1>Page No: "+pageid+"</h1>");  

if(totalrow==0)
{
	out.println("<div style='color:red;margin-top:150px;margin-left:500px;'>No records available currently</div>");
}
else
{
%>

<div class="table-responsive" >
<table align='center' class='otable' border="1" cellspacing=0 id="myTable">  
 <thead >
   
<tr><th>#</th><th>College Name</th><th>Address</th><th>College Code</th><th>Action</th></tr>  
</thead>
<tbody >
<% for(College e:list){
	//out.println("hi");
	cnt++;
	String aname=e.getCollege_name();
	String clgcode=e.getCollege_code();
	String c="#";
	String name=c+aname;
    String cnameid=aname.replaceAll("\\s","");
	%>
    <!--  out.print("");
    out.print("<tr id='"+name+"'><td></td><td>"+e.getCollege_name()+"</td><td>"+e.getAddress()+"</td><td>"++"</td></tr>");
    out.print("<details><tr id='panel1'><td></td><td colspan='2'><div id='"+name+"'class='collapse in p-3'"); -->
     <tr >
    <td class="collapsed" id="accordion" data-toggle="collapse"  href="#<%=cnameid%>"><%=cnt %></td><td data-toggle="collapse"href="#<%=cnameid%>"class="collapsed"id="accordion"><%= e.getCollege_name() %></td><td href="#<%=cnameid%>"data-toggle="collapse"class="collapsed"id="accordion"><%=e.getAddress() %></td><td href="#<%=cnameid%>"data-toggle="collapse"class="collapsed"id="accordion"><%=e.getCollege_code()%></td>
    <td style="text-align:center;">
    <a class="btn btn-md"href="" style="text-decoration:none;background:#186A3B;color:white;"data-toggle="modal" data-target="#E<%=e.getCollege_code()%>">Edit</a></td>
  
    </tr>
     <div id="E<%=e.getCollege_code()%>" class="modal" tabindex="-1" role="dialog">
   <div class="modal-dialog" role="document"> 
    
        <div class="modal-content" id="login-modal-content">        
          <div class="modal-header">
          <h4 class="modal-title">Edit College Details</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>            
          </div>
          <div class="modal-body">
          <form method="post" action="EditCollege.jsp">
          <div class="form-group">
       <label for="collegeid"> College Code:</label>
                           <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-university" ></span>
                    
                </span>                    
            </div>
            
                <input name="collegeid" id="collegeid" autocomplete="off"type="text" class="form-control input-lg" value="<%=e.getCollege_code() %>" required>
                </div>                      
            </div>
               <div class="form-group">
               <label for="collegename">College Name:</label>
                                 <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-university" ></span>
                    
                </span>                    
            </div>
                <input name="collegename" id="collegenamae" autocomplete="off"type="text" class="form-control input-lg" value="<%=e.getCollege_name() %>" required>
                </div>                      
            </div>
             
        <div class="form-group">
               <label for="collegeadd">College Address:</label>
                        <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span style="font-size:24px;"class="fa fa-map-marker" ></span>
                    
                </span>                    
            </div>
                <input name="collegeadd" id="collegeadd" autocomplete="off"type="text" class="form-control input-lg" value="<%=e.getAddress() %>" required>
                </div>                      
            </div>
       <input type="hidden" name="olddb" value="<%=e.getCollege_code() %>">
       
               <button style="background:#186A3B;color:white;width:230px;"type="submit" name="modify" class="btn btn-lg"><i class="fas fa-edit"></i> Modify</button>
                 <a style="width:230px;text-decoration:none;color:white;"href="" data-dismiss="modal" aria-label="Close"data-toggle="modal" data-target="#D<%=e.getCollege_code()%>"class="btn btn-danger btn-lg"><i class="fas fa-trash"></i> Delete</a>
             
          </form>
        </div>
        
       </div>
 </div>
</div>
	<div id="D<%=e.getCollege_code()%>" class="modal" tabindex="-1" role="dialog">
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
				<a href="DeleteCollege.jsp?collegeid=<%=e.getCollege_code() %>" style="color:white;padding-top:10px;"class="btn btn-danger">Delete</a>
			</div>
        
       </div>
 </div>

  </div>
 
    <tr class="hide-table-padding" data-parent="#accordion">
    <td></td>
    <td colspan="5">
    <div width='100%' align="center" id="<%=cnameid%>" class="collapse in p-3 admindiv">
    <!--  -<tr>
    <td >
    <table width='100%' align="center"> -->
    <div class="row" id="rid">
    <div class="col">Admin Name</div>
    <div class="col">User Id</div>
    
    <div class="col">Email Id</div>
    <div class="col">Mobile number</div>
    <div class="col">Address</div>
    <div class="col">Action</div>
    </div>
    <% 
    PreparedStatement ps=con.prepareStatement("Select Username,College_name,Email_Id,Mobile_No,Address,Userid from college_admin_details where College_name=?");
    ps.setString(1,aname);
    ResultSet res2=ps.executeQuery();
    while(res2.next()){
    %>
    
    
    <div class="row">
    	<div class="col">
    	<%  String admin_name = res2.getString(1); out.print(admin_name); %>
    	</div>
    <div class="col">
    	<% String userid =res2.getString(6); out.print(userid); %>
    </div>
    
   
    <div class="col">
    	<% String email=res2.getString(3); out.print(email); %>
    </div>
    <div class="col">
    	<% String mobile=res2.getString(4); out.print(mobile); %>
    </div>
    <div class="col">
    	<% String admin_address=res2.getString(5); out.print(admin_address); %>
    </div>
    
    <% String nameid=admin_name.replaceAll("\\s",""); %>
    <div class="col" style="text-align:center;"><a class="btn btn-md"href="" style="text-decoration:none;background:#186A3B;color:white;"href="" data-toggle="modal" data-target="#<%=nameid%>">Edit</a></div>
   
      <div id="<%=nameid %>" class="modal" tabindex="-1" role="dialog">
   <div class="modal-dialog" role="document"> 
    
        <div class="modal-content" id="login-modal-content">        
          <div class="modal-header">
          <h4 class="modal-title">Edit College Admin</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>            
          </div>
          <div class="modal-body">
          <form method="post" action="EditCollegeAdmin.jsp">
          <div class="form-group">
          <label style="float:left;color:grey;"for="adminname">College Admin Name:</label>
                           <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-user" ></span>
                    
                </span>                    
            </div>
                <input name="adminname" autocomplete="off"pattern="^[a-zA-Z ]+$"title="This field contains only alphabets"id="adminname" type="text" class="form-control input-lg" value="<%=admin_name %>" required>
                </div>                      
            </div>
           
            <div class="form-group">
                <label style="float:left;color:grey;"for="adminaddress">College Admin Address:</label>
                        <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span style="font-size:24px;"class="fa fa-map-marker" ></span>
                    
                </span>                    
            </div>
                <input name="adminaddress" autocomplete="off"id="adminaddress" type="text" class="form-control input-lg" value="<%=admin_address%>"required>
                </div>                      
            </div>
            <div class="form-group">
            <label style="float:left;color:grey;"for="adminemail">College Admin Email:</label>
                           <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-envelope" ></span>
                    
                </span>                    
            </div>
                <input name="adminemail" autocomplete="off"id="adminemail" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"title="Valid Email Id required" class="form-control input-lg" value="<%=email%>" required>
                </div>                      
            </div>
            <div class="form-group">
            <label style="float:left;color:grey;"for="adminmobile">College Admin Contact No:</label>
                      <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span style="font-size:24px;"class="fa fa-mobile" ></span>
                    
                </span>                    
            </div> 
                <input name="adminmobile" id="adminmobile" autocomplete="off"type="text" class="form-control input-lg"pattern="[0-9]{10}"title="Valid Contact no required"value="<%=mobile %>" required>
                </div>                      
            </div>
           <input type="hidden" name="userid" value="<%=userid%>"> 
           <input type="hidden" name="collegecode" value="<%=clgcode%>">
            <button type="submit" value="Modify"style="background:#186A3B;color:white;width:230px;" name="Modify" class="btn btn-lg"><i class="fas fa-edit"></i> Modify</button>
                       <a style="width:229px;text-decoration:none;color:white;"href=""data-dismiss="modal" aria-label="Close" data-toggle="modal" data-target="#D<%=userid%>"class="btn btn-danger btn-lg"><i class="fas fa-trash"></i> Delete</a>
      
          </form>
        </div>
        
       </div>
 </div>
</div> 
</div>

	<div id="D<%=userid%>" class="modal" tabindex="-1" role="dialog">
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
				<a href="DeleteCollegeAdmin.jsp?adname=<%=userid %>&clgcode=<%=clgcode %>" style="color:white;padding-top:10px;"class="btn btn-danger">Delete</a>
			</div>
        
       </div>
 </div>

  </div>

    <% }%>
    
  
   <!--  -</table>
   </td>
   </tr>-->
   </div>
   </td>
   </tbody>
   
    <% 
}
}
con.close();
//con1.close();
}
catch(Exception e)
{
	out.println(e.getMessage());
}
	%>
</table></div><br>
<span style="margin-left:125px;">
<% int i;
//out.println(total);
//out.println(totalrow);
double p=totalrow/total;
//out.println(p);
Double pages=Math.ceil(p);
//out.println(pages);
if(pages>1)
{
for(i=1;i<=pages;i++)
{
%>  
  <span style="margin-left:25px;color:black;"><a href="College_Details.jsp?page=<%=i%>" style="color:black;"><%=i %></a></span>
<%
}
}
%>
</span>
</div>
</div>
 <script>
  function generatefacultyid()
  {
	  
	  var adminname=document.getElementById("adminname").value;
	  if(adminname=="")
		  {
		  var x = document.getElementById("msg")
		  x.innerHTML ="<nav style='margin-left:0px;line-height:40px;width:467px;background:#E6B0AA;color:#C0392B;text-align:center;font-size:17px;'><i class='fa fa-times' aria-hidden='true'></i> Please enter College Admin name</nav>";
		} 
	  else
		  {
		  var x = document.getElementById("msg")
		  x.innerHTML ="";
	  var res = adminname.substring(0, 4);
	  var rand=Math.floor((Math.random() * 90) + 10);
	 var userid=res+rand;
	 document.getElementById('userid').value = userid;
	   }
  }
  </script>
<script src="Bootstrap/jquery/jquery.min.js"></script>
  
<script src="Bootstrap/js/bootstrap.bundle.min.js"></script>
 <script src="Bootstrap/js/script_file.js"></script>

</body>
</html>