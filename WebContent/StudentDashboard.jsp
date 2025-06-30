<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.text.DateFormat,java.text.*,java.util.Calendar" %>
 <%@ include file="connection.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Student Dashboard</title>
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




.progress {
  width: 150px;
  height: 150px;
  background: none;
  position: relative;
}

.progress::after {
  content: "";
  width: 100%;
  height: 100%;
  border-radius: 50%;
  border: 6px solid #eee;
  position: absolute;
  top: 0;
  left: 0;
}

.progress>span {
  width: 50%;
  height: 100%;
  overflow: hidden;
  position: absolute;
  top: 0;
  z-index: 1;
}

.progress .progress-left {
  left: 0;
}

.progress .progress-bar {
  width: 100%;
  height: 100%;
  background: none;
  border-width: 6px;
  border-style: solid;
  position: absolute;
  top: 0;
}

.progress .progress-left .progress-bar {
  left: 100%;
  border-top-right-radius: 80px;
  border-bottom-right-radius: 80px;
  border-left: 0;
  -webkit-transform-origin: center left;
  transform-origin: center left;
}

.progress .progress-right {
  right: 0;
}

.progress .progress-right .progress-bar {
  left: -100%;
  border-top-left-radius: 80px;
  border-bottom-left-radius: 80px;
  border-right: 0;
  -webkit-transform-origin: center right;
  transform-origin: center right;
}

.progress .progress-value {
  position: absolute;
  top: 0;
  left: 0;
}



.rounded-lg {
  border-radius: 1rem;
}

.text-gray {
  color: #aaa;
}

div.h4 {
  line-height: 1rem;
}



