<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.text.DateFormat" %>
 <%@ include file="connection.jsp" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>My Assignments</title>
<link href="Bootstrap/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">


<link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="Bootstrap/css/style.css" rel="stylesheet" type="text/css"></link>
<link rel="stylesheet" type="text/css" href="Bootstrap/dist/bootstrap-clockpicker.min.css">
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<style>
input[type="date"] {
  position: relative;
  padding: 15px;

}

input[type="date"]::-webkit-calendar-picker-indicator {
  color: transparent;
  background: none;
  z-index: 1;
}
#date
{
font-family:Times New Roman;
font-size:20px;
 width: 432px;
  padding: 5px 20px;
margin: 9px;
margin-left:-1px;
 box-sizing: border-box;
 border: 1px solid silver;
}
input[type="date"]:before {
  color: transparent;
  background: none;
  display: block;
  font-family: 'FontAwesome';
  content: '\f073';
  /* This is the calendar icon in FontAwesome */
  width: 15px;
  height: 30px;
  position: absolute;
  top: 7px;
  right: 25px;
  color: #999;

}


a
{
text-decoration:none;
}
#addnew{
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
  height:90px;
  width:260px;
  font-size:20px;
  border:none;
outline:none;
  margin-left:1050px;
 text-decoration:none;
 margin-top:15px;
 padding:12px;
}

.mybuttons
{
text-decoration:none;
color:black;
margin-left:30px;
cursor:pointer;
}
#notice1
{
margin-left:60px;
text-decoration:none;
color:black;
}
#assignment1
{
text-decoration:none;
color:black;
border-bottom:2px solid red;
}

#test1
{
text-decoration:none;
color:black;

}
#file1
{
text-decoration:none;
color:black;
}
#student1
{
text-decoration:none;
color:black;
}
#notices
{

  text-decoration:none;
  color:#000;
  background:#ffc;
  display:inline-block;
  height:13em;
  width:13em;
  padding:1rem;
  -moz-box-shadow:3px 3px 5px rgba(33,33,33,1);
  -webkit-box-shadow: 3px 3px 5px rgba(33,33,33,.7);
  box-shadow: 3px 3px 5px rgba(33,33,33,.7);
  -moz-transition:-moz-transform .15s linear;
  -o-transition:-o-transform .15s linear;
  -webkit-transition:-webkit-transform .15s linear;
margin-left:40px;
}
#notices{
  -webkit-transform: rotate(-6deg);
  -o-transform: rotate(-6deg);
  -moz-transform:rotate(-6deg);
}
#notices:hover{
  box-shadow:2px 2px 2px rgba(0,0,0,.7);
  -moz-box-shadow:2px 2px 2px rgba(0,0,0,.7);
  -webkit-box-shadow: 2px 2px 2px rgba(0,0,0,.7);
  -webkit-transform: scale(1.10);
  -moz-transform: scale(1.25);
  -o-transform: scale(1.25);
  position:relative;
  z-index:5;
}
#notices #addnewnotice
{
 border-style: dotted;
 border-color:lightgrey;
text-align:center;
color:grey;
font-size:5rem;
height:140px;
}
#notices #notic
{
color:black;
font-size:18px;
 word-wrap: break-word;

}
#notices h2{
  font-size:22px;
  font-weight:bold;
  padding-bottom:10px;
}
.image-upload > input
{
    display: none;
}

