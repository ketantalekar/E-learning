

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.sql.*;
import java.io.*;
import java.util.*;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class FacultyUploadFile
 */
@WebServlet("/FacultyUploadFile")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB

public class FacultyUploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public FacultyUploadFile() {
    		
    	
    	//super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		Connection con1=null;  
		PrintWriter out=response.getWriter();
	   	
		String message="File Uploaded Successfully";
		out.println(message);
		HttpSession session = request.getSession();
		String utype=(String)session.getAttribute("utype");
		try{  
			//ServletRequest session;
			
			
	        
					String collegename=(String)session.getAttribute("colcode");
		        	  Class.forName("com.mysql.jdbc.Driver");  
		        con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
		        String userid=(String)session.getAttribute("sessuid");
		        out.println(userid);
		        String subject="";
		        if(utype.equals("Faculty"))
		        {
		        	subject=(String)session.getAttribute("subjectname1");
			         
		        }
		        else if(utype.equals("Student"))
		        {
		        	subject=(String)session.getAttribute("studsubject1");
		            	
		        }
		        
		        out.println(subject);
		        Date date = new Date();  
			    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
			    String strDate= formatter.format(date);  
			    out.print(strDate);
			  
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            if (fileName != null && fileName.length() > 0) {
                // File data
                InputStream is = part.getInputStream();
                // Write to file
                out.println(fileName);
                out.print(is);
                this.writeToDB(con1, fileName, is,userid,subject,strDate);
            }
        }
        if(utype.equals("Faculty"))
        {
        	response.sendRedirect("FacultySubjectFile.jsp?message="+message);
            
        }
        else if(utype.equals("Student"))
        {
        	response.sendRedirect("StudentSubjectFile.jsp?message="+message);
            	
        }
        }
        catch (Exception e) {
            if(utype.equals("Faculty"))
            {
            	response.sendRedirect("FacultySubjectFile.jsp?error=Failed+to+Upload+file");
                
            }
            else if(utype.equals("Student"))
            {
            	response.sendRedirect("StudentSubjectFile.jsp?error=Failed+to+Upload+file");
                	
            }
        	out.println(e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
           // RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/FacultySubject.jsp");
            //dispatcher.forward(request, response);
        } finally {
            this.closeQuietly(con1);
        }
	}
	
	private String extractFileName(Part part) {
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip
                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }
	private void writeToDB(Connection con1, String fileName, InputStream is, String userid,String subject,String strDate) throws SQLException {
		 
        String sql = "Insert into upload_file(Subject_Name,Userid,File_Name,File_data,Upload_date) values (?,?,?,?,?) ";
        PreparedStatement pstm = con1.prepareStatement(sql);
 
        //Long id = this.getMaxAttachmentId(con) + 1;
        pstm.setString(1,subject);
        pstm.setString(2,userid);
        
        pstm.setString(3, fileName);
        pstm.setBlob(4, is);
        pstm.setString(5,strDate);
        pstm.executeUpdate();
        
        
        String uid="";
	       int fstatus=0;
	       int addstatus=0;
	       String query4="select Userid,StudyMaterial from student_subject where Subject_code=?";
	     PreparedStatement ps5=con1.prepareStatement(query4);
	     ps5.setString(1,subject);
	     ResultSet rs5=ps5.executeQuery();
	     while(rs5.next())
	     {
	    	 addstatus=1;
	    	 uid=rs5.getString(1);
	    	 fstatus=rs5.getInt(2);
	    	 addstatus=addstatus+fstatus;
	    	 PreparedStatement ps6=con1.prepareStatement("Update student_subject set StudyMaterial=? Where Userid=? and Subject_code=?");
	    	 ps6.setInt(1,addstatus);
	    	   ps6.setString(2,uid);
	    	   ps6.setString(3,subject);
	    	  
	    	   int row3=ps6.executeUpdate();
	    	 
	     }
    }
	 private void closeQuietly(Connection conn) {
	        try {
	            if (conn != null) {
	                conn.close();
	            }
	        } catch (Exception e) {
	        }
	    }


}
