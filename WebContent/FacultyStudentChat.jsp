<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
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
				url:'StudentChatRecord.jsp',
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

         
</style>
</head>
<body>
<body id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">

    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-text mx-3">Welcome <%out.println(session.getAttribute("sessname"));%></div>
      </a>

      <hr class="sidebar-divider my-0">

      <li class="nav-item active">
        <a class="nav-link" href="CollegeAdminDashboard.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      
      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class='fas fa-chalkboard-teacher'></i>
          <span>Faculty</span>
        </a>
      </li>

<li class="nav-item">
        <a class="nav-link collapsed" href="Vendorchat.jsp">
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
            <a class="collapse-item" href="FacultyCollegeAdminChat.jsp">College Admin</a>
            <a class="collapse-item" href="">Faculty</a>
            <a class="collapse-item" href="FacultyStudentChat.jsp">Student</a>
             </div>
        </div>
      </li>
  <li class="nav-item">
        <a class="nav-link collapsed" href="vcourses.jsp">
          <i class="fa fa-book"></i>
          <span>Courses</span>
        </a>
        </li>
      
      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="charts.html">
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
      <nav class="navbar navbar-expand topbar mb-4 static-top shadow" style="background-color:#F4F6F6">
          <%
          
          //session.setAttribute("colcode",collegecode);
          String collegename=(String)session.getAttribute("colcode");
          String query3="select college_name from college_details where college_code=?";
          PreparedStatement ps4=con.prepareStatement(query3);
          ps4.setString(1,collegename);
          ResultSet rs4=ps4.executeQuery();
          while(rs4.next())
          {
          out.println(rs4.getString(1));
          }
          con.close();
        
          Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
          String username=(String)session.getAttribute("sessname");
          %>
      <ul class="navbar-nav ml-auto">
      <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                
              </a>
            </li>
             <div class="topbar-divider d-none d-sm-block"></div>
            
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%out.println(session.getAttribute("sessname"));%></span>
                <img class="img-profile rounded-circle" src="">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="Vsettings.jsp">
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
<nav class="openbtn" title="Groups" onclick="openNav()" id="grp-icon"><i class="fa fa-users" aria-hidden="true"></i></nav>
<nav id="head">Chats</nav>  
  </div>
  
  <div id="top-private-bar">
  <form autocomplete="off"method="post"action="FacultyStudentChatCheck.jsp">
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
		      String bs1="select Username from student_details where Userid=?";
		  	PreparedStatement ps5=con1.prepareStatement(bs1);
		      ps5.setString(1,rec);
		      ResultSet rs5=ps5.executeQuery();
		      while(rs5.next())
		      {
		      recname=rs5.getString(1);
		      }
		    


		   		   %>
		   		   <a id="recent-chats-link"href="FacultyStudentChatCheck.jsp?people=<%=recname%>"><div id="recent-chats">
		      <img class="img-chat rounded-circle" width="95px" height="50px" src="StudentViewImage.jsp?name=<%=rec%>">
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
		      String bs1="select Username from student_details where Userid=?";
		  	PreparedStatement ps5=con1.prepareStatement(bs1);
		      ps5.setString(1,sen);
		      ResultSet rs5=ps5.executeQuery();
		      while(rs5.next())
		      {
		      senname=rs5.getString(1);
		      }
			  %>
			  <a id="recent-chats-link"href="FacultyStudentChatCheck.jsp?people=<%=senname%>"><div id="recent-chats">
		      <img class="img-chat rounded-circle" width="95px" height="50px" src="StudentViewImage.jsp?name=<%=sen%>">
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
	  PreparedStatement pst=con1.prepareStatement("Select Username,Userid from student_details where Userid<>?");
	  pst.setString(1,sender);
	  
	  ResultSet res3=pst.executeQuery();
	  while(res3.next()){
		  String user=res3.getString(1);
		  String uid=res3.getString(2);
		  %>
		  <a id="recent-chats-link"href="FacultyStudentChatCheck.jsp?people=<%=user%>">
		  <img class="img-chat rounded-circle" width="95px" height="50px" src="StudentViewImage.jsp?name=<%=uid%>">
	  
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
  String uname=(String)session.getAttribute("searchuname");
  if(uname!=null)
  {
	  %>
      <img class="img-chat rounded-circle" width="95px" height="50px" src="StudentViewImage.jsp?name=<%=uname%>">
      <%
      String usname="";
      String bs1="select Username from student_details where Userid=?";
  	PreparedStatement ps5=con1.prepareStatement(bs1);
      ps5.setString(1,uname);
      ResultSet rs5=ps5.executeQuery();
      while(rs5.next())
      {
      usname=rs5.getString(1);
      }
    

      
      %>
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
	 
	 receiver=(String)session.getAttribute("searchuname");
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
out.println(e.getMessage());
}
 }
	%>	
 </div>
 <div id="message-area">
 <form method="post"action="/E-learning/SFvchat">
 
<textarea name="message"placeholder="Type your message"required></textarea>
 <button id="search1"type="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
 </form>
</div>
  </div>
</div>


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
//session.removeAttribute("searchuname");
%>
</body>
</html>