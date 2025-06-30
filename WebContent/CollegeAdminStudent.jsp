<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.text.DateFormat,java.text.*,java.util.Calendar" %>
<%@ include file="connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Manage Students</title>
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

.otable tr:hover {background-color:#D1F2EB;}

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

#a2
{
color:#2980B9;
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
<script>
$(document).ready(function(){
  $("#myInput6").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myUL .ml").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-text mx-3">Welcome <%out.println(session.getAttribute("sessname"));%></div>
      </a>

      <hr class="sidebar-divider my-0">

      <li class="nav-item">
        <a class="nav-link" href="CollegeAdminDashboard.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      
      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="CollegeAdminFaculty.jsp">
          <i class='fas fa-chalkboard-teacher'></i>
          <span>Faculty</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="CollegeAdminDepartment.jsp">
          <i class='fas fa-chalkboard-teacher'></i>
          <span>Department</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="CollegeAdminSubject.jsp">
          <i class='fas fa-chalkboard-teacher'></i>
          <span>Subject</span>
        </a>
      </li>

<li class="nav-item active">
        <a class="nav-link collapsed" href="CollegeAdminStudent.jsp">
          <i class="fa fa-graduation-cap" aria-hidden="true"></i>
           <span>Students</span>
        </a>
        </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-comments"></i>
          <span>Chats</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class=" py-2 collapse-inner rounded"style="background-color:#E5E8E8;">
            <a class="collapse-item" href="CollegeAdminVendorChat.jsp">Vendor</a>
            <a class="collapse-item" href="CollegeAdminchats.jsp">College </a>
             </div>
        </div>
      </li>
  <li class="nav-item">
        <a class="nav-link collapsed" href="CollegeAdminCourses.jsp">
          <i class="fa fa-book"></i>
          <span>Courses</span>
        </a>
        </li>
      
      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="CollegeAdminFeedback.jsp">
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
  <div id="content-wrapper" style="background:#F7F9F9 ;"class="d-flex flex-column">

      <div id="content">
      <nav class="navbar navbar-expand topbar mb-4 static-top shadow" style="background:white;">
          <% //session.setAttribute("colcode",collegecode);
          String collegename=(String)session.getAttribute("colcode");
          Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
          String user=(String)session.getAttribute("sessuid");
          String username=(String)session.getAttribute("sessname");
          
          String query3="select college_name from college_details where college_code=?";
          PreparedStatement ps4=con.prepareStatement(query3);
          ps4.setString(1,collegename);
          ResultSet rs4=ps4.executeQuery();
          while(rs4.next())
          {
          out.println(rs4.getString(1));
          }
          %>
          
      <ul class="navbar-nav ml-auto">
        <form class=" d-sm-inline-block form-inline mr-3 mt-1 ml-md-3 my-3 my-md-10 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-silver border-1 small" autocomplete="off"id="myInput6" onkeyup="myFunction()" placeholder="Search for ..." aria-label="Search" aria-describedby="basic-addon2">
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
      pstmt46=con1.prepareStatement("SELECT ProfilePicStatus,ProfileStatus,PasswordStatus FROM college_admin_details WHERE Userid=?");
      pstmt46.setString(1,(String)session.getAttribute("sessuid"));
      ResultSet rs46=pstmt46.executeQuery();
      if(rs46.next())
      {     
    	
    	  proffpicstatus=rs46.getInt(1);
    	  proffstatus=rs46.getInt(2);
    	  psstatus=rs46.getInt(3);
      totalsta=proffpicstatus+proffstatus+psstatus;
      }
      
      
      
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

<a class="dropdown-item d-flex align-items-center" href="CAsettings.jsp">
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

<a class="dropdown-item d-flex align-items-center" href="CollegeAdminProfile.jsp">
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

<a class="dropdown-item d-flex align-items-center" href="CAsettings.jsp">
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
if(proffpicstatus==0 && psstatus==0 && proffstatus==0) 
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
PreparedStatement pstmt34=null;
int privatestate=1;
int countprivate=0;
int bothcount=0;
pstmt34=con1.prepareStatement("SELECT count(Status) FROM private_chat WHERE Reciever=? and Status=? order by id desc");
pstmt34.setString(1,(String)session.getAttribute("sessuid"));
pstmt34.setInt(2,privatestate);
ResultSet rs34=pstmt34.executeQuery();
if(rs34.next())
{
	countprivate=rs34.getInt(1);
}
PreparedStatement pstmt35=null;
int groupstate=0;
int totalgroupstate=0;
pstmt35=con1.prepareStatement("SELECT Status from group_notifications where Member=?");
pstmt35.setString(1,(String)session.getAttribute("sessuid"));
ResultSet rs35=pstmt35.executeQuery();
while(rs35.next())
{
	groupstate=rs35.getInt(1);
	totalgroupstate=totalgroupstate+groupstate;
}
bothcount=countprivate+totalgroupstate+countprivat;

%>

  <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- Counter - Messages -->
                <%
                if(bothcount!=0)
                {
                %>
                <span class="badge badge-danger badge-counter"><%=bothcount %></span>
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
                    
                   <a class="dropdown-item d-flex align-items-center" href="CollegeAdminChatCheck.jsp?people=<%=privatesendernam %>">
                      <div class="dropdown-list-image mr-3">
                        <img class="rounded-circle" src="viewimage.jsp?name=<%=privatesende %>" alt="">
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
                   
            PreparedStatement pstmt30=null;
                String chatmessages="",privatesender="",privatedate="",privatetime="";
                String groupsender1="",groupmessage1="",groupdate1="",grouptime1="";
                int privatestatus=1;
                pstmt30=con1.prepareStatement("SELECT Sender,Message,Date,Time FROM private_chat WHERE Reciever=? and Status=? order by id desc");
                pstmt30.setString(1,(String)session.getAttribute("sessuid"));
                pstmt30.setInt(2,privatestatus);
                ResultSet rs30=pstmt30.executeQuery();
                while(rs30.next())
                {
                	privatesender=rs30.getString(1);
                	chatmessages=rs30.getString(2);
                	privatedate=rs30.getString(3);
                	privatetime=rs30.getString(4);
                	 
                	 PreparedStatement pstmt31=null;
                	 String privatesendername="";
                	 pstmt31=con1.prepareStatement("SELECT Username FROM faculty_details WHERE Userid = ? union all SELECT Username FROM student_details WHERE Userid = ? union all select Username from college_admin_details WHERE Userid = ?");
                	 pstmt31.setString(1,privatesender);
                	 pstmt31.setString(2,privatesender);
                	 pstmt31.setString(3,privatesender);
                	 ResultSet rs31=pstmt31.executeQuery();
                	 if(rs31.next())
                	 {
                		 privatesendername=rs31.getString(1);
                	 }
                	 if(!chatmessages.equals(""))
                	 {
                %>
                
               <a class="dropdown-item d-flex align-items-center" href="AllChatCheck.jsp?people=<%=privatesendername %>">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="AllViewImage.jsp?name=<%=privatesender %>" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div class="font-weight-bold">
                  <div class="small text-gray-500"><%=privatedate %></div>
                  <div class="small text-gray-500"><%=privatesendername %> <%=privatetime %></div>
                <div class="text-truncate"><%=chatmessages %></div>
                    
                  </div>
                </a>
                <% 
                	 }
                }
               
                
    
                PreparedStatement pstmt32=null;
               int groupstatus=0;
                pstmt32=con1.prepareStatement("SELECT Group_name,Group_alias,Status from group_notifications where Member=?");
                pstmt32.setString(1,(String)session.getAttribute("sessuid"));
                
                ResultSet rs32=pstmt32.executeQuery();
                String grname="",gralias="";
                int high=0;
                while(rs32.next())
                {
                	grname=rs32.getString(1);
                	gralias=rs32.getString(2);
                	 groupstatus=rs32.getInt(3);
                	 PreparedStatement pstmt33=null;
                	
                	 pstmt33=con1.prepareStatement("SELECT Sender,Message,Date,Time,Highlight FROM group_chat where Group_name=? order by Id desc limit "+groupstatus);
                	 pstmt33.setString(1,gralias);
                	 ResultSet rs33=pstmt33.executeQuery();
                	 while(rs33.next())
                	 {
                		 groupsender1=rs33.getString(1);
                		 groupmessage1=rs33.getString(2);
                		groupdate1=rs33.getString(3);
                		grouptime1=rs33.getString(4);
                		high=rs33.getInt(5);
                		if(!groupmessage1.equals(""))
                		{
                %>
               <a class="dropdown-item d-flex align-items-center" href="AllGroupChatCheck.jsp?groupname=<%=grname%>">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="images/grpimgg.jpg" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div class="font-weight-bold">
                  <div class="small text-gray-500"><%=groupdate1 %></div>
                  <div class="small text-gray-500"><%=grname %> <%=grouptime1 %></div>
                <%
                  if(high!=1)
                  {
                  %>
                <div class="text-truncate"><%=groupsender1 %>:<%=groupmessage1 %></div>
                   <%
                  }
                  else
                  {
                   %>
                   <div class="text-truncate"><%=groupmessage1 %></div>
                   <%
                   }
                   %>
                    
                  </div>
                </a>
                <%
                	 }
                }
                }
                if(groupmessage1.equals("") && chatmessages.equals("") && chatmessage.equals("") )
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
                <img class="img-profile rounded-circle" src="CollegeAdminViewImage.jsp?name=<%=session.getAttribute("sessuid")%>">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="CollegeAdminProfile.jsp">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="CAsettings.jsp">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="logout.jsp">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>
           
  </nav>
 <%
 // Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
  %>
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
  <a href="" id="buttons"data-toggle="modal" data-target="#addstudent" class="btn-room">Add Student</a>

  <div style="margin-left:70px;color:black;margin-top:15px;position:absolute;"><h3><i class="fas fa-book-reader"></i>&nbsp;Students</h3></div>  
  <div id="addstudent" class="modal" tabindex="-1" role="dialog">
   <div class="modal-dialog" role="document" > 
    
     <!-- login modal content -->
        <div class="modal-content" id="login-modal-content">        
          <div class="modal-header">
          <h4 class="modal-title">Add Student</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>            
          </div>
          <div class="modal-body">
          <form method="post" action="AddStudent.jsp">
            <div class="form-group">
                   <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-user" ></span>
                    
                </span>                    
            </div>
                <input name="studentname" autocomplete="off"pattern="^[a-zA-Z ]+$"title="This field contains only alphabets"id="studentname" type="text" class="form-control input-lg" placeholder="Enter Student Name" required>
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
                <button type="button" id="gen"name="generateuserid"onclick="generatefacultyid()"title="Generate Userid"style="background:#2980B9;color:white;border:0px;width:40px;outline:none;" ><i class="fa fa-refresh" aria-hidden="true" ></i></button>
                </div>                      
            </div>
             <div class="form-group">
                     <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-id-card" ></span>
                    
                </span>                    
            </div>
                <input name="rollno" id="rollno" autocomplete="off"type="text" class="form-control input-lg" placeholder="Enter Roll No" required>
                </div>                      
            </div>
            <div class="form-group">
                      <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-envelope" ></span>
                    
                </span>                    
            </div>
                <input name="emailid" id="emailid" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"title="Valid Email Id required"autocomplete="off"type="email" class="form-control input-lg" placeholder="Enter Email Id" required>
                </div>                      
            </div>
            <div class="form-group">
                        <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span style="font-size:24px;"class="fa fa-mobile" ></span>
                    
                </span>                    
            </div> 
                <input name="mobileno" autocomplete="off"id="mobno" type="text" pattern="[0-9]{10}"title="Valid Contact no required"class="form-control input-lg" placeholder="Enter Mobile No" required>
                </div>                      
            </div>
              <div class="form-group">
                         <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span style="font-size:24px;"class="fa fa-map-marker" ></span>
                    
                </span>                    
            </div>
                <input name="address" autocomplete="off"id="address" type="text" class="form-control input-lg" placeholder="Enter Address" required>
                </div>                      
            </div>
            
               <%
            String query5="select department from subject_details group by department";
            PreparedStatement ps5=con1.prepareStatement(query5);
            ResultSet rs5=ps5.executeQuery();  
            
            
            %>
            <div class="form-group">
                <label for="sel3">Select Department:</label>
                        <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-home" ></span>
                    
                </span>                    
            </div>
                <select name="department" id="sel3" class="form-control input-lg" required>
                <option value="">------- Select --------</option>
                 <%
               while(rs5.next())
               {
            	   %>
            	   <option value="<%=rs5.getString(1)%>"><%=rs5.getString(1)%></option>
            	   <% 
               }
               %>
                </select>
                   </div>               
            </div>
    <div class="form-group">
                        <div class="input-group input-group-md">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <span class="fa fa-calendar" ></span>
                    
                </span>                    
            </div>
                <input name="batch" id="batch" autocomplete="off"type="text" class="form-control input-lg" placeholder="Enter Batch" required>
                </div>                      
            </div>
          
  
            
            
                
            <input type="submit"value="&#43; Add Student"style="background:#2980B9;color:white;outline:none;" class="btn btn-block btn-lg">
          </form>
        </div>
        
       </div>
 </div>

  </div>
  <div class="table-responsive">
  
  
  <table border=1 align='center' class='otable' border="1" cellspacing=0 id="myUL">
<tr>
<th>Sr.no</th><th> Student Name</th><th>Email_Id</th><th>Mobile number</th><th>Address</th><th>Department</th><th>Batch</th><th>Action</th></tr>

<%
int count=0;
String query6="Select Username,Email_Id,Mobile_No,Address,Department,Batch,Userid,Roll_no,Id from student_details";

PreparedStatement ps6=con1.prepareStatement(query6);
ResultSet rs6=ps6.executeQuery();  
while(rs6.next())
{
	count++;
	%>
	<tr class="ml"><td><% out.println(count);%></td><td><% out.println(rs6.getString(1)); %></td><td><% out.println(rs6.getString(2)); %></td>
	<td><% out.println(rs6.getString(3)); %></td>
	<td><% out.println(rs6.getString(4)); %></td><td><% out.println(rs6.getString(5)); %></td><td><% out.println(rs6.getString(6)); %></td>
	<td><a href="" class="btn btn-md"  style="background:#186A3B;color:white;"data-toggle="modal" data-target="#E<%=rs6.getString(7)%>">Edit</a> 
	<a href="" data-toggle="modal" data-target="#D<%=rs6.getString(9)%>"class="btn btn-md"style="background:#C0392B;color:white;">Remove</a></td></tr>
	<div id="E<%=rs6.getString(7)%>" class="modal" tabindex="-1" role="dialog">
   <div class="modal-dialog" role="document"> 
    
     <!-- login modal content -->
        <div class="modal-content" id="login-modal-content">        
          <div class="modal-header">
          <h4 class="modal-title">Edit Student</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>            
          </div>
          <div class="modal-body">
          <form method="post" action="EditStudent.jsp">
            <div class="form-group row">
               <label for="studentname" class="col-sm-3 col-form-label">Username:</label>
               <div class="col-lg-9">
             <input name="studentname" id="studentname" type="text" pattern="^[a-zA-Z ]+$"title="This field contains only alphabets"autocomplete="off"class="form-control input-lg" value="<%=rs6.getString(1)%>" required>
                </div>                      
            </div>
             <p id="msg"></p>
              <div class="form-group row">
               <label for="rollno" class="col-sm-3 col-form-label">Roll no:</label>
               <div class="col-lg-9">
           
                <input name="rollno" id="rollno" type="text" autocomplete="off"class="form-control input-lg" value="<%=rs6.getString(8)%>" required>
                </div>                      
            </div>
           <div class="form-group row">
               <label for="emailid" class="col-sm-3 col-form-label">Email Id:</label>
               <div class="col-lg-9">
                 <input name="emailid" id="emailid" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"title="Valid Email Id required"autocomplete="off"class="form-control input-lg" value="<%=rs6.getString(2)%>" required>
                </div>        
                </div>              
             <div class="form-group row">
               <label for="mobno" class="col-sm-3 col-form-label">Mobile no:</label>
               <div class="col-lg-9">
               <input name="mobileno" id="mobno" type="text" pattern="[0-9]{10}"title="Valid Contact no required"autocomplete="off"class="form-control input-lg" value="<%=rs6.getString(3)%>" required>
                </div>           
                </div>           
             <div class="form-group row">
               <label for="address" class="col-sm-3 col-form-label">Address:</label>
               <div class="col-lg-9">
                <input name="address" id="address" type="text" autocomplete="off"class="form-control input-lg" value="<%=rs6.getString(4)%>" required>
                </div>    
                </div>                  
            
               <%
            String query10="select department from subject_details group by department";
            PreparedStatement ps10=con1.prepareStatement(query10);
            ResultSet rs10=ps10.executeQuery();  
            
            
            %>
          <div class="form-group row">
               <label for="sel3" class="col-sm-3 col-form-label">Department:</label>
               <div class="col-lg-9">
                   
                <select name="department" id="sel3" class="form-control input-lg" required>
                <option value="<%=rs6.getString(5)%>"><%=rs6.getString(5)%></option>
                 <%
               while(rs5.next())
               {
            	   %>
            	   <option value="<%=rs5.getString(1)%>"><%=rs5.getString(1)%></option>
            	   <% 
               }
               %>
                </select>
                                  
            </div></div>
   <div class="form-group row">
               <label for="batch" class="col-sm-3 col-form-label">Batch:</label>
               <div class="col-lg-9">
                          <input name="batch" id="batch" autocomplete="off"type="text" class="form-control input-lg" value="<%=rs6.getString(6)%>" required>
                </div>                      
           </div>
  
            
                   <input name="uid" type="hidden"  value="<%=rs6.getString(7) %>" required>
          
                
            <button type="submit"style="background:#186A3B;color:white;" class="btn btn-block btn-lg"><i class="fa fa-edit" aria-hidden="true"></i> Modify</button>
          </form>
        </div>
        
       </div>
 </div>
</div>
	<div id="D<%=rs6.getString(9)%>" class="modal" tabindex="-1" role="dialog">
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
				<a href="DeleteStudent.jsp?id=<%=rs6.getString(9)%>" style="color:white;padding-top:10px;"class="btn btn-danger">Delete</a>
			</div>
        
       </div>
 </div>

  </div>
	
	<% 
}
%>




</table>

</div>
  </div>
  </div>
 
    <script>
  function generatefacultyid()
  {
	  
	  var studentname=document.getElementById("studentname").value;
	  if(studentname=="")
		  {
		  var x = document.getElementById("msg")
		  x.innerHTML ="<nav style='margin-left:0px;line-height:40px;width:467px;background:#E6B0AA;color:#C0392B;text-align:center;font-size:17px;'><i class='fa fa-times' aria-hidden='true'></i> Please enter Student name</nav>";
		} 
	  else
		  {
		  var x = document.getElementById("msg")
		  x.innerHTML ="";
	  var res = studentname.substring(0, 4);
	  var rand=Math.floor((Math.random() * 90) + 10);
	 var userid=res+rand;
	 document.getElementById('userid').value = userid;
	   }
  }
  </script>
<script src="Bootstrap/jquery/jquery.min.js"></script>
  
<script src="Bootstrap/js/bootstrap.bundle.min.js"></script>
 <script src="Bootstrap/js/script_file.js"></script>
<%
try
{
	con.close(); 
	con1.close();
}
catch(Exception e)
{
	out.println(e.getMessage());
}
%>

</body>
</html>