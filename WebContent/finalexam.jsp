<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.text.DateFormat,java.text.*,java.util.Calendar" %>
 
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

<style>
#question-nos::-webkit-scrollbar {
  width:10px;

}


#question-nos::-webkit-scrollbar-track {
  background: #f1f1f1; 
}

#question-nos::-webkit-scrollbar-thumb {
  background: #888; 
border-radius:10px;
}


#question-nos::-webkit-scrollbar-thumb:hover {
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
margin-left:15px;
font-size:20px;
border:1px solid black;
border-right:0px solid black;
border-bottom:0px solid white;
border-top:0px;
margin-left:25px;
width:1180px;
height:600px;
}

#quiz-page
{
border:1px solid black;
width:1180px;
margin-top:15px;
border-right:0px solid black;
height:70px;
margin-left:25px;
display:inline-block;

}
#question-nos
{
margin-top:75px;
width:300px;
display:inline-block;
overflow-y:scroll;
height:370px;
margin-left:20px;
overflow-x:hidden;

}
#question-no-boxes
{
display:inline-block;
border:2px solid dodgerblue;
margin-left:10px;
margin-top:10px;
width:40px;
font-size:20px;

text-align:center;
}

#question-no-boxes4
{
display:inline-block;
border:2px solid green;
margin-left:10px;
margin-top:10px;
width:40px;
font-size:20px;
color:white;
background:green;
text-align:center;
}
#question-no-boxes5
{
display:inline-block;
border:2px solid red;
margin-left:10px;
margin-top:10px;
width:40px;
font-size:20px;
color:white;
background:red;
text-align:center;
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
  height:100px;
   outline:none;
   font-size:20px;
  padding: 10px 20px;
 border:1px solid silver;
  resize:none;
  margin-left:40px;
    }

    #question-no-boxes1
{

display:inline-block;
border:2px solid transparent;
margin-left:10px;
margin-top:10px;
width:150px;
font-size:18px;
color:white;
background:green;
text-align:center;
}
    #question-no-boxes2
{

display:inline-block;
border:2px solid transparent;
margin-left:10px;
margin-top:10px;
width:150px;
font-size:18px;
background:red;
color:white;
text-align:center;

}
#question-no-boxes3
{
display:inline-block;
border:2px solid dodgerblue;
margin-left:10px;
margin-top:10px;
width:auto;
font-size:18px;
width:150px;
text-align:center;
}
</style>

</head>
<body>


<%

String collegename=(String)session.getAttribute("colcode");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
String subject=(String)session.getAttribute("studsubject1");
String subject2=(String)session.getAttribute("subjectname");
String  spageid=request.getParameter("page");
String  cnt=request.getParameter("cnt");
String  prepageid=request.getParameter("prevpage");
int count2;
count2=Integer.parseInt(cnt);

//out.println("Subject:<b>"+subject2+"</b>");
int qid=Integer.parseInt(request.getParameter("id"));
//out.println(qid);
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
int total1=0;
int marks1=0;
int count=0;
String questionss="";
String subcode=(String)session.getAttribute("studsubject1");
String sql1 = "Select Question,Marks from quiz_questions where title=? and Subject_code=?";
PreparedStatement pstm3 = con1.prepareStatement(sql1);
pstm3.setString(1,title);
pstm3.setString(2,subcode);
ResultSet rs1 = pstm3.executeQuery();

while(rs1.next()) 
{
	 count++;
	 questionss=rs1.getString("Question");
	 marks1=rs1.getInt("Marks");
	 total1 = total1+marks1;


}
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
Date date1 = sdf.parse(quiz_date);
Date date2=new Date();
String d2=sdf.format(date2);
DateFormat dateFormat = new SimpleDateFormat("hh:mm aa");
String dateString = dateFormat.format(new Date()).toString();
//String t1=time_limit.substring(0,2);
//int st1=Integer.parseInt(t1);
String d1=d2.substring(0, 10);
String[] s=time_limit.split(" ");

//String d1=d2.substring(0, 10);
int sthrs=0;
if(s[0]!=null)
{
	 sthrs =Integer.parseInt(s[0])*60;
	  
}
else if(s[0]==null)
{
	 sthrs=0;
}
int stmins=Integer.parseInt(s[2]);
int tlimit=sthrs+stmins;
//out.println("time"+s[0]);
//out.println("type"+s[1]);
//String myTime = "14:10";
SimpleDateFormat df = new SimpleDateFormat("hh:mm aa");
Date d = df.parse(quiz_time); 
Calendar cal = Calendar.getInstance();
cal.setTime(d);
int st1=Integer.parseInt(s[0]);
int mincon;
	cal.add(Calendar.MINUTE,tlimit);

String newTime = df.format(cal.getTime());
//out.println(newTime);
DateFormat Date = DateFormat.getDateInstance();
//Initializing Calender Object
Calendar cals = Calendar.getInstance();
cals.setTime(date1);
String currentDate = Date.format(cals.getTime());
String apdate=currentDate+" "+newTime;

String uid=(String)session.getAttribute("sessuid") ;
String sql2 = "Select Roll_no from student_details where Userid=?";
PreparedStatement pstm2 = con1.prepareStatement(sql2);
pstm2.setString(1,uid);
ResultSet rs2 = pstm2.executeQuery();
String rollno="";
if(rs2.next()) 
{
	rollno=rs2.getString("Roll_no");
}


