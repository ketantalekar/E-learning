<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.text.DateFormat,java.text.*,java.util.Calendar" %>
<%@ include file="connection.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Manage Courses</title>
<link href="Bootstrap/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="Bootstrap/css/style.css" rel="stylesheet" type="text/css"></link>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>

<style>
#addnew{
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
  height:90px;
  width:260px;
  font-size:20px;
  border:none;
  outline:none;
  margin-left:1070px;
 text-decoration:none;
 margin-top:10px;
 padding:12px;
}
.iconset
{
font-size:25px;
background:#ddd;
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
background: #8383F2;
    color: #fff;
    width: 160px;
    display: inline-block;
padding:10px 20px;
    text-transform: uppercase;
    font-size: 16px;
    font-weight: bold;
   margin-left:30px;
   margin-right:30px;
   margin-top:50px;
   margin-bottom:30px;
border:none;
border-radius:5%;
text-decoration:none;
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

       <li class="nav-item">
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
      <li class="nav-item active">
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
              <input type="text" class="form-control bg-silver border-1 small" id="myInput" onkeyup="myFunction()" autocomplete="off"placeholder="Search for Courses" aria-label="Search" aria-describedby="basic-addon2">
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
	<br>
	<%
}
if(error!=null)
{
	%>
	 <nav style="margin-left:20px;line-height:45px;width:1270px;background:#E6B0AA;color:#C0392B;">
	<%
	out.println("<center><i class='fa fa-times' aria-hidden='true'></i> "+error+"</center>");
	%>
	</nav><br>
	<%
}
%>
   
   <a href=""data-toggle="modal" data-target="#addcourse" id="addnew"><i class="fa fa-plus" aria-hidden="true"></i> Add New Course</a>
   <div style="margin-left:100px;color:black;margin-top:-30px;"><h3><i class="fa fa-book"></i>&nbsp;Courses</h3></div>
 
  <div id="addcourse" class="modal fade" tabindex="-1" role="dialog">
   <div class="modal-dialog" role="document"> 
    
     <!-- login modal content -->
        <div class="modal-content" id="login-modal-content">        
            <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Add Course</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
    </div>
          <div class="modal-body mx-3">
          <form method="post" action="/E-learning/UploadToDBServlet" enctype="multipart/form-data">
      <div class="form-group">
                <div class="input-group">
               <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-lock" aria-hidden="true"></i></span></div>
            	<input name="coursename" id="coursename" autocomplete="off"type="text" class="form-control input-lg" placeholder="Enter Course Name" required>
                	</div>
      </div>                            
            
        <div class="form-group">
                
                <div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroupFileAddon01"><i class="fa fa-files-o" aria-hidden="true"></i></span>
  </div>
  <div class="custom-file">
    <input type="file" name="file"class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01"required>
    <label class="custom-file-label" for="inputGroupFile01" id="info-area">Choose file</label>
  </div>
</div>
                                      
            </div>   
        
    
            
            <input type="submit"  value="&#43; Add Course"class="btn btn-primary btn-block btn-lg">
          </form>
        </div>
        
       </div>
 </div>
