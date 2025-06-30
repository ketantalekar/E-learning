

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
 * Servlet implementation class Allvchat
 */
 @WebServlet(name="Allvchat",urlPatterns= {"/Allvchat"})

public class Allvchat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Allvchat() {
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
		PrintWriter out=response.getWriter();
		try
		{
			HttpSession session=request.getSession();
			
			  Date date = new Date();  
			    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
			    String strDate= formatter.format(date);  
			    DateFormat dateFormat = new SimpleDateFormat("hh.mm aa");
		    	String dateString = dateFormat.format(new Date()).toString();
		Class.forName("com.mysql.jdbc.Driver");
		String collegename=(String)session.getAttribute("colcode");
        Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
        String username=(String)session.getAttribute("sessuid");
         
		 String receiver=(String)session.getAttribute("searchuname");
		String message=request.getParameter("message");
		String replaceString=message.replace("'","\\'");
		String sender=(String)session.getAttribute("sessuid");
		int privatestatus=1;
				Statement stmt=con1.createStatement();
		int query=stmt.executeUpdate("insert into private_chat(Sender,Reciever,Message,Date,Time,Status) values('"+sender+"','"+receiver+"','"+replaceString+"','"+strDate+"','"+dateString+"',"+privatestatus+")");
		String sql = "delete from dummy_private_chat where Sender=? and Reciever=? or Sender=? and Reciever=?";
		PreparedStatement pstm = con1.prepareStatement(sql);
		pstm.setString(1,sender);
		pstm.setString(2, receiver);
		pstm.setString(3,receiver);
		pstm.setString(4, sender);
		pstm.execute();
		Statement stmtt=con1.createStatement();
		int query1=stmtt.executeUpdate("insert into dummy_private_chat(Sender,Reciever,Message,Date,Time) values('"+sender+"','"+receiver+"','"+replaceString+"','"+strDate+"','"+dateString+"')");
		//HttpSession session = request.getSession();
		String utype = (String) session.getAttribute("utype");
		if(utype.equals("Faculty"))
		{
			response.sendRedirect("Facultychats.jsp?uname="+receiver);
			
		}
		else if(utype.equals("Student"))
		{
			response.sendRedirect("Facultychats.jsp?uname="+receiver);
			
			
		}
		else if(utype.equals("College Admin"))
		{
			response.sendRedirect("CollegeAdminchats.jsp?uname="+receiver);
			
			
		}
		}
		catch(Exception e)
		{
		out.println(e.getMessage());
		}
	}

}
