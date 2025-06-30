

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.sql.*;
import java.io.*;

/**
 * Servlet implementation class EditCourse
 */

@WebServlet(name="EditCourse",urlPatterns= {"/EditCourse"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class EditCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCourse() {
        super();
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
		PrintWriter out=response.getWriter();
		 Connection con=null;  
		 String message="";
	        try{  
	        	
	            Class.forName("com.mysql.jdbc.Driver");  
	            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-learning","root","");  
	            out.println("hii");
	        String coursename = request.getParameter("cname");
	        int cid = Integer.parseInt(request.getParameter("courseid"));
	        out.println(coursename);
	        for (Part part : request.getParts()) {
               String fileName = extractFileName(part);
               
               if (fileName!= null && fileName.length() > 0) {
                   // File data
                   InputStream is = part.getInputStream();
                   // Write to file
                 // out.println("hii");
                   if(is.available()>=4194304)
                   {
                   		 out.print("size: "+is.available()+" ");
                            message="File size must be less than 4MB";
                           response.sendRedirect("vcourses.jsp?error="+message);
                   }
                   else
                   {
                	  
                   this.writeToDB(con, fileName, is,coursename,cid);
                   
                   }
                  
               }
               else if(fileName==null)
               {
            	      this.writeToDB2(con,coursename,cid);
            	      message="Course updated successfully";
          	        response.sendRedirect("vcourses.jsp?message="+message);
          	        
                      
               }
              
           }
	        message="Course updated successfully";
	        response.sendRedirect("vcourses.jsp?message="+message);
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	            out.println(e.getMessage());
	            //request.setAttribute("errorMessage", "Error: " + e.getMessage());
	            //RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/vcourses.jsp");
	            //dispatcher.forward(request, response);
	        } finally {
	            this.closeQuietly(con);
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
	private void writeToDB2(Connection con, String coursename,int cid) throws SQLException {
		 
		  String sql = "Update courses set coursename=? where courseid=?";
	       PreparedStatement pstm = con.prepareStatement(sql);

	       //Long id = this.getMaxAttachmentId(con) + 1;
	       pstm.setString(1, coursename);
	       
	       pstm.setInt(2,cid);
	       
	       pstm.executeUpdate();
	   }

	private void writeToDB(Connection con, String fileName, InputStream is, String coursename,int cid) throws SQLException {
		 
		
			String sql = "Update courses set coursename=?,file_name=?,file_data=? where courseid=?";
		       PreparedStatement pstm = con.prepareStatement(sql);

		       //Long id = this.getMaxAttachmentId(con) + 1;
		       pstm.setString(1, coursename);
		       pstm.setString(2, fileName);
		       pstm.setBlob(3, is);
		       pstm.setInt(4,cid);
		       
		       pstm.executeUpdate();
		
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