%>
<title><%=title %></title>
<div id="quiz-page">
<div style="margin-top:14px;"></div>
<li style="display:inline-block;margin-left:50px;" href="#" id="example" rel="popover" class="btn btn-success" data-toggle="popover" data-placement="bottom" data-content="">
 My Profile
</li>

<div id="popover_content_wrapper" style="display:none">
<div id="uname">
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<img src="prof.jpg" style="margin-left:50px;"><br>
<b>Account Name:</b> <%=(String)session.getAttribute("sessname") %>
<br><b>UserId:</b>
 <%=uid%>
<br><b>Roll Number:</b>
 <%=rollno %>
 <br><b>Subject:</b>
 <%=subject2 %>
</div>
</div>

<span style="margin-left:50px;position:absolute;display:inline-block;font-size:22px;"><b>Questions:</b>
<%=count%></span>
<span style="margin-left:220px;position:absolute;display:inline-block;font-size:22px;"><b>Time Limit:</b>
<% if(s[0].equals("0"))
{ 
	out.println(s[2]+" "+s[3]); 
	}
else if(!s[0].equals("0") && !s[2].equals("0"))
{
	out.println(time_limit);
	}
else if(s[2].equals("0"))
{
	out.println(s[0]+" "+s[1]);
	} %>
</span>
<span style="margin-left:500px;position:absolute;display:inline-block;font-size:22px;"><b>Total Marks:</b>
<%=total1%></span>

<span style="margin-left:700px;position:absolute;display:inline-block;font-size:22px;"><b>Time Remaining:</b>
<span id="demo">
</span>
</span>

</div>
<div id="timediv">

<div id="subject-name"><div style="margin-top:15px;"></div>
 <%=subject2 %>
</div>
<div id="question-nos">

