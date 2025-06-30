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
cell.setCellValue("Students Assignment details");
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
cell.setCellValue("Assignment Name");
cell = row.createCell(5);
cell.setCellValue("Submitted Date");
cell = row.createCell(6);
cell.setCellValue("Submitted Time");
cell = row.createCell(7);
cell.setCellValue("Feedback");
// write it as an excel attachment
String collegename=(String)session.getAttribute("colcode");
		Connection con1=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
		String subject=(String)session.getAttribute("subjectname1");
		  
		 int id1=Integer.parseInt(request.getParameter("id"));
	    String sql2 = "Select Title from facultyassignment where Id=? ";
	    PreparedStatement pstm2 = con1.prepareStatement(sql2);
	    pstm2.setInt(1,id1);
	    ResultSet rs2 = pstm2.executeQuery();
	    String tt="",uname="";
	    if(rs2.next())
	    {
	    	tt=rs2.getString(1);
	    }
	    out.println(tt);
	   
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
		    String sql = "Select id,Assignment_name,Submitted_date,Submitted_time,Name,Feedback from student_assignments where Assignment_name=? and Subject_code=? and Name=?";
		  PreparedStatement pstm = con1.prepareStatement(sql);
		  pstm.setString(1,tt);
		  pstm.setString(2,subject);
		  pstm.setString(3,uid);
		  ResultSet rs = pstm.executeQuery();
		  if(rs.next()) 
		  {
			  int id=rs.getInt("id");
			  	 title = rs.getString("Assignment_name");
			  String submit_date = rs.getString("Submitted_date");
			  String submit_time = rs.getString("Submitted_time");
			  username=rs.getString("Name");
			  String remark=rs.getString("Feedback");
			  String sql3="Select Username,Roll_no from student_details where Userid=?";
			  PreparedStatement pstm3 = con1.prepareStatement(sql3);
			  pstm3.setString(1,username);
			  ResultSet rs3 = pstm3.executeQuery();
			  if(rs3.next())
			  {
				  uname=rs3.getString("Username");
				  rollno=rs3.getString("Roll_no");
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
			cell.setCellValue(uname);
			cell = row.createCell(4);
			cell.setCellValue(title);
			cell = row.createCell(5);
			cell.setCellValue(submit_date);
			cell = row.createCell(6);
			cell.setCellValue(submit_time);
			cell = row.createCell(7);
			cell.setCellValue(remark);
			
			
		}
		  else
		  {
			  //String username="";
			  String sql3="Select Username,Roll_no from student_details where Userid=?";
			  PreparedStatement pstm3 = con1.prepareStatement(sql3);
			  pstm3.setString(1,uid);
			  ResultSet rs3 = pstm3.executeQuery();
			  String rno="";
			  if(rs3.next())
			  {
				  uname=rs3.getString("Username");
				  rno=rs3.getString("Roll_no");
			  }
			  String submsg="Not submitted";
			  String subtmsg="Not submitted";
			  String subrmsg="Not submitted";
			  row = sheet.createRow(rowcount++);
				cell = row.createCell(0);
				cell.setCellValue(cnt);
				cell = row.createCell(1);
				cell.setCellValue(rno);
				cell = row.createCell(2);
				cell.setCellValue(uid);
				cell = row.createCell(3);
				cell.setCellValue(uname);
				cell = row.createCell(4);
				cell.setCellValue(title);
				cell = row.createCell(5);
				cell.setCellValue(subtmsg);
				cell = row.createCell(6);
				cell.setCellValue(submsg);
				cell = row.createCell(7);
				cell.setCellValue(subrmsg);
				
				
			 
		  }

		  }
		  
		  
ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
wb.write(outByteStream);
byte [] outArray = outByteStream.toByteArray();
response.setContentType("application/ms-excel");
response.setContentLength(outArray.length); 
response.setHeader("Expires:", "0"); // eliminates browser caching
response.setHeader("Content-Disposition", "attachment; filename=Student Assignment Report.xls");
OutputStream outStream = response.getOutputStream();
outStream.write(outArray);
outStream.flush();
}
catch(Exception e)
{
	out.println(e.getMessage());
}
%>