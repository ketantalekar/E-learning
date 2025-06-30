<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.text.DateFormat,java.text.*,java.util.Calendar" %>
 <%@ include file="connection.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Assignments</title>
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
#date2
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
#pp:hover
{
background:transparent;
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
#qq:hover
{
background:transparent;
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
        <a class="nav-link" href="FacultyDashboard.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

       <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item active">
        <a class="nav-link collapsed" href="FacultyAllSubjects.jsp">
          <i class="fas fa-book"></i>
          <span>Subjects</span>
        </a>
     
              </li>
 <li class="nav-item">
        <a class="nav-link" href="Facultychats.jsp" >
          <i class="fas fa-comments"></i>
          <span>Chats</span>
        </a>
        </li>
 
      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="FacultyCourses.jsp">
          <i class="fa fa-book"></i>
          <span>Courses</span>
        </a>
        </li>

     

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="FacultyFeedback.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Feedback</span></a>
      </li>
<!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="FacultyStudentsPerformance.jsp">
          <i class="fas fa-fw fa-chart-bar"></i>
          <span>Students Performance</span></a>
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
      String collegename=(String)session.getAttribute("colcode");
  Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
  String subject=(String)session.getAttribute("subjectname1");
  String subject2=(String)session.getAttribute("subjectname");
  
  out.println("<b>"+subject2+"</b>");
 
   %>
  
  
      
      <!-- links-->
         <a class="mybuttons"id="notice1"href="FacultySubject.jsp">Notice</a>
         <a class="mybuttons"id="file1"href="FacultySubjectFile.jsp">File</a>
          <a class="mybuttons"id="assignment1"href="FacultySubjectAssignment.jsp">Assignment</a>
          <a class="mybuttons"id="test1"href="FacultySubjectQuiz.jsp">Quiz</a>
          <a class="mybuttons"id="student1"href="FacultySubjectStudent.jsp">Student</a>
         
          
          
          
            <ul class="navbar-nav ml-auto">
      <%
      PreparedStatement pstmt49=null;
      PreparedStatement pstmt50=null;

 	 PreparedStatement pstmt29=null;
     PreparedStatement pstmt46=null;
     int notitotal=0,psstatus=0,proffstatus=0,proffpicstatus=0,totalsta=0;
     pstmt46=con1.prepareStatement("SELECT ProfilePicStatus,ProfileStatus,PasswordStatus FROM faculty_details WHERE Userid=?");
     pstmt46.setString(1,(String)session.getAttribute("sessuid"));
     ResultSet rs46=pstmt46.executeQuery();
     if(rs46.next())
     {     
   	
   	  proffpicstatus=rs46.getInt(1);
   	  proffstatus=rs46.getInt(2);
   	  psstatus=rs46.getInt(3);
     totalsta=proffpicstatus+proffstatus+psstatus;
     }
      pstmt49=con1.prepareStatement("SELECT Subject_code FROM subject_details WHERE Userid=?");
      pstmt49.setString(1,(String)session.getAttribute("sessuid"));
      ResultSet rs49=pstmt49.executeQuery();
      String mysubcode="";
      int assigntotal=0,countassignstatus=0;
      int st=1;
      int quizsttotal=0,countquizst=0;
      while(rs49.next())
      {     
    	 mysubcode=rs49.getString(1);
    	 
    	 
         pstmt29=con1.prepareStatement("SELECT count(Status) FROM student_assignments WHERE subject_code=? and Status=?");
          pstmt29.setString(1,mysubcode);
          pstmt29.setInt(2,st);
          ResultSet rs29=pstmt29.executeQuery();
          while(rs29.next())
          {     
        	  countassignstatus=rs29.getInt(1);
        	 assigntotal=assigntotal+ countassignstatus;
          }
          
          pstmt50=con1.prepareStatement("SELECT count(Status) FROM quizresult WHERE Subject_code=? and Status=?");
          pstmt50.setString(1,mysubcode);
          pstmt50.setInt(2,st);
          ResultSet rs50=pstmt50.executeQuery();
          while(rs50.next())
          {     
        	  countquizst=rs50.getInt(1);
        	  quizsttotal=quizsttotal+countquizst;
          }
    	 
    	 
      }
      notitotal=totalsta+quizsttotal+assigntotal;
      
      
      
      
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
	
	<a class="dropdown-item d-flex align-items-center" href="Fsettings.jsp">
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
	
	<a class="dropdown-item d-flex align-items-center" href="FacultyProfile.jsp">
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
	
	<a class="dropdown-item d-flex align-items-center" href="Fsettings.jsp">
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
PreparedStatement pstmt40=null;
PreparedStatement pstmt51=null;
String subcode="",subsname="",assname="",quizztitle="";
int myassignid=0;
int quizzstatus=1,assignmentst=1;
int assignstudent=0,quizstudent=0;
pstmt21=con1.prepareStatement("SELECT Subject_code,Subject_name FROM subject_details WHERE Userid=?");
pstmt21.setString(1,(String)session.getAttribute("sessuid"));
ResultSet rs21=pstmt21.executeQuery();
while(rs21.next())
{
	subcode=rs21.getString(1);
	subsname=rs21.getString(2);
	
	pstmt22=con1.prepareStatement("SELECT count(Status),Assignment_name FROM student_assignments WHERE Subject_code=? and Status=? order by id desc");
	pstmt22.setString(1,subcode);
	pstmt22.setInt(2,assignmentst);
	ResultSet rs22=pstmt22.executeQuery();
while(rs22.next())
{
	assignstudent=rs22.getInt(1);
	assname=rs22.getString(2);
	pstmt51=con1.prepareStatement("SELECT Id FROM facultyassignment WHERE Subject_code=? and Title=?");
	pstmt51.setString(1,subcode);
	pstmt51.setString(2,assname);
	ResultSet rs51=pstmt51.executeQuery();
if(rs51.next())
{
myassignid=rs51.getInt(1);
}
	if(assignstudent==1)
	 {
	%>
	<a class="dropdown-item d-flex align-items-center" href="test.jsp?sfassign=<%=subcode%>&ide=<%=myassignid%>">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
               
 <b><%=assignstudent %></b> Student has uploaded the Assignment '<b><%=assname %></b>'
 </div>
                </a>
	<%
}
	else if(assignstudent>1)
	 {
	%>
	<a class="dropdown-item d-flex align-items-center" href="test.jsp?sfassign=<%=subcode%>&ide=<%=myassignid%>">
                 <div class="mr-3">
                   <div class="icon-circle bg-warning">
                     <i class="fas fa-exclamation-triangle text-white"></i>
                   </div>
                 </div>
                 <div>
              
<b><%=assignstudent %></b> Students have uploaded the Assignment '<b><%=assname %></b>'
</div>
               </a>
	<%
}
}
int qqqid=0;
pstmt23=con1.prepareStatement("SELECT count(Status),title FROM quizresult WHERE Subject_code=? and Status=? order by id desc");
pstmt23.setString(1,subcode);
pstmt23.setInt(2,quizzstatus);
ResultSet rs23=pstmt23.executeQuery();
while(rs23.next())
{
	quizstudent=rs23.getInt(1);
	quizztitle=rs23.getString(2);
	
	pstmt40=con1.prepareStatement("SELECT quiz_date,quiz_time,id FROM quiz_info WHERE subject=? and title=?");
	pstmt40.setString(1,subcode);
	pstmt40.setString(2,quizztitle);
	
	ResultSet rs40=pstmt40.executeQuery();
	String qdate3="",qtime3="";
if(rs40.next())
	{
	qdate3=rs40.getString(1);
	qtime3=rs40.getString(2);
	qqqid=rs40.getInt(3);
}
 
 if(quizstudent==1)
 {
	 %>
<a class="dropdown-item d-flex align-items-center" href="test.jsp?sfquiz=<%=subcode%>&idf=<%=qqqid%>">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
               
 <div class="small text-gray-500"><%=qdate3 %> <%=qtime3 %></div>
 <b><%=quizstudent %></b> Student has submitted the Quiz named '<b><%=quizztitle %></b>'
 </div>
                </a>
                <% 
   }
  else if(quizstudent>1)
 {
	  %>
<a class="dropdown-item d-flex align-items-center" href="test.jsp?sfquiz=<%=subcode%>&idf=<%=qqqid%>">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
               
 <div class="small text-gray-500"><%=qdate3 %> <%=qtime3 %></div>
 <b><%=quizstudent %></b> Students have submitted the Quiz named '<b><%=quizztitle %></b>'
 </div>
                </a>
 <%
   }           
 

}

}
if(psstatus==0 && proffstatus==0 && proffpicstatus==0 && quizstudent==0 && assignstudent==0)
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
                <img class="img-profile rounded-circle" src="FacultyViewImage.jsp?name=<%=session.getAttribute("sessuid")%>">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="FacultyProfile.jsp">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="Fsettings.jsp">
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
	</nav>
	<br>
	<%
}
%>
  <div style="margin-left:60px;color:black;margin-top:-4px;position:absolute;"><h3><i class="fas fa-chalkboard-teacher" aria-hidden="true"></i>&nbsp;Assignments</h3></div>
    <div id="assignment">
   
    <div id="assignmentboard">
    

      
    
    </div>
    
   </div>
   <a href="" data-toggle="modal" data-target="#addassignment" id="addnew"><i class="fa fa-plus" aria-hidden="true"></i> Add Assignment</a>
  
   <div id="addassignment" class="modal fade" tabindex="-1" role="dialog">
   <div class="modal-dialog" role="document"> 
    
     <!-- login modal content -->
        <div class="modal-content" id="login-modal-content">        
            <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Add New Assignment</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
    </div>
          <div class="modal-body mx-3">
          <form action="/E-learning/FacultyUploadAssignment" method="POST" ENCTYPE="multipart/form-data">
    <div class="form-group">
     
                <div class="input-group">
                <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-info-circle" aria-hidden="true"></i></span></div>
            	<input name="assigntitle" id="assigntitle" autocomplete="off"type="text" class="form-control input-lg" placeholder="Enter Assignment Title" required>
                	</div>
      </div>   
      <div class="form-group">
                
                <div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroupFileAddon01"><i class="fa fa-files-o" aria-hidden="true"></i></span>
  </div>
  <div class="custom-file">
    <input type="file" name="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01"required>
    <label class="custom-file-label" for="inputGroupFile01" id="info-area">Choose file</label>
  </div>
</div>
                                      
            </div>         
            <div class="form-group">
                
   <textarea name="description" placeholder="Description about Assignment"></textarea>
                 </div>        
                 <label for="date">Set Due Date </label>
 
                <input id="date2"type="date"name="duedate">
<div class="md-form md-outline">
 <label for="default-picker">Set Due Time </label>
  <input type="time" name="duetime" id="default-picker" class="form-control" placeholder="Select time">
 
</div>
<br>
       <button type="submit" class="btn btn-primary btn-block btn-lg">&#43; Upload Assignment</button>
  </div>
      
           </div>
          </form>
        </div>
        
       </div><br><br>

  <% 
  try
  {
	  
  
  int cnt=0;
  String sql = "Select Id,Title,File_name,File_data,Date,Time,DueDate,DueTime,Subject,Subject_code,Description from facultyassignment where Userid=? and Subject_code=? order by Id desc ";
  PreparedStatement pstm = con1.prepareStatement(sql);
  pstm.setString(1,(String)session.getAttribute("sessuid"));
  pstm.setString(2,subject);
  
  ResultSet rs = pstm.executeQuery();
  %>
  <table cellspacing="6" cellpadding="25">
  <tr id="qq"><th>#</th><th>Title</th><th>File</th><th>Created At</th><th>Due Date</th><th>Action</th></tr>
  <% 
  while(rs.next()) 
  {
	  cnt++;
  	int id=rs.getInt("Id");
  	 String title = rs.getString("Title");
  String fileName = rs.getString("File_Name");
 
  Blob fileData = rs.getBlob("File_data");
  String upload_date = rs.getString("Date");
  String upload_time = rs.getString("Time");
  String duedate=rs.getString("DueDate");
  String duetime=rs.getString("DueTime");
  String subjectcode=rs.getString("Subject_code");
  String[] s=duedate.split("/");
  String disdate=s[2]+"-"+s[1]+"-"+s[0];
  SimpleDateFormat displayFormat = new SimpleDateFormat("HH:mm");
  SimpleDateFormat parseFormat = new SimpleDateFormat("hh:mm a");
  Date date = parseFormat.parse(duetime);
  String dtime=displayFormat.format(date);
  String description=rs.getString("Description");
%>
<tr>

<td onclick="location.href='FacultyShowAssignment.jsp?id='+<%=id%>;"><%=cnt %></td>
<td onclick="location.href='FacultyShowAssignment.jsp?id='+<%=id%>;"><%=title%></td>
<td style="width:40px;"id="fname" title="<%=fileName%>" ><a href="/E-learning/FacultyViewAssignmenfile?filename=<%=fileName%>" target="_blank" style="text-decoration:none;"><%=fileName.substring(0, Math.min(fileName.length(), 40))%></a></td>
<td onclick="location.href='FacultyShowAssignment.jsp?id='+<%=id%>;"><%=upload_date %>&nbsp;<%=upload_time %></td>
<td onclick="location.href='FacultyShowAssignment.jsp?id='+<%=id%>;"><%=duedate %>&nbsp;<%=duetime %></td>
<td><a href="" data-toggle="modal" data-target="#E<%=id%>" class="btn btn-md"style="background:#186A3B;color:white;">Edit</a> 
	<a href="" data-toggle="modal" data-target="#D<%=id%>"class="btn btn-md"style="background:#C0392B;color:white;">Remove</a></td>
</tr>
 <div id="E<%=id%>" class="modal fade" tabindex="-1" role="dialog">
   <div class="modal-dialog" role="document"> 
    
     <!-- login modal content -->
        <div class="modal-content" id="login-modal-content">        
            <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Edit Assignment</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
    </div>
          <div class="modal-body mx-3">
          <form action="/E-learning/FacultyEditAssignment" method="POST" ENCTYPE="multipart/form-data">
    <div class="form-group">
     <label for="assigntitle">Assignment Title </label>
                <div class="input-group">
                <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-info-circle" aria-hidden="true"></i></span></div>
            	<input name="assigntitle" id="assigntitle" autocomplete="off"type="text" class="form-control input-lg" value="<%=title %>" required>
                	</div>
      </div>   
      <div class="form-group">
                <label for="file">Assignment File </label>
                <div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroupFileAddon02"><i class="fa fa-files-o" aria-hidden="true"></i></span>
  </div>
  <div class="custom-file">
    <input type="file" name="file" class="custom-file-input" id="inputGroupFile02" aria-describedby="inputGroupFileAddon02">
    <label class="custom-file-label" for="inputGroupFile02" id="info-area2"><%=fileName %></label>
  </div>
</div>
                                      
            </div>         
            <div class="form-group">
              <label for="description">Description </label>  
   <textarea name="description" ><%=description%></textarea>
                 </div>        
                 <label for="date">Set Due Date </label>
 
                <input id="date"type="date"name="duedate" value="<%=disdate%>">
                
<div class="md-form md-outline">
 <label for="default-picker">Set Due Time </label>
  <input type="time" name="duetime" id="duetime" value="<%=dtime%>"class="form-control" placeholder="Select time">
 
</div>
<br>
<input type="hidden" name="prevtitle" value="<%=title%>">
       <button type="submit" class="btn btn-primary btn-block btn-lg"><i class="fas fa-edit"></i> Modify</button>
       </form>
  </div>
      
           </div>
          
        </div>
        
       </div>
       
       	<div id="D<%=id%>" class="modal" tabindex="-1" role="dialog">
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
          <p>Do you really want to delete this assignment? This process cannot be undone.</p>
      </div>
      <div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				<a href="DeleteFacultyAssignment.jsp?Id=<%=id %>" style="color:white;padding-top:10px;"class="btn btn-danger">Delete</a>
			</div>
        
       </div>
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
  
  </table>

 </div>
</div>
  

</div>
</div>


<script type="text/javascript" src="Bootstrap/dist/bootstrap-clockpicker.min.js"></script>
<script>
$(function(){
    var dtToday = new Date();
    
    var month = dtToday.getMonth() + 1;
    var day = dtToday.getDate();
    var year = dtToday.getFullYear();
    if(month < 10)
        month = '0' + month.toString();
    if(day < 10)
        day = '0' + day.toString();
    
    var maxDate = year + '-' + month + '-' + day;
  //  alert(maxDate);
    $('#date').attr('min', maxDate);
    $('#date2').attr('min', maxDate);
});
</script>
<script>
$('#duetime').timepicker({timeFormat: 'h:mm:ss p'});
</script>
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