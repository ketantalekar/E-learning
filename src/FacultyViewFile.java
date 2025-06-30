

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Blob;
/**
 * Servlet implementation class FacultyViewFile
 */
@WebServlet("/FacultyViewFile")

public class FacultyViewFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacultyViewFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//String Id = request.getParameter("Id");
		//PrintWriter out=response.getWriter();
	   	
        String fileName=request.getParameter("filename");
        //out.println("hi");
        
        //ServletOutputStream sos;
        PreparedStatement pstmt=null;
         
        //response.setContentType("application/pdf");
        
 
        //response.setHeader("Content-disposition","inline; filename="+fileName);
 
 
         //sos = response.getOutputStream();
         Connection con1=null;
         HttpSession session = request.getSession();
			byte byteArray[]=null;
			String filetype=fileName.substring(fileName.indexOf(".")+1);
           try {
        	   
			String collegename=(String)session.getAttribute("colcode");
			String userid=(String)session.getAttribute("sessuid");
        		  Class.forName("com.mysql.jdbc.Driver");  
        	con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");

} catch (Exception e) {
                     System.out.println(e);
                     System.exit(0); 
                          }
            
          ResultSet rset=null;
            try {
                pstmt = con1.prepareStatement("Select Id,Userid,File_Name,File_data,Upload_date from upload_file where File_Name=?");
                pstmt.setString(1, fileName);
                rset = pstmt.executeQuery();
                if (rset.next())
                {
                	
                	Blob blob = rset.getBlob("File_data");
                	byteArray = blob.getBytes(1, (int)blob.length());
                    //sos.write(byteArray);
                }
                else
                {
          //      out.println("error");	
                }
                Writer out = null;
				
                if(filetype.equals("pdf"))
                	{
                	response.setContentType("application/pdf");
                	response.setHeader("content-Disposition","inline");
                    response.setContentLength(byteArray.length);
                    OutputStream output =response.getOutputStream();
                    output.write(byteArray);
                    output.flush();
                	}
                else if(filetype.equals("docx"))
                {
                	response.setContentType("application/msword");
                	response.setHeader("content-Disposition","inline");
                    response.setContentLength(byteArray.length);
                    OutputStream output =response.getOutputStream();
                    output.write(byteArray);
                    output.flush();
                
                	
                }
                 } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            //    out.println(e.getMessage());
            }
     
        //sos.flush();
        //sos.close();
         
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
        
        
	}

}
