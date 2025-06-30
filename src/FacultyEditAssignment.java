

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
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import java.util.Properties;
import com.email.durgesh.Email;

/**
 * Servlet implementation class FacultyEditAssignment
 */
@WebServlet("/FacultyEditAssignment")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB

public class FacultyEditAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacultyEditAssignment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con1=null;  
		PrintWriter out=response.getWriter();
		String message="";
        try{  
        	HttpSession session = request.getSession();
			
            Class.forName("com.mysql.jdbc.Driver");  
            String collegename=(String)session.getAttribute("colcode");
            con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
            String subjectcode=(String)session.getAttribute("subjectname1");
            String assigntitle=request.getParameter("assigntitle");
            String prevtitle=request.getParameter("prevtitle");
            
        String duetime = request.getParameter("duetime");
        DateFormat df = new SimpleDateFormat("HH:mm");
        //Date/time pattern of desired output date
        DateFormat outputformat = new SimpleDateFormat("hh:mm aa");
        Date date = null;
        String output = null;
        		date= df.parse(duetime);
        //old date format to new date format
  	  output = outputformat.format(date);
        out.println(output);
      DateFormat df2=new SimpleDateFormat("yyyy-MM-dd");
        String duedat=request.getParameter("duedate");
        out.println(duedat);
        Date d2=null;
        DateFormat formatter1 = new SimpleDateFormat("dd/MM/yyyy");  
        d2=df2.parse(duedat);
	    String duedate= formatter1.format(d2); 
	   
       out.println(duedate);
       
        String description=request.getParameter("description");
        String userid=(String)session.getAttribute("sessuid");
        
        String department="";
        Date dt = new Date();  
	    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
	    String strDate= formatter.format(dt);  
	    DateFormat dateFormat = new SimpleDateFormat("hh.mm aa");
    	String dateString = dateFormat.format(new Date()).toString();
String subjectname="";
out.println(subjectcode);

        String query="Select Department,Subject_name from subject_details where Userid=? and Subject_code=?";
        PreparedStatement ps4=con1.prepareStatement(query);
        ps4.setString(1,userid);
        ps4.setString(2, subjectcode);
        ResultSet rs4=ps4.executeQuery();
        while(rs4.next())
        {
        //out.println();
        department=rs4.getString(1);
        subjectname=rs4.getString(2);
        }
       
        out.println(subjectname);
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
          out.println(fileName);
            if (fileName != null && fileName.length() > 0) {
                // File data
                InputStream is = part.getInputStream();
                // Write to file
                if(is.available()>=4194304)
                {
                		 out.print("size: "+is.available()+" ");
                         message="File size must be less than 4MB";
                        response.sendRedirect("FacultySubjectAssignment.jsp?error="+message);
                }
                else
                {
     
                this.writeToDB(con1, fileName, is,subjectname,assigntitle,output,duedate,description,userid,strDate,dateString,department,subjectcode,prevtitle);
               
                }
                }
            else if(fileName == null)
            {
            	this.writeToDB2(con1,subjectname,assigntitle,output,duedate,description,userid,strDate,dateString,department,subjectcode,prevtitle);
            }
        
                }
        
        message="Assignment updated successfully";
        response.sendRedirect("FacultySubjectAssignment.jsp?message="+message);
        
       
        }
        catch (Exception e) {
        	out.println(e.getMessage());
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

private void writeToDB2(Connection con,String subjectname,String assigntitle,String output,String duedate,String description,String userid,String strDate,String dateString,String department,String subjectcode,String prevtitle) throws SQLException {
	 try
	 {
		 
		 String sql = "Update facultyassignment set Title=?,DueDate=?,DueTime=?,Description=?,Date=?,Time=? where Userid=? and Subject_code=? and Title=?";
		    
   PreparedStatement pstm = con.prepareStatement(sql);

   //Long id = this.getMaxAttachmentId(con) + 1;
   pstm.setString(1,assigntitle);
  
   pstm.setString(2,duedate);
 pstm.setString(3,output);
   
   pstm.setString(4,description);
   pstm.setString(5,strDate);
   pstm.setString(6,dateString);
   pstm.setString(7,userid);
   
   pstm.setString(8,subjectcode);
   pstm.setString(9,prevtitle);
   //System.out.println(assigntitle);
   pstm.executeUpdate();
   
   String sql2 = "Update student_assignments set Assignment_name=? where Assignment_Name=? and Subject_code=?";
   PreparedStatement pstm2 = con.prepareStatement(sql2);

   //Long id = this.getMaxAttachmentId(con) + 1;
   pstm2.setString(1,assigntitle);
   pstm2.setString(2,prevtitle);
   pstm2.setString(3,subjectcode);
       pstm2.executeUpdate();

   
   String uid="";
   int astatus=0;
   int addstatus=0;
   String query4="select Userid,AssignmentStatus from student_subject where Subject_code=?";
 PreparedStatement ps5=con.prepareStatement(query4);
 ps5.setString(1,subjectcode);
 ResultSet rs5=ps5.executeQuery();
 String uuname="",emid="";
 while(rs5.next())
 {
	 addstatus=1;
	 uid=rs5.getString(1);
	 astatus=rs5.getInt(2);
	 addstatus=addstatus+astatus;
	 PreparedStatement ps6=con.prepareStatement("Update student_subject set AssignmentStatus=? Where Userid=? and Subject_code=?");
	 ps6.setInt(1,addstatus);
	   ps6.setString(2,uid);
	   ps6.setString(3,subjectcode);
	  
	   int row3=ps6.executeUpdate();
	 
 }
	 }
	 catch(Exception e)
	 {
		System.out.println(e.getMessage());
	 }
}











private void writeToDB(Connection con, String fileName, InputStream is,String subjectname,String assigntitle,String output,String duedate,String description,String userid,String strDate,String dateString,String department,String subjectcode,String prevtitle) throws SQLException {
	 try
	 {
		 
		 String sql = "Update facultyassignment set Title=?,File_Name=?,File_data=?,DueDate=?,DueTime=?,Description=?,Date=?,Time=? where Userid=? and Subject_code=? and Title=?";
		    
    PreparedStatement pstm = con.prepareStatement(sql);

    //Long id = this.getMaxAttachmentId(con) + 1;
    pstm.setString(1,assigntitle);
    pstm.setString(2, fileName);
    pstm.setBlob(3, is);
    pstm.setString(4,duedate);
    pstm.setString(5,output);
    
    pstm.setString(6,description);
    pstm.setString(7,strDate);
    pstm.setString(8,dateString);
    pstm.setString(9,userid);
    
    pstm.setString(10,subjectcode);
    pstm.setString(11,prevtitle);
    System.out.println(assigntitle);
    pstm.executeUpdate();
    
    String sql2 = "Update student_assignments set Assignment_name=? where Assignment_Name=? and Subject_code=?";
    PreparedStatement pstm2 = con.prepareStatement(sql2);

    //Long id = this.getMaxAttachmentId(con) + 1;
    pstm2.setString(1,assigntitle);
    pstm2.setString(2,prevtitle);
    pstm2.setString(3,subjectcode);
        pstm2.executeUpdate();

    
    String uid="";
    int astatus=0;
    int addstatus=0;
    String query4="select Userid,AssignmentStatus from student_subject where Subject_code=?";
  PreparedStatement ps5=con.prepareStatement(query4);
  ps5.setString(1,subjectcode);
  ResultSet rs5=ps5.executeQuery();
  String uuname="",emid="";
  while(rs5.next())
  {
 	 addstatus=1;
 	 uid=rs5.getString(1);
 	 astatus=rs5.getInt(2);
 	 addstatus=addstatus+astatus;
 	 PreparedStatement ps6=con.prepareStatement("Update student_subject set AssignmentStatus=? Where Userid=? and Subject_code=?");
 	 ps6.setInt(1,addstatus);
 	   ps6.setString(2,uid);
 	   ps6.setString(3,subjectcode);
 	  
 	   int row3=ps6.executeUpdate();
 	 
  }
	 }
	 catch(Exception e)
	 {
		System.out.println(e.getMessage());
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
        