<%
int count3=0;
String sql3 = "Select Question_no,Question,Question_type from quiz_questions where title=? and Subject_code=?";
PreparedStatement pstm4 = con1.prepareStatement(sql3);
pstm4.setString(1,title);
pstm4.setString(2,subcode);
ResultSet rs3 = pstm4.executeQuery();
String questio="";
String qqtype="";
String c1="",c2="",c3="",c4="",an="",qtypeee="",quess="",markreview="";
while(rs3.next()) 
{
	questio=rs3.getString(2);
	qqtype=rs3.getString(3);
	String sql10 = "Select Checkbox1,Checkbox2,Checkbox3,Checkbox4,Answer,Question_type,Question,Markreview from finalquiz where title=? and Subject_code=? and Question=? and Question_type=?";
	PreparedStatement pstm10 = con1.prepareStatement(sql10);
	pstm10.setString(1,title);
	pstm10.setString(2,subcode);
	pstm10.setString(3,questio);
	pstm10.setString(4,qqtype);
	ResultSet rs10 = pstm10.executeQuery();
	while(rs10.next()) 
	{
		c1=rs10.getString(1);
		c2=rs10.getString(2);
		c3=rs10.getString(3);
		c4=rs10.getString(4);
		an=rs10.getString(5);
		qtypeee=rs10.getString(6);
		quess=rs10.getString(7);
		markreview=rs10.getString(8);
	}
	if(qtypeee.equals("Multiple Choice")  && questio.equals(quess) && qtypeee.equals(qqtype))
	{
		// attempted and mark as review
	if(!c1.equals("N") || !c2.equals("N") || !c3.equals("N") || !c4.equals("N"))
	{
		if(markreview.equals("Y"))
		{
			int qno=rs3.getInt(1);
			double q=(double)qno;
			double pno=q/2;
			//		out.println(pno);
			double p2=Math.ceil(pno);
			int p3=(int)p2;
			%>
			<a style="text-decoration:none;color:white;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes5'><%=rs3.getInt(1)%></div></a>
		
		<%
		}
		else
		{
			int qno=rs3.getInt(1);
			double q=(double)qno;
			double pno=q/2;
			//out.println(pno);
			
			double p2=Math.ceil(pno);
			int p3=(int)p2;
			
			%>
			<a style="text-decoration:none;color:white;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes4'><%=rs3.getInt(1)%></div></a>
	
		<%}
}
		
	
	else if(c1.equals("N") && c2.equals("N") && c3.equals("N") && c4.equals("N"))
	{
		// not attempte and mark as reveiw
		if(markreview.equals("Y"))
		{
			int qno=rs3.getInt(1);
			double q=(double)qno;
			double pno=q/2;
			//		out.println(pno);
			double p2=Math.ceil(pno);
			int p3=(int)p2;
			%>
			<a style="text-decoration:none;color:white;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes5'><%=rs3.getInt(1)%></div></a>
		<%	}
		else
		{
			int qno=rs3.getInt(1);
		double q=(double)qno;
		double pno=q/2;
		//		out.println(pno);
		double p2=Math.ceil(pno);
		int p3=(int)p2;
		%>
		<a style="text-decoration:none;color:black;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes'><%=rs3.getInt(1)%></div></a>
	<%}
	}
	
}

	if(qtypeee.equals("Single Choice")  && questio.equals(quess) && qtypeee.equals(qqtype))
	{
	if(!an.equals(" ") && an!=null && !an.equals("N"))
	{
		if(markreview.equals("Y"))
		{
			int qno=rs3.getInt(1);
		double q=(double)qno;
		double pno=q/2;
		//		out.println(pno);
		double p2=Math.ceil(pno);
		int p3=(int)p2;
		%>
		<a style="text-decoration:none;color:white;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes5'><%=rs3.getInt(1)%></div></a>
	
	<%
	}
		else
		{
			int qno=rs3.getInt(1);
			double q=(double)qno;
			double pno=q/2;
			//		out.println(pno);
			double p2=Math.ceil(pno);
			int p3=(int)p2;
			%>
			<a style="text-decoration:none;color:white;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes4'><%=rs3.getInt(1)%></div></a>
		<%}	
		}
		
	
	else if(an.equals(" ") || an==null || an.equals("N"))
	{
		if(markreview.equals("Y"))
		{
			int qno=rs3.getInt(1);
		double q=(double)qno;
		double pno=q/2;
		//		out.println(pno);
		double p2=Math.ceil(pno);
		int p3=(int)p2;
		%>
		<a style="text-decoration:none;color:white;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes5'><%=rs3.getInt(1)%></div></a>

	<%}
		else
		{
			int qno=rs3.getInt(1);
		double q=(double)qno;
		double pno=q/2;
		//		out.println(pno);
		double p2=Math.ceil(pno);
		int p3=(int)p2;
		%>
		<a style="text-decoration:none;color:black;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes'><%=rs3.getInt(1)%></div></a>
	<%}
	}
	
	
}	
	if(qtypeee.equals("True or False")  && questio.equals(quess) && qtypeee.equals(qqtype))
	{
	if(!an.equals(" ") && an!=null && !an.equals("N"))
	{
		if(markreview.equals("Y"))
		{
			int qno=rs3.getInt(1);
			double q=(double)qno;
			double pno=q/2;
			//		out.println(pno);
			double p2=Math.ceil(pno);
			int p3=(int)p2;
			%>
			<a style="text-decoration:none;color:white;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes5'><%=rs3.getInt(1)%></div></a>
		<%}	
		else
		{
			int qno=rs3.getInt(1);
		double q=(double)qno;
		double pno=q/2;
		//		out.println(pno);
		double p2=Math.ceil(pno);
		int p3=(int)p2;
		%>
		<a style="text-decoration:none;color:white;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes4'><%=rs3.getInt(1)%></div></a>
	<%}
		
	}
	else if(an.equals(" ") || an==null || an.equals("N"))
	{
		if(markreview.equals("Y"))
		{
			int qno=rs3.getInt(1);
		double q=(double)qno;
		double pno=q/2;
		//		out.println(pno);
		double p2=Math.ceil(pno);
		int p3=(int)p2;
		%>
		<a style="text-decoration:none;color:white;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes5'><%=rs3.getInt(1)%></div></a>
	<%}
		else
		{
			int qno=rs3.getInt(1);
			double q=(double)qno;
			double pno=q/2;
			//		out.println(pno);
			double p2=Math.ceil(pno);
			int p3=(int)p2;
			%>
			<a style="text-decoration:none;color:black;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes'><%=rs3.getInt(1)%></div></a>
		<%}
	}
	
	
}	

	if(qtypeee.equals("One Word")  && questio.equals(quess) && qtypeee.equals(qqtype))
	{
		if(an.equals("") || an.equals("N"))
		{
			if(markreview.equals("Y"))
			{int qno=rs3.getInt(1);
			double q=(double)qno;
			double pno=q/2;
			//		out.println(pno);
			double p2=Math.ceil(pno);
			int p3=(int)p2;
			%>
			<a style="text-decoration:none;color:white;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes5'><%=rs3.getInt(1)%></div></a>
		<%}
			else
			{int qno=rs3.getInt(1);
			double q=(double)qno;
			double pno=q/2;
			//		out.println(pno);
			double p2=Math.ceil(pno);
			int p3=(int)p2;
			%>
			<a style="text-decoration:none;color:black;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes'><%=rs3.getInt(1)%></div></a>
		<%}
	}
		else if(!an.equals("") && !an.equals("N"))
		{
			if(markreview.equals("Y"))
			{
				int qno=rs3.getInt(1);
				double q=(double)qno;
				double pno=q/2;
				//		out.println(pno);
				double p2=Math.ceil(pno);
				int p3=(int)p2;
				%>
				<a style="text-decoration:none;color:white;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes5'><%=rs3.getInt(1)%></div></a>
			<%}
			else
			{int qno=rs3.getInt(1);
			double q=(double)qno;
			double pno=q/2;
			//		out.println(pno);
			double p2=Math.ceil(pno);
			int p3=(int)p2;
			%>
			<a style="text-decoration:none;color:white;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes4'><%=rs3.getInt(1)%></div></a>
		<%}
			
		}
	
	
}
	
	
	if(qtypeee.equals("Single Line")  && questio.equals(quess) && qtypeee.equals(qqtype))
	{
		
		if(an.equals("") || an.equals("N"))
		{
			if(markreview.equals("Y"))
			{
				int qno=rs3.getInt(1);
				double q=(double)qno;
				double pno=q/2;
				double p2=Math.ceil(pno);
				
				int p3=(int)p2;
				//out.println(p3);
				%>
				<a style="text-decoration:none;color:white;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes5'><%=rs3.getInt(1)%></div></a>
			<%}
				else
			{
					int qno=rs3.getInt(1);
					double q=(double)qno;
					double pno=q/2;
					double p2=Math.ceil(pno);
					int p3=(int)p2;
					
					%>
					<a style="text-decoration:none;color:black;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes'><%=rs3.getInt(1)%></div></a>
				<%}

	}
		else if(!an.equals("") && !an.equals("N"))
		{
			if(markreview.equals("Y"))
			{int qno=rs3.getInt(1);
			double q=(double)qno;
			double pno=q/2;
			//		out.println(pno);
			double p2=Math.ceil(pno);
			int p3=(int)p2;
			%>
			<a style="text-decoration:none;color:white;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes5'><%=rs3.getInt(1)%></div></a>
		<%}
			else
			{int qno=rs3.getInt(1);
			double q=(double)qno;
			double pno=q/2;
			//		out.println(pno);
			double p2=Math.ceil(pno);
			int p3=(int)p2;
			%>
			<a style="text-decoration:none;color:white;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes4'><%=rs3.getInt(1)%></div></a>
		<%}
			
		}
	
	
}	
	if(qtypeee.equals("Descriptive")  && questio.equals(quess) && qtypeee.equals(qqtype))
	{
		if(an.equals("") || an.equals("N"))
		{
			if(markreview.equals("Y"))
			{
				int qno=rs3.getInt(1);
				double q=(double)qno;
				double pno=q/2;
				//out.println(pno);
				double p2=Math.ceil(pno);
				int p3=(int)p2;
				%>
				<a style="text-decoration:none;color:white;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes5'><%=rs3.getInt(1)%></div></a>
			<%}
				else
			{
					int qno=rs3.getInt(1);
					double q=(double)qno;
					double pno=q/2;
					//out.println(pno);
					double p2=Math.ceil(pno);
					int p3=(int)p2;
					%>
					<a style="text-decoration:none;color:black;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes'><%=rs3.getInt(1)%></div></a>
				<%}
				
	}
		else if(!an.equals("") && !an.equals("N"))
		{
			if(markreview.equals("Y"))
			{int qno=rs3.getInt(1);
			double q=(double)qno;
			double pno=q/2;
			//		out.println(pno);
			double p2=Math.ceil(pno);
			int p3=(int)p2;
			%>
			<a style="text-decoration:none;color:white;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes5'><%=rs3.getInt(1)%></div></a>
		<%}
			else
			{int qno=rs3.getInt(1);
			double q=(double)qno;
			double pno=q/2;
			//		out.println(pno);
			double p2=Math.ceil(pno);
			int p3=(int)p2;
			%>
			<a style="text-decoration:none;color:white;"href="finalexam.jsp?id=<%=qid%>&page=<%=p3%>&cnt=<%=count2%>"><div id='question-no-boxes4'><%=rs3.getInt(1)%></div></a>
		<%}
			
		}
	
	
}
	
}
%>

