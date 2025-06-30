
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.http.*;
import com.mysql.jdbc.Connection;
/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
@MultipartConfig(maxFileSize = 16177215) 
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
	{
        response.setContentType("text/html;charset=UTF-8");
                
    }
    public UploadServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
        
		HttpSession session = request.getSession();
		String var = (String) session.getAttribute("sessuid");
		//out.println(var);
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		processRequest(request, response);
		InputStream inputStream = null; 
		Part filePart = request.getPart("myimg");
        if (filePart != null) {
            //out.println(filePart.getName());
            //out.println(filePart.getSize());
            //out.println(filePart.getContentType());      
           inputStream = filePart.getInputStream();
        }
         
        Connection conn = null; // connection to the database
        String message = null;
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/e-learning","root","");
 
            // constructs SQL statement
            int prfpicst=1;
            String sql = "update admin_details set ProfilePic = ?,ProfilePicStatus=? where Userid =?";
            PreparedStatement statement = conn.prepareStatement(sql);
             
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(1, inputStream);
                statement.setInt(2,prfpicst);
                statement.setString(3,var);
                
            }
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
                //out.println(message);
                response.sendRedirect("Vsettings.jsp?message=Profile+Picture+Uploaded+Successfully");
            }
        } catch (SQLException ex) {
            //message = "ERROR: " + ex.getMessage();
            //out.println(message);
        	response.sendRedirect("Vsettings.jsp?error=Couldnt+Upload+Profile+Picture");
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
           // out.println("hello");
        }
	}

}
