<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.text.DateFormat,java.text.*,java.util.Calendar" %>
<%@ include file="connection.jsp" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="Bootstrap/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="Bootstrap/css/style.css" rel="stylesheet" type="text/css"></link>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
$('body').on('click', function (e) {
    $('[data-toggle="popover"]').each(function () {
        //the 'is' for buttons that trigger popups
        //the 'has' for icons within a button that triggers a popup
        if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
            $(this).popover('hide');
        }
    });
});
</script>
  <script src="~/Scripts/jquery-3.5.1.min.js"></script>
<script>
        $(window).scroll(function () {
            sessionStorage.scrollTop = $(this).scrollTop();
        });
        $(document).ready(function () {
            if (sessionStorage.scrollTop != "undefined") {
                $(window).scrollTop(sessionStorage.scrollTop);
            }
        });
</script>
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
a {
  color: lightgrey;
  text-decoration: none;
  background-color: transparent;
}
a:hover {
  color: #909497;
  text-decoration: underline;
}

html::-webkit-scrollbar {
  width:10px;

}


html::-webkit-scrollbar-track {
  background: #f1f1f1; 
}

html::-webkit-scrollbar-thumb {
  background: #888; 
border-radius:10px;
}


html::-webkit-scrollbar-thumb:hover {
  background: #555; 
}

.container
{
margin-left:0px;
padding-left:2px;
}
#quiz-info
{
border:1px solid black;
height:400px;
width:400px;
}
#subject
{
font-weight:bold;
font-size:25px;
color:black;
display:inline-block;
}
#uname
{
margin-top:15px;
color:black;
font-size:20px;
}
#un
{
   margin-left:10px;
    margin-top:5px;
    font-size:20px;
    display:inline-block;
 
}
#und
{
margin-left:10px;
margin-top:5px;
font-size:20px;
display:inline-block;
font-weight:bold;
    

}

#demo
{
float:right;
display:inline-block;
margin-right:0x;

margin-left:5px;
position:absolute;
color:black;
font-size:22px;

width:200px;

}
#timediv
{
margin-top:15px;
height:450px;
float:right;
width:330px;
display:inline-block;
border:1px solid black;

margin-right:1px;
}
#subject-name
{
font-size:22px;
color:white;
width:331px;
font-weight:bold;
position:absolute;
background:dodgerblue;
height:70px;
 word-wrap: break-word;
 margin-left:-1px;
text-align:center;

}
#questions-display
{

font-size:20px;
border:1px solid black;
border-top:0px;
border-bottom:0px solid black;
border-right:1px solid black;
margin-left:16px;
width:97.9%;
margin-top:-6px;
height:auto;
margin-bottom:10px;
word-wrap:break-word;
}

#quiz-page
{
border:1px solid black;
width:98%;

margin-top:15px;

height:70px;
margin-left:15px;
display:inline-block;

}


#oneword {
border-radius:5px;
font-family:Times New Roman;
font-size:20px;
   width:240px;
   margin-top:10px;
  padding: 10px 20px;
 margin-left:40px;
 box-sizing: border-box;
 border:none;
outline:none;
border-bottom: 2px solid silver;
}
#oneword1 {
border-radius:5px;
font-family:Times New Roman;
font-size:20px;
   width:500px;
  padding: 10px 20px;
 margin-left:40px;
 box-sizing: border-box;
 border:none;
outline:none;
border-bottom: 2px solid silver;
}
html
{
overflow-x:hidden;
}
textarea
{
  width:600px;
  height:200px;
   outline:none;
   font-size:20px;
  padding: 10px 20px;
 border:1px solid silver;
  resize:none;
  margin-left:40px;
    }

  input[type="checkbox"][readonly] {
  pointer-events: none;
}
  input[type="radio"][readonly] {
  pointer-events: none;
}
</style>

</head>
<body>


<%
try
{
String collegename=(String)session.getAttribute("colcode");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
String subject=(String)session.getAttribute("subjectname1");
String subject2=(String)session.getAttribute("subjectname");
int qid=Integer.parseInt(request.getParameter("id"));
int quizresultid=Integer.parseInt(request.getParameter("qrid"));

String sql6 = "Select Userid from quizresult where Id=?";
PreparedStatement pstm6 = con1.prepareStatement(sql6);
pstm6.setInt(1,quizresultid);
String userid="",username="";
ResultSet rs6 = pstm6.executeQuery();
if(rs6.next())
{
	userid=rs6.getString("Userid");
}
String sql8="Select Username from student_details where Userid=?";
PreparedStatement pstm8 = con1.prepareStatement(sql8);
pstm8.setString(1,userid);
ResultSet rs8 = pstm8.executeQuery();

if(rs8.next())
{
   username=rs8.getString("Username");
}

String sql = "Select Id,title,created_date,quiz_date,quiz_time,time_limit,description from quiz_info where Id=? order by id desc";
PreparedStatement pstm = con1.prepareStatement(sql);
pstm.setInt(1,qid);
int id=0;
String title="";
String created_date="";
String quiz_time="";
String quiz_date="";
String time_limit="";
String description="";
ResultSet rs = pstm.executeQuery();

while(rs.next()) 
{
	 
	 id=rs.getInt("Id");
	 title = rs.getString("title");
created_date = rs.getString("created_date");
quiz_time = rs.getString("quiz_time");
quiz_date=rs.getString("quiz_date");
time_limit=rs.getString("time_limit");
description = rs.getString("description");

}
String sql4 = "Select sum(Marks) from finalquiz where title=? and Subject_code=? and Userid=?";
PreparedStatement pstm4 = con1.prepareStatement(sql4);
pstm4.setString(1,title);
pstm4.setString(2,subject);
pstm4.setString(3,userid);
int sum=0;
ResultSet rs4 = pstm4.executeQuery();
if(rs4.next())
{
	  sum=rs4.getInt(1);
}
PreparedStatement ps3=con1.prepareStatement("Update quizresult set TotalMarks=? Where title=? and Userid=? and Subject_code=?");
	 ps3.setInt(1,sum);
	   ps3.setString(2,title);
	   ps3.setString(3,userid);
	   ps3.setString(4,subject);
	     int row3=ps3.executeUpdate();
int total1=0;
int marks1=0;
int count=0;

String questionss="";

String sql1 = "Select Question,Marks from quiz_questions where title=? and Subject_code=?";
PreparedStatement pstm3 = con1.prepareStatement(sql1);
pstm3.setString(1,title);
pstm3.setString(2,subject);
ResultSet rs1 = pstm3.executeQuery();

while(rs1.next()) 
{
	 count++;
	 questionss=rs1.getString("Question");
	 marks1=rs1.getInt("Marks");
	 total1 = total1+marks1;


}
%>
<title><%=title %></title>
<div id="quiz-page">
<div style="margin-top:15px;"></div>
<span style="margin-left:30px;display:inline-block;font-size:22px;"><b>Userid:</b>
<%=userid%></span>
<span style="margin-left:30px;display:inline-block;font-size:22px;"><b>Name:</b>
<%=username%></span>
<span style="margin-left:30px;display:inline-block;font-size:22px;"><b>Questions:</b>
<%=count%></span>
<span style="margin-left:30px;display:inline-block;font-size:22px;"><b>Time Limit:</b>
<%=time_limit%></span>
<span style="margin-left:30px;display:inline-block;font-size:22px;"><b>Marks Obtained:</b>
<%=sum%></span>
<span style="margin-left:30px;display:inline-block;font-size:22px;"><b>Total Marks:</b>
<%=total1%></span>

<a href="QuizResponse.jsp?id=<%=qid%>"><span style="float:right;margin-right:10px;display:inline-block;font-size:22px;"><button style="outline:none;background:#2471A3;color:white;border:0px;"type="submit">Back</button></span></a>
<a href="quizresponsemarks.jsp?id=<%=qid%>&type=button&qrid=<%=quizresultid%>"><span style="margin-left:10px;float:right;margin-right:10px;display:inline-block;font-size:22px;"><button style="outline:none;background:#2471A3;color:white;border:0px;"type="submit">Submit</button></span></a>
</div>


<div id="questions-display">

<%

String qtype="",quest="",op1="",op2="",op3="",op4="",correct="";
int marks;
int qno=0;
String sid;
String message=request.getParameter("message");
String message1=request.getParameter("message1");
String message2=request.getParameter("message2");
String message3=request.getParameter("message3");
String message4=request.getParameter("message4");
String message5=request.getParameter("message5");
String[] s={};
int count8=0;
String qstn="Select Question_type,Question,Option1,Option2,Option3,Option4,correct_ans,Marks,Id,Question_no from quiz_questions where title=? and Subject_code=?";
PreparedStatement ps7=con1.prepareStatement(qstn);
ps7.setString(1,title);
ps7.setString(2,subject);
ResultSet rs7=ps7.executeQuery();
while(rs7.next())
{
	qtype=rs7.getString(1);
	quest=rs7.getString(2);
	op1=rs7.getString(3);
	op2=rs7.getString(4);
	op3=rs7.getString(5);
	op4=rs7.getString(6);
	correct=rs7.getString(7);
	marks=rs7.getInt(8);
	id=rs7.getInt(9);
	sid="Q"+rs7.getInt(10)+":";
	qno=rs7.getInt(10);
	  if(qtype.equals("Multiple Choice"))
	  {
		  s=correct.split(",");
		//out.println(Arrays.toString(s));
count8=s.length;


	  }
	//out.println(qtype);
	  String qstn1="Select Checkbox1,Checkbox2,Checkbox3,Checkbox4,Answer,Marks from finalquiz where title=? and Subject_code=? and Question=? and Question_type=? and Userid=? ";
		  PreparedStatement ps9=con1.prepareStatement(qstn1);
		  String checkbox1="",checkbox2="",checkbox3="",checkbox4="",answer="";
		  int markss=0;
		  ps9.setString(1,title);
		  ps9.setString(2,subject);
		  ps9.setString(3,quest);
		  ps9.setString(4,qtype);
		  ps9.setString(5,userid);
		  ResultSet rs9=ps9.executeQuery();
		
		  while(rs9.next())
		  {
			  checkbox1=rs9.getString("Checkbox1");
			  checkbox2=rs9.getString("Checkbox2");
			  checkbox3=rs9.getString("Checkbox3");
			  checkbox4=rs9.getString("Checkbox4");
			  answer=rs9.getString("Answer");
			  markss=rs9.getInt("Marks");
		  
		  
	%>
	<div id="questions-set" style="border:1px solid lightgrey;margin-left:20px;margin-right:10px;margin-top:20px;width:98%;display:inline-block;color:black;">
	<div style="margin-left:10px;margin-top:15px;display:inline-block;"><%=sid%></div><div style="margin-left:10px;width:500px;display:inline-block;word-wrap:break-word;"><%=quest%></div><div style="float:right;margin-top:15px;margin-right:10px;display:inline-block;">Marks <%=marks%></div>
   
   <%
   if(qtype.equals("Multiple Choice"))
   {
	   
		%>

<%
if(!checkbox1.equals("N"))
{


%>
<br><span style="margin-left:45px"><input type="checkbox" id="check1" name="check1" value="<%=op1 %>"  readonly checked>
	   <label for="check1"><%=op1 %></label></span>	
	   <%
	   if(count8==4)
	   {
		   if(checkbox1.equals(s[0]) || checkbox1.equals(s[1]) || checkbox1.equals(s[2]) || checkbox1.equals(s[3]))
			  { 
	   
	   %>
	   
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   
		   else if(op1.equals(s[0])  && !checkbox1.equals("N") || op1.equals(s[1])  && !checkbox1.equals("N") || op1.equals(s[2])  && !checkbox1.equals("N") || op1.equals(s[3])  && !checkbox1.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
		   
		   
	   }
	    
	     else if(count8==3)
	   {
		   if(checkbox1.equals(s[0]) || checkbox1.equals(s[1]) || checkbox1.equals(s[2]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op1.equals(s[0])  && !checkbox1.equals("N") || op1.equals(s[1])  && !checkbox1.equals("N") || op1.equals(s[2])  && !checkbox1.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	    else if(count8==2)
	   {
		   if(checkbox1.equals(s[0]) || checkbox1.equals(s[1]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op1.equals(s[0])  && !checkbox1.equals("N") || op1.equals(s[1])  && !checkbox1.equals("N"))
		   {
			   %>
			<span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	    
	     else if(count8==1)
	   {
		   if(checkbox1.equals(s[0]))
			  { 
	  
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op1.equals(s[0])  && !checkbox1.equals("N"))
		   
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	    
	  
 } 
else if(checkbox1.equals("N"))
{

%>
<br><span style="margin-left:45px"><input type="checkbox" id="check1" name="check1" value="<%=op1 %>"readonly >
	   <label for="check1"><%=op1 %></label></span>	 
	<%
	   if(count8==4)
	   {
			
		   if(checkbox1.equals(s[0]) || checkbox1.equals(s[1]) || checkbox1.equals(s[2]) || checkbox1.equals(s[3]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op1.equals(s[0])  && !checkbox1.equals("N") || op1.equals(s[1])  && !checkbox1.equals("N") || op1.equals(s[2])  && !checkbox1.equals("N") || op1.equals(s[3])  && !checkbox1.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	    
	     else if(count8==3)
	   {
		   if(checkbox1.equals(s[0]) || checkbox1.equals(s[1]) || checkbox1.equals(s[2]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op1.equals(s[0])  && !checkbox1.equals("N") || op1.equals(s[1])  && !checkbox1.equals("N") || op1.equals(s[2])  && !checkbox1.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	    
	     else if(count8==2)
	   {
		   if(checkbox1.equals(s[0]) || checkbox1.equals(s[1]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op1.equals(s[0])  && !checkbox1.equals("N") || op1.equals(s[1])  && !checkbox1.equals("N"))
		   {
			   %>
			<span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
		   
	   }
	   
	     else if(count8==1)
	   {
	    	 
		   if(checkbox1.equals(s[0]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op1.equals(s[0])  && !checkbox1.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	    
	   
	 

} 

if(!checkbox2.equals("N"))
{
	
%>
  
	    <br><span style="margin-left:45px"><input type="checkbox" id="check2" name="check2"  value="<%=op2 %>" readonly checked>
	   <label for="check2"><%=op2 %></label></span> 

<%
	   if(count8==4)
	   {
		   if(checkbox2.equals(s[0]) || checkbox2.equals(s[1]) || checkbox2.equals(s[2]) || checkbox2.equals(s[3]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op2.equals(s[0])  && !checkbox2.equals("N") || op2.equals(s[1])  && !checkbox2.equals("N") || op2.equals(s[2])  && !checkbox2.equals("N") || op2.equals(s[3])  && !checkbox2.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		    else 
			   {
				   %>
				   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
				   <% 
			   }
	   }
	    
	     else if(count8==3)
	   {
		   if(checkbox2.equals(s[0]) || checkbox2.equals(s[1]) || checkbox2.equals(s[2]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op2.equals(s[0])  && !checkbox2.equals("N") || op2.equals(s[1])  && !checkbox2.equals("N") || op2.equals(s[2])  && !checkbox2.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		    else 
			   {
				   %>
				   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
				   <% 
			   }
	   }
	    
	     else if(count8==2)
	   {
		   if(checkbox2.equals(s[0]) || checkbox2.equals(s[1]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op2.equals(s[0])  && !checkbox2.equals("N") || op2.equals(s[1])  && !checkbox2.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		    else 
			   {
				   %>
				   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
				   <% 
			   }
	   }
	   
	     else if(count8==1)
	   {
		   if(checkbox2.equals(s[0]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op2.equals(s[0])  && !checkbox2.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		    else 
			   {
				   %>
				   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
				   <% 
			   }
	   }
	    
	 
	} 
else if(checkbox2.equals("N"))
{
%>

	    <br><span style="margin-left:45px"><input type="checkbox" id="check2" name="check2"  value="<%=op2 %>" readonly >
	   <label for="check2"><%=op2 %></label></span> 
	   	     

<%
	   if(count8==4)
	   {
		   if(checkbox2.equals(s[0]) || checkbox2.equals(s[1]) || checkbox2.equals(s[2]) || checkbox2.equals(s[3]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op2.equals(s[0])  && !checkbox2.equals("N") || op2.equals(s[1])  && !checkbox2.equals("N") || op2.equals(s[2])  && !checkbox2.equals("N") || op2.equals(s[3])  && !checkbox2.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		    else 
			   {
				   %>
				   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
				   <% 
			   }
	   }
	   
	     else if(count8==3)
	   {
		   if(checkbox2.equals(s[0]) || checkbox2.equals(s[1]) || checkbox2.equals(s[2]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op2.equals(s[0])  && !checkbox2.equals("N") || op2.equals(s[1])  && !checkbox2.equals("N") || op2.equals(s[2])  && !checkbox2.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		    else 
			   {
				   %>
				   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
				   <% 
			   }
	   }
	    
	     else if(count8==2)
	   {
		   if(checkbox2.equals(s[0]) || checkbox2.equals(s[1]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op2.equals(s[0])  && !checkbox2.equals("N") || op2.equals(s[1])  && !checkbox2.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		    else 
			   {
				   %>
				   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
				   <% 
			   }
	   }
	   
	     else if(count8==1)
	   {
		   if(checkbox2.equals(s[0]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op2.equals(s[0])  && !checkbox2.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		    else 
			   {
				   %>
				   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
				   <% 
			   }
	   }
	   
	 

} 

if(!checkbox3.equals("N"))
{
	String empty="N";
%>

	   <br><span style="margin-left:45px"><input type="checkbox" id="check3" name="check3" value="<%=op3 %>"readonly checked>
	   <label for="check3"><%=op3 %></label></span>
<%
	   if(count8==4)
	   {
		   if(checkbox3.equals(s[0]) || checkbox3.equals(s[1]) || checkbox3.equals(s[2]) || checkbox3.equals(s[3]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op3.equals(s[0])  && !checkbox3.equals("N") || op3.equals(s[1])  && !checkbox3.equals("N") || op3.equals(s[2])  && !checkbox3.equals("N") || op3.equals(s[3])  && !checkbox3.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	    
	     else if(count8==3)
	   {
		   if(checkbox3.equals(s[0]) || checkbox3.equals(s[1]) || checkbox3.equals(s[2]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op3.equals(s[0])  && !checkbox3.equals("N") || op3.equals(s[1])  && !checkbox3.equals("N") || op3.equals(s[2]))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	   
	     else if(count8==2)
	   {
		   if(checkbox3.equals(s[0]) || checkbox3.equals(s[1]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op3.equals(s[0])  && !checkbox3.equals("N") || op3.equals(s[1])  && !checkbox3.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	   
	     else if(count8==1)
	   {
		   if(checkbox3.equals(s[0]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op3.equals(s[0])  && !checkbox3.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	   
	  

} 
else if(checkbox3.equals("N"))
{
%>

	   <br><span style="margin-left:45px"><input type="checkbox" id="check3" name="check3" value="<%=op3 %>"readonly >
	   <label for="check3"><%=op3 %></label></span>
	   	     <%
	   if(count8==4)
	   {
		   if(checkbox3.equals(s[0]) || checkbox3.equals(s[1]) || checkbox3.equals(s[2]) || checkbox3.equals(s[3]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op3.equals(s[0])  && !checkbox3.equals("N") || op3.equals(s[1])  && !checkbox3.equals("N") || op3.equals(s[2])  && !checkbox3.equals("N") || op3.equals(s[3])  && !checkbox3.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	   
	     else if(count8==3)
	   {
		   if(checkbox3.equals(s[0]) || checkbox3.equals(s[1]) || checkbox3.equals(s[2]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op3.equals(s[0])  && !checkbox3.equals("N") || op3.equals(s[1])  && !checkbox3.equals("N") || op3.equals(s[2])  && !checkbox3.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	   
	     else if(count8==2)
	   {
		   if(checkbox3.equals(s[0]) || checkbox3.equals(s[1]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op3.equals(s[0])  && !checkbox3.equals("N") || op3.equals(s[1])  && !checkbox3.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	    
	     else if(count8==1)
	   {
		   if(checkbox3.equals(s[0]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op3.equals(s[0])  && !checkbox3.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	   
	  

} 

if(!checkbox4.equals("N"))
{
	
%>

	   <br><span style="margin-left:45px"><input type="checkbox" id="check4" name="check4" value="<%=op4 %>"readonly checked>
	   <label for="check4"><%=op4 %></label></span>


<%
	   if(count8==4)
	   {
		   if(checkbox4.equals(s[0]) || checkbox4.equals(s[1]) || checkbox4.equals(s[2]) || checkbox4.equals(s[3]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op4.equals(s[0])  && !checkbox4.equals("N") || op4.equals(s[1])  && !checkbox4.equals("N") || op4.equals(s[2])  && !checkbox4.equals("N") || op4.equals(s[3])  && !checkbox4.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	   
	     else if(count8==3)
	   {
		   if(checkbox4.equals(s[0]) || checkbox4.equals(s[1]) || checkbox4.equals(s[2]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op4.equals(s[0])  && !checkbox4.equals("N") || op4.equals(s[1])  && !checkbox4.equals("N") || op4.equals(s[2])  && !checkbox4.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	    
	     else if(count8==2)
	   {
		   if(checkbox4.equals(s[0]) || checkbox4.equals(s[1]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op4.equals(s[0])  && !checkbox4.equals("N") || op4.equals(s[1])  && !checkbox4.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	   
	     else if(count8==1)
	   {
		   if(checkbox4.equals(s[0]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op4.equals(s[0])  && !checkbox4.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	   
	  

}
	else if(checkbox4.equals("N"))
{
%>
	   <br><span style="margin-left:45px"><input type="checkbox" id="check4" name="check4" value="<%=op4 %>"readonly >
	   <label for="check4"><%=op4 %></label></span>
	   	    
<%
	   if(count8==4)
	   {
		   if(checkbox4.equals(s[0]) || checkbox4.equals(s[1]) || checkbox4.equals(s[2]) || checkbox4.equals(s[3]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op4.equals(s[0])  && !checkbox4.equals("N") || op4.equals(s[1])  && !checkbox4.equals("N") || op4.equals(s[2])  && !checkbox4.equals("N") || op4.equals(s[3])  && !checkbox4.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	    
	     else if(count8==3)
	   {
		   if(checkbox4.equals(s[0]) || checkbox4.equals(s[1]) || checkbox4.equals(s[2]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op4.equals(s[0])  && !checkbox4.equals("N") || op4.equals(s[1])  && !checkbox4.equals("N") || op4.equals(s[2])  && !checkbox4.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	    
	     else if(count8==2)
	   {
		   if(checkbox4.equals(s[0]) || checkbox4.equals(s[1]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op4.equals(s[0])  && !checkbox4.equals("N") || op4.equals(s[1])  && !checkbox4.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	   
	     else if(count8==1)
	   {
		   if(checkbox4.equals(s[0]))
			  { 
	   
	   %>
	    <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
	    <%
			  }
		   else if(op4.equals(s[0])  && !checkbox4.equals("N"))
		   {
			   %>
			   <span style="margin-left:20px;color:green"><i class="fa fa-check" aria-hidden="true"></i></span>
			   <% 
		   }
		   else 
		   {
			   %>
			   <span style="margin-left:20px;color:red;"><i class="fas fa-times" aria-hidden="true"></i></span>
			   <% 
		   }
	   }
	   
	   

} 
%>		 
 <div style="height:5px"></div>
 <%if(markss!=0 || markss==0)
 {
 %>
 <div style="margin-left:40px;display:inline-block;"><b>Marks Obtained:</b> <input autocomplete="off"style="width:80px;"type="number"onchange="window.location.replace('quizresponsemarks.jsp?id=<%=qid%>&qrid=<%=quizresultid%>&question=<%=quest%>&qtype=<%=qtype%>&qno=<%=qno%>&mainmarks=<%=marks%>&type=mult&marks='+this.value);"name="marks"id="marks"value="<%=markss%>"></div>
 <%
 if(message!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message+"</span>");
	 }
 }
   }
   else
   {
 %>
  <div style="margin-left:40px;"><b>Marks Obtained:</b> <input autocomplete="off"style="width:80px;"type="number"onchange="window.location.replace('quizresponsemarks.jsp?id=<%=qid%>&qrid=<%=quizresultid%>&question=<%=quest%>&qtype=<%=qtype%>&qno=<%=qno%>&mainmarks=<%=marks%>&type=mult&marks='+this.value);"name="marks"id="marks"value=""></div>
    <%
    if(message!=null)
    {
    	 int qnoo=Integer.parseInt(request.getParameter("qno"));
    	 if(qnoo==qno)
    	 {
     out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message+"</span>");
    	 }
    }
		}
   %>
 
 <div style="height:10px"></div>
	   <%
		
   }
   %>
   <%
   if(qtype.equals("Single Choice"))
   {
	  %>
<% 
	  if(op1.equals(answer))
{
		 
%>

<br><span style="margin-left:45px"><input type="radio" id="radio1" name="<%=quest%>"value="<%=op1 %>"readonly checked>
        <label for="radio1"><%=op1 %></label></span>
<%		  
}
else if(!op1.equals(answer))
{
%>
<br><span style="margin-left:45px"><input type="radio" id="radio1" name="<%=quest%>"value="<%=op1 %>"readonly>
        <label for="radio1"><%=op1 %></label></span>
<%		  
}
%>

<% 
	  if(op2.equals(answer))
{
%>
 <br><span style="margin-left:45px"><input type="radio" id="radio2" name="<%=quest%>"value="<%=op2 %>"readonly checked>
        <label for="radio2"><%=op2 %></label></span>
<%		  
}
else if(!op2.equals(answer))
{
%>
 <br><span style="margin-left:45px"><input type="radio" id="radio2" name="<%=quest%>"value="<%=op2 %>"readonly>
        <label for="radio2"><%=op2 %></label></span>
<%		  
}
%>

<% 
	  if(op3.equals(answer))
{
%>
  <br><span style="margin-left:45px"><input type="radio" id="radio3" name="<%=quest%>"value="<%=op3 %>"readonly checked>
        <label for="radio3"><%=op3 %></label></span>
<%		  
}
else if(!op3.equals(answer))
{
%>
 <br><span style="margin-left:45px"><input type="radio" id="radio3" name="<%=quest%>"value="<%=op3 %>"readonly>
        <label for="radio3"><%=op3 %></label></span>
<%		  
}
%>
<% 
	  if(op4.equals(answer))
{
%>
  
        <br><span style="margin-left:45px"><input type="radio" id="radio4" name="<%=quest%>"value="<%=op4 %>"readonly checked>
        <label for="radio4"><%=op4 %></label></span>
<%		  
}
else if(!op4.equals(answer))
{
%>
   
<br><span style="margin-left:45px"><input type="radio" id="radio4" name="<%=quest%>" value="<%=op4 %>"readonly>
        <label for="radio4"><%=op4 %></label></span>
<%		  
}
%>
     <div style="height:5px"></div>
 <%if(markss!=0 || markss==0)
 {
 %>
 <div style="margin-left:40px;display:inline-block;"><b>Marks Obtained:</b> <input autocomplete="off" style="width:80px;"type="number"onchange="window.location.replace('quizresponsemarks.jsp?id=<%=qid%>&qrid=<%=quizresultid%>&question=<%=quest%>&qtype=<%=qtype%>&qno=<%=qno%>&mainmarks=<%=marks%>&type=sing&marks1='+this.value);"id="marks1"name="marks1"value="<%=markss%>"></div>
 	      <%
 if(answer.equals(correct))
 {
 %>
 <span style="margin-left:20px;color:green;display:inline-block;"><i class="fa fa-check" aria-hidden="true"></i></span>
 <%
 if(message1!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno1"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message1+"</span>");
	 }
 }
 }
else
 {
 %>
 <span style="margin-left:20px;color:red;display:inline-block;"><i class="fas fa-times" aria-hidden="true"></i></span>
 <%
 if(message1!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno1"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message1+"</span>");
	 }
 }
 }
 %>
 <%
   }
   else
   {
 %>
  <div style="margin-left:40px;display:inline-block;"><b>Marks Obtained:</b> <input autocomplete="off" style="width:80px;"type="number"onchange="window.location.replace('quizresponsemarks.jsp?id=<%=qid%>&qrid=<%=quizresultid%>&question=<%=quest%>&qtype=<%=qtype%>&qno=<%=qno%>&mainmarks=<%=marks%>&type=sing&marks1='+this.value);"id="marks1"name="marks1"value=""></div>
   	      <%
 if(answer.equals(correct))
 {
 %>
 <span style="margin-left:20px;color:green;display:inline-block;"><i class="fa fa-check" aria-hidden="true"></i></span>
 <%
 if(message1!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno1"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message1+"</span>");
	 }
 }
 }
else
 {
 %>
 <span style="margin-left:20px;color:red;display:inline-block;"><i class="fas fa-times" aria-hidden="true"></i></span>
 <%
 if(message1!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno1"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message1+"</span>");
	 }
 }
 }
 %>
    <%
		}
   %>
 
 <div style="height:10px"></div>
	   <%
   }
   %>
     <%
   if(qtype.equals("True or False"))
   {
	  %>
	  <%
	  if(answer.equals("True"))
	  {
	  %>
	   <br><span style="margin-left:45px"><input type="radio" id="radio5" name="truefalse"value="True"readonly checked>
        <label for="radio5">True</label></span>
        <%
 }
 	  else if(!answer.equals("True"))
	  {
	  %>
	   <br><span style="margin-left:45px"><input type="radio" id="radio5" name="truefalse"value="True"readonly>
        <label for="radio5">True</label></span>
        <%
 }
 %>    
 
 	  <%
	  if(answer.equals("False"))
	  {
	  %>
	     <br><span style="margin-left:45px"><input type="radio" id="radio6" name="truefalse"value="False"readonly checked>
        <label for="radio6">False</label></span>
        <%
 }
 	  else if(!answer.equals("False"))
	  {
	  %>
	     <br><span style="margin-left:45px"><input type="radio" id="radio6" name="truefalse" value="False"readonly>
        <label for="radio6">False</label></span>
        <%
 }
 %>  

	  <div style="height:5px"></div>
 <%if(markss!=0 || markss==0)
 {
 %>
 <div style="margin-left:40px;display:inline-block;"><b>Marks Obtained:</b> <input autocomplete="off"style="width:80px;"type="number"onchange="window.location.replace('quizresponsemarks.jsp?id=<%=qid%>&qrid=<%=quizresultid%>&question=<%=quest%>&qtype=<%=qtype%>&qno=<%=qno%>&mainmarks=<%=marks%>&type=trufal&marks2='+this.value);"id="marks2"name="marks2"value="<%=markss%>"></div>
 	      <%
 if(answer.equals(correct))
 {
 %>
 <span style="margin-left:20px;color:green;display:inline-block;"><i class="fa fa-check" aria-hidden="true"></i></span>
 <%
 if(message2!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno2"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message2+"</span>");
	 }
 }
 }
else
 {
 %>
 <span style="margin-left:20px;color:red;display:inline-block;"><i class="fas fa-times" aria-hidden="true"></i></span>
 <%
 if(message2!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno2"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message2+"</span>");
	 }
 }
 }
 %>
 
 
 <%
   }
   else
   {
 %>
  <div style="margin-left:40px;display:inline-block;"><b>Marks Obtained:</b> <input autocomplete="off"style="width:80px;"type="number"onchange="window.location.replace('quizresponsemarks.jsp?id=<%=qid%>&qrid=<%=quizresultid%>&question=<%=quest%>&qtype=<%=qtype%>&qno=<%=qno%>&mainmarks=<%=marks%>&type=trufal&marks2='+this.value);"id="marks2"name="marks2"value=""></div>
    	      <%
 if(answer.equals(correct))
 {
 %>
 <span style="margin-left:20px;color:green;display:inline-block;"><i class="fa fa-check" aria-hidden="true"></i></span>
 <%
 if(message2!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno2"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message2+"</span>");
	 }
 }
 }
else
 {
 %>
 <span style="margin-left:20px;color:red;display:inline-block;"><i class="fas fa-times" aria-hidden="true"></i></span>
 <%
 if(message2!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno2"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message2+"</span>");
	 }
 }
 }
 %>
    
    <%
		}
   %>
  
 <div style="height:10px"></div>
	   <%
   }
   %>
       <%
   if(qtype.equals("One Word"))
   {
	  %>
	  <% 
	   if(!answer.equals("N"))
	   {
		   %>
		   
	     <br><input type="text" id="oneword" name="oneword"placeholder="Write One Word Answer" value="<%=answer%>"readonly>
	    <%
	    }
	   else if(answer.equals("N"))
	   {
		   
		   %>
		   
	      <br><input type="text" id="oneword" name="oneword"placeholder="Write One Word Answer" value=""readonly>
	    <%
	    }
	     %>
          <div style="height:10px"></div>
 <%if(markss!=0 || markss==0)
 {
 %>
 <div style="margin-left:40px;display:inline-block;"><b>Marks Obtained:</b> <input autocomplete="off"style="width:80px;"type="number"onchange="window.location.replace('quizresponsemarks.jsp?id=<%=qid%>&qrid=<%=quizresultid%>&question=<%=quest%>&qtype=<%=qtype%>&qno=<%=qno%>&mainmarks=<%=marks%>&type=onew&marks3='+this.value);"id="marks3"name="marks3"value="<%=markss%>"></div>
 	      <%
 if(answer.equals(correct))
 {
 %>
 <span style="margin-left:20px;color:green;display:inline-block;"><i class="fa fa-check" aria-hidden="true"></i></span>
 <%
 if(message3!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno3"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message3+"</span>");
	 }
 }
 }
else
 {
 %>
 <span style="margin-left:20px;color:red;display:inline-block;"><i class="fas fa-times" aria-hidden="true"></i></span>
 <%
 if(message3!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno3"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message3+"</span>");
	 }
 }
 }
 %>
 <%
   }
   else
   {
 %>
  <div style="margin-left:40px;display:inline-block;"><b>Marks Obtained:</b> <input autocomplete="off"style="width:80px;"type="number"onchange="window.location.replace('quizresponsemarks.jsp?id=<%=qid%>&qrid=<%=quizresultid%>&question=<%=quest%>&qno=<%=qno%>&qtype=<%=qtype%>type=onew&marks3='+this.value);"id="marks3"name="marks3"value=""></div>
    	      <%
 if(answer.equals(correct))
 {
 %>
 <span style="margin-left:20px;color:green;display:inline-block;"><i class="fa fa-check" aria-hidden="true"></i></span>
 <%
 if(message3!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno3"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message3+"</span>");
	 }
 }
 }
else
 {
 %>
 <span style="margin-left:20px;color:red;display:inline-block;"><i class="fas fa-times" aria-hidden="true"></i></span>
 <%
 if(message3!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno3"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message3+"</span>");
	 }
 }
 }
 %>
    <%
		}
   %>
 
 <div style="height:10px"></div>
	  
	   <%
   }
   %>
         <%
   if(qtype.equals("Single Line"))
   {
	  %>
	   <% 
	   if(!answer.equals("N"))
	   {
		   %>
		   
	       <br><input type="text" id="oneword1" name="singleline"placeholder="Write Single Line Answer"value="<%=answer%>"readonly>
	    <%
	    }
	   else if(answer.equals("N"))
	   {
		   
		   %>
		   
	       <br><input type="text" id="oneword1" name="singleline"placeholder="Write Single Line Answer"value=""readonly>
	    <%
	    }
	     %>
	 
          <div style="height:10px"></div>
 <%if(markss!=0)
 {
 %>
 <div style="margin-left:40px;display:inline-block;"><b>Marks Obtained:</b> <input autocomplete="off"style="width:80px;"type="number"onchange="window.location.replace('quizresponsemarks.jsp?id=<%=qid%>&qrid=<%=quizresultid%>&question=<%=quest%>&qtype=<%=qtype%>&qno=<%=qno%>&mainmarks=<%=marks%>&type=sline&marks4='+this.value);"id="marks4"name="marks4"value="<%=markss%>"></div>
 	      <%
 if(answer.equals(correct) || markss>0)
 {
 %>
 <span style="margin-left:20px;color:green;display:inline-block;"><i class="fa fa-check" aria-hidden="true"></i></span>
 <%
 if(message4!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno4"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message4+"</span>");
	 }
 }
 }
 	      
else
 {
 %>
 <span style="margin-left:20px;color:red;display:inline-block;"><i class="fas fa-times" aria-hidden="true"></i></span>
 <%
 if(message4!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno4"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message4+"</span>");
	 }
 }
 }
 %>
 <%
   }
   else
   {
 %>
 
  <div style="margin-left:40px;display:inline-block;"><b>Marks Obtained:</b> <input autocomplete="off"style="width:80px;"type="number"onchange="window.location.replace('quizresponsemarks.jsp?id=<%=qid%>&qrid=<%=quizresultid%>&question=<%=quest%>&qtype=<%=qtype%>&qno=<%=qno%>&mainmarks=<%=marks%>&type=sline&marks4='+this.value);"id="marks4"name="marks4"value=""></div>
   	      <%
 if(answer.equals(correct) || markss>0)
 {
 %>
 <span style="margin-left:20px;color:green;display:inline-block;"><i class="fa fa-check" aria-hidden="true"></i></span>
 <%
 if(message4!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno4"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message4+"</span>");
	 }
 }
 }
else
 {
 %>
 <span style="margin-left:20px;color:red;display:inline-block;"><i class="fas fa-times" aria-hidden="true"></i></span>
 <%
 if(message4!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno4"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message4+"</span>");
	 }
 }
 }
 %>
    <%
		}
 
   %>

 <div style="height:10px"></div>
	  
	   <%
   }
   %>
           <%
   if(qtype.equals("Descriptive"))
   {
	  %>
	 
	  
	   <% 
	   if(!answer.equals("N"))
	   {
		   %>
		   
	       <br><textarea id="description"name="description"onchange="Descriptive(this.value);"placeholder="Write Answer in Brief"readonly><%=answer %></textarea>
	    <%
	    }
	   else if(answer.equals("N"))
	   {
		   
		   %>
		   
	       <br><textarea id="description"name="description"onchange="Descriptive(this.value);"placeholder="Write Answer in Brief"readonly></textarea>
	    <%
	    }
	     %>
	   
       <div style="height:5px"></div>
 <%if(markss!=0)
 {
 %>
 <div style="margin-left:40px;display:inline-block;"><b>Marks Obtained:</b> <input style="width:80px;"type="number"onchange="window.location.replace('quizresponsemarks.jsp?id=<%=qid%>&qrid=<%=quizresultid%>&question=<%=quest%>&qtype=<%=qtype%>&qno=<%=qno%>&mainmarks=<%=marks%>&type=desc&marks5='+this.value);"autocomplete="off"id="marks5"name="marks5"value="<%=markss%>"></div>
	      <%
 if(answer.equals(correct) || markss>0)
 {
 %>
 <span style="margin-left:20px;color:green;display:inline-block;"><i class="fa fa-check" aria-hidden="true"></i></span>
 <%
 if(message5!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno5"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message5+"</span>");
	 }
 }
 }
else
 {
 %>
 <span style="margin-left:20px;color:red;display:inline-block;"><i class="fas fa-times" aria-hidden="true"></i></span>
 <%
 if(message5!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno5"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message5+"</span>");
	 }
 }
 }
 %>
 <%
   }
   else
   {
 %>
  <div style="margin-left:40px;display:inline-block;"><b>Marks Obtained:</b> <input style="width:80px;"type="number"onchange="window.location.replace('quizresponsemarks.jsp?id=<%=qid%>&qrid=<%=quizresultid%>&question=<%=quest%>&qtype=<%=qtype%>&qno=<%=qno%>&mainmarks=<%=marks%>&type=desc&marks5='+this.value);"autocomplete="off"id="marks5"name="marks5"value=""></div>
   	      <%
 if(answer.equals(correct) || markss>0)
 {
 %>
 <span style="margin-left:20px;color:green;display:inline-block;"><i class="fa fa-check" aria-hidden="true"></i></span>
 <%
 if(message5!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno5"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message5+"</span>");
	 }
 }
 }
else
 {
 %>
 <span style="margin-left:20px;color:red;display:inline-block;"><i class="fas fa-times" aria-hidden="true"></i></span>
 <%
 if(message5!=null)
 {
	 int qnoo=Integer.parseInt(request.getParameter("qno5"));
	 if(qnoo==qno)
	 {
 out.println("<span style='margin-left:20px;display:inline-block;color:red;'>"+message5+"</span>");
	 }
 }
 }
 %>
    <%
		}
   %>

 <div style="height:10px"></div>
	  
	   <%
   }
   %>
  
      </div>
   
   
   <% 
		  }
		  
}
con.close();
con1.close();
}
catch(Exception e)
{
	out.println(e.getMessage());
	}

%>
 
	<br>             
</div>
<br>

 
</body>
</html>