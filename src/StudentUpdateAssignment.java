

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.*;


/**
 * Servlet implementation class StudentUploadAssignment
 */
@WebServlet("/StudentUpdateAssignment")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB

public class StudentUpdateAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentUpdateAssignment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con1=null;  
		PrintWriter out=response.getWriter();
		 int assid=Integer.parseInt(request.getParameter("assignid"));
        try{  
        	HttpSession session = request.getSession();
			
            Class.forName("com.mysql.jdbc.Driver");  
            String collegename=(String)session.getAttribute("colcode");
            con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
            String subject=(String)session.getAttribute("studsubject1");
            String assigntitle=request.getParameter("assigntitle");
           
            
        String userid=(String)session.getAttribute("sessuid");
        Date dt = new Date();  
	    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
	    String strDate= formatter.format(dt);  
	    DateFormat dateFormat = new SimpleDateFormat("hh.mm aa");
    	String dateString = dateFormat.format(new Date()).toString();
/*String subjectcode="";
        String query="Select Subject_code from subject_details where Subject_name=?";
        PreparedStatement ps4=con1.prepareStatement(query);
        ps4.setString(1, subject);
        ResultSet rs4=ps4.executeQuery();
        while(rs4.next())
        {
        //out.println();
        subjectcode=rs4.getString(1);
        }*/
       
        
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            if (fileName != null && fileName.length() > 0) {
                // File data
                InputStream is = part.getInputStream();
                // Write to file
                this.writeToDB(con1, fileName, is,userid,assigntitle,strDate,dateString,subject);
            }
        }
        String message="Assignment updated successfully";
        response.sendRedirect("StudentUpdateAssignment.jsp?id="+assid+"&message="+message);
        }
        catch (Exception e) {
        	out.println(e.getMessage());
        	String message="Failed to Update Assignment";
            response.sendRedirect("StudentUpdateAssignment.jsp?id="+assid+"&error="+message);
            //e.printStackTrace();
            //request.setAttribute("errorMessage", "Error: " + e.getMessage());
            //RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/FacultySubjectAssignment.jsp");
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
private void writeToDB(Connection con, String fileName, InputStream is,String userid,String assigntitle,String strDate,String dateString,String subject) throws SQLException {
	 
    String sql = "Update student_assignments set Assignment_file=?,File_data=?,Submitted_date=?,Submitted_time=? where Name=? and Subject_code=? and Assignment_name=?";
    PreparedStatement pstm = con.prepareStatement(sql);

    //Long id = this.getMaxAttachmentId(con) + 1;
    pstm.setString(1, fileName);
    pstm.setBlob(2, is);
    pstm.setString(3,strDate);
    pstm.setString(4,dateString);
    pstm.setString(5,userid);
    pstm.setString(6,subject);
    
    pstm.setString(7,assigntitle);

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
        
	




