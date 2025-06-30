<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.text.DateFormat,java.text.*,java.util.Calendar" %>
<%@ include file="connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Chats</title>
<link href="Bootstrap/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="Bootstrap/css/style.css" rel="stylesheet" type="text/css"></link>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
 
  <script type="text/javascript">
  $(document).ready(function(){
	  $('#myInput').keyup(function(){
		var search=$('#myInput').val();
		if(search!==''&&search!==null)
			{
			$.ajax({
				type:'POST',
				url:'CollegeAdminChatRecord.jsp',
				data:'key='+search,
				success:function(data)
				{
					$('#showList').html(data);
					$('#showList2').html(data);
				}
			});
			
			}
		else
			{
			$('#showList').html('');
			$('#showList2').html('');
			}
	  });
	  $(document).on('click','li',function(){
		  $('#myInput').val($(this).text());
document.getElementById("showList").innerHTML='';
document.getElementById("showList2").innerHTML='';

		//document.getElementById("private-chat-window").style.display="block";
		
	  });
  });
  
  </script>
   
<style>
#view-chats::-webkit-scrollbar {
  width:10px;

}


#view-chats::-webkit-scrollbar-track {
  background: #f1f1f1; 
}

#view-chats::-webkit-scrollbar-thumb {
  background: #888; 
border-radius:10px;
}


#view-chats::-webkit-scrollbar-thumb:hover {
  background: #555; 
}

* {
  box-sizing: border-box;
}


/*the container must be positioned relative:*/
.autocomplete {
  position: relative;
  display: inline-block;
}

input {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;

}

input[type=text] {
  background-color: #f1f1f1;
  width: 100%;
    font-size: 16px;
    outline:none;
}
#myInput1 {
  background-color: #f1f1f1;
  width: 83.7%;
    font-size: 16px;
    outline:none;
}
#search {
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
  height:48px;
  width:63.6px;
  font-size:20px;
  border:none;
  outline:none;
  margin-left:-5px;
  margin-top:-1.9px;
}
#search2{
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
  height:48px;
  width:63.6px;
  font-size:20px;
  border:none;
  outline:none;
  margin-left:-5px;
  margin-top:-1.9px;
  
}
.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
}

/*when hovering an item:*/
.autocomplete-items div:hover {
  background-color: #e9e9e9; 
}

/*when navigating through the items using the arrow keys:*/
.autocomplete-active {
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}
#private-bar
{
background-image:url("images/chat_back.jpg");
background-repeat:no-repeat;
background-size:cover;
height:717px;
width:100%;
margin-top:-20px;

}
.autocomplete
{
width:330px;
}
#top-panel{
background: #e5e5e5;
width: 31%;
height:50px;
}
#grp-icon{
margin-left:22.3%;
color:grey;
font-size:28px;
margin-top:10px;
position:absolute;
}
#head{
font-size:25px;
color:black;
margin-left:30px;
margin-top:10px;
position:absolute;
}



.sidepanel  {
  width: 0;
  position: fixed;
  z-index: 1;
  height: 720px;
  top: 0;
  left: 224px;
  background-color:silver;
  
  overflow: hidden;
  transition: 0.5s;
  padding-top: 60px;
 
  margin-top:74px
}

.sidepanel a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: grey;
  display: block;
  transition: 0.3s;
}

.sidepanel a:hover {
  color: black;
}

.sidepanel .closebtn {
  position: absolute;
  top: 0;
  right: 8px;
  font-size: 40px;
  top:-10px;
}
#close-back
{
background: #e5e5e5;;
width:100%;
height:50px;
margin-top:-60px;
}
#grp-add-icon{
margin-left:75%;
color:grey;
font-size:28px;
margin-top:10px;
position:absolute;
}
#top-panel-group{
background: #e5e5e5;
width: 100%;
height:50px;
}
#chat-bar{
height:620px;
width:393px;
color:;
background:#fff;
border:2px solid silver;

}