</div>

<div id='question-no-boxes1'>Attempted</div>
<div id='question-no-boxes2'>Mark as review</div>
<div id='question-no-boxes3'>Not Attempted</div>

</div>
<script>
$(function(){
$('[rel=popover]').popover({
html:true,
content:function(){	
	return $('#popover_content_wrapper').html();
	}
	});
});


</script>

<div id="questions-display">
<%
String subject3=(String)session.getAttribute("studsubject1");

if(spageid!=null)
{	
	spageid=request.getParameter("page");
}
else
{
	spageid=String.valueOf(1);

}
if(cnt!=null)
{	
	cnt=request.getParameter("cnt");
}
else
{
	cnt=String.valueOf(0);

}


int pageid=Integer.parseInt(spageid);
int pageno=pageid;
//out.println(pageid);
int total=2;  
if(pageid==1){}  
else{  
    pageid=pageid-1;  
    pageid=pageid*(int)total+1;  
}  
//System.out.println(pageid);
String qtype="",quest="",op1="",op2="",op3="",op4="",correct="",random="";
int marks;
int cntt=1;
int cnttt=1;
int qno=0;
String sid;

String cntdata="Select count(Id) from quiz_questions where title=? and Subject_code=?";
PreparedStatement ps8=con1.prepareStatement(cntdata);
ps8.setString(1,title);
ps8.setString(2,subject3);
ResultSet rs8=ps8.executeQuery();
double totalrow=0;
while(rs8.next()){
totalrow = rs8.getInt(1);
//out.println(totalrow);

//out.println("<div id='dis-row'>" +totalrow+"</div>");
}


