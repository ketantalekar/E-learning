

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
 import java.sql.*;
 
 import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
 import java.util.Date;

/**
 * Servlet implementation class vchat
 */
 @WebServlet(name="vchat",urlPatterns= {"/vchat"})
public class vchat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
	{
        response.setContentType("text/html;charset=UTF-8");
                
    }

    public vchat() {
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
		PrintWriter out=response.getWriter();
		try
		{
			HttpSession session=request.getSession();
			
			processRequest(request, response);
			  Date date = new Date();  
			    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
			    String strDate= formatter.format(date);  
			    DateFormat dateFormat = new SimpleDateFormat("hh.mm aa");
		    	String dateString = dateFormat.format(new Date()).toString();
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-learning","root",""); 
		String utype = (String) session.getAttribute("utype");
		String receiver="";
		if(utype.equals("Vendor"))
		{
			receiver=(String)session.getAttribute("searchuname");
			
		}
		else if(utype.equals("College Admin"))
		{
			receiver=(String)session.getAttribute("searchname");
			
			
		}
		
		 
		String message=request.getParameter("message");
		String replaceString=message.replace("'","\\'");
		int privatestatus=1;
		String sender=(String)session.getAttribute("sessuid");
				Statement stmt=con.createStatement();
		int query=stmt.executeUpdate("insert into private_chat(Sender,Reciever,Message,Date,Time,Status) values('"+sender+"','"+receiver+"','"+replaceString+"','"+strDate+"','"+dateString+"',"+privatestatus+")");
		String sql = "delete from dummy_private_chat where Sender=? and Reciever=? or Sender=? and Reciever=?";
		PreparedStatement pstm = con.prepareStatement(sql);
		pstm.setString(1,sender);
		pstm.setString(2, receiver);
		pstm.setString(3,receiver);
		pstm.setString(4, sender);
		pstm.execute();
		Statement stmtt=con.createStatement();
		int query1=stmtt.executeUpdate("insert into dummy_private_chat(Sender,Reciever,Message,Date,Time) values('"+sender+"','"+receiver+"','"+replaceString+"','"+strDate+"','"+dateString+"')");
		//HttpSession session = request.getSession();
		if(utype.equals("Vendor"))
		{
			response.sendRedirect("Vendorchat.jsp");
			
		}
		else if(utype.equals("College Admin"))
		{
			response.sendRedirect("CollegeAdminVendorChat.jsp");
			
			
		}
		}
		catch(Exception e)
		{
		out.println(e.getMessage());
		}
	}

}
