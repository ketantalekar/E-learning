package com.Data;
import com.Data.*;

//import java.io.PrintWriter;
import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;

import javax.servlet.http.*;

//import javax.xml.ws.Response;  
public class CollegeDao {
	public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-learning","root","");  
            //PrintWriter out=response.getWriter();
        }catch(Exception e){System.out.println(e);}  
        return con;  
    }  
  
    public static List<College> getRecords(int start,int total){  
    	HttpServletResponse response = null;
    	String message="";
        List<College> list=new ArrayList<College>();  
        try{  
        //	int id1=0;
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement("select college_id,college_name,college_address,college_code from college_details limit "+(start-1)+","+total);  
            ResultSet rs=ps.executeQuery();  
            if (rs.next() == false) 
            { 
            	message="No records Found";
            	response.sendRedirect("College_Details.jsp?message="+message);
            	}
            else 
            { 
            	do 
            	{ 
            		College e=new College();  
                    e.setCollege_id(rs.getInt(1));
                   
                   e.setCollege_name(rs.getString(2));  
                   //e.setAdmin_name(rs.getString(2));  
                   e.setAddress(rs.getString(3));  
                   e.setCollege_code(rs.getString(4));
                   
                   list.add(e);  
                
            		} 
            	while (rs.next()); 
            	}

            con.close(); 
            
              
        }catch(Exception e){System.out.println(e.getMessage());}  
        return list;  
    }
    public static List<College> getAdmin(int start,int total){  
        List<College> list=new ArrayList<College>();  
        try{  
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement("Select Username,College_name,Email_Id,Mobile_No,Address,College_Code from college_admin_details limit "+(start-1)+","+total);  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                College e=new College();
            
                e.setCollege_name(rs.getString(1));  
                //e.setAdmin_name(rs.getString(2));  
                e.setAddress(rs.getString(2)); 
                list.add(e);  
            }  
            con.close();  
        }catch(Exception e){System.out.println(e);}  
        return list;  
    }  
}
