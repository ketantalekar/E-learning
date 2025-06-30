

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
 * Servlet implementation class FacultyEditQuiz
 */
@WebServlet("/FacultyEditQuiz")
public class FacultyEditQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacultyEditQuiz() {
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
		PrintWriter out=response.getWriter();
        try{  
        	String quiztitle=request.getParameter("quiztitle");
            out.print(quiztitle); 
            int qid=Integer.parseInt(request.getParameter("qid"));
            String qname=request.getParameter("qname");
            
        	HttpSession session = request.getSession();
			
            Class.forName("com.mysql.jdbc.Driver");  
            String collegename=(String)session.getAttribute("colcode");
            out.print(collegename);
            Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
            String subject=(String)session.getAttribute("subjectname");
            out.print(subject);
            String subject1=(String)session.getAttribute("subjectname1");
            out.print(subject1);
            String quiztime = request.getParameter("quiztime");
            DateFormat df = new SimpleDateFormat("HH:mm");
            //Date/time pattern of desired output date
            DateFormat outputformat = new SimpleDateFormat("hh:mm aa");
            Date date = null;
            String output = null;
            		date= df.parse(quiztime);
            //old date format to new date format
      	  output = outputformat.format(date);
            out.println(output);
          DateFormat df2=new SimpleDateFormat("yyyy-MM-dd");
            String quizdat=request.getParameter("quizdate");
            out.println(quizdat);
            Date d2=null;
            DateFormat formatter1 = new SimpleDateFormat("dd/MM/yyyy");  
            d2=df2.parse(quizdat);
    	    String quizdate= formatter1.format(d2); 
    	   
           out.println(quizdate);
           
            String description=request.getParameter("description");
            String preview=request.getParameter("preview");
            String faculty_name=(String)session.getAttribute("sessname");
            String uid=(String)session.getAttribute("sessuid");
            String department="",st="0",st2="0";
            Date dt = new Date();  
    	    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
    	    String strDate= formatter.format(dt);  
    	   String timelimi=request.getParameter("timelimit1");
    	   out.println(timelimi);
    	   out.println(st);
    	   out.println(st2);
    	   String timelimi2=request.getParameter("timelimit2");
    	   if(timelimi.length()==0 && timelimi2.length()==0)
    	   {
    		   String message="Please enter time limit";
               response.sendRedirect("FacultySubjectQuiz.jsp?error="+message);
    	   }
    	   else
    	   {
    	   if(timelimi.length()==0)
    	   {
    		st="0";   
    		out.println(st);
    	   }
    	   else if(timelimi.length()>0)
    	   {
    		   st=timelimi;
    	   }
    	   if(timelimi2.length()==0)
    	   {
    		st2="0";   
    	   }
    	   else if(timelimi2.length()>0)
    	   {
    		   st2=timelimi2;
    	   }
    	   String hrmin=request.getParameter("hr");
    	   String min=request.getParameter("min");
    	   String timelimit1=st+" "+hrmin;
    	   String timelimit2=st2+" "+min;
    	   String timelimit=timelimit1+" "+timelimit2;
    	   
           String query="Select Department from subject_details where Userid=? and Subject_code=?";
            PreparedStatement ps4=con1.prepareStatement(query);
            ps4.setString(1,uid);
            ps4.setString(2, subject1);
            ResultSet rs4=ps4.executeQuery();
            while(rs4.next())
            {
            //out.println();
            department=rs4.getString(1);
            }
            String sql = "Update quiz_info set title=?,quiz_date=?,quiz_time=?,time_limit=?,description=?,Preview=? where subject=? and Faculty_Name=? and Department=? and id=?";
            PreparedStatement pstm = con1.prepareStatement(sql);

            //Long id = this.getMaxAttachmentId(con) + 1;
            pstm.setString(1,quiztitle);
            pstm.setString(2,quizdate);
            pstm.setString(3,output);
            pstm.setString(4,timelimit);
            pstm.setString(5,description);
            pstm.setString(6,preview);
            
            pstm.setString(7, subject1);
            
            pstm.setString(8,uid);
            pstm.setString(9,department );
            pstm.setInt(10,qid);
            pstm.executeUpdate();
            
            String sql2="Update quiz_questions set title=? where title=? and Subject_code=?";
            PreparedStatement pstm2 = con1.prepareStatement(sql2);

            //Long id = this.getMaxAttachmentId(con) + 1;
            pstm2.setString(1,quiztitle);
            pstm2.setString(2,qname);
            pstm2.setString(3,subject1);
            pstm2.executeUpdate();
            String sql3="Update quizresult set title=? where title=? and Subject_code=?";
            PreparedStatement pstm3 = con1.prepareStatement(sql3);

            //Long id = this.getMaxAttachmentId(con) + 1;
            pstm3.setString(1,quiztitle);
            pstm3.setString(2,qname);
            pstm3.setString(3,subject1);
            pstm3.executeUpdate();
            
            String sql4="Update finalquiz set title=? where title=? and Subject_code=?";
            PreparedStatement pstm4 = con1.prepareStatement(sql4);

            //Long id = this.getMaxAttachmentId(con) + 1;
            pstm4.setString(1,quiztitle);
            pstm4.setString(2,qname);
            pstm4.setString(3,subject1);
            pstm4.executeUpdate();


            String uid1="";
 	       int qstatus=0;
 	       int addstatus=0;
 	       String query4="select Userid,QuizStatus from student_subject where Subject_code=?";
 	     PreparedStatement ps5=con1.prepareStatement(query4);
 	     ps5.setString(1,subject1);
 	     ResultSet rs5=ps5.executeQuery();
 	     while(rs5.next())
 	     {
 	    	 addstatus=1;
 	    	 uid1=rs5.getString(1);
 	    	 qstatus=rs5.getInt(2);
 	    	 addstatus=addstatus+qstatus;
 	    	 PreparedStatement ps6=con1.prepareStatement("Update student_subject set QuizStatus=? Where Userid=? and Subject_code=?");
 	    	 ps6.setInt(1,addstatus);
 	    	   ps6.setString(2,uid1);
 	    	   ps6.setString(3,subject1);
 	    	  
 	    	   int row3=ps6.executeUpdate();
 	    	 
 	     }
            
            
            
            String message="Quiz updated successfully";
            response.sendRedirect("FacultySubjectQuiz.jsp?message="+message);
            
    	   }
           
        }
        catch (Exception e) {
        	out.println(e.getMessage());
        	String message="Failed to update quiz";
            response.sendRedirect("FacultySubjectQuiz.jsp?error="+message);
            //e.printStackTrace();
            //request.setAttribute("errorMessage", "Error: " + e.getMessage());
            //RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/FacultySubjectAssignment.jsp");
            //dispatcher.forward(request, response);
        }
		
	}

}
