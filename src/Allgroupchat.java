

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
 * Servlet implementation class Allgroupchat
 */
 @WebServlet(name="Allgroupchat",urlPatterns= {"/Allgroupchat"})

public class Allgroupchat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Allgroupchat() {
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
         String sendername=(String)session.getAttribute("sessname");
		 String receiver=(String)session.getAttribute("searchgrpname");
		String message=request.getParameter("message1");
		String replaceString=message.replace("'","\\'");
		String sender=(String)session.getAttribute("sessuid");
				Statement stmt=con1.createStatement();
		int query=stmt.executeUpdate("insert into group_chat(Sender,Group_name,Message,Date,Time,Sendername) values('"+sender+"','"+receiver+"','"+replaceString+"','"+strDate+"','"+dateString+"','"+sendername+"')");
		//HttpSession session = request.getSession();
		
		
		
	     String mem="";
	      int ustatus=0;
	      int countstatus=0;
	       String query4="select Member,Status from group_notifications where Group_alias=?";
	     PreparedStatement ps5=con1.prepareStatement(query4);
	     ps5.setString(1,receiver);
	     ResultSet rs5=ps5.executeQuery();
	     while(rs5.next())
	     {
	    	 countstatus=1;
	    	 mem=rs5.getString(1);
	    	 ustatus=rs5.getInt(2);
	    	 countstatus=countstatus+ustatus;
	    	 PreparedStatement ps6=con1.prepareStatement("Update group_notifications set Status=? Where Member <> ? and Group_alias=?");
	    	 ps6.setInt(1,countstatus);
	    	   ps6.setString(2,(String)session.getAttribute("sessuid"));
	    	   ps6.setString(3,receiver);
	    	  
	    	   int row3=ps6.executeUpdate();
	    	 
	     }
		
		
		String utype = (String) session.getAttribute("utype");
		if(utype.equals("Faculty"))
		{
			response.sendRedirect("Facultychats.jsp?ok=ok&uname1="+receiver);
			
		}
		else if(utype.equals("Student"))
		{
			response.sendRedirect("Studentchats.jsp?ok=ok&uname1="+receiver);
			
			
		}
		else if(utype.equals("College Admin"))
		{
			response.sendRedirect("CollegeAdminchats.jsp?ok=ok&uname1="+receiver);

		}

		}
		catch(Exception e)
		{
		out.println(e.getMessage());
		}
	}

}
