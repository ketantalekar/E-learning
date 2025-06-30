<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ include file="connection.jsp" %>
    <%@ page import="com.Data.*,java.io.*" %>
    <%@ page import="java.util.Date,java.text.DateFormat,java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
try
{
	String collegename=(String)session.getAttribute("colcode");
	  Class.forName("com.mysql.jdbc.Driver");  
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
String userid="";
	int uploadId=Integer.parseInt(request.getParameter("id"));
int BUFFER_SIZE = 4096;   
String sql = "Select Id,Userid,File_Name,File_data,Upload_date from upload_file where Id=?";
PreparedStatement pstm = con1.prepareStatement(sql);
pstm.setInt(1, uploadId);
ResultSet rs = pstm.executeQuery();
if (rs.next()) 
{
	int id=rs.getInt("Id");
	//userid=rs.getString()
String fileName = rs.getString("File_Name");
Blob fileData = rs.getBlob("File_data");
String upload_date = rs.getString("Upload_date");
//out.println(id);
//out.print(fileName);
//out.println(fileData);
//out.println(description);
Date date = new Date();  
			    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
			    String strDate= formatter.format(date);  
			  
String sql2 = "Insert into downloads(Userid,File_Name,Download_date) values (?,?,?) ";
PreparedStatement pstm2 = con1.prepareStatement(sql2);

//Long id = this.getMaxAttachmentId(con) + 1;
pstm2.setString(1,(String)session.getAttribute("sessuid"));

pstm2.setString(2, fileName);
pstm2.setString(3, strDate);


pstm2.executeUpdate();


InputStream inputStream = fileData.getBinaryStream();
int fileLength = inputStream.available();
 
System.out.println("fileLength = " + fileLength);

ServletContext context = getServletContext();

// sets MIME type for the file download
String mimeType = context.getMimeType(fileName);
if (mimeType == null) {        
    mimeType = "application/octet-stream";
}              
 
// set content properties and header attributes for the response
response.setContentType(mimeType);
response.setContentLength(fileLength);
String headerKey = "Content-Disposition";
String headerValue = String.format("attachment; filename=\"%s\"", fileName);
response.setHeader(headerKey, headerValue);

// writes the file to the client
OutputStream outStream = response.getOutputStream();
 
byte[] buffer = new byte[BUFFER_SIZE];
int bytesRead = -1;
 
while ((bytesRead = inputStream.read(buffer)) != -1) {
    outStream.write(buffer, 0, bytesRead);
}
 
inputStream.close();
outStream.close();   
//return new Attachment(id, fileName, fileData, description);

}
con.close(); 
con1.close();
}
catch (SQLException ex) {
    ex.printStackTrace();
    response.getWriter().print("SQL Error: " + ex.getMessage());
} catch (IOException ex) {
    ex.printStackTrace();
    response.getWriter().print("IO Error: " + ex.getMessage());
} 
%>
</body>
</html>