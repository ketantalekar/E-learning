<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
 <%@ page import ="javax.servlet.http.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<%@ page import="java.io.PrintWriter,java.io.StringWriter" %>
 <%@ include file="connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%

String message="";
try{  
	String name=request.getParameter("adname");
	String collegecode=request.getParameter("clgcode");
    
    Connection con1=null;
    //out.println(collegename);
    //out.println(collegecode);
    //out.println(name);
    //out.println(address);
    //out.println(email);
    //out.println(mobile);
    
    
    String bs5="SELECT Username FROM college_admin_details where Userid = ?";
    PreparedStatement ps11=con.prepareStatement(bs5);
    ps11.setString(1,name);
    String myname="";
    ResultSet rs11=ps11.executeQuery();
    if(rs11.next())
    {
    	myname=rs11.getString("Username");
    }
   PreparedStatement ps=con.prepareStatement("DELETE  FROM college_admin_details where Userid=?");
   ps.setString(1,name);
    
   int row=ps.executeUpdate();
   Statement st2=con.createStatement();
	  int i2=st2.executeUpdate("DELETE FROM private_chat WHERE Sender='"+name+"' or Reciever='"+name+"'");
	  Statement st3=con.createStatement();
	  int i3=st3.executeUpdate("DELETE FROM dummy_private_chat WHERE Sender='"+name+"' or Reciever='"+name+"'");
  //out.println(row);
  
  
  
   if (row > 0) {
       //message = "File uploaded and saved into database";
       //out.println(message);
      
         con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegecode,"root",""); 
   PreparedStatement ps1=con1.prepareStatement("DELETE FROM college_admin_details  where Userid=?");
   ps1.setString(1,name);
   
   int row1=ps1.executeUpdate();
   
   Statement st4=con1.createStatement();
	  int i4=st4.executeUpdate("DELETE FROM private_chat WHERE Sender='"+name+"' or Reciever='"+name+"'");
	  Statement st5=con1.createStatement();
	  int i5=st5.executeUpdate("DELETE FROM dummy_private_chat WHERE Sender='"+name+"' or Reciever='"+name+"'");
   
	
	  Date date = new Date();  
	    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
	    String strDate= formatter.format(date);  
	    DateFormat dateFormat = new SimpleDateFormat("hh.mm aa");
  	String dateString = dateFormat.format(new Date()).toString();
   int highlight=1;
	   String bs6="SELECT Group_alias from group_notifications where Member=?";
	    PreparedStatement ps12=con1.prepareStatement(bs6);
	    ps12.setString(1,name);
	    String grpalias="";
	    ResultSet rs12=ps12.executeQuery();
	    while(rs12.next())
	    {
	    	grpalias=rs12.getString(1);
	    
	  String mess=myname+" left the group";
	  PreparedStatement ps10=con1.prepareStatement("insert into group_chat(Group_name,Sender,Message,Date,Time,Highlight) values(?,?,?,?,?,?)");
	  ps10.setString(1,grpalias);
	  ps10.setString(2,name);
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
	    	   ps6.setString(2,name);
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
		if(s[n].equals(name))
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
	 PreparedStatement ps7=con1.prepareStatement("Update group_details set Members=? Where Group_alias=?");
	   ps7.setString(1,groupmember);
	     ps7.setString(2,grpalias);
	    
	     int row2=ps.executeUpdate();
	    
	    }
	    

	    
	    
	    
	    
	    
	    
	    
	  String sql = "delete from group_notifications where Member=?";
	  PreparedStatement pstm = con1.prepareStatement(sql);
	  pstm.setString(1,name);
	  pstm.execute();
	  String sql10 = "delete from dummy_quiz_title where Userid=?";
	  PreparedStatement pstm10 = con1.prepareStatement(sql10);
	  pstm10.setString(1,name);
	  pstm10.execute();
	  session.removeAttribute("searchuname");
	  session.removeAttribute("searchgrpname");
   message="College Admin Deleted successfully";
       response.sendRedirect("College_Details.jsp?message="+message);
   }
   con1.close();
   con.close();
   
}catch(Exception e){
	
	out.println(e.getMessage());
	 message="Failed to delete College Admin details";
     response.sendRedirect("College_Details.jsp?error="+message);
}  

%>

</body>
</html>