</div>
<div style="margin-bottom:20px;"></div>
  <%
  con=null;
  Class.forName("com.mysql.jdbc.Driver");  
  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-learning","root","");  
  String sql = "Select courseid,file_name,file_data,coursename from courses ";
  PreparedStatement pstm = con.prepareStatement(sql);
  ResultSet rs = pstm.executeQuery();
  int cnt=0;
  %>
  <div class="container">
  <table class="table table-striped" id="myTable">
  <thead>
  <tr><th scope="col">Course ID</th><th scope="col">Course Name</th><th scope="col">Action</th></tr>
  </thead>
  <tbody>
  <% 
  while(rs.next()) 
  {
	  cnt++;
  	int id=rs.getInt("courseid");
  String fileName = rs.getString("file_name");
  Blob fileData = rs.getBlob("file_data");
  String coursename = rs.getString("coursename");
%>
<tr><td scope="row"><%=cnt %></td><td><%=coursename %></td>
<td><a class="btn btn-md btn-primary" href="Download.jsp?id=<%=id%>"><i class="fa fa-download" aria-hidden="true"></i> Download</a><span style="width:10px"></span>
<a class="btn btn-md btn-warning"style="color:black;font-weight:bold;" href=""data-toggle="modal" data-target="#E<%=id%>" id="E<%=id%>">
<i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</a>
<a class="btn btn-md btn-danger" href=""data-toggle="modal" data-target="#D<%=id%>"><i class="fa fa-trash" aria-hidden="true"></i> Delete</a>
</td> </tr>

 <div id="E<%=id%>" class="modal fade" tabindex="-1" role="dialog">
   <div class="modal-dialog" role="document"> 
    
     <!-- login modal content -->
        <div class="modal-content" id="login-modal-content">        
            <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Edit Course</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
    </div>
          <div class="modal-body mx-3">
          <form method="post" action="/E-learning/EditCourse" enctype="multipart/form-data">
      <div class="form-group">
                <div class="input-group">
               <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-lock" aria-hidden="true"></i></span></div>
            	<input name="cname" id="cname" autocomplete="off"type="text" class="form-control input-lg" value="<%=coursename%>" required>
                	</div>
      </div>                            
            
        <div class="form-group">
                
                <div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroupFileAddon02"><i class="fa fa-files-o" aria-hidden="true"></i></span>
  </div>
  <div class="custom-file">
    <input type="file" name="file"class="custom-file-input" id="inputGroupFile02" aria-describedby="inputGroupFileAddon02">
    <label class="custom-file-label" for="inputGroupFile02" id="info-area2"><%=fileName %></label>
  </div>
</div>
                                      
            </div>   
        
    <input type="hidden" name="courseid" value="<%=id%>">
            
            <button type="submit" class="btn btn-primary btn-block btn-lg"style="color:white;"><i class="fas fa-edit"></i> Modify</button>
          </form>
        </div>
        
       </div>
 </div>
</div>
<div id="D<%=id%>" class="modal fade" tabindex="-1" role="dialog">
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
          <p>Do you really want to delete this record? This process cannot be undone.</p>
      </div>
      <div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				<a href="vcoursedel.jsp?id=<%=id%>" style="color:white;padding-top:10px;"class="btn btn-danger">Delete</a>
			</div>
        
       </div>
 </div>

  </div>
<% 
  }
  
  %>
 </tbody>
  </table>
  </div>
</div>
 <script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 1; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
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
<script>
var input1 = document.getElementById('inputGroupFile01');
var infoArea1 = document.getElementById('info-area');

input1.addEventListener( 'change', showFileName1 );

function showFileName1( event ) {
  
  // the change event gives us the input it occurred in 
  var input1 = event.srcElement;
  
  // the input has an array of files in the `files` property, each one has a name that you can use. We're just using the name here.
  var fileName1 = input1.files[0].name;
  var res1 = fileName1.substr(0, 20);
  // use fileName however fits your app best, i.e. add it into a div
  infoArea1.textContent = res1;
}

</script>

<script src="Bootstrap/jquery/jquery.min.js"></script>
  
<script src="Bootstrap/js/bootstrap.bundle.min.js"></script>
 <script src="Bootstrap/js/script_file.js"></script>
 <script>
 var input2 = document.getElementById('inputGroupFile02');
var infoArea2 = document.getElementById('info-area2');

input2.addEventListener( 'change', showFileName2 );


function showFileName2( event ) {
  
  // the change event gives us the input it occurred in 
  var input2 = event.srcElement;
  
  // the input has an array of files in the `files` property, each one has a name that you can use. We're just using the name here.
  var fileName2 = input2.files[0].name;
  var res2 = fileName2.substr(0, 20);
  // use fileName however fits your app best, i.e. add it into a div
  infoArea2.textContent = res2;
}

</script>

<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
	</script>
   <%
try
{
	con.close();
	
}
catch(Exception e)
{
	
	out.println(e.getMessage());
}



%>
</body>

</html>