#line{
height:2px;
width:393px;
background:grey;
}
#private-chat-window
{
width:919px;
height:715px;
margin-top:-716px;
position:absolute;
margin-left:393px;
background:#E3F1FD;
border:2px solid silver;


}
html
{
overflow-y:hidden;
}
#chatuser
{
background:#34495E;
color:white;
width:100%;
height:60px;
}
textarea
{
  width:800px;
   outline:none;
   font-size:15px;
  padding: 10px 10px;
  margin-left:15px;
  resize:none;
 
    }
    #view-chats
    {
    background:#EBEDEF;
    width:914px;
    height:530px;
    overflow-y:scroll;
    overflow-x:hidden;
    }
    #search1{
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
  height:66px;
  width:65px;
  font-size:25px;
  border:none;
  outline:none;
  position:absolute;
  margin-top:0px;
}
#chat-sender
{
font-size:18px;
background:yellow;
width:auto;
height:auto;
margin-left:300px;
border:1px solid silver;
}
#chat-receiver
{
font-size:18px;
background:white;
width:auto;
height:auto;
margin-left:10px;
border:1px solid silver;
}
    
               #chat-align
            {
                display: inline-block;
                max-width: 500px;
                background-color: white;
                padding: 5px;
                border-radius: 4px;
                position: relative;
                border-width: 1px;
                border-style: solid;
                border-color: grey;
            }

            .left
            {
                float: left;
               left:10px;
            }

            .left:after
            {
                content: "";
                display: inline-block;
                position: absolute;
                left: -8.5px;
                top: 1px;
                height: 0px;
                width: 0px;
                border-top: 8px solid transparent;
                border-bottom: 8px solid transparent;
                border-right: 8px solid white;
            }

            .left:before
            {
                content: "";
                display: inline-block;
                position: absolute;
                left: -9px;
                top: 1px;
                height: 0px;
                width: 0px;
                border-top: 8px solid transparent;
                border-bottom: 8px solid transparent;
                border-right: 8px solid black;
            }

           .right:after
            {
                content: "";
                display: inline-block;
                position: absolute;
                right: -8px;
                top: 1px;
                height: 0px;
                width: 0px;
                border-top: 8px solid transparent;
                border-bottom: 8px solid transparent;
                border-left: 8px solid #dbedfe;
            }

            .right:before
            {
                content: "";
                display: inline-block;
                position: absolute;
                right: -9px;
                top: 1px;
                height: 0px;
                width: 0px;
                border-top: 8px solid transparent;
                border-bottom: 8px solid transparent;
                border-left: 8px solid grey;
               
            }

           #chat-align.right
            {
                float: right;
                 background-color: #dbedfe;
                 right:8px;
                
            }

            .clear
            {
                clear: both;
                background:#EBEDEF;
                height:3px;
            }
            #chat-name
            {
           margin-top:10px;
           margin-left:-5px;
           display:inline-block;
           font-weight:bold;
           font-size:24px;
            }
            .img-chat
            {
            padding:0px 20px;
           
            }
           
             #recent-chats
            {
            margin-left:5px;
            color:black;
            
            }
            
            #time
            {
            float:right;
            margin-right:5px;
            
            }
            #recent-align
            {
            margin-top:10px;
            width:100%;
            }
            #recent-msg
            {
            margin-left:100px;
            margin-top:-15px;
            font-size:16px;
            }
            #chat-line
            {
            border:1px solid lightgrey;
            }
            #recent-chats-link
            {
            text-decoration:none;
            
            }
            #private-chat-list
            {
            /*icon*/
            margin-left:335px;
            position:absolute;
            text-decoration:none;
            cursor:default;
            color:grey;
            font-size:30px;
            margin-top:5px;
            }
            #private-list-tab
            {
            height:620px;
            width:393px;
			color:;
			background:#fff;
			border:2px solid silver;
			margin-top:-622px;
			
			margin-left:0px;
			position:absolute;
			display:none;
            }
            .closebt
            {
             position: absolute;
             top: 0;
             right: 8px;
             font-size: 40px;
             top:-10px;
             color:black;
             text-decoration:none;
            }
          #closeprivate
          {
          text-decoration:none;
          color:black;
          } 
          #titleprivate-chat
          {
          padding:5px;
          text-decoration:underline;
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

         
</style>
</head>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <a class="sidebar-brand d-flex align-items-center justify-content-center"href="">
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

<li class="nav-item">
        <a class="nav-link collapsed" href="CollegeAdminStudent.jsp">
          <i class="fa fa-graduation-cap" aria-hidden="true"></i>
           <span>Students</span>
        </a>
        </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item active">
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
      
       
    </ul>
  <div id="content-wrapper" class="d-flex flex-column">

      <div id="content">
      
      <nav class="navbar navbar-expand topbar mb-4 static-top shadow">
        
          <%
          //session.setAttribute("colcode",collegecode);
         
          String collegename=(String)session.getAttribute("colcode");
          
         Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
          String user8=(String)session.getAttribute("sessuid");
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

     <div id="private-bar"> 
   <div id="mySidepanel" class="sidepanel">
     <div id="close-back">
      <div id="top-panel-group">
      
   <nav title="Create new Group"  id="grp-add-icon"><i class="fa fa-user-plus" aria-hidden="true"></i></nav>
<nav id="head">Groups</nav>  
  </div>
     <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a></div>
   
<div id="top-private-bar">
  <form autocomplete="off">
 
    <input id="myInput1" type="text" name="groupname" placeholder="Search groups"reuired>
 
  <button id="search2"type="submit"name="searchgrp"><i class="fa fa-search" aria-hidden="true"></i></button>
</form>
  </div>
 <div id="chat-bar">
  
  </div>
</div> 
  <div id="top-panel">
 <a title="View list" id="private-chat-list"href="#"onclick="privatelist()"><i class="fa fa-list-alt" aria-hidden="true"></i></a>
<nav class="openbtn" style="display:none;"title="Groups" onclick="openNav()" id="grp-icon"><i class="fa fa-users" aria-hidden="true"></i></nav>
<nav id="head">Chats</nav>  
  </div>
  
  <div id="top-private-bar">
  <form autocomplete="off"method="post"action="CollegeAdminChatCheck.jsp">
  <div class="autocomplete" >
    <input id="myInput" type="text" name="people" placeholder="Search people"required>
     </div>
 <button id="search"type="submit"  name="search"><i class="fa fa-search" aria-hidden="true"></i></button>
</form>
  </div>
 
  <div id="chat-bar">
   <div id="showList">
    <ul class="list-group">
    </ul>
    </div>
    <%
  String unam=request.getParameter("unam");
  if(unam!=null)
  {
	  out.println(unam);
  }
  else
  {
	  %>
	  <div id="recent-align">
	  <%
	  String sender=(String)session.getAttribute("sessuid");
	  String sen="";
	  String rec="";
	  String msg="";
	  String tim="";
	  try
	  {
	  PreparedStatement pst=con.prepareStatement("Select * from dummy_private_chat where Sender=? or Reciever=? order by id desc");
	  pst.setString(1,sender);
	  pst.setString(2, sender);
	  ResultSet res3=pst.executeQuery();
	  while(res3.next()){
	   sen=res3.getString(2);
	   rec=res3.getString(3);
	   msg=res3.getString(4);
	   tim=res3.getString(6);
	   if(sen.equals(sender))
		  {
		   String recname="";
			 PreparedStatement ps7=con.prepareStatement("Select Username from admin_details where Userid=?");
			 ps7.setString(1,rec);
			 // int row4=ps7.executeUpdate();
			  ResultSet rs5=ps7.executeQuery();
			    
			  while(rs5.next())
			    {
			    recname=rs5.getString(1);
			    }
		   		   %>
		   		   <a id="recent-chats-link"href="CollegeAdminChatCheck.jsp?people=<%=recname%>"><div id="recent-chats">
		      <img class="img-chat rounded-circle" width="95px" height="50px" src="viewimage.jsp?name=<%=rec%>">
			  <% 
			   out.println(recname.substring(0, 1).toUpperCase() +recname.substring(1));
			  out.println("<span id='time'><small><small>"+tim+"</small></small></span>");
			   out.println("<div id='recent-msg'>"+msg.substring(0, Math.min(msg.length(), 25))+"</div>");
			   %>
			   <hr id="chat-line">
			   </div></a>
			   <%
		    }
		  else if(rec.equals(sender))
		  {
			  String senname="";
				 PreparedStatement ps7=con.prepareStatement("Select Username from admin_details where Userid=?");
				 ps7.setString(1,sen);
				 // int row4=ps7.executeUpdate();
				  ResultSet rs5=ps7.executeQuery();
				    
				  while(rs5.next())
				    {
				    senname=rs5.getString(1);
				    }
			  %>
			  <a id="recent-chats-link"href="CollegeAdminChatCheck.jsp?people=<%=senname%>"><div id="recent-chats">
		      <img class="img-chat rounded-circle" width="95px" height="50px" src="viewimage.jsp?name=<%=sen%>">
			  <% 
			   out.println(senname.substring(0, 1).toUpperCase() +senname.substring(1));
			  out.println("<span id='time'><small><small>"+tim+"</small></small></span>");
			   out.println("<div id='recent-msg'>"+msg.substring(0, Math.min(msg.length(), 25))+"</div>");
			   %>
			   <hr id="chat-line">
			   </div></a>
			   <%
		  }
	  
	 }
	
	  }
	  catch(Exception e)
	  {
	  out.println(e.getMessage());
	  }
	  
  }
 
  %>
  </div>
  </div>
  <div id="private-list-tab">
<a id="closeprivate"href="javascript:void(0)" class="closebt" onclick="closeprivatelist()">×</a>
<div id="titleprivate-chat"><center>All Contacts</center></div>
<div id="showList2">
    <ul class="list-group">
    </ul>
    </div>
    <%
  String un=request.getParameter("unam");
  if(un!=null)
  {
	  out.println(un);
  }
  else
  {
	  %>
	  <div id="recent-align">
	  <%
	  String sender=(String)session.getAttribute("sessuid");
	 
	  try
	  {
	  PreparedStatement pst=con.prepareStatement("Select Username,Userid from admin_details where Userid<>?");
	  pst.setString(1,sender);
	  
	  ResultSet res3=pst.executeQuery();
	  while(res3.next()){
		  String user=res3.getString(1);
		  String uid=res3.getString(2);
		  %>
		  <a id="recent-chats-link"href="CollegeAdminChatCheck.jsp?people=<%=user%>">
		  <img class="img-chat rounded-circle" width="95px" height="50px" src="viewimage.jsp?name=<%=uid%>">
	  
		  <%
	      out.println("<div style='display:inline-block;color:black'>"+user.substring(0, 1).toUpperCase() +user.substring(1)+"</div><hr id='chat-line'></a>");
	  }
	
	  }
	  catch(Exception e)
	  {
	  out.println("error");
	  }
	  
  }
 
  %>
    
    
    
    
</div>
  
  </div>
  <div id="private-chat-window">
  <div id="chatuser">
  <%
  String uname=request.getParameter("uname");
  if(uname!=null)
  {
	  String usname="";
	  PreparedStatement ps11=con.prepareStatement("Select Username from admin_details where Userid=?");
	  ps11.setString(1,uname);
	  
	  ResultSet res3=ps11.executeQuery();
	  while(res3.next()){
		 usname=res3.getString(1);
	  }
	  %>
      <img class="img-chat rounded-circle" width="95px" height="50px" src="viewimage.jsp?name=<%=uname%>">
	  <% out.println("<div id='chat-name'>"+usname.substring(0, 1).toUpperCase() +usname.substring(1)+"</div>");
	  
  }

 // String p=request.getParameter("people");
  //out.println(p);
  //request.getParameter("people");
  

 /*if(request.getParameter("search")!=null)
  {
  	String search=request.getParameter("people");
  out.println(search);
  	} */
  

%>
 </div>
 <div id="view-chats">
 <%
 String receiver="";
 if(receiver!=null)
 {
	 
	 receiver=(String)session.getAttribute("searchname");
 String sender=(String)session.getAttribute("sessuid");
 String date="";
 int count=0;
try
{
	PreparedStatement pstt=con.prepareStatement("Select Distinct Date  from private_chat where Sender=? and Reciever=? or Sender=? and Reciever=?");
	pstt.setString(1,sender);
	pstt.setString(2, receiver);
	pstt.setString(3,receiver);
	pstt.setString(4, sender);
	ResultSet res4=pstt.executeQuery();
	while(res4.next()){
	date=res4.getString(1);
	count++;
PreparedStatement ps=con.prepareStatement("Select Sender,Reciever,Message,Date,Time  from private_chat where Sender=? and Reciever=? and Date=? or Sender=? and Reciever=? and Date=?");
ps.setString(1,sender);
ps.setString(2, receiver);
ps.setString(3,date);
ps.setString(4,receiver);
ps.setString(5, sender);
ps.setString(6,date);
ResultSet res2=ps.executeQuery();
while(res2.next()){
String s=res2.getString(1);
String r=res2.getString(2);
String m=res2.getString(3);
String d=res2.getString(4);
String t=res2.getString(5);

if(sender.equals(s))
{
	if(count==1)
	{
		out.println("<center><small><small>"+d+"</small></small></center>");
		count--;
		
	}
%>	
<div>
<div class="clear"></div>
<span  id="chat-align"class="right">

<% 
	
out.println(m);
//out.println(d);
out.println("<small><small><small>"+t+"</small></small></small>");
%>
</span>
<div class="clear"></div>
</div>
<% 
}
else if(!sender.equals(s))
{
	
	if(count==1)
	{
		out.println("<center><small><small>"+d+"</small></small></center>");
		count--;
		
	}
%>
<div>
<div class="clear"></div>
<span id="chat-align" class="left">

<% 
	
	out.println(m);
	//out.println(d);
	out.println("<small><small><small>"+t+"</small></small></small>");
	%>
	</span>
<div class="clear"></div>
	</div>
	
	<% 
}
}
}
}
catch(Exception e)
{
out.println("error");
}
 }
	%>	
 </div>
  <%
 if(uname!=null)
  {
  %>
 <div id="message-area">
 <form method="post"action="/E-learning/vchat">
 
<textarea name="message"placeholder="Type your message"required></textarea>
 <button id="search1"type="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
 </form>
</div>
<%
}
%>
  </div>
</div>
</div>
</div>
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
<script src="Bootstrap/jquery/jquery.min.js"></script>
  
<script src="Bootstrap/js/bootstrap.bundle.min.js"></script>
 <script src="Bootstrap/js/script_file.js"></script>
 <script>
 function privatelist()
 {
	document.getElementById("private-list-tab").style.display="block";
}
 function closeprivatelist()
 {
	document.getElementById("private-list-tab").style.display="none";
}
 </script>
<script>
function openNav() {
  document.getElementById("mySidepanel").style.width = "394px";
}

function closeNav() {
  document.getElementById("mySidepanel").style.width = "0";
}

$("#view-chats").scrollTop($("#view-chats")[0].scrollHeight);

</script>
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