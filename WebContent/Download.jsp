<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%@ include file="connection.jsp" %>
    <%@ page import="com.Data.*,java.io.*" %>
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
	
	int uploadId=Integer.parseInt(request.getParameter("id"));
int BUFFER_SIZE = 4096;   
con=null;
Class.forName("com.mysql.jdbc.Driver");  
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-learning","root","");  
String sql = "Select courseid,file_name,file_data,coursename from courses where courseid=?";
PreparedStatement pstm = con.prepareStatement(sql);
pstm.setInt(1, uploadId);
ResultSet rs = pstm.executeQuery();
if (rs.next()) 
{
	int id=rs.getInt("courseid");
String fileName = rs.getString("file_name");
Blob fileData = rs.getBlob("file_data");
String description = rs.getString("coursename");
//out.println(id);
//out.print(fileName);
//out.println(fileData);
//out.println(description);
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
//con1.close();
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