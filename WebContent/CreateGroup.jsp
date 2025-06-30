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
String collegename=(String)session.getAttribute("colcode");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
String username=(String)session.getAttribute("sessname");
String message="";
  
	  Date date = new Date();  
	    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
	    String strDate= formatter.format(date);  
	    DateFormat dateFormat = new SimpleDateFormat("hh.mm aa");
  	String dateString = dateFormat.format(new Date()).toString();
   String groupname=request.getParameter("groupname");
   String[] a = request.getParameterValues("multiple");
   String groupmember="";
   int grpcount=0;
   String sql1 = "Select Group_count from group_notifications order by Id desc limit 1";
   PreparedStatement pstm1 = con1.prepareStatement(sql1);
    ResultSet rset = pstm1.executeQuery();
    if(rset.next())
    {
    	grpcount=rset.getInt("Group_count")+1;
    }
   if(a!=null)
   {
   for(int i=0;i<a.length;i++){
   //out.println(Integer.parseInt(a[i])); //If integer
   //out.println(a[i]);
  
  groupmember=groupmember+a[i].toString()+",";
  
  PreparedStatement ps1=con1.prepareStatement("insert into group_notifications(Group_name,Member,Date,Time,Group_count) values(?,?,?,?,?)");
  ps1.setString(1,groupname);
  ps1.setString(2,a[i].toString());
  ps1.setString(3,strDate);
  ps1.setString(4,dateString);
  ps1.setInt(5,grpcount);
  
 int row2=ps1.executeUpdate();

  
  
   }}
   groupmember=groupmember+(String)session.getAttribute("sessuid");
  /* if (groupmember.endsWith(",")) {
	groupmember = groupmember.substring(0, groupmember.length() - 1);
	}
*/
PreparedStatement ps6=con1.prepareStatement("insert into group_notifications(Group_name,Member,Date,Time,Group_count) values(?,?,?,?,?)");
ps6.setString(1,groupname);
ps6.setString(2,(String)session.getAttribute("sessuid"));
ps6.setString(3,strDate);
ps6.setString(4,dateString);
ps6.setInt(5,grpcount);
int row4=ps6.executeUpdate();
  PreparedStatement ps=con1.prepareStatement("insert into group_details(Group_name,Members,Date,Time,Createdby) values(?,?,?,?,?)");
   ps.setString(1,groupname);
   ps.setString(2,groupmember);
   ps.setString(3,strDate);
   ps.setString(4,dateString);
    ps.setString(5,(String)session.getAttribute("sessuid"));
   
  int row=ps.executeUpdate();
 
  //out.println(row);
   if (row > 0) {
       //message = "File uploaded and saved into database";
       //out.println(message);
        String sql = "Select Id,Group_name from group_details where Group_name=? and Createdby=? order by Id desc limit 1";
  PreparedStatement pstm = con1.prepareStatement(sql);
  pstm.setString(1,groupname);
  pstm.setString(2,(String)session.getAttribute("sessuid"));
  ResultSet rs = pstm.executeQuery();
  int id=0;
  String tablename="";
  String grpname="";
 if(rs.next()) 
  {
      id=rs.getInt(1);
      grpname=rs.getString(2);
      tablename=grpname+id;
  }
 PreparedStatement pst=con1.prepareStatement("Update group_details set Group_alias=? Where Id=?");
		 pst.setString(1,tablename);
   pst.setInt(2,id);
   int row1=pst.executeUpdate();
  
	   PreparedStatement pst1=con1.prepareStatement("Update group_notifications set Group_alias=? Where Group_name=? and Group_count=?");
		 pst1.setString(1,tablename);
		 pst1.setString(2,grpname);
 pst1.setInt(3,grpcount);
 int row3=pst1.executeUpdate();
 int highlight=1;
 String mess="";
 mess=username+" created a group ' "+groupname+" ' ";
 PreparedStatement ps10=con1.prepareStatement("insert into group_chat(Group_name,Sender,Message,Date,Time,Highlight) values(?,?,?,?,?,?)");
 ps10.setString(1,tablename);
 ps10.setString(2,(String)session.getAttribute("sessuid"));
 ps10.setString(3,mess);
 ps10.setString(4,strDate);
 ps10.setString(5,dateString);
 ps10.setInt(6,highlight);
 int row10=ps10.executeUpdate();
  // response.sendRedirect("Facultychats.jsp");
 String utype = (String) session.getAttribute("utype");
	
       if(utype.equals("Faculty"))
		{
			response.sendRedirect("Facultychats.jsp");
			
		}
		else if(utype.equals("Student"))
		{
			response.sendRedirect("Studentchats.jsp");
			
			
		}
		else if(utype.equals("College Admin"))
		{
			response.sendRedirect("CollegeAdminchats.jsp");

		}


 
   }
   con1.close();
   
}catch(Exception e){
	
	out.println(e.getMessage());
}  

%>

</body>
</html>