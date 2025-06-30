<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
 <%@ page import ="javax.servlet.http.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<%@ page import="java.io.PrintWriter,java.io.StringWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Faculty Dashboard</title>
<link href="Bootstrap/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="Bootstrap/css/style.css" rel="stylesheet" type="text/css"></link>
</head>
<body>
<%
try
{
String collegename=(String)session.getAttribute("colcode");
String message="";
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");

int uid=Integer.parseInt(request.getParameter("id"));
String fid=request.getParameter("fid");
String userid="NULL";
String isAlloted="N";

PreparedStatement pstmt41=null;
String useri="";
 pstmt41=con1.prepareStatement("SELECT Userid FROM faculty_details WHERE Id=?");
 pstmt41.setInt(1,uid);
 ResultSet rs41=pstmt41.executeQuery();
 if(rs41.next())
 {
	  useri=rs41.getString(1);
	  
	
 }
 PreparedStatement pstmt42=null;
 String subcode="";
  pstmt42=con1.prepareStatement("SELECT Subject_name FROM subject_details WHERE Userid=?");
  pstmt42.setString(1,useri);
  ResultSet rs42=pstmt42.executeQuery();
  if(rs42.next())
  {
 	  subcode=rs42.getString(1);
 	  
 	
  }
 String bs5="SELECT Username FROM faculty_details where Userid = ?";
 PreparedStatement ps11=con1.prepareStatement(bs5);
 ps11.setString(1,useri);
 String myname="";
 ResultSet rs11=ps11.executeQuery();
 if(rs11.next())
 {
 	myname=rs11.getString("Username");
 }
 Statement st2=con1.createStatement();
 int i2=st2.executeUpdate("DELETE FROM private_chat WHERE Sender='"+useri+"' or Reciever='"+useri+"'");
 Statement st3=con1.createStatement();
 int i3=st3.executeUpdate("DELETE FROM dummy_private_chat WHERE Sender='"+useri+"' or Reciever='"+useri+"'");

if(myname!=null)
{
	String query1="Update subject_details set Userid=?,isAlloted=? where Userid=? and isAlloted='Y'";
    PreparedStatement ps4=con1.prepareStatement(query1);
    ps4.setString(1,userid);
    ps4.setString(2,isAlloted);
    ps4.setString(3,fid);
    
    int row=ps4.executeUpdate();
    String unan="NAN";
    String query8="Update facultyassignment set Userid=? where Userid=?";
    PreparedStatement ps8=con1.prepareStatement(query8);
    ps8.setString(1,unan);
    ps8.setString(2,useri);
   
    int row8=ps8.executeUpdate();
    String query9="Update notices set Faculty_Name=? where Faculty_Name=?";
    PreparedStatement ps9=con1.prepareStatement(query9);
    ps9.setString(1,unan);
    ps9.setString(2,useri);
   
    int row9=ps9.executeUpdate();
    
    String query10="Update quiz_info set Faculty_Name=? where Faculty_Name=?";
    PreparedStatement ps10=con1.prepareStatement(query10);
    ps10.setString(1,unan);
    ps10.setString(2,useri);
   
    int row10=ps10.executeUpdate();
    String query14="Update upload_file set Userid=? where Userid=?";
    PreparedStatement ps14=con1.prepareStatement(query14);
    ps14.setString(1,unan);
    ps14.setString(2,useri);
   
    int row14=ps14.executeUpdate();
    
    
    int ns=0,as=0,qs=0,sm=0;
    String query15="Update student_subject set NoticeStatus=?,AssignmentStatus=?,QuizStatus=?,StudyMaterial=? where Subject_code=?";
    PreparedStatement ps15=con1.prepareStatement(query15);
    ps15.setInt(1,ns);
    ps15.setInt(2,as);
    ps15.setInt(3,qs);
    ps15.setInt(4,sm);
    ps15.setString(5,useri);
    
    int row15=ps15.executeUpdate();
    
	
	  Date date = new Date();  
	    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
	    String strDate= formatter.format(date);  
	    DateFormat dateFormat = new SimpleDateFormat("hh.mm aa");
	String dateString = dateFormat.format(new Date()).toString();
 int highlight=1;
	   String bs6="SELECT Group_alias from group_notifications where Member=?";
	    PreparedStatement ps12=con1.prepareStatement(bs6);
	    ps12.setString(1,useri);
	    String grpalias="";
	    ResultSet rs12=ps12.executeQuery();
	    while(rs12.next())
	    {
	    	grpalias=rs12.getString(1);
	    
	  String mess=myname+" left the group";
	  PreparedStatement ps16=con1.prepareStatement("insert into group_chat(Group_name,Sender,Message,Date,Time,Highlight) values(?,?,?,?,?,?)");
	  ps16.setString(1,grpalias);
	  ps16.setString(2,useri);
	  ps16.setString(3,mess);
	  ps16.setString(4,strDate);
	  ps16.setString(5,dateString);
	  ps16.setInt(6,highlight);
	  int row16=ps16.executeUpdate();
	  
	  
	  
	    String mem="";
	    int ustatus=0;
	    int countstatus=0;
	     String query4="select Member,Status from group_notifications where Group_alias=?";
	    PreparedStatement ps5=con1.prepareStatement(query4);
	    ps5.setString(1,grpalias);
	    ResultSet rs5=ps5.executeQuery();
	    while(rs5.next())
	    {
	    	 countstatus=1;
	    	 mem=rs5.getString(1);
	    	 ustatus=rs5.getInt(2);
	    	 countstatus=countstatus+ustatus;
	    	 PreparedStatement ps6=con1.prepareStatement("Update group_notifications set Status=? Where Member <> ? and Group_alias=?");
	    	 ps6.setInt(1,countstatus);
	    	   ps6.setString(2,useri);
	    	   ps6.setString(3,grpalias);
	    	  
	    	   int row3=ps6.executeUpdate();
	    	 
	    }
	    
	    
	    String bs3="select Members,Createdby from group_details where Group_alias=?";
		PreparedStatement ps6=con1.prepareStatement(bs3);
	   ps6.setString(1,grpalias);
	   
	   ResultSet rs6=ps6.executeQuery();
	   String[] s={};
	   String smem="";
	   int count=0;
	   if(rs6.next())
	   {
		   s=rs6.getString(1).split(",");
			//out.println(s);
	count=s.length;
	   }
	   for(String w:s)
	   {
		//   out.println(w);
	   }
	   //int i=0;
	  //out.println(count);
	  //out.println(Arrays.toString(s));
	String[] ss={};
	int n=0;
	int removeIndex=0;
	//int removeIndex = Arrays.binarySearch(s,uname);
	if(removeIndex<0)
	{
		//removeIndex=
	}
	while(n<count)
	{
		if(s[n].equals(useri))
		{
		removeIndex=n;
		break;
		}
		else
		{
			n=n+1;
		}
	}
	//out.println(removeIndex);
	
	   //out.println(s.length);
	      String[] anotherArray = new String[s.length - 1]; 
	      for (int b = 0, k = 0; b < s.length; b++) { 
	    	  if (b == removeIndex) { 
	              continue; 
	          }   
	    	  anotherArray[k++] = s[b];
	      }
	   //   out.println(anotherArray.length);
	      
	   //out.println(Arrays.toString(anotherArray));
	   String groupmember="";
	   
	   for(int j=0;j<anotherArray.length;j++)
	   {
		   groupmember=groupmember+anotherArray[j].toString()+",";
		   
	   }
	  // out.println(groupmember);
	   if (groupmember.endsWith(",")) {
			groupmember = groupmember.substring(0, groupmember.length() - 1);
			}
	  //out.println(groupmember);
	 PreparedStatement ps=con1.prepareStatement("Update group_details set Members=? Where Group_alias=?");
	   ps.setString(1,groupmember);
	     ps.setString(2,grpalias);
	    
	     int row1=ps.executeUpdate();
	    
	    
	    }
	   
	    Statement st=con1.createStatement();
	    int i=st.executeUpdate("DELETE FROM faculty_details WHERE Id="+uid);    
	  String sql = "delete from group_notifications where Member=?";
	  PreparedStatement pstm = con1.prepareStatement(sql);
	  pstm.setString(1,useri);
	  pstm.execute();
	  String sql10 = "delete from dummy_quiz_title where Userid=?";
	  PreparedStatement pstm10 = con1.prepareStatement(sql10);
	  pstm10.setString(1,useri);
	  pstm10.execute();
    
	  session.removeAttribute("searchuname");
	  session.removeAttribute("searchgrpname");
    message="Faculty deleted successfully";
    response.sendRedirect("CollegeAdminFaculty.jsp?message="+message);

}
else
{
	message="Failed to delete faculty";
    response.sendRedirect("CollegeAdminFaculty.jsp?error="+message);
	}
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