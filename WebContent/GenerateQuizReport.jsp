<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%> 
<%@page import="org.apache.poi.ss.util.CellRangeAddress"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="java.io.*,java.sql.*" %>
<% 
try
{
// create a small spreadsheet
HSSFWorkbook wb = new HSSFWorkbook();
HSSFSheet sheet = wb.createSheet();
HSSFRow row = sheet.createRow(0);
sheet.addMergedRegion(new CellRangeAddress(
 0, //first row (0-based)
 0, //last row (0-based)
 0, //first column (0-based)
 6 //last column (0-based)
));
 row = sheet.createRow(0);
HSSFCell cell = row.createCell(0);
cell = row.createCell(0);
cell.setCellValue("Test details");
row = sheet.createRow(1);
cell = row.createCell(0);
cell.setCellValue("Id");
cell = row.createCell(1);
cell.setCellValue("Roll No");
cell = row.createCell(2);
cell.setCellValue("Username");
cell = row.createCell(3);
cell.setCellValue("Userid");
cell = row.createCell(4);
cell.setCellValue("Title");
cell = row.createCell(5);
cell.setCellValue("Start Time");
cell = row.createCell(6);
cell.setCellValue("Submitted Time");
cell = row.createCell(7);
cell.setCellValue("Marks");
// write it as an excel attachment
String collegename=(String)session.getAttribute("colcode");
		Connection con1=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
		String subject=(String)session.getAttribute("subjectname1");
		  String quiztitle="";
		 int id1=Integer.parseInt(request.getParameter("id"));
		 String query2="select title from quiz_info where Id=?";
	  	    PreparedStatement pstm2=con1.prepareStatement(query2);
	  	    pstm2.setInt(1,id1);
	  	    ResultSet rs2=pstm2.executeQuery();
	  	    if(rs2.next())
	  	    {
	  	 	   quiztitle=rs2.getString(1);
	  	   
	  	    }
	    // out.println(tt);
	   
		String ss="Select Subject_code,Userid,Department,Subject_name,Batch from student_subject where Subject_code=?";
		  PreparedStatement pstm4 = con1.prepareStatement(ss);
		  pstm4.setString(1,subject);
		  String uid="",rollno="";
		  ResultSet rs4 = pstm4.executeQuery();
		  int cnt=0;
		  int rowcount=2;
		  String username="";
		  String title="";
		  while(rs4.next()) 
		  {
			  cnt++;
			uid=rs4.getString(2);
			 String sql = "Select id,Userid,Subject_code,title,Totalmarks,Start_time,Submitted_time,Updated from quizresult where title=? and Subject_code=? and Userid=? order by id desc";
			  PreparedStatement pstm = con1.prepareStatement(sql);
			  pstm.setString(1,quiztitle);
			  pstm.setString(2,subject);
			  pstm.setString(3,uid);
			  int id=0;
			 
			  String user_id="";
			  String totalmarks="";
			  String updated="";
			  int totalmark=0;
			  ResultSet rs = pstm.executeQuery();
			 
			  if(rs.next()) 
			  {
				  //cnt++;
			  	 id=rs.getInt("id");
			  	 title = rs.getString("title");
			 user_id = rs.getString("Userid");
			  String start_time = rs.getString("Start_time");
			  String submitted_time=rs.getString("Submitted_time");
			  totalmark=rs.getInt("Totalmarks");
			  updated=rs.getString("Updated");
			  String questiontype="";
			   
			  
			    String sql4="Select Username,Roll_no from student_details where Userid=?";
			    PreparedStatement pstm5 = con1.prepareStatement(sql4);
			    pstm5.setString(1,user_id);
			    ResultSet rs5 = pstm5.executeQuery();
			    
			   if(rs5.next())
			   {
				   rollno=rs5.getString("Roll_no");
				   username=rs5.getString("Username");
			   }
			  	//String query = "select Id,Username,Userid,Email_Id,Mobile_No,Address,Department,Batch,Roll_no from ";
		//Statement stmt;
		//stmt = con1.createStatement();
		//ResultSet rs = stmt.executeQuery(query);
			row = sheet.createRow(rowcount++);
			cell = row.createCell(0);
			cell.setCellValue(cnt);
			cell = row.createCell(1);
			cell.setCellValue(rollno);
			cell = row.createCell(2);
			cell.setCellValue(username);
			cell = row.createCell(3);
			cell.setCellValue(uid);
			cell = row.createCell(4);
			cell.setCellValue(title);
			cell = row.createCell(5);
			cell.setCellValue(start_time);
			cell = row.createCell(6);
			cell.setCellValue(submitted_time);
			cell = row.createCell(7);
			 if(totalmarks.equals("null") && updated.equals("N"))
			   {
				 cell.setCellValue("Marks Need to be Updated");
					
			   //	out.println("<span style='color:red;'>Marks Need to be Updated</span>");
			   }
			   else
			   {
				   cell.setCellValue(totalmark);
					
			   	//out.println(totalmark);
			   }
	
			
		}
		  else
		  {
			  //String username="";
			 String sql6="Select Username,Roll_no from student_details where Userid=?";
	    PreparedStatement pstm6 = con1.prepareStatement(sql6);
	    pstm6.setString(1,uid);
	    ResultSet rs6 = pstm6.executeQuery();
	    String rno="";
	   if(rs6.next())
	   {
		   rno=rs6.getString("Roll_no");
		   username=rs6.getString("Username");
	   }
	   
	  
			  row = sheet.createRow(rowcount++);
				cell = row.createCell(0);
				cell.setCellValue(cnt);
				cell = row.createCell(1);
				cell.setCellValue(rno);
				cell = row.createCell(2);
				cell.setCellValue(uid);
				cell = row.createCell(3);
				cell.setCellValue(username);
				cell = row.createCell(4);
				cell.setCellValue(title);
				cell = row.createCell(5);
				cell.setCellValue("Not submitted");
				cell = row.createCell(6);
				cell.setCellValue("Not submitted");
				cell = row.createCell(7);
				cell.setCellValue("Not submitted");
				
				
			 
		  }

		  }
		  
		  
ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
wb.write(outByteStream);
byte [] outArray = outByteStream.toByteArray();
response.setContentType("application/ms-excel");
response.setContentLength(outArray.length); 
response.setHeader("Expires:", "0"); // eliminates browser caching
response.setHeader("Content-Disposition", "attachment; filename=Student Test Report.xls");
OutputStream outStream = response.getOutputStream();
outStream.write(outArray);
outStream.flush();
}
catch(Exception e)
{
	out.println(e.getMessage());
}
%>