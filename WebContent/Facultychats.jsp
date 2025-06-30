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
  
  <link href="Bootstrap/css/multiselect.css" rel="stylesheet"/>
	<script src="Bootstrap/js/multiselect.min.js"></script>
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
				url:'AllChatRecord.jsp',
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
document.getElementById("chat-bar").innerHTML='';

		//document.getElementById("private-chat-window").style.display="block";
		
	  });
  });
  
  </script>


  <script type="text/javascript">
  $(document).ready(function(){
	  $('#myInput1').keyup(function(){
		var search=$('#myInput1').val();
		if(search!==''&&search!==null)
			{
			$.ajax({
				type:'POST',
				url:'AllGroupChatRecord.jsp',
				data:'key='+search,
				success:function(data)
				{
					
					$('#showList1').html(data);
					$('#chat-bar').html(data);
				}
			});
			
			}
		else
			{
			
			$('#showList1').html('');
			$('#chat-bar').html('');
			
			}
	  });
	  $(document).on('click','li',function(){
		  $('#myInput1').val($(this).text());
document.getElementById("showList1").innerHTML='';
document.getElementById("chat-bar").innerHTML='';



		//document.getElementById("private-chat-window").style.display="block";
		
	  });
  });
  
  </script>
    
<script>
window.onload = function() {
    var show = localStorage.getItem('show');
    if(show === 'true'){
        
         document.getElementById("mySidepanel").style.width = "394px";
 		
    }
}
</script>
   
<style>
.multiselect-wrapper ul {
	list-style: none;
	display: block;
	position: relative;
	padding: 0px;
	margin: 0px;
	max-height:200px;
	overflow-y: auto;
	overflow-x: hidden;
}
.multiselect-wrapper ul::-webkit-scrollbar {
  width:10px;

}


.multiselect-wrapper ul::-webkit-scrollbar-track {
  background: #f1f1f1; 
}

.multiselect-wrapper ul::-webkit-scrollbar-thumb {
  background: #888; 
border-radius:10px;
}


.multiselect-wrapper ul::-webkit-scrollbar-thumb:hover {
  background: #555; 
}






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


#participantslist::-webkit-scrollbar {
  width:10px;

}


#participantslist::-webkit-scrollbar-track {
  background: #f1f1f1; 
}

#participantslist::-webkit-scrollbar-thumb {
  background: #888; 
border-radius:10px;
}


#participantslist::-webkit-scrollbar-thumb:hover {
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
  width: 100%;
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
width: 30%;
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
             #recent-chats1
            {
            margin-left:-30px;
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
            #recent-align1
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
              #recent-msg1
            {
            margin-left:98px;
            margin-top:-5px;
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
            margin-left:280px;
            position:absolute;
            text-decoration:none;
            cursor:default;
            color:grey;
            font-size:30px;
            margin-top:10px;
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
          
          
          
          
.modal {
  background: transparent;
  position: absolute;
  float: left;
  margin-left: 200px;
  top: 60%;
  transform: translate(-50%, -50%);
  width:600px;
  
}


#testSelect1_multiSelect {
			width: 564px;
		}
		#testSelect2_multiSelect {
			width: 564px;
		}
		
		
		
		
		#myInput6 {
  background-image: url('/css/searchicon.png');
  background-position: 10px 12px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#myUL {
  list-style-type: none;
  padding: 0;
  margin: 0;
}

#myUL li a {
  border: 1px solid #ddd;
  margin-top: -1px; /* Prevent double borders */
  background-color: #f6f6f6;
  padding: 12px;
  text-decoration: none;
  font-size: 18px;
  color: black;
  display: block
}

