<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.text.DateFormat,java.text.*,java.util.Calendar,java.util.Arrays" %>
 
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
  <title>Quiz Result</title>
</head>
<body>
<%
try
{
double marksum=0.0,marksum1=0.0,marksum2=0.0,marksum3=0.0,marksum4=0.0;
double markstotal=0.0;
String collegename=(String)session.getAttribute("colcode");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
DateFormat dateFormat = new SimpleDateFormat("hh:mm aa");
String dateString = dateFormat.format(new Date()).toString(); 
String subject=(String)session.getAttribute("studsubject1");
String subject2=(String)session.getAttribute("subjectname");
int qid=Integer.parseInt(request.getParameter("id"));
String sql = "Select title from quiz_info where Id=?";
PreparedStatement pstm = con1.prepareStatement(sql);
pstm.setInt(1,qid);
String title="";

ResultSet rs = pstm.executeQuery();

while(rs.next()) 
{
	 
	 title=rs.getString("title");
}
PreparedStatement ps=con1.prepareStatement("Update quizresult set Submitted_time=? Where title=? and Userid=? and Subject_code=?");
ps.setString(1,dateString);
  ps.setString(2,title);
  ps.setString(3,(String)session.getAttribute("sessuid"));
  ps.setString(4,subject);
  
  int row=ps.executeUpdate();
  
  
 
  String sql1 = "Select Question,Question_type,Option1,Option2,Option3,Option4,correct_ans,Marks from quiz_questions where title=? and Subject_code=?";
  PreparedStatement pstm1 = con1.prepareStatement(sql1);
  pstm1.setString(1,title);
  pstm1.setString(2,subject);
  String question="",qtype="",op1="",op2="",op3="",op4="",corans="";
  int marks=0;
int count=0;
  ResultSet rs1 = pstm1.executeQuery();
  String[] s={};
  while(rs1.next()) 
  {
  	 
	  question=rs1.getString(1);
			  qtype=rs1.getString(2);
			  op1=rs1.getString(3);
			  op2=rs1.getString(4);
			  op3=rs1.getString(5);
			  op4=rs1.getString(6);
			  corans=rs1.getString(7);
			  marks=rs1.getInt(8);
			  if(qtype.equals("Multiple Choice"))
			  {
				  s=corans.split(",");
				 // out.println(Arrays.toString(s));
count=s.length;

			  }
  
// out.println(s[0]);
 //out.println(s[1]);
// out.println(s[2]);
// out.println(s[3]);
			  String sql2 = "Select Question,Question_type,Checkbox1,Checkbox2,Checkbox3,Checkbox4,Answer from finalquiz where title=? and Subject_code=? and Question=? and Question_type=? and Userid=?";
			  PreparedStatement pstm2 = con1.prepareStatement(sql2);
			  pstm2.setString(1,title);
			  pstm2.setString(2,subject);
			  pstm2.setString(3,question);
			  pstm2.setString(4,qtype);
			  pstm2.setString(5,(String)session.getAttribute("sessuid"));
			  String questio="",qtyp="",check1="",check2="",check3="",check4="",ans="";
              ResultSet rs2 = pstm2.executeQuery();
              if(rs2.next())
              {
            	  questio=rs2.getString("Question");
            			  qtyp=rs2.getString("Question_type");
            			  check1=rs2.getString("Checkbox1");
            			  check2=rs2.getString("Checkbox2");
            			  check3=rs2.getString("Checkbox3");
            			  check4=rs2.getString("Checkbox4");
            			  ans=rs2.getString("Answer");
            			  
            			  if(qtyp.equals("Multiple Choice") && qtyp.equals(qtype) && question.equals(questio))
            			  {
            				
            				  
            				  if(count==4)
               				  {
               				
               					  marksum=(double)marks/4;
               				  if(check1.equals(s[0]) || check1.equals(s[1]) || check1.equals(s[2]) || check1.equals(s[3]))
               				  { 
               					  marksum1=marksum;
               				  }
               				  if(check2.equals(s[0]) || check2.equals(s[1]) || check2.equals(s[2]) || check2.equals(s[3]))
               				  { 
               					  marksum2=marksum;
               				  }
               				  if(check3.equals(s[0]) || check3.equals(s[1]) || check3.equals(s[2]) || check3.equals(s[3]))
               				  { 
               					  marksum3=marksum;
               				  }
               				  if(check4.equals(s[0]) || check4.equals(s[1]) || check4.equals(s[2]) || check4.equals(s[3]))
               				  { 
               					  marksum4=marksum;
               				  }
               				 markstotal=marksum1+marksum2+marksum3+marksum4;
               				 }
            				  
            				   if(count==3)
            				  {
            					  
                				  
            					  marksum=(double)marks/3;
            				  if(check1.equals(s[0]) || check1.equals(s[1]) || check1.equals(s[2]))
            				  { 
            					  marksum1=marksum;
            				  }
            				  if(check2.equals(s[0]) || check2.equals(s[1]) || check2.equals(s[2]))
            				  { 
            					  marksum2=marksum;
            				  }
            				  if(check3.equals(s[0]) || check3.equals(s[1]) || check3.equals(s[2]))
            				  { 
            					  marksum3=marksum;
            				  }
            				  if(check4.equals(s[0]) || check4.equals(s[1]) || check4.equals(s[2]))
            				  { 
            					  marksum4=marksum;
            				  }
            				  markstotal=marksum1+marksum2+marksum3+marksum4;
            				 }
            				   if(count==2)
              				  {
              					 
              					  marksum=(double)marks/2;
              					 
              				if(check1.equals(s[0]) || check1.equals(s[1]))
              				  { 
              					  marksum1=marksum;
              					  
              				  }
              				  if(check2.equals(s[0]) || check2.equals(s[1]))
              				  { 
              					  marksum2=marksum;
              					out.println(marksum2);
              				  }
              				  if(check3.equals(s[0]) || check3.equals(s[1]))
              				  { 
              					  marksum3=marksum;
              				  }
              				  if(check4.equals(s[0]) || check4.equals(s[1]))
              				  { 
              					  marksum4=marksum;
              					
              				  }
              				  markstotal=marksum1+marksum2+marksum3+marksum4;
              			
              				 }
                  			
            		  
            				   if(count==1)
            				  {
            					  marksum=(double)marks/1;
   //         					  out.println(marksum);
            				  if(check1.equals(s[0]))
            				  { 
            					  marksum1=marksum;
            					  
            					  
            				  }
            				  if(check2.equals(s[0]))
            				  { 
            					  marksum2=marksum;
            				  }
            				  if(check3.equals(s[0]))
            				  { 
            					  marksum3=marksum;
            				  }
            				  if(check4.equals(s[0]))
            				  { 
            					  marksum4=marksum;
            				  }
            				  markstotal=marksum1+marksum2+marksum3+marksum4;
            				  
            				 }
              				 
            				  int totalmarks=(int)(markstotal);
            				  
            				  PreparedStatement ps1=con1.prepareStatement("Update finalquiz set Marks=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
            					 ps1.setInt(1,totalmarks);
            					   ps1.setString(2,title);
            					   ps1.setString(3,(String)session.getAttribute("sessuid"));
            					   ps1.setString(4,subject);
            					   ps1.setString(5,question);
            					   ps1.setString(6,qtype);
            					   int row1=ps1.executeUpdate();
            				  
            			  }
            			  
            			  if(qtyp.equals("Single Choice") && qtyp.equals(qtype) && question.equals(questio))
            				 {
            				  if(ans.equals(corans))
            				  {
            					  PreparedStatement ps1=con1.prepareStatement("Update finalquiz set Marks=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
             					 ps1.setInt(1,marks);
             					   ps1.setString(2,title);
             					   ps1.setString(3,(String)session.getAttribute("sessuid"));
             					   ps1.setString(4,subject);
             					   ps1.setString(5,question);
             					   ps1.setString(6,qtype);
             					   int row1=ps1.executeUpdate();
            				  }
            				  else
             				  {
             					  int mk=0;
             					  PreparedStatement ps1=con1.prepareStatement("Update finalquiz set Marks=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
               					 ps1.setInt(1,mk);
               					   ps1.setString(2,title);
               					   ps1.setString(3,(String)session.getAttribute("sessuid"));
               					   ps1.setString(4,subject);
               					   ps1.setString(5,question);
               					   ps1.setString(6,qtype);
               					   int row1=ps1.executeUpdate();
             				  }
            				 }
            			  if(qtyp.equals("True or False") && qtyp.equals(qtype) && question.equals(questio))
         				 {
            				  
         				  if(ans.equals(corans))
         				  {
         					  
         					  PreparedStatement ps1=con1.prepareStatement("Update finalquiz set Marks=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
          					 ps1.setInt(1,marks);
          					   ps1.setString(2,title);
          					   ps1.setString(3,(String)session.getAttribute("sessuid"));
          					   ps1.setString(4,subject);
          					   ps1.setString(5,question);
          					   ps1.setString(6,qtype);
          					   int row1=ps1.executeUpdate();
         				  }
         				  else
         				  {
         					  int mk=0;
         					  PreparedStatement ps1=con1.prepareStatement("Update finalquiz set Marks=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
           					 ps1.setInt(1,mk);
           					   ps1.setString(2,title);
           					   ps1.setString(3,(String)session.getAttribute("sessuid"));
           					   ps1.setString(4,subject);
           					   ps1.setString(5,question);
           					   ps1.setString(6,qtype);
           					   int row1=ps1.executeUpdate();
         				  }
         				 }
            			  if(qtyp.equals("One Word") && qtyp.equals(qtype) && question.equals(questio))
         				 {
         				  if(ans.equals(corans))
         				  {
         					  PreparedStatement ps1=con1.prepareStatement("Update finalquiz set Marks=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
          					 ps1.setInt(1,marks);
          					   ps1.setString(2,title);
          					   ps1.setString(3,(String)session.getAttribute("sessuid"));
          					   ps1.setString(4,subject);
          					   ps1.setString(5,question);
          					   ps1.setString(6,qtype);
          					   int row1=ps1.executeUpdate();
         				  }
         				  else
         				  {
         					  int mk=0;
         					  PreparedStatement ps1=con1.prepareStatement("Update finalquiz set Marks=? Where title=? and Userid=? and Subject_code=? and Question=? and Question_type=?");
           					 ps1.setInt(1,mk);
           					   ps1.setString(2,title);
           					   ps1.setString(3,(String)session.getAttribute("sessuid"));
           					   ps1.setString(4,subject);
           					   ps1.setString(5,question);
           					   ps1.setString(6,qtype);
           					   int row1=ps1.executeUpdate();
         				  }
         				 }
            		
              }
              
		
}
  String sql4 = "Select sum(Marks) from finalquiz where title=? and Subject_code=? and Userid=?";
  PreparedStatement pstm4 = con1.prepareStatement(sql4);
  pstm4.setString(1,title);
  pstm4.setString(2,subject);
  pstm4.setString(3,(String)session.getAttribute("sessuid"));
  int sum=0;
  ResultSet rs4 = pstm4.executeQuery();
  if(rs4.next())
  {
	  sum=rs4.getInt(1);
  }
  int quizstatus=1;
  PreparedStatement ps3=con1.prepareStatement("Update quizresult set TotalMarks=?,Status=? Where title=? and Userid=? and Subject_code=?");
	 ps3.setInt(1,sum);
	 ps3.setInt(2,quizstatus);
	   ps3.setString(3,title);
	   ps3.setString(4,(String)session.getAttribute("sessuid"));
	   ps3.setString(5,subject);
	     int row3=ps3.executeUpdate();
  
  con1.close();
}
catch(Exception e)
{
	out.println(e.getMessage());
}
%>
<div style="height:200px;"></div>
<center><div style="border:1px solid black;width:800px;height:200px;">
<div style="margin-top:60px;font-size:25px;"><b>Your Quiz Submitted Successfully</b></div>
<a href="StudentSubjectQuiz.jsp"><button style="background:#2471A3;outline:none;border:none;color:white;font-size:22px;border-radius:2px;"type="button">Go to Home Page</button></a>
</div></center>
</body>
</html>