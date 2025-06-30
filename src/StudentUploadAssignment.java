

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
@WebServlet("/StudentUploadAssignment")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB


public class StudentUploadAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentUploadAssignment() {
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
        
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            if (fileName != null && fileName.length() > 0) {
                // File data
                InputStream is = part.getInputStream();
                // Write to file
                this.writeToDB(con1, fileName, is,userid,assigntitle,strDate,dateString,subject);
            }
        }
        String message="Assignment submitted";
        response.sendRedirect("StudentUploadAssignment.jsp?id="+assid+"&message="+message);
        }
        catch (Exception e) {
        	out.println(e.getMessage());
        	String message="Failed to Submit assignment";
            response.sendRedirect("StudentUploadAssignment.jsp?id="+assid+"&error="+message);
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
private void writeToDB(Connection con, String fileName, InputStream is,String userid,String assigntitle,String strDate,String dateString,String subjectcode) throws SQLException {
	 
    String sql = "Insert into student_assignments(Name,Assignment_name,Assignment_file,File_data,Submitted_date,Submitted_time,Subject_code) values (?,?,?,?,?,?,?) ";
    PreparedStatement pstm = con.prepareStatement(sql);

    //Long id = this.getMaxAttachmentId(con) + 1;
    pstm.setString(1,userid);
    pstm.setString(2,assigntitle);
    pstm.setString(3, fileName);
    pstm.setBlob(4, is);
    pstm.setString(5,strDate);
    pstm.setString(6,dateString);
    pstm.setString(7,subjectcode);
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
        
	