String qstn="Select Question_type,Question,Option1,Option2,Option3,Option4,correct_ans,Marks,Id,Question_no from quiz_questions where title=? and Subject_code=? limit "+(pageid-1)+","+total;
PreparedStatement ps7=con1.prepareStatement(qstn);
ps7.setString(1,title);
ps7.setString(2,subject3);
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
	
	//out.println(qtype);
	  String qstn1="Select Checkbox1,Checkbox2,Checkbox3,Checkbox4,Answer,Markreview from finalquiz where title=? and Subject_code=? and Question=? and Question_type=? and Userid=?";
		  PreparedStatement ps9=con1.prepareStatement(qstn1);
		  String checkbox1="",checkbox2="",checkbox3="",checkbox4="",answer="",mkreview="";
		  ps9.setString(1,title);
		  ps9.setString(2,subject);
		  ps9.setString(3,quest);
		  ps9.setString(4,qtype);
		  ps9.setString(5,(String)session.getAttribute("sessuid"));
		  ResultSet rs9=ps9.executeQuery();
		  while(rs9.next())
		  {
			  checkbox1=rs9.getString("Checkbox1");
			  checkbox2=rs9.getString("Checkbox2");
			  checkbox3=rs9.getString("Checkbox3");
			  checkbox4=rs9.getString("Checkbox4");
			  answer=rs9.getString("Answer");
			  mkreview=rs9.getString("Markreview");
		 
	%>
	<div id="questions-set" style="border:1px solid lightgrey;margin-left:20px;margin-right:10px;margin-top:20px;width:1140px;display:inline-block;color:black;">
	<div style="margin-left:10px;margin-top:15px;display:inline-block;"><%=sid%></div><div style="margin-left:10px;width:500px;display:inline-block;word-wrap:break-word;"><%=quest%></div><div style="float:right;margin-top:15px;margin-right:10px;display:inline-block;">Marks <%=marks%></div>
   
   <%
   if(qtype.equals("Multiple Choice"))
   {
	 
		%>

<%
if(!checkbox1.equals("N"))
{

	String empty="N";
%>
<br><span style="margin-left:45px"><input type="checkbox" id="check1" name="check1" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&type=check1&check1=<%=empty%>');"value="<%=op1 %>"checked>
	   <label for="check1"><%=op1 %></label></span>	 
<%
} 

else if(checkbox1.equals("N"))
{
%>
<br><span style="margin-left:45px"><input type="checkbox" id="check1" name="check1" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&check1=<%=op1 %>&type=check1');"value="<%=op1 %>">
	   <label for="check1"><%=op1 %></label></span>	  
<%
} 
%>

<%
if(!checkbox2.equals("N"))
{
	String empty="N";
%>
  
	    <br><span style="margin-left:45px"><input type="checkbox" id="check2" name="check2"  onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&check2=<%=empty%>&type=check2');"value="<%=op2 %>"checked>
	   <label for="check2"><%=op2 %></label></span> 
	   
<%
} 
else if(checkbox2.equals("N"))
{
%>

	    <br><span style="margin-left:45px"><input type="checkbox" id="check2" name="check2"  onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&check2=<%=op2 %>&type=check2');"value="<%=op2 %>">
	   <label for="check2"><%=op2 %></label></span> 
	   
<%
} 
%>

<%
if(!checkbox3.equals("N"))
{
	String empty="N";
%>

	   <br><span style="margin-left:45px"><input type="checkbox" id="check3" name="check3"  onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&check3=<%=empty%>&type=check3');"value="<%=op3 %>"checked>
	   <label for="check3"><%=op3 %></label></span>
	   
<%
} 
else if(checkbox3.equals("N"))
{
%>

	   <br><span style="margin-left:45px"><input type="checkbox" id="check3" name="check3"  onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&check3=<%=op3 %>&type=check3');"value="<%=op3 %>">
	   <label for="check3"><%=op3 %></label></span>
	   
<%
} 
%>	

<%
if(!checkbox4.equals("N"))
{
	String empty="N";
%>

	   <br><span style="margin-left:45px"><input type="checkbox" id="check4" name="check4"  onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&check4=<%=empty%>&type=check4');"value="<%=op4 %>"checked>
	   <label for="check4"><%=op4 %></label></span>
<%
}
	else if(checkbox4.equals("N"))
{
%>
	   <br><span style="margin-left:45px"><input type="checkbox" id="check4" name="check4"  onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&check4=<%=op4 %>&type=check4');"value="<%=op4 %>">
	   <label for="check4"><%=op4 %></label></span>
<%
} 
%>		 



	   <div style="border-top:0px solid lightgrey;">
	   <span style="float:right;margin-right:10px;">
	   <%
	   if(mkreview.equals("N"))
	   {
	   %>
	   <a style="text-decoration:none;color:black;"href="quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&type=mult"><button style="outline:none;border:1px solid black;"type="submit"name="review"><i class="fa fa-star" aria-hidden="true"></i> Mark as Review</button></a> 
	   <%
	   }
	    else if(mkreview.equals("Y"))
	   {
	   %>
	   <a style="text-decoration:none;color:black;"href="quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&type=mult1"><button style="outline:none;border:1px solid black;"type="submit"name="review"><i class="fa fa-minus" aria-hidden="true"></i> Remove from Review</button></a> 
	   <%
	   }
	   %>
	   
	   </span>
	   </div><br><div style="height:20px"></div>
	   <%
		
   }
   %>
   <%
   if(qtype.equals("Single Choice"))
   {
	  %>
	 
<% 
if(cntt==1)
{
	  if(op1.equals(answer))
{
%>
<br><span style="margin-left:45px"><input type="radio" id="radio1" name="singlechoice1" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&singlechoice1=<%=op1 %>&type=singlechoice4');"value="<%=op1 %>"checked>
        <label for="radio1"><%=op1 %></label></span>
<%		  
}
else if(!op1.equals(answer))
{
%>
<br><span style="margin-left:45px"><input type="radio" id="radio1" name="singlechoice1" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&singlechoice1=<%=op1 %>&type=singlechoice4');"value="<%=op1 %>">
        <label for="radio1"><%=op1 %></label></span>
<%		  
}
%>

<% 
	  if(op2.equals(answer))
{
%>
 <br><span style="margin-left:45px"><input type="radio" id="radio2" name="singlechoice1" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&singlechoice1=<%=op2 %>&type=singlechoice4');"value="<%=op2 %>"checked>
        <label for="radio2"><%=op2 %></label></span>
<%		  
}
else if(!op2.equals(answer))
{
%>
 <br><span style="margin-left:45px"><input type="radio" id="radio2" name="singlechoice1" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&singlechoice1=<%=op2 %>&type=singlechoice4');"value="<%=op2 %>">
        <label for="radio2"><%=op2 %></label></span>
<%		  
}
%>

<% 
	  if(op3.equals(answer))
{
%>
  <br><span style="margin-left:45px"><input type="radio" id="radio3" name="singlechoice1" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&singlechoice1=<%=op3 %>&type=singlechoice4');"value="<%=op3 %>"checked>
        <label for="radio3"><%=op3 %></label></span>
<%		  
}
else if(!op3.equals(answer))
{
%>
 <br><span style="margin-left:45px"><input type="radio" id="radio3" name="singlechoice1" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&singlechoice1=<%=op3 %>&type=singlechoice4');"value="<%=op3 %>">
        <label for="radio3"><%=op3 %></label></span>
<%		  
}
%>
<% 
	  if(op4.equals(answer))
{
%>
  
        <br><span style="margin-left:45px"><input type="radio" id="radio4" name="singlechoice1" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&singlechoice1=<%=op4 %>&type=singlechoice4');"value="<%=op4 %>"checked>
        <label for="radio4"><%=op4 %></label></span>
<%		  
}
else if(!op4.equals(answer))
{
%>
   
<br><span style="margin-left:45px"><input type="radio" id="radio4" name="singlechoice1" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&singlechoice1=<%=op4 %>&type=singlechoice4');"value="<%=op4 %>">
        <label for="radio4"><%=op4 %></label></span>
       
<%		  
}
}

else if(cntt==2)
{
	
	  if(op1.equals(answer))
{
%>
<br><span style="margin-left:45px"><input type="radio" id="radio1" name="singlechoice2" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&singlechoice2=<%=op1 %>&type=singlechoice');"value="<%=op1 %>"checked>
        <label for="radio1"><%=op1 %></label></span>
<%		  
}
else if(!op1.equals(answer))
{
%>
<br><span style="margin-left:45px"><input type="radio" id="radio1" name="singlechoice2" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&singlechoice2=<%=op1 %>&type=singlechoice');"value="<%=op1 %>">
        <label for="radio1"><%=op1 %></label></span>
<%		  
}
%>

<% 
	  if(op2.equals(answer))
{
%>
 <br><span style="margin-left:45px"><input type="radio" id="radio2" name="singlechoice2" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&singlechoice2=<%=op2 %>&type=singlechoice');"value="<%=op2 %>"checked>
        <label for="radio2"><%=op2 %></label></span>
<%		  
}
else if(!op2.equals(answer))
{
%>
 <br><span style="margin-left:45px"><input type="radio" id="radio2" name="singlechoice2" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&singlechoice2=<%=op2 %>&type=singlechoice');"value="<%=op2 %>">
        <label for="radio2"><%=op2 %></label></span>
<%		  
}
%>

<% 
	  if(op3.equals(answer))
{
%>
  <br><span style="margin-left:45px"><input type="radio" id="radio3" name="singlechoice2" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&singlechoice2=<%=op3 %>&type=singlechoice');"value="<%=op3 %>"checked>
        <label for="radio3"><%=op3 %></label></span>
<%		  
}
else if(!op3.equals(answer))
{
%>
 <br><span style="margin-left:45px"><input type="radio" id="radio3" name="singlechoice2" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&singlechoice2=<%=op3 %>&type=singlechoice');"value="<%=op3 %>">
        <label for="radio3"><%=op3 %></label></span>
<%		  
}
%>
<% 
	  if(op4.equals(answer))
{
%>
  
        <br><span style="margin-left:45px"><input type="radio" id="radio4" name="singlechoice2" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&singlechoice2=<%=op4 %>&type=singlechoice');"value="<%=op4 %>"checked>
        <label for="radio4"><%=op4 %></label></span>
<%		  
}
else if(!op4.equals(answer))
{
%>
   
<br><span style="margin-left:45px"><input type="radio" id="radio4" name="singlechoice2" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&singlechoice2=<%=op4 %>&type=singlechoice');"value="<%=op4 %>">
        <label for="radio4"><%=op4 %></label></span>
        
<%		  
}
cntt--;
}

cntt++;
%>
     
	   <div style="border-top:0px solid lightgrey;">
	   <span style="float:right;margin-right:10px;">
	   
	   <%
	   if(mkreview.equals("N"))
	   {
	   %>
	   <a style="text-decoration:none;color:black;"href="quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&type=sincho"><button style="outline:none;border:1px solid black;"type="submit"name="review"><i class="fa fa-star" aria-hidden="true"></i> Mark as Review</button></a>
	   <%
	   }
	    else if(mkreview.equals("Y"))
	   {
	   %>
	   <a style="text-decoration:none;color:black;"href="quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&type=sincho1"><button style="outline:none;border:1px solid black;"type="submit"name="review"><i class="fa fa-minus" aria-hidden="true"></i> Remove from Review</button></a>
	   <%
	   }
	   %>
	   
	 </span>
	   </div><br><div style="height:20px"></div>
	   <%
   }
   %>
     <%
   if(qtype.equals("True or False"))
   {
	  %>
	  <%
	  if(cnttt==1)
	  {
	  
	  if(answer.equals("True"))
	  {
	  %>
	   <br><span style="margin-left:45px"><input type="radio" id="radio5" name="truefalse1" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&truefalse1=True&type=truefalse');"value="True"checked>
        <label for="radio5">True</label></span>
        <%
 }
 	  else if(!answer.equals("True"))
	  {
	  %>
	   <br><span style="margin-left:45px"><input type="radio" id="radio5" name="truefalse1" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&truefalse1=True&type=truefalse');"value="True">
        <label for="radio5">True</label></span>
        <%
 }
 %>    
 
 	  <%
	  if(answer.equals("False"))
	  {
	  %>
	     <br><span style="margin-left:45px"><input type="radio" id="radio6" name="truefalse1" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&truefalse1=False&type=truefalse');"value="False"checked>
        <label for="radio6">False</label></span>
        <%
 }
 	  else if(!answer.equals("False"))
	  {
	  %>
	     <br><span style="margin-left:45px"><input type="radio" id="radio6" name="truefalse1" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&truefalse1=False&type=truefalse');"value="False">
        <label for="radio6">False</label></span>
        <%
 }
	  }
 else if(cnttt==2)
	  {
	  
	  if(answer.equals("True"))
	  {
	  %>
	   <br><span style="margin-left:45px"><input type="radio" id="radio5" name="truefalse2" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&truefalse2=True&type=truefalse4');"value="True"checked>
        <label for="radio5">True</label></span>
        <%
 }
 	  else if(!answer.equals("True"))
	  {
	  %>
	   <br><span style="margin-left:45px"><input type="radio" id="radio5" name="truefalse2" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&truefalse2=True&type=truefalse4');"value="True">
        <label for="radio5">True</label></span>
        <%
 }
 %>    
 
 	  <%
	  if(answer.equals("False"))
	  {
	  %>
	     <br><span style="margin-left:45px"><input type="radio" id="radio6" name="truefalse2" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&truefalse2=False&type=truefalse4');"value="False"checked>
        <label for="radio6">False</label></span>
        <%
 }
 	  else if(!answer.equals("False"))
	  {
	  %>
	     <br><span style="margin-left:45px"><input type="radio" id="radio6" name="truefalse2" onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&truefalse2=False&type=truefalse4');"value="False">
        <label for="radio6">False</label></span>
        <%
        
 }
 	  cnttt--;
	  }
	  cnttt++;
 %>  
 
 
  
	       <div style="border-top:0px solid lightgrey;">
	   <span style="float:right;margin-right:10px;">
	   
	   <%
	   if(mkreview.equals("N"))
	   {
	   %>
	   <a style="text-decoration:none;color:black;"href="quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&type=trufal"><button style="outline:none;border:1px solid black;"type="submit"name="review"><i class="fa fa-star" aria-hidden="true"></i> Mark as Review</button></a>
	   <%
	   }
	    else if(mkreview.equals("Y"))
	   {
	   %>
	   <a style="text-decoration:none;color:black;"href="quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&type=trufal1"><button style="outline:none;border:1px solid black;"type="submit"name="review"><i class="fa fa-minus" aria-hidden="true"></i> Remove from Review</button></a>
	   <%
	   }
	   %>
	  
	   </span>
	   </div><br><div style="height:20px"></div>
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
		   
	     <br><input type="text" id="oneword" name="oneword"onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&type=oneword&oneword='+this.value);" placeholder="Write One Word Answer" value="<%=answer%>">
	    <%
	    }
	   else if(answer.equals("N"))
	   {
		   String N="N";
		   %>
		   
	      <br><input type="text" id="oneword" name="oneword"onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&type=oneword&oneword='+this.value);" placeholder="Write One Word Answer" value="">
	    <%
	    }
	     %>

        <div style="border-top:0px solid lightgrey;">
	   <span style="float:right;margin-right:10px;">
	   
	     <%
	   if(mkreview.equals("N"))
	   {
	   %>
	   <a style="text-decoration:none;color:black;"href="quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&type=onew"><button style="outline:none;border:1px solid black;"type="submit"name="review"><i class="fa fa-star" aria-hidden="true"></i> Mark as Review</button></a>
	   <%
	   }
	    else if(mkreview.equals("Y"))
	   {
	   %>
	   <a style="text-decoration:none;color:black;"href="quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&type=onew1"><button style="outline:none;border:1px solid black;"type="submit"name="review"><i class="fa fa-minus" aria-hidden="true"></i> Remove from Review</button></a>
	   <%
	   }
	   %>
	  
	   </span>
	   </div><br><div style="height:20px"></div>
	  
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
		   
	       <br><input type="text" id="oneword1" name="singleline"onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&type=singleline&singleline='+this.value);"placeholder="Write Single Line Answer"value="<%=answer%>">
	    <%
	    }
	   else if(answer.equals("N"))
	   {
		   String N="N";
		   %>
		   
	       <br><input type="text" id="oneword1" name="singleline"onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&type=singleline&singleline='+this.value);"placeholder="Write Single Line Answer"value="">
	    <%
	    }
	     %>

        <div style="border-top:0px solid lightgrey;">
	   <span style="float:right;margin-right:10px;">
	        <%
	   if(mkreview.equals("N"))
	   {
	   %>
	   <a style="text-decoration:none;color:black;"href="quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&type=singline"><button style="outline:none;border:1px solid black;"type="submit"name="review"><i class="fa fa-star" aria-hidden="true"></i> Mark as Review</button></a>
	   <%
	   }
	    else if(mkreview.equals("Y"))
	   {
	   %>
	   <a style="text-decoration:none;color:black;"href="quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&type=singline1"><button style="outline:none;border:1px solid black;"type="submit"name="review"><i class="fa fa-minus" aria-hidden="true"></i> Remove from Review</button></a>
	   <%
	   }
	   %>
	   
	   </span>
	   </div><br><div style="height:20px"></div>
	  
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
		   
	       <br><textarea id="description"name="description"onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&type=descriptive&descriptive='+this.value);"placeholder="Write Answer in Brief"><%=answer %></textarea>
	    <%
	    }
	   else if(answer.equals("N"))
	   {
		   String N="N";
		   %>
		   
	       <br><textarea id="description"name="description"onchange="window.location.replace('quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&type=descriptive&descriptive='+this.value);"placeholder="Write Answer in Brief"></textarea>
	    <%
	    }
	     %>

        <div style="border-top:0px solid lightgrey;">
	   <span style="float:right;margin-right:10px;">
	           <%
	   if(mkreview.equals("N"))
	   {
	   %>
	   <a style="text-decoration:none;color:black;"href="quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&type=descr"><button style="outline:none;border:1px solid black;"type="submit"name="review"><i class="fa fa-star" aria-hidden="true"></i> Mark as Review</button></a>
	   <%
	   }
	    else if(mkreview.equals("Y"))
	   {
	   %>
	   <a style="text-decoration:none;color:black;"href="quizanswer.jsp?id=<%=qid%>&page=<%=pageno%>&count=<%=count3%>&question=<%=quest%>&qtype=<%=qtype%>&type=descr1"><button style="outline:none;border:1px solid black;"type="submit"name="review"><i class="fa fa-minus" aria-hidden="true"></i> Remove from Review</button></a>
	   <%
	   }
	   %>
	   
	   </span>
	   </div><br><div style="height:20px"></div>
	  
	   <%
   }
   %>
   
      </div>
   
   
   <% 
		  } 
}
%>

	      <span style="margin-left:125px;">
	      <br>
 <% int i;
