<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
 <%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
<%@ page import ="javax.servlet.http.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<%@ page import="java.io.PrintWriter,java.io.StringWriter,java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
	int highlight=1;
String collegename=(String)session.getAttribute("colcode");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
String username=(String)session.getAttribute("sessname");
Date date = new Date();  
SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
String strDate= formatter.format(date);  
DateFormat dateFormat = new SimpleDateFormat("hh.mm aa");
String dateString = dateFormat.format(new Date()).toString();
String message="";
String grpalias=(String)session.getAttribute("searchgrpname");
String uname = request.getParameter("name"); 

String sql = "delete from group_notifications where Group_alias=? and Member=?";
PreparedStatement pstm = con1.prepareStatement(sql);
pstm.setString(1,grpalias);
pstm.setString(2,uname);
pstm.execute();

String bs5="SELECT Username FROM faculty_details where Userid = ? union all SELECT Username FROM student_details where Userid = ? union all select Username from college_admin_details where Userid = ?";
PreparedStatement ps11=con1.prepareStatement(bs5);
ps11.setString(1,uname);
ps11.setString(2,uname);
ps11.setString(3,uname);
String myname="";
ResultSet rs11=ps11.executeQuery();
if(rs11.next())
{
	myname=rs11.getString("Username");
}


String mess=username+" removed "+myname;
PreparedStatement ps10=con1.prepareStatement("insert into group_chat(Group_name,Sender,Message,Date,Time,Highlight) values(?,?,?,?,?,?)");
ps10.setString(1,grpalias);
ps10.setString(2,(String)session.getAttribute("sessuid"));
ps10.setString(3,mess);
ps10.setString(4,strDate);
ps10.setString(5,dateString);
ps10.setInt(6,highlight);
int row10=ps10.executeUpdate();

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
	   ps6.setString(2,uname);
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
	if(s[n].equals(uname))
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
 /*  for(int i = removeIndex; i <count -1; i++){
        s[i] = s[i + 1];
        
        out.println(i+" "+s[i]);

      }*/
   //out.println(s.length);
      String[] anotherArray = new String[s.length - 1]; 
      for (int i = 0, k = 0; i < s.length; i++) { 
    	  if (i == removeIndex) { 
              continue; 
          }   
    	  anotherArray[k++] = s[i];
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
    
     int row=ps.executeUpdate();
    
    // out.println(row);
      if (row > 0) {
          //message = "File uploaded and saved into database";
          //out.println(message);
           //response.sendRedirect("Facultychats.jsp?ok=ok&uname1="+grpalias);
           //out.println("success");
           String utype=(String)session.getAttribute("utype");
	
    	  if(utype.equals("Faculty"))
  		{
  			response.sendRedirect("Facultychats.jsp?ok=ok&uname1="+grpalias);

  		}
  		else if(utype.equals("Student"))
  		{
  			response.sendRedirect("Studentchats.jsp?ok=ok&uname1="+grpalias);

  		}
  		else if(utype.equals("College Admin"))
  		{
  			response.sendRedirect("CollegeAdminchats.jsp?ok=ok&uname1="+grpalias);

  		}

      }
      con1.close();


}
catch(Exception e){
	
	out.println(e.getMessage());
}  


%>

</body>
</html>