</style>
<script>
   $(function() {

	   $(".progress").each(function() {

	     var value = $(this).attr('data-value');
	     var left = $(this).find('.progress-left .progress-bar');
	     var right = $(this).find('.progress-right .progress-bar');

	     if (value > 0) {
	       if (value <= 50) {
	         right.css('transform', 'rotate(' + percentageToDegrees(value) + 'deg)')
	       } else {
	         right.css('transform', 'rotate(180deg)')
	         left.css('transform', 'rotate(' + percentageToDegrees(value - 50) + 'deg)')
	       }
	     }

	   })

	   function percentageToDegrees(percentage) {

	     return percentage / 100 * 360

	   }

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

      <li class="nav-item active">
        <a class="nav-link" href="StudentDashboard.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      
      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="StudentClass.jsp">
          <i class="fa fa-graduation-cap"></i>
          <span>
          <% 
          String collegename=(String)session.getAttribute("colcode");
          Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
          String user=(String)session.getAttribute("sessuid");
          String username=(String)session.getAttribute("sessname");
          String query="Select department from student_details where Userid=?";
          PreparedStatement ps5=con1.prepareStatement(query);
          ps5.setString(1,user);
          ResultSet rs5=ps5.executeQuery();
          if(rs5.next())
          {
          out.println(rs5.getString(1));
          }
          %>
        
          
          </span>
        </a>
      </li>


<li class="nav-item">
        <a class="nav-link" href="Studentchats.jsp" >
          <i class="fas fa-comments"></i>
          <span>Chats</span>
        </a>
         </li>
      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="StudentCourses.jsp">
          <i class="fa fa-book"></i>
          <span>Courses</span>
        </a>
        </li>

     
      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="StudentFeedback.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Feedback</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="StudentMyDowloads.jsp">
          <i class="fa fa-download"></i>
          <span>My Downloads</span></a>
      </li>
<hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

       
    </ul>
  <div id="content-wrapper" class="d-flex flex-column">

      <div id="content">
      <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
            <% //session.setAttribute("colcode",collegecode);
          
            //String collegename=(String)session.getAttribute("colcode");
            //Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
          String query3="select college_name from college_details where college_code=?";
          PreparedStatement ps4=con.prepareStatement(query3);
          ps4.setString(1,collegename);
          ResultSet rs4=ps4.executeQuery();
          while(rs4.next())
          {
          out.println(rs4.getString(1));
          }
          
          con.close();
          %>
      <ul class="navbar-nav ml-auto">
      <%
     int nstatus=0,astatus=0,qqstatus=0,ststatus=0,notitotal=0,psstatus=0,proffstatus=0,proffpicstatus=0,totalsta=0,stotal=0;
      PreparedStatement pstmt29=null;
     pstmt29=con1.prepareStatement("SELECT NoticeStatus,AssignmentStatus,QuizStatus,StudyMaterial FROM student_subject WHERE Userid=?");
      pstmt29.setString(1,(String)session.getAttribute("sessuid"));
      ResultSet rs29=pstmt29.executeQuery();
      while(rs29.next())
      {     
    	  nstatus=rs29.getInt(1);
    	  astatus=rs29.getInt(2);
    	  qqstatus=rs29.getInt(3);
    	  ststatus=rs29.getInt(4);
    	  stotal=stotal+nstatus+astatus+qqstatus+ststatus;
      }
      PreparedStatement pstmt46=null;
      pstmt46=con1.prepareStatement("SELECT ProfilePicStatus,ProfileStatus,PasswordStatus FROM student_details WHERE Userid=?");
      pstmt46.setString(1,(String)session.getAttribute("sessuid"));
      ResultSet rs46=pstmt46.executeQuery();
      if(rs46.next())
      {     
    	
    	  proffpicstatus=rs46.getInt(1);
    	  proffstatus=rs46.getInt(2);
    	  psstatus=rs46.getInt(3);
      totalsta=proffpicstatus+proffstatus+psstatus;
      }
      notitotal=stotal+totalsta;
      
      %>
      <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
               <%
               if(notitotal!=0)
               {
               %>
                  <span class="badge badge-danger badge-counter"><%=notitotal%></span>
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
	
	<a class="dropdown-item d-flex align-items-center" href="Ssettings.jsp">
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
	
	<a class="dropdown-item d-flex align-items-center" href="StudentProfile.jsp">
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
	
	<a class="dropdown-item d-flex align-items-center" href="Ssettings.jsp">
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
PreparedStatement pstmt21=null;
PreparedStatement pstmt22=null;
PreparedStatement pstmt23=null;
PreparedStatement pstmt24=null;
PreparedStatement pstmt25=null;
PreparedStatement pstmt26=null;
PreparedStatement pstmt41=null;
String subcode="";
int noticestatus=0,assignstatus=0,quizstatus=0,study=0;
pstmt21=con1.prepareStatement("SELECT Subject_code,NoticeStatus,AssignmentStatus,QuizStatus,StudyMaterial FROM student_subject WHERE Userid=?");
pstmt21.setString(1,(String)session.getAttribute("sessuid"));
ResultSet rs21=pstmt21.executeQuery();
while(rs21.next())
{
	subcode=rs21.getString(1);
	noticestatus=rs21.getInt(2);
	assignstatus=rs21.getInt(3);
	quizstatus=rs21.getInt(4);
	study=rs21.getInt(5);
	if(noticestatus!=0 || assignstatus!=0 || quizstatus!=0 || study!=0 || psstatus!=0 || proffstatus!=0 || proffpicstatus!=0)
	{
	
	pstmt22=con1.prepareStatement("SELECT Subject_name FROM subject_details WHERE Subject_code=?");
	pstmt22.setString(1,subcode);
	ResultSet rs22=pstmt22.executeQuery();
	String subname="";
if(rs22.next())
	{
		subname=rs22.getString(1);
	
}

pstmt23=con1.prepareStatement("SELECT Notice_title,Faculty_Name,Date FROM notices WHERE subject=? order by id desc limit "+noticestatus);
pstmt23.setString(1,subcode);
ResultSet rs23=pstmt23.executeQuery();
String ntitle="",facname1="",dt1="";

while(rs23.next())
{
	ntitle=rs23.getString(1);
	facname1=rs23.getString(2);
 dt1=rs23.getString(3);
	PreparedStatement pstmt40=null;
	pstmt40=con1.prepareStatement("SELECT Username FROM faculty_details WHERE Userid=?");
	pstmt40.setString(1,facname1);
	ResultSet rs40=pstmt40.executeQuery();
	String facname="";
if(rs40.next())
	{
		facname=rs40.getString(1);
	
}
 %>
<a class="dropdown-item d-flex align-items-center" href="test.jsp?studsubject=<%=subcode%>">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
               
 <div class="small text-gray-500"><%=dt1 %></div>
 <%=facname %> added new Notice '<b><%=ntitle %></b>'
 </div>
                </a>
               
 
<% 
}


String assigntitle="",ussid="",dt2="",time1="";
pstmt24=con1.prepareStatement("SELECT Userid,Title,Date,Time FROM facultyassignment WHERE Subject_code=? order by id desc limit "+assignstatus);
pstmt24.setString(1,subcode);

ResultSet rs24=pstmt24.executeQuery();
while(rs24.next())
{
	ussid=rs24.getString(1);
	
assigntitle=rs24.getString(2);
	dt2=rs24.getString(3);
 time1=rs24.getString(4);
 
 
 

 String fcname="";
 pstmt25=con1.prepareStatement("SELECT Username FROM faculty_details WHERE Userid=?");
 pstmt25.setString(1,ussid);
 ResultSet rs25=pstmt25.executeQuery();
 if(rs25.next())
 {
	 fcname=rs25.getString(1);
 }
 
%>
<a class="dropdown-item d-flex align-items-center" href="test.jsp?facassign=<%=subcode%>">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
               
 <div class="small text-gray-500"><%=dt2 %> <%=time1 %></div>
 <%=fcname %> added new Assignment '<b><%=assigntitle %></b>'
 </div>
                </a>
               
 
<% 
}


String cdate="",qutitle="",dt3="",time2="",fccname1="";
pstmt26=con1.prepareStatement("SELECT title,created_date,quiz_date,quiz_time,Faculty_Name FROM quiz_info WHERE subject=? order by id desc limit "+quizstatus);
pstmt26.setString(1,subcode);

ResultSet rs26=pstmt26.executeQuery();
while(rs26.next())
{
qutitle=rs26.getString(1);
cdate=rs26.getString(2);
	dt3=rs26.getString(3);
 time2=rs26.getString(4);
 fccname1=rs26.getString(5);
	
	pstmt41=con1.prepareStatement("SELECT Username FROM faculty_details WHERE Userid=?");
	pstmt41.setString(1,fccname1);
	ResultSet rs41=pstmt41.executeQuery();
	String fccname="";
if(rs41.next())
	{
	fccname=rs41.getString(1);
	
}
 
%>
<a class="dropdown-item d-flex align-items-center" href="test.jsp?quizup=<%=subcode%>">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
               
 <div class="small text-gray-500"><%=cdate %></div>
 <%=fccname %> added new Quiz '<b><%=assigntitle %></b>'
 which will held on '<b><%=dt3 %> <%=time2 %></b>'
 </div>
                </a>
               
 
<% 
}
PreparedStatement pstmt27=null;
String update="",finame="",uuuid="",fcccname="";
pstmt27=con1.prepareStatement("SELECT Userid,File_Name,Upload_date FROM upload_file WHERE Subject_Name=? order by id desc limit "+study);
pstmt27.setString(1,subcode);

ResultSet rs27=pstmt27.executeQuery();
while(rs27.next())
{
	uuuid=rs27.getString(1);

finame=rs27.getString(2);

	update=rs27.getString(3);
	
	 PreparedStatement pstmt28=null;
 pstmt28=con1.prepareStatement("SELECT Username FROM faculty_details WHERE Userid=?");
	 pstmt28.setString(1,ussid);
	 ResultSet rs28=pstmt28.executeQuery();
	 if(rs28.next())
	 {
		 fcccname=rs28.getString(1);
	 }
 
%>
<a class="dropdown-item d-flex align-items-center" href="test.jsp?sfiles=<%=subcode%>">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
               
 <div class="small text-gray-500"><%=update %></div>
 <%=fcccname %> added new File '<b><%=finame %></b>' 
 </div>
                </a>
               
 
<% 
}
	}
	

}
if(noticestatus==0 && assignstatus==0 && quizstatus==0 && study==0 && psstatus==0 && proffstatus==0 && proffpicstatus==0)
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
bothcount=countprivate+totalgroupstate;

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
                if(groupmessage1.equals("") && chatmessages.equals("") )
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
                <img class="img-profile rounded-circle" src="StudentViewImage.jsp?name=<%=user%>">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="StudentProfile.jsp">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="Ssettings.jsp">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="logout.jsp">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>
           
  </nav>
   <div class="row">
  
  <%
  try
  {
	  Date today = new Date();  

	  SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("dd/MM/yyyy");
	  Calendar calendar = Calendar.getInstance();
	  calendar.setTime(today);
	  //System.out.println(simpleDateFormat1.format(calendar.getTime()));
	  calendar.add(Calendar.DATE, -7);
	  //System.out.println(simpleDateFormat1.format(calendar.getTime()));
String mydate=simpleDateFormat1.format(calendar.getTime());
Calendar calendar1 = Calendar.getInstance();
String mydate1=simpleDateFormat1.format(calendar1.getTime());
Calendar calendar2 = Calendar.getInstance();
calendar2.setTime(today);
//System.out.println(simpleDateFormat1.format(calendar.getTime()));
calendar2.add(Calendar.MONTH, -1);
String mydate2=simpleDateFormat1.format(calendar2.getTime());

  String subscode="",subs="",dued="";
  int cntfacass=0;
  int cntstass=0;
  double per=0.0,per2=0.0;
  double per1=0.0;
  String subd="";
  int cntlastmonth=0;
 String ti="";
 int cntlastweek=0;
 int lastweek=0,lastmonth=0;
  String sql = "Select Subject_code from student_subject where Userid=?"; //os
  PreparedStatement pstm = con1.prepareStatement(sql);
  pstm.setString(1,(String)session.getAttribute("sessuid"));
 ResultSet rs = pstm.executeQuery();
 String fp="";
  while(rs.next())
  {
	  fp="";
	  cntlastweek=0;
	  cntlastmonth=0;
	  per=0.0;
	  per1=0.0;
	  per2=0.0;
	  cntfacass=0;
	  cntstass=0;
	  lastweek=0;
	  lastmonth=0;
	 subscode=rs.getString(1);
	 //out.println(subscode);
	 String sql1 = "Select Subject,DueDate,Title from facultyassignment where Subject_code=?";  //no
	  PreparedStatement pstm1 = con1.prepareStatement(sql1);
	  pstm1.setString(1,subscode);
	 ResultSet rs1 = pstm1.executeQuery();
	 while(rs1.next())
	 {
		 cntfacass++;
	fp="scanned";
		 System.out.println(cntfacass);
		 subs=rs1.getString(1); //subs=uml
		 //out.println(subs+"<br>");
		 dued=rs1.getString(2);
	 ti=rs1.getString(3);
	 SimpleDateFormat sdformat1 = new SimpleDateFormat("dd/MM/yyyy");
	 Date d6 = sdformat1.parse(mydate);
     Date d7 = sdformat1.parse(mydate1);
     Date d8 = sdformat1.parse(dued);
     Date d9 = sdformat1.parse(mydate2);
     if(d8.compareTo(d6)>=0 && d8.compareTo(d7)<=0)
     {
    	 cntlastweek++;
    	
     }
     if(d8.compareTo(d9)>=0 && d8.compareTo(d7)<=0)
     {
    	 cntlastmonth++;
    	
     }
	 String sql2 = "Select Id,Submitted_date from student_assignments where subject_code=? and Name=? and Assignment_name=?";
	  PreparedStatement pstm2 = con1.prepareStatement(sql2);
	  pstm2.setString(1,subscode);
	  pstm2.setString(2,(String)session.getAttribute("sessuid"));
	  pstm2.setString(3,ti);
	 ResultSet rs2 = pstm2.executeQuery();
	 while(rs2.next())
	 {
		 
		 subd=rs2.getString(2);
		// out.println(subd);
		fp="scanned";
		 SimpleDateFormat sdformat = new SimpleDateFormat("dd/MM/yyyy");
	      Date d1 = sdformat.parse(subd);
	      Date d2 = sdformat.parse(dued);
	      Date d3 = sdformat.parse(mydate);
	      Date d4 = sdformat.parse(mydate1);
	      Date d5 = sdformat.parse(mydate2);
	     
		 if(d1.compareTo(d2)<0 || d1.compareTo(d2)==0)
		 {
		 cntstass++;
		 }
		 if(d1.compareTo(d3)>=0 && d1.compareTo(d4)<=0 && d1.compareTo(d2)<=0)
		 {
		 lastweek++;
		
		 }
		 if(d1.compareTo(d5)>=0 && d1.compareTo(d4)<=0 && d1.compareTo(d2)<=0)
		 {
		 lastmonth++;
		
		 }
		 
	 }
	 }
	
	 per=(double)cntstass/(double)cntfacass*100;
	 per1=(double)lastweek/(double)cntlastweek*100;
	 per2=(double)lastmonth/(double)cntlastmonth*100;
	 if(cntfacass>0 && fp.equals("scanned"))
	 {
	 %>
	    <div class="col-xl-3 col-lg-6 mb-4">
      <div class="bg-white rounded-lg p-5 shadow">
        <h2 class="h6 font-weight-bold text-center mb-4"><b><%=subs %></b> Assignment progress </h2>
        <!-- Progress bar 1 -->
        <div class="progress mx-auto" data-value='<%=per%>'>
          <span class="progress-left">
                        <span class="progress-bar border-primary"></span>
          </span>
          <span class="progress-right">
                        <span class="progress-bar border-primary"></span>
          </span>
          <div class="progress-value w-100 h-100 rounded-circle d-flex align-items-center justify-content-center">
            <div class="h2 font-weight-bold"><%=Math.round(per)%><sup class="small">%</sup></div>
          </div>
        </div>
        <!-- END -->
        <%
        }
	 else if(cntfacass==0 && fp.equals("scanned"))
	 {
	  %>
	  	    <div class="col-xl-3 col-lg-6 mb-4">
      <div class="bg-white rounded-lg p-5 shadow">
        <h2 class="h6 font-weight-bold text-center mb-4"><b><%=subs %></b> Assignment progress </h2>

        <!-- Progress bar 1 -->
        <div class="progress mx-auto" data-value='100'>
          <span class="progress-left">
                        <span class="progress-bar border-primary"></span>
          </span>
          <span class="progress-right">
                        <span class="progress-bar border-primary"></span>
          </span>
          <div class="progress-value w-100 h-100 rounded-circle d-flex align-items-center justify-content-center">
            <div class="h2 font-weight-bold">100<sup class="small">%</sup></div>
          </div>
        </div>
        <!-- END -->
	  
<%
	 }
if(cntlastweek>0 && fp.equals("scanned"))
{
%>
        <!-- Demo info -->
        <div class="row text-center mt-4">
          <div class="col-6 border-right">
            <div class="h4 font-weight-bold mb-0"><%=Math.round(per1)%>%</div><span class="small text-gray">Last week</span>
          </div>
          <%
          }
else if(cntlastweek==0 && fp.equals("scanned"))
{
          %>
            <!-- Demo info -->
        <div class="row text-center mt-4">
          <div class="col-6 border-right">
            <div class="h4 font-weight-bold mb-0">100%</div><span class="small text-gray">Last week</span>
          </div>
          <%
          }
          %>
          <%
if(cntlastmonth>0 && fp.equals("scanned"))
{
%>
          <div class="col-6">
            <div class="h4 font-weight-bold mb-0"><%=Math.round(per2)%>%</div><span class="small text-gray">Last month</span>
          </div>
        </div>
        <!-- END -->
        <%
}
else if(cntlastmonth==0 && fp.equals("scanned"))
{
        %>
 
 <div class="col-6">
            <div class="h4 font-weight-bold mb-0">100%</div><span class="small text-gray">Last month</span>
          </div>
        </div>
        <!-- END -->
 
 <%
}  
  %>      
      </div>
    </div>
      

	 
	 
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
<script src="Bootstrap/jquery/jquery.min.js"></script>
  <script src="Bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="Bootstrap/js/script_file.js"></script>
   <%
try
{
	con1.close();
	
}
catch(Exception e)
{
	
	out.println(e.getMessage());
}



%>
  
  </div>
</body>
</html>