//out.println(total);
//out.println(totalrow);
//out.println(total);
double p=totalrow/total;
//out.println(p);
Double pages=Math.ceil(p);
//out.println(pages);
int temp=pageno;

if(pageno==1 && pages==pageno)
{
	//pageid=pageid+1;
			
		 %>
		 <a class="btn btn-warning btn-lg"href="submitquiz.jsp?id=<%=qid%>">Finish</a>
		 
		 <% 
	}
else if(pageno==1)
{
	//pageid=pageid+1;
	 %>
	 <a style="margin-left:20px;"class="btn btn-primary btn-lg"href="finalexam.jsp?id=<%=qid%>&page=<%=pageno+1%>&cnt=<%=count2%>">Next</a>
		 <% 
}

	else if(pageno>1 && pages!=pageno)
	{
		//out.println("pageid"+pageno);
		
		//pageno=pageno-1;
		temp=pageno-1;
		//out.println("prev temp: "+temp);
		//out.println("cur pageid"+pageno);
		%>
		<a style="margin-left:20px;"class="btn btn-primary btn-lg"href="finalexam.jsp?id=<%=qid%>&page=<%=temp%>&cnt=<%=count2%>">Previous</a>
		<a class="btn btn-primary btn-lg"href="finalexam.jsp?id=<%=qid%>&page=<%=pageno+1%>&cnt=<%=count2%>">Next</a>
	<% 
	//out.println(" pageid"+pageno);
	
	}
	else if(pages==pageno)
	{
		temp=pageno-1;
		
		%>
		<a style="margin-left:20px;"class="btn btn-primary btn-lg" href="finalexam.jsp?id=<%=qid%>&page=<%=temp%>&cnt=<%=count2%>">Previous</a>
		
		<a class="btn btn-warning btn-lg" href="submitquiz.jsp?id=<%=qid%>">Finish</a>
		
		<%
	}