.image-upload img
{
    width: 80px;
    cursor: pointer;
}
tr {
border-bottom: 1px solid #ccc;
}
table
{
color:black;
font-size:17px;
margin-left:40px;
}
textarea
{
  width:432px;
   outline:none;
   font-size:15px;
  padding: 10px 10px;
 border:1px solid silver;
  resize:none;
 
    }
    
    #dragdrop{
  position: absolute;
  top: 50%;
  left: 50%;
  margin-top: -100px;
  margin-left: -250px;
  width: 500px;
  height: 200px;
  border: 4px dashed black;
 
}
#dragdrop p{
  width: 100%;
  height: 100%;
  text-align: center;
  line-height: 170px;
  color:black;
  font-family: Arial;
}
#dragdrop input{
  position: absolute;
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  outline: none;
  opacity: 0;
}
#dragdrop button{
  margin: 0;
  color: #fff;
  
  border: none;
  width: 508px;
  height: 35px;
  margin-top: -20px;
  margin-left: -4px;
  border-radius: 4px;
  border-bottom: 4px solid #117A60;
  transition: all .2s ease;
  outline: none;
}
#dragdrop button:hover{
  background: #149174;
	color: #0C5645;
}
#dragdrop button:active{
  border:0;
}
tr:hover
{
background:lightgrey;
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
    #pp:hover
{
background:transparent;
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
        <a class="nav-link" href="StudentDashboard.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      
      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item active">
        <a class="nav-link collapsed" href="StudentClass.jsp">
          <i class="fa fa-graduation-cap"></i>
          <span>
          <% 
          String collegename=(String)session.getAttribute("colcode");
          Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
          String user=(String)session.getAttribute("sessuid");
          String username=(String)session.getAttribute("sessname");
          String query="Select department from student_details where Userid=?";
          PreparedStatement ps20=con1.prepareStatement(query);
          ps20.setString(1,user);
          ResultSet rs20=ps20.executeQuery();
          if(rs20.next())
          {
          out.println(rs20.getString(1));
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
      <button title="Back"style="background:transparent;font-size:25px;outline:none;border:none;"onclick="goBack()"><i class="fas fa-angle-left"></i></button>
<button title="Forward"style="background:transparent;font-size:25px;outline:none;border:none;"onclick="goForward()"><i class="fas fa-angle-right"></i></button>

<script>
function goForward() {
  window.history.forward();
}
</script>
  <script>
  function goBack() {
    window.history.back();
  }
  </script>
      <%
  //    String collegename=(String)session.getAttribute("colcode");
  //Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
  
  String query2="Select Subject_name from subject_details where Subject_code=?";  
  PreparedStatement ps5=con1.prepareStatement(query2);
  String subject=(String)session.getAttribute("studsubject1");
  String subject1="";
  ps5.setString(1,subject);
  ResultSet rs5=ps5.executeQuery();
  while(rs5.next())
  {
	  subject1=rs5.getString(1);
	}
  
  session.setAttribute("subjectname",subject1);
  
  out.println("<b>"+(String)session.getAttribute("subjectname")+"</b>");
  int astatus=0;
  PreparedStatement ps6=con1.prepareStatement("Update student_subject set AssignmentStatus=? Where Userid=? and Subject_code=?");
	 ps6.setInt(1,astatus);
	   ps6.setString(2,(String)session.getAttribute("sessuid"));
	   ps6.setString(3,subject);
	   int row3=ps6.executeUpdate();
 
  %>
  
  
      
      <!-- links-->
         <a class="mybuttons"id="notice1"href="StudentSubject.jsp">Notice</a>
         <a class="mybuttons"id="file1"href="StudentSubjectFile.jsp">File</a>
          <a class="mybuttons"id="assignment1"href="StudentSubjectAssignment.jsp">Assignment</a>
          <a class="mybuttons"id="test1"href="StudentSubjectQuiz.jsp">Quiz</a>
          <a class="mybuttons"id="student1"href="StudentSubjectStudent.jsp">Student</a>
         
          
          
          
     <ul class="navbar-nav ml-auto">
      <%
      int nstatus=0,astatus1=0,qqstatus=0,ststatus=0,notitotal=0,psstatus=0,proffstatus=0,proffpicstatus=0,totalsta=0,stotal=0;
      PreparedStatement pstmt29=null;
     pstmt29=con1.prepareStatement("SELECT NoticeStatus,AssignmentStatus,QuizStatus,StudyMaterial FROM student_subject WHERE Userid=?");
      pstmt29.setString(1,(String)session.getAttribute("sessuid"));
      ResultSet rs29=pstmt29.executeQuery();
      while(rs29.next())
      {     
    	  nstatus=rs29.getInt(1);
    	  astatus1=rs29.getInt(2);
    	  qqstatus=rs29.getInt(3);
    	  ststatus=rs29.getInt(4);
    	  stotal=stotal+nstatus+astatus1+qqstatus+ststatus;
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
         <%  String message2=request.getParameter("message");
if(message2!=null)
{
	out.println("<span><center>"+message2+"</center></span>");
}
%>
  <div style="margin-left:20px;color:black;margin-top:-4px;position:absolute;"><h3><i class="fas fa-chalkboard-teacher" aria-hidden="true"></i>&nbsp;Assignments</h3></div>
   <div style="height:50px;"></div>
    <div id="assignment">
   
    <div id="assignmentboard">
    

<div id="accordion">
	<%
	 String s1 = "Select Title from facultyassignment where Subject_code=?";
	  PreparedStatement p1 = con1.prepareStatement(s1);
	  p1.setString(1,subject);
	 String tit="";
	  ResultSet r1 = p1.executeQuery();
	  int asgncount=0;
	 while(r1.next())
	 {
		 //asgncount=r1.getInt(1);
		 tit=r1.getString(1);
		  String q1="Select Assignment_name from student_assignments where Assignment_name=? and Name=?";
  PreparedStatement ps10=con1.prepareStatement(q1);
  ps10.setString(1,tit);
  ps10.setString(2,(String)session.getAttribute("sessuid"));
  ResultSet rs10=ps10.executeQuery();
  if(rs10.next())
  {
	  //out.println();
  }
  else
  {
	  asgncount++;
  }
	 }
	%>
  <a id="assigndetails"data-toggle="collapse" href="#assigned" aria-expanded="false" aria-controls="assigned" style="text-decoration:none;color:black;margin-left:20px;"> 
 Assigned (<%=asgncount %>)
  </a>
    <div class="collapse" id="assigned" data-parent = "#accordion"> 
        
    
  <%   
  int cnt=0;
  
  String sql = "Select Id,Title,File_name,File_data,Date,Time,DueDate,DueTime from facultyassignment where Subject_code=? order by Id desc ";
  PreparedStatement pstm = con1.prepareStatement(sql);
  pstm.setString(1,subject);
 
  ResultSet rs = pstm.executeQuery();
  %>
  <table cellspacing="6" cellpadding="25">
  <tr id="pp"><th>#</th><th>Title</th><th>File</th><th>Created At</th><th>Due Date</th></tr>
  
  <% 
  String title="";
 
  while(rs.next()) 
  {
	  
  	int id=rs.getInt("Id");
  	  title = rs.getString("Title");
  String fileName = rs.getString("File_Name");
 
  Blob fileData = rs.getBlob("File_data");
  String upload_date = rs.getString("Date");
  String upload_time = rs.getString("Time");
  String duedate=rs.getString("DueDate");
  String duetime=rs.getString("DueTime");
  String q="Select Assignment_name from student_assignments where Assignment_name=? and Name=?";
  PreparedStatement ps1=con1.prepareStatement(q);
  ps1.setString(1,title);
  ps1.setString(2,(String)session.getAttribute("sessuid"));
  
  ResultSet rs1=ps1.executeQuery();
  if(rs1.next())
  {
	  out.println();
  }
  else
  {
	  cnt++;
%>
<tr onclick="location.href='StudentUploadAssignment.jsp?id='+<%=id%>;">

<td><%=cnt %></td>
<td><%=title%></td>
<td id="fname" title="<%=fileName%>"><%=fileName.substring(0, Math.min(fileName.length(), 40))%></td><td><%=upload_date %>&nbsp;<%=upload_time %></td>
<td>
<%

SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
Date date1 = sdf.parse(duedate);
Date date2=new Date();
String d2=sdf.format(date2);
DateFormat dateFormat = new SimpleDateFormat("hh:mm aa");
String dateString = dateFormat.format(new Date()).toString();

String d1=d2.substring(0, 10);

if(duedate.compareTo(d1)==0 && dateString.compareTo(duetime)<0 || dateString.compareTo(duetime)==0 || duedate.compareTo(d1)>0)
{

	%>
	<span><%=duedate %>&nbsp;<%=duetime %></span></td>
	
<% 
	//out.println(sdformat.format(d1));
}
else
{
	%>
		<span style="color:red;"><%=duedate %>&nbsp;<%=duetime %></span></td>
	
	
<% 
	//out.println(sdformat.format(d2));
}
%>

</tr>
<% 
  }
  }
  %>
  
  </table>
 </div>
 <br>
 <%
	 String s2 = "Select count(*) from student_assignments where subject_code=? and Name=?";
	  PreparedStatement p2 = con1.prepareStatement(s2);
	  p2.setString(1,subject);
	  p2.setString(2,(String)session.getAttribute("sessuid"));
	 int subcount=0;
	  ResultSet r2 = p2.executeQuery();
	 if(r2.next())
	 {
		 subcount=r2.getInt(1);
	 }
	 else
	 {
		 subcount=0;
	 }
	%>
 
 <a id="assigndetails"data-toggle="collapse" href="#submitted" aria-expanded="false" aria-controls="submitted" style="text-decoration:none;color:black;margin-left:20px;"> 
 Submitted (<%=subcount %>)
  </a>
    <div class="collapse" id="submitted" data-parent = "#accordion"> 
        
    
  <%   
  int cnt1=0;
  String sql1 = "Select id,Assignment_name,Assignment_file,File_data,Submitted_date,Submitted_time from student_assignments where Subject_code=? and Name=? order by Id desc ";
  PreparedStatement pstm1 = con1.prepareStatement(sql1);
  pstm1.setString(1,subject);
  pstm1.setString(2,(String)session.getAttribute("sessuid"));
  ResultSet rs1 = pstm1.executeQuery();
  %>
  <table cellspacing="6" cellpadding="25">
  <tr id="pp"><th>#</th><th>Title</th><th>File</th><th>Submitted On</th></tr>
  
  <% 
  String title1="";
  while(rs1.next()) 
  {
	  cnt1++;
  	int id1=rs1.getInt("id");
  	  title1 = rs1.getString("Assignment_name");
  String fileName1 = rs1.getString("Assignment_file");
 
  Blob fileData1 = rs1.getBlob("File_data");
  String upload_date1 = rs1.getString("Submitted_date");
  String upload_time1 = rs1.getString("Submitted_time");
  
%>
<tr onclick="location.href='StudentUpdateAssignment.jsp?id='+<%=id1%>;">

<td><%=cnt1 %></td>
<td><%=title1%></td>
<td id="fname" title="<%=fileName1%>"><%=fileName1.substring(0, Math.min(fileName1.length(), 40))%></td><td><%=upload_date1 %>&nbsp;<%=upload_time1 %></td>
</tr>
<% 
  }
  
  %>
  
  </table>

 </div>
 
</div>
  

</div>
</div>


<script type="text/javascript" src="Bootstrap/dist/bootstrap-clockpicker.min.js"></script>
<script>
$(document).ready(function(){
    $('#default-picker').timepicker({ timeFormat: 'h:mm:ss p' });
});

</script>
<script>
var input = document.getElementById('inputGroupFile01');
var infoArea = document.getElementById('info-area');

input.addEventListener( 'change', showFileName );

function showFileName( event ) {
  
  // the change event gives us the input it occurred in 
  var input = event.srcElement;
  
  // the input has an array of files in the `files` property, each one has a name that you can use. We're just using the name here.
  var fileName = input.files[0].name;
  var res = fileName.substr(0, 20);
  // use fileName however fits your app best, i.e. add it into a div
  infoArea.textContent = res;
}

</script>


<script src="Bootstrap/jquery/jquery.min.js"></script>
  <script src="Bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="Bootstrap/js/script_file.js"></script>
   <%
try
{
	con1.close();
	con.close();
}
catch(Exception e)
{
	
	out.println(e.getMessage());
}



%>
</body>
</html>