#myUL li a:hover:not(.header) {
  background-color: #eee;
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
a
{
text-decoration:none;
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
      <li class="nav-item">
        <a class="nav-link collapsed" href="FacultyAllSubjects.jsp">
          <i class="fas fa-book"></i>
          <span>Subjects</span>
        </a>
     
              </li>
 <li class="nav-item active">
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
            <% //session.setAttribute("colcode",collegecode);
          
            String collegename=(String)session.getAttribute("colcode");
            String query3="select college_name from college_details where college_code=?";
          PreparedStatement ps4=con.prepareStatement(query3);
          ps4.setString(1,collegename);
          ResultSet rs4=ps4.executeQuery();
          while(rs4.next())
          {
          out.println(rs4.getString(1));
          }
          Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
          %>
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

      <div id="private-bar">
   <div id="mySidepanel" class="sidepanel">
     <div id="close-back">
      <div id="top-panel-group">
      
   <nav title="Create new Group" href="#myModal"data-toggle="modal" id="grp-add-icon"><i class="fa fa-user-plus" aria-hidden="true"></i></nav>
<nav id="head">Groups</nav>  
  </div>
     <a href="javascript:void(0)" style="text-decoration:none;"class="closebtn" onclick="closeNav();document.getElementById('myInput').value='';">×</a></div>
     
    
   
<div id="top-private-bar">
  <form autocomplete="off"method="post"action="AllGroupChatCheck.jsp">
 <div class="autocomplete" >
    <input id="myInput1" type="text" name="groupname" placeholder="Search groups"reuired>
 </div>
  <button id="search2"onclick="openNav1();" type="submit"name="searchgrp"><i class="fa fa-search" aria-hidden="true"></i></button>
</form>
  </div>
 <div id="chat-bar">
  <div id="showList1">
    <ul class="list-group">
    </ul>
    </div>
    <% 
    
 String grperrormsg=request.getParameter("grperrormsg");
  if(grperrormsg!=null)
  {
	  out.println(grperrormsg);
  }
  else
  {
  %>

	  <div id="recent-align">
	  <%
	  String grpal="";
	  String sender=(String)session.getAttribute("sessuid");
	  String sen="";
	  String msg="";
	  String tim="";
	String grpnm="";
	
	int highl=0;
	String usid=(String)session.getAttribute("sessuid");
	String uidwild="%"+usid+"%";
	 
	  try
	  {
		  
		  PreparedStatement pst11=con1.prepareStatement("Select Group_name,Group_alias from group_details where Members Like ?");
		  pst11.setString(1,uidwild);
		  ResultSet res12=pst11.executeQuery();
		  while(res12.next()){
			  grpnm=res12.getString("Group_name");
			  grpal=res12.getString("Group_alias");
			  
			 PreparedStatement pst=con1.prepareStatement("Select * from group_chat where Group_name=? order by Id desc limit 1");
	  pst.setString(1,grpal);
	  
	  ResultSet res3=pst.executeQuery();
	  while(res3.next()){
	   sen=res3.getString(3);
	    msg=res3.getString(4);
	   tim=res3.getString(6);
	   highl=res3.getInt(7);
	   if(sen.equals(sender))
		  {
		   String recname="";
		      String bs1="select Username from student_details where Userid=? union all select Username from faculty_details where Userid=? union all select Username from college_admin_details where Userid=?";
		  	PreparedStatement ps5=con1.prepareStatement(bs1);
		      ps5.setString(1,sen);
		      ps5.setString(2,sen);
		      ps5.setString(3,sen);
		      //ps5.setString(4,sen);
		      ResultSet rs5=ps5.executeQuery();
		      while(rs5.next())
		      {
		      recname=rs5.getString("Username");
		      }
		    


		   		   %>
		   		   <a id="recent-chats-link"onclick="openNav1()"href="AllGroupChatCheck.jsp?groupname=<%=grpnm%>"><div id="recent-chats1">
		      <img class="img-chat rounded-circle"style="" width="90px" height="45px" src="images/grpimgg.jpg">
			  <% 
			   out.println(grpnm.substring(0, 1).toUpperCase() +grpnm.substring(1));
			  out.println("<span id='time'><small><small>"+tim+"</small></small></span>");
			   out.println("<br><div id='recent-msg1'>"+msg.substring(0, Math.min(msg.length(), 25))+"</div>");
			   %>
			   <hr id="chat-line">
			   </div></a>
			   <%
		    }
		  else if(!sen.equals(sender))
		  {
			  String senname="";
			  String bs1="select Username from student_details where Userid=? union all select Username from faculty_details where Userid=? union all select Username from college_admin_details where Userid=?";
		  	PreparedStatement ps5=con1.prepareStatement(bs1);
		      ps5.setString(1,sen);
		      ps5.setString(2,sen);
		      ps5.setString(3,sen);
		      //ps5.setString(4,sen);
		      ResultSet rs5=ps5.executeQuery();
		      while(rs5.next())
		      {
		      senname=rs5.getString("Username");
		      }
		      if(highl==1)
		      {
			  %>
			   <a id="recent-chats-link"onclick="openNav1()"href="AllGroupChatCheck.jsp?groupname=<%=grpnm%>"><div id="recent-chats1">
		      <img class="img-chat rounded-circle"style="" width="90px" height="45px" src="images/grpimgg.jpg">
			  <% 
			  out.println(grpnm.substring(0, 1).toUpperCase() +grpnm.substring(1));
			  out.println("<span id='time'><small><small>"+tim+"</small></small></span>");
			   out.println("<div id='recent-msg1'>"+msg.substring(0, Math.min(msg.length(), 25))+"</div>");
			   %>
			   <hr id="chat-line">
			   </div></a>
			  <%
			  }
		      else
		      {
			  %>
			  <a id="recent-chats-link"onclick="openNav1()"href="AllGroupChatCheck.jsp?groupname=<%=grpnm%>"><div id="recent-chats1">
		      <img class="img-chat rounded-circle"style="" width="90px" height="45px" src="images/grpimgg.jpg">
			  <% 
			  out.println(grpnm.substring(0, 1).toUpperCase() +grpnm.substring(1));
			  out.println("<span id='time'><small><small>"+tim+"</small></small></span>");
			   out.println("<div id='recent-msg1'><b>"+senname.substring(0, 1).toUpperCase()+senname.substring(1)+":</b>"+msg.substring(0, Math.min(msg.length(), 15))+"</div>");
			   %>
			   <hr id="chat-line">
			   </div></a>
			   <%
		  
		      }
	  
	 }
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
 
</div>

  <div id="top-panel">
 <a title="View list" id="private-chat-list"href="#"onclick="privatelist()"><i class="fa fa-list-alt" aria-hidden="true"></i></a>
<nav class="openbtn" title="Groups" onclick="openNav()" id="grp-icon"><i class="fa fa-users" aria-hidden="true"></i></nav>
<nav id="head">Chats</nav>  
  </div>
  
  <div id="top-private-bar">
  <form autocomplete="off"method="post"action="AllChatCheck.jsp">
  <div class="autocomplete" >
    <input id="myInput"  type="text" name="people" placeholder="Search people"required>
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
	  PreparedStatement pst=con1.prepareStatement("Select * from dummy_private_chat where Sender=? or Reciever=? order by id desc");
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
		      String bs1="select Username from student_details where Userid=? union all select Username from faculty_details where Userid=? union all select Username from college_admin_details where Userid=?";
		  	PreparedStatement ps5=con1.prepareStatement(bs1);
		      ps5.setString(1,rec);
		      ps5.setString(2,rec);
		      ps5.setString(3,rec);
		      ResultSet rs5=ps5.executeQuery();
		      while(rs5.next())
		      {
		      recname=rs5.getString(1);
		      }
		    


		   		   %>
		   		   <a id="recent-chats-link"href="AllChatCheck.jsp?people=<%=recname%>"><div id="recent-chats">
		      <img class="img-chat rounded-circle" width="95px" height="50px" src="AllViewImage.jsp?name=<%=rec%>">
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
			  String bs1="select Username from student_details where Userid=? union all select Username from faculty_details where Userid=? union all select Username from college_admin_details where Userid=?";
		  	PreparedStatement ps5=con1.prepareStatement(bs1);
		      ps5.setString(1,sen);
		      ps5.setString(2,sen);
		      ps5.setString(3,sen);
		      ResultSet rs5=ps5.executeQuery();
		      while(rs5.next())
		      {
		      senname=rs5.getString(1);
		      }
			  %>
			  <a id="recent-chats-link"href="AllChatCheck.jsp?people=<%=senname%>"><div id="recent-chats">
		      <img class="img-chat rounded-circle" width="95px" height="50px" src="AllViewImage.jsp?name=<%=sen%>">
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
	  out.println("error");
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
	  PreparedStatement pst=con1.prepareStatement("Select Username,Userid from student_details where Userid<>? union all select Username,Userid from faculty_details where Userid<>? union all select Username,Userid from college_admin_details where Userid<>?");
	  pst.setString(1,sender);
	  pst.setString(2,sender);
	  pst.setString(3,sender);
	  
	  ResultSet res3=pst.executeQuery();
	  while(res3.next()){
		  String user=res3.getString(1);
		  String uid=res3.getString(2);
		  %>
		  <a id="recent-chats-link"href="AllChatCheck.jsp?people=<%=user%>">
		  <img class="img-chat rounded-circle" width="95px" height="50px" src="AllViewImage.jsp?name=<%=uid%>">
	  
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
  String uname1=request.getParameter("uname1");
  String uname=request.getParameter("uname");
  if(uname!=null)
  {
	  %>
      <img class="img-chat rounded-circle" width="95px" height="50px" src="AllViewImage.jsp?name=<%=uname%>">
      <%
      String usname="";
      String bs1="select Username from student_details where Userid=? union all select Username from faculty_details where Userid=? union all select Username from college_admin_details where Userid=?";
  	PreparedStatement ps5=con1.prepareStatement(bs1);
      ps5.setString(1,uname);
      ps5.setString(2,uname);
      ps5.setString(3,uname);
      
      ResultSet rs5=ps5.executeQuery();
      while(rs5.next())
      {
      usname=rs5.getString(1);
      }
    

      
      %>
	  <% out.println("<div id='chat-name'>"+usname.substring(0, 1).toUpperCase() +usname.substring(1)+"</div>");
	  
  }
  else if(uname1!=null)
  {
	  %>
      
      <img class="img-chat rounded-circle"style="" width="90px" height="45px" src="images/grpimgg.jpg">
      <span title="Group info"  href="#myModal1"data-toggle="modal" ><i style="float:right;color:lightgrey;font-size:36px;margin-right:20px;margin-top:11px;"class="fa fa-info-circle" aria-hidden="true"></i></span>
      <span title="Edit Group Name" href="#myModal4"data-toggle="modal" ><i style="float:right;color:lightgrey;font-size:28px;margin-right:20px;margin-top:15px;" class="fas fa-edit"></i></span>
      <%
      String grppnm="";
      String bs1="select Group_name from group_details where Group_alias=?";
  	PreparedStatement ps5=con1.prepareStatement(bs1);
      ps5.setString(1,uname1);
     
       ResultSet rs5=ps5.executeQuery();
      while(rs5.next())
      {
      grppnm=rs5.getString(1);
      }
    

      
      %>
	  <% out.println("<div id='chat-name'style='margin-left:-10px;'>"+grppnm.substring(0, 1).toUpperCase() +grppnm.substring(1)+"</div>");
	  
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
 <div id="myModal" class="modal">
        <!--  <div class="modal-dialog">-->
            <div class="modal-content">
                <div class="modal-header">
                Create New Group
                    <button style="outline:none;border:0px;"type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    
                </div>
                <div class="modal-body">
                    
                         <form method="post" action="CreateGroup.jsp">
                
                  <div class="form-group">
                <div class="input-group">
               <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-users" aria-hidden="true"></i></span></div>
            	<input name="groupname" id="groupname" autocomplete="off"type="text" class="form-control input-lg" placeholder="Enter Group Name" required>
                	</div>
      </div> 
      
      
      
                <label for="testSelect1">Select Members</label><br>
<select name="multiple"id='testSelect1' multiple="multiple">
<%

PreparedStatement pstmt=null;
pstmt=con1.prepareStatement("SELECT Username,Userid FROM faculty_details WHERE Userid <> ? union all SELECT Username,Userid FROM student_details WHERE Userid <> ? union all select Username,Userid from college_admin_details WHERE Userid <> ?");

pstmt.setString(1,(String)session.getAttribute("sessuid"));
pstmt.setString(2,(String)session.getAttribute("sessuid"));
pstmt.setString(3,(String)session.getAttribute("sessuid"));
ResultSet rs=pstmt.executeQuery();
while(rs.next())
{
	%>
	<option value='<%=rs.getString("Userid")%>'><%=rs.getString("Username")%></option>
<%
}



%>

</select>
  
                </div>
                <div class="modal-footer">
                <input type="submit" name="create"value="Create"class="btn btn-primary btn-block btn-lg">
                 </form>
                </div>
            </div>
       <!--   </div>-->
      
   
       
    </div> 
 
 <div id="view-chats">
 <%
 String receiver="";
 String receiver1="";
 if(request.getParameter("uname")!=null)
 {
	 
	 receiver=request.getParameter("uname");
 String sender=(String)session.getAttribute("sessuid");
 String date="";
 int count=0;
try
{
	PreparedStatement pstt=con1.prepareStatement("Select Distinct Date  from private_chat where Sender=? and Reciever=? or Sender=? and Reciever=?");
	pstt.setString(1,sender);
	pstt.setString(2, receiver);
	pstt.setString(3,receiver);
	pstt.setString(4, sender);
	ResultSet res4=pstt.executeQuery();
	while(res4.next()){
	date=res4.getString(1);
	count++;
PreparedStatement ps=con1.prepareStatement("Select Sender,Reciever,Message,Date,Time  from private_chat where Sender=? and Reciever=? and Date=? or Sender=? and Reciever=? and Date=?");
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
out.println("<span style='margin-right:0px;float:right;'><small><small><small>"+t+"</small></small></small></span>");
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
	out.println("<span style='margin-right:0px;float:right;'><small><small><small>"+t+"</small></small></small></span>");
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
out.println(e.getMessage());
}
 }
 else if(request.getParameter("uname1")!=null)	
  {
	 String chatuser="";
		 receiver1=request.getParameter("uname1");
		 String sender=(String)session.getAttribute("sessuid");
		 String date="";
		 int count=0;
		try
		{
			PreparedStatement pstt=con1.prepareStatement("Select Distinct Date  from group_chat where Group_name=?");
			pstt.setString(1, receiver1);
			ResultSet res4=pstt.executeQuery();
			while(res4.next()){
			date=res4.getString(1);
			count++;
			int highlight=0;
		PreparedStatement ps=con1.prepareStatement("Select Sender,Message,Date,Time,Highlight from group_chat where Group_name=? and Date=?");
		ps.setString(1, receiver1);
		ps.setString(2,date);
		ResultSet res2=ps.executeQuery();
		while(res2.next()){
		String s=res2.getString(1);
		String m=res2.getString(2);
		String d=res2.getString(3);
		String t=res2.getString(4);
               highlight=res2.getInt(5);
               String bs21="select Username from student_details where Userid=? union all select Username from faculty_details where Userid=? union all select Username from college_admin_details where Userid=?";
             	PreparedStatement ps21=con1.prepareStatement(bs21);
                 ps21.setString(1,s);
                 ps21.setString(2,s);
                 ps21.setString(3,s);
                // ps21.setString(4,s);
                 ResultSet rs21 =ps21.executeQuery();
                 if(rs21.next())
                 {
                	 chatuser=rs21.getString("Username");
                 }
		if(sender.equals(s))
		{
			if(count==1)
			{
				out.println("<center><small><small>"+d+"</small></small></center>");
				count--;
				
			}
			 if(highlight==1)
             {
          	   out.println("<span style='background:#666666;width:100%;'><center><small><small>"+m+"</small></small></center></span>"); 
             } 
		%>	
		<div>
		
		<div class="clear"></div>
		<%
		if(highlight!=1)
		{
		%>
		<span  id="chat-align"class="right">

		<% 
			
		out.println(m);
		//out.println(d);
		out.println("<span style='margin-right:0px;float:right;'><small><small><small> "+t+"</small></small></small></span>");
			}
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
			 if(highlight==1)
             {
          	   out.println("<span style='background:#666666;width:100%;'><center><small><small>"+m+"</small></small></center></span>"); 
             } 
			
		%>
		<div>
		<div class="clear"></div>
		<%
		
		if(highlight!=1)
		{
		%>
		<span id="chat-align" class="left">

		<% 
		
			out.println("<span style='font-size:18px;font-weight:bold;color:orange;'>"+chatuser+"</span><br>"+m);
			//out.println(d);
			out.println("<span style='margin-right:0px;float:right;'><small><small><small>"+t+"</small></small></small></span>");
		}
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
		out.println(e.getMessage());
		}
		 }
  
  
	  %>
 </div>
 <% 
 if(uname1!=null)
 {
	
	  
%>
	 
	 <div id="message-area">
 <form method="post"action="/E-learning/Allgroupchat">
 
<textarea name="message1"placeholder="Type your message"required></textarea>
 <button id="search1"type="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
 </form>
<%	 
	   
 }
 else  if(uname!=null)
 {
	 %>
 <div id="message-area">
 <form method="post"action="/E-learning/Allvchat">
 
<textarea name="message"placeholder="Type your message"required></textarea>
 <button id="search1"type="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
 </form>
 <%
 }
 %>
</div>

    <div id="myModal1" class="modal">
        <!--  <div class="modal-dialog">-->
            <div class="modal-content">
                <div class="modal-header">
                 Participants
                    <button style="outline:none;border:0px;"type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    
                </div>
                <div class="modal-body">
                    <input type="text" style="outline:none;"id="myInput6" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
<div id="participantslist"style="max-height:230px;overflow-y:scroll;overflow-x:hidden;">
<ul id="myUL">
                       <%
                       String createdby="";
                       String useri=(String)session.getAttribute("sessuid");
                       String bs3="select Members,Createdby from group_details where Group_alias=?";
                   	PreparedStatement ps6=con1.prepareStatement(bs3);
                       ps6.setString(1,receiver1);
                       
                       ResultSet rs6=ps6.executeQuery();
                       String[] s={};
                       String smem="";
                	   int count=0;
                       if(rs6.next())
                       {
                    	   createdby=rs6.getString("Createdby");
                    	   s=rs6.getString(1).split(",");
          				 // out.println(Arrays.toString(s));
          count=s.length;
         
for(String w:s)
{
	smem=w;
	//out.println(smem);
	PreparedStatement pstmt2=null;
    pstmt2=con1.prepareStatement("SELECT Username FROM faculty_details WHERE Userid=? union all SELECT Username FROM student_details WHERE Userid=? union all select Username from college_admin_details WHERE Userid=?");

    pstmt2.setString(1,smem);
    pstmt2.setString(2,smem);
    pstmt2.setString(3,smem);
    ResultSet rs1=pstmt2.executeQuery();
   
    if(rs1.next())
    {
    	 if(createdby.equals(useri))
         {
    	if(createdby.equals(smem))
    	{
    	%>
    	<li><a href="#"><img class="img-chat rounded-circle" width="70px" height="30px" src="AllViewImage.jsp?name=<%=smem%>"><%=rs1.getString(1)%></a></li>
    	
    	<% 
    	}
    	else
    	{
    	%>
    	<li><a style="display:inline-block;width:83%"><img class="img-chat rounded-circle" width="70px" height="30px" src="AllViewImage.jsp?name=<%=smem%>"><%=rs1.getString(1)%></a>
    	<a style="display:inline-block;float:right;" href="Removeparticipants.jsp?name=<%=smem %>" >Remove</a></li>
    	
    	<%
    	}
         }
    	 else
    	 {
    		%>
    		<li><a href="#"><img class="img-chat rounded-circle" width="70px" height="30px" src="AllViewImage.jsp?name=<%=smem%>"><%=rs1.getString(1)%></a></li>
    		<%  
    	 }
    	 
    }

}
                       }
                     
                     
                         %>
      </ul>
      </div>
                </div>
                <div class="modal-footer">
                <%
                if(createdby.equals(useri))
                {
                
                %>
                <button  data-dismiss="modal"type="button" href="#myModal2"data-toggle="modal"name="addmem"class="btn btn-primary btn-block btn-lg"><i class="fa fa-plus" aria-hidden="true"></i>  Add Members</button>
              <button onclick="window.location.replace('Deletegroup.jsp');"type="button" name="delgrp"class="btn btn-danger btn-block btn-lg"><i class="fa fa-trash" aria-hidden="true"></i>  Delete Group</button>
                <%
                }
                else
                {
                %>
                <a href="Exitgroup.jsp?name=<%=(String)session.getAttribute("sessuid") %>"class="btn btn-danger btn-block btn-lg"><i class="fas fa-sign-out-alt"></i> Exit Group</a>
                <%
                }
                %>
                
                </div>
            </div>
  
  </div>
  
  
   
  
  
  
  
  
  <div id="myModal2" class="modal">
        <!--  <div class="modal-dialog">-->
            <div class="modal-content">
                <div class="modal-header">
Add Members                 
                    <button style="outline:none;border:0px;"type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    
                </div>
                <div class="modal-body">
                <form method="post"action="Addnewparticipants.jsp">
                    <label for="testSelect1">Select Members</label><br>
<select name="multiple1"id='testSelect2' multiple="multiple"> 

<%

//out.println(count8);
String status="";
PreparedStatement pstmt4=null;
pstmt4=con1.prepareStatement("SELECT Username,Userid FROM faculty_details where Userid <> ? union all SELECT Username,Userid FROM student_details where Userid <> ? union all select Username,Userid from college_admin_details where Userid <> ?");
pstmt4.setString(1,(String)session.getAttribute("sessuid"));
pstmt4.setString(2,(String)session.getAttribute("sessuid"));
pstmt4.setString(3,(String)session.getAttribute("sessuid"));
ResultSet rs5=pstmt4.executeQuery();
String usname="";

int flag=0;
while(rs5.next())
{
	usname=rs5.getString("Userid");
	//out.println(usname);
	//out.println(count);
	flag=0;
	for(int i=0;i<count;i++)
	{
		
		if(s[i].equals(usname))
		{
			status="found";
			flag++;
			
		}
		else 
		{
			status="not found";
			
		}
		
		
	}
	if(flag>0 && status.equals("found"))
	{
		//out.println("F "+usname);
	}
	else if(flag==0 && status.equals("not found"))
	{
		%>
		<option value='<%=rs5.getString("Userid")%>'><%=rs5.getString("Username") %></option>
		<% 
		
	}
	
	
}

//out.println(Arrays.toString(array));
%>
</select>
               <div class="modal-footer">
                <button type="submit" name="addmems"class="btn btn-primary btn-block btn-lg"><i class="fa fa-plus" aria-hidden="true"></i>  Add</button>
                 </form>
                </div>
            </div>
  
  </div>
  
  </div>
  
  
  
   <div id="myModal4" class="modal">
        <!--  <div class="modal-dialog">-->
            <div class="modal-content">
                <div class="modal-header">
                 Rename Group Name
                    <button style="outline:none;border:0px;"type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    
                </div>
                <div class="modal-body"style="max-height:350px;overflow-y:scroll;overflow-x:hidden;">
   <% 
   String bs6="select Group_name from group_details where Group_alias=?";
                   	PreparedStatement ps8=con1.prepareStatement(bs6);
                       ps8.setString(1,receiver1);
                       String gpname="";
                       ResultSet rs8=ps8.executeQuery();
                      
                       if(rs8.next())
                       {
                    	   gpname=rs8.getString(1);
                       }
                    	   %>
                    	   <form method="post"action="Editgroupname.jsp">
  <div class="form-group">
                <div class="input-group">
               <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-users" aria-hidden="true"></i></span></div>
            	<input name="editgrpname" id="groupname" autocomplete="off"type="text" class="form-control input-lg"value="<%=gpname %>" placeholder="Enter Group Name" required>
                	</div>
      </div> 
  
  
  <div class="modal-footer">
                <button type="submit" name="editgrp"class="btn btn-primary btn-block btn-lg"><i class="fa fa-pencil" aria-hidden="true"></i>  Edit</button>
                 
                </div>
            </div>
  
  </div>
  
  </div>
  
  
  
  
  
  
  
  <!-- last div -->
  </div>
  

     
  
  
  
  
  
  
  
  
  
  
  
  

<%
String ok=request.getParameter("ok");
String removed=request.getParameter("removed");
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
function openNav1() {
	var ok="<%=ok%>";
	if(ok!=null)
		{
		document.getElementById("mySidepanel").style.width = "394px";
		//document.getElementById("t").style.display = "none";
		localStorage.setItem('show', 'true');
		
		}
		}

function closeNav() {
	localStorage.setItem('show', 'false');
	  
  document.getElementById("mySidepanel").style.width = "0";
  var msg="<%=grperrormsg%>";
  
  if(msg=="Group not found")
  {
	  window.location.replace("Facultychats.jsp");
 
  }
 
  
}

$("#view-chats").scrollTop($("#view-chats")[0].scrollHeight);

</script>
<%
//session.removeAttribute("searchuname");
%>
<script>
	document.multiselect('#testSelect1')
		.setCheckBoxClick("checkboxAll", function(target, args) {
			console.log("Checkbox 'Select All' was clicked and got value ", args.checked);
		})
		.setCheckBoxClick("1", function(target, args) {
			console.log("Checkbox for item with value '1' was clicked and got value ", args.checked);
		});

</script>
<script>
	document.multiselect('#testSelect2')
		.setCheckBoxClick("checkboxAll", function(target, args) {
			console.log("Checkbox 'Select All' was clicked and got value ", args.checked);
		})
		.setCheckBoxClick("1", function(target, args) {
			console.log("Checkbox for item with value '1' was clicked and got value ", args.checked);
		});

</script>
<script>
function myFunction() {
    var input, filter, ul, li, a, i, txtValue;
    input = document.getElementById("myInput6");
    filter = input.value.toUpperCase();
    ul = document.getElementById("myUL");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}
</script>
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
