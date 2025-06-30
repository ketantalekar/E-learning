<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.imageio.ImageIO" %>
<%@page import="java.awt.image.BufferedImage" %>
<%@page import="java.io.*"%>

<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
<%
String id = "5";
  // con = null;
    String collegename=(String)session.getAttribute("colcode");
  Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
  

try{
 	String name=request.getParameter("name");
   
     PreparedStatement ps = con1.prepareStatement("select ProfilePic from student_details where Userid=?");
    ps.setString(1,name);
    ResultSet rs = ps.executeQuery();
 
    if(rs.next()){
        Blob blob = rs.getBlob("ProfilePic");
        if(blob!=null)
        {
        byte byteArray[] = blob.getBytes(1, (int)blob.length());
 
        response.setContentType("image/jpg");
        OutputStream os = response.getOutputStream();
        os.write(byteArray);
        
        os.flush();
        os.close();
        }
        else
        {
        	response.setContentType("image/jpeg");

    		String pathToWeb = getServletContext().getRealPath(File.separator);
    		File f = new File(pathToWeb + "prof.jpg");
    		BufferedImage bi = ImageIO.read(f);
    		OutputStream outd = response.getOutputStream();
    		ImageIO.write(bi, "jpg", outd);
    		out.close();
        }
    }
    
}
catch(Exception e){
    e.printStackTrace();
}   
finally{
    if(con1 != null){
        try{
            con1.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
%>
</body>
</html>