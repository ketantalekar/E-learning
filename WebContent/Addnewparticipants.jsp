<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
 <%@ page import="java.util.*,com.Data.*,java.sql.*" %> 
<%@ page import ="javax.servlet.http.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<%@ page import="java.io.PrintWriter,java.io.StringWriter" %>
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
String message="";
String grpalias=(String)session.getAttribute("searchgrpname");
	  Date date = new Date();  
	    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
	    String strDate= formatter.format(date);  
	    DateFormat dateFormat = new SimpleDateFormat("hh.mm aa");
  	String dateString = dateFormat.format(new Date()).toString();
   
   String[] a = request.getParameterValues("multiple1");
   String groupmember="";
   String groupname="";
   int grpcount=0;
   String sql1 = "Select Group_count,Group_name from group_notifications where Group_alias=?";
   PreparedStatement pstm1 = con1.prepareStatement(sql1);
   pstm1.setString(1,grpalias);
    ResultSet rset = pstm1.executeQuery();
    if(rset.next())
    {
    	grpcount=rset.getInt("Group_count");
    	groupname=rset.getString("Group_name");
    }
    
    String sql5 = "Select Members from group_details where Group_alias=?";
    PreparedStatement pstm5 = con1.prepareStatement(sql5);
    pstm5.setString(1,grpalias);
     ResultSet rset1 = pstm5.executeQuery();
     if(rset1.next())
     {
     	groupmember=rset1.getString("Members");
     }
    
    
   if(a!=null)
   {
   for(int i=0;i<a.length;i++){
   //out.println(Integer.parseInt(a[i])); //If integer
   //out.println(a[i]);
  
  groupmember=groupmember+","+a[i].toString();
    
  PreparedStatement ps1=con1.prepareStatement("insert into group_notifications(Group_name,Member,Date,Time,Group_count,Group_alias) values(?,?,?,?,?,?)");
  ps1.setString(1,groupname);
  ps1.setString(2,a[i].toString());
  ps1.setString(3,strDate);
  ps1.setString(4,dateString);
  ps1.setInt(5,grpcount);
  ps1.setString(6,grpalias);
 int row2=ps1.executeUpdate();
 String bs5="SELECT Username FROM faculty_details where Userid = ? union all SELECT Username FROM student_details where Userid = ? union all select Username from college_admin_details where Userid = ?";
 PreparedStatement ps11=con1.prepareStatement(bs5);
 ps11.setString(1,a[i].toString());
 ps11.setString(2,a[i].toString());
 ps11.setString(3,a[i].toString());
 String myname="";
 ResultSet rs11=ps11.executeQuery();
 if(rs11.next())
 {
 	myname=rs11.getString("Username");
 }
 String mess=username+" added "+myname;
 PreparedStatement ps10=con1.prepareStatement("insert into group_chat(Group_name,Sender,Message,Date,Time,Highlight) values(?,?,?,?,?,?)");
 ps10.setString(1,grpalias);
 ps10.setString(2,(String)session.getAttribute("sessuid"));
 ps10.setString(3,mess);
 ps10.setString(4,strDate);
 ps10.setString(5,dateString);
 ps10.setInt(6,highlight);
 int row10=ps10.executeUpdate();
  
   }}
 
  /* if (groupmember.endsWith(",")) {
	groupmember = groupmember.substring(0, groupmember.length() - 1);
	}
*/

PreparedStatement ps=con1.prepareStatement("Update group_details set Members=? Where Group_alias=?");
ps.setString(1,groupmember);
  ps.setString(2,grpalias);
 
  int row=ps.executeUpdate();
 
  //out.println(row);
  String utype = (String) session.getAttribute("utype");
		
   if (row > 0) {
       //message = "File uploaded and saved into database";
       //out.println(message);
        //response.sendRedirect("Facultychats.jsp?ok=ok&uname1="+grpalias);
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
   //con.close(); 
	con1.close();
}catch(Exception e){
	
	out.println(e.getMessage());
}  

%>

</body>
</html>