%>  

  
 </span>
          
</div>
<div style="background:lightgrey;height:70px;width:100%;">

</div>

<script>
// Set the date we're counting down to
var countDownDate = new Date("<%=apdate %>").getTime();

// Update the count down every 1 second
var x = setInterval(function() {

  // Get today's date and time
  var now = new Date().getTime();
    
  // Find the distance between now and the count down date
  var distance = countDownDate - now;
     // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
  // Output the result in an element with id="demo"
  if(hours==0)
	  {
	  
	  document.getElementById("demo").innerHTML = minutes + "m " + seconds + "s ";
	  if(minutes<5)
	  {
	  document.getElementById("demo").style.color="red";
	  }
	     
	  }
 
  else
	  {
	  document.getElementById("demo").innerHTML = hours + "h "
	  + minutes + "m " + seconds + "s ";
	   
	  }
  
    
  // If the count down is over, write some text 
  if (distance < 0) {
    clearInterval(x);
    //document.getElementById("demo").innerHTML = "EXPIRED";
    window.location.replace("submitquiz.jsp?id=<%=qid%>"); 
  }
}, 1000);
</script>
<%
try
{
	//con.close(); 
	con1.close();
}
catch(Exception e)
{
	out.println(e.getMessage());
}
%>



</body>
</html>