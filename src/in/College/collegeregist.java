package in.College;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import in.common.GetConnection;
import in.common.hashed;
import in.common.img;


/**
 * Servlet implementation class collegeregistration
 */
@WebServlet("/collegeregist")
@MultipartConfig()
public class collegeregist extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private int pk_city_id;
	private Connection con;

	private PreparedStatement stmt,stmt1,stmt2,stmt3,stmt4,stmt5,stmt6,stmt7,stmt8;

	private int  pk_address_id, pk_affilation_id, pk_authentication_id ;

	public void init(ServletConfig config) throws ServletException 
	{
    GetConnection getConObj=new GetConnection();
    con=getConObj.getCon();
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		
			
 
		Random rnd = new Random();
        int number = rnd.nextInt(99999999);
        try 
		{
		  
		String cname = request.getParameter("cname")!= null ? request.getParameter("cname") : "";
		int  uninum = Integer.parseInt(request.getParameter("uniname")!= null ? request.getParameter("uniname") : "");
		String dname = request.getParameter("dname")!= null ? request.getParameter("dname") : "";
		int type = Integer.parseInt(request.getParameter("ctype")!= null ? request.getParameter("ctype") : "");
		int fax= Integer.parseInt(request.getParameter("cfax")!= null ? request.getParameter("cfax") : "");
		int category = Integer.parseInt(request.getParameter("ccategory")!= null ? request.getParameter("ccategory") : "");
		String user = request.getParameter("uname")!= null ? request.getParameter("uname") : "";
		String email = request.getParameter("email")!= null ? request.getParameter("email") : "";
	   String  num = request.getParameter("num")!= null ? request.getParameter("num") : "";
		int year = Integer.parseInt(request.getParameter("year")!= null ? request.getParameter("year") : "");
		String address = request.getParameter("address")!= null ? request.getParameter("address") : "";
		String cntry =request.getParameter("cntry")!= null ? request.getParameter("cntry") : "";
        int state = Integer.parseInt(request.getParameter("state")!= null ? request.getParameter("state") : "");
		String city = request.getParameter("city")!= null ?  request.getParameter("city") : "";
		int pincode = Integer.parseInt(request.getParameter("pincode")!= null ? request.getParameter("pincode") : "11/01/2000");
		int Anumber = Integer.parseInt(request.getParameter("Anumber")!= null ? request.getParameter("Anumber") : "11/01/2000");
		Part pdf = request.getPart("pdf");
		Part pic = request.getPart("pic");
		String pass = request.getParameter("pass")!= null ? request.getParameter("pass") : "";
		 
		
		String filename = pdf.getSubmittedFileName();
		String filename1 = pic.getSubmittedFileName();
		out.println(city);
		
		
		String reg_num ="col" + number ;
		
		
		hashed hash = new hashed();
		String Hashed =hash.getHash(pass);
		
		img image=new img();
		String pdfname = image.image(filename, pdf);
		String picname = image.image(filename1, pic);
		
		
		//fetch city pk_id
		
		String sql="select pk_id from city where fk_state_id ='"+state+"' ";
		System.out.println(sql);
		 stmt = con.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery(sql);
		 
		if(rs.next())
		{
			  pk_city_id = rs.getInt(1);
			  
		}
		else
		{
			
			out.println("Data Not Found");
		}
		
		
		
		
		
		String sql1="insert into college_address(address,pincode,fk_city_id,fk_college_id) values (?,?,?,?)";
		
				
				
				 stmt1 = con.prepareStatement(sql1);
				stmt1.setString(1,address);
				stmt1.setInt(2,pincode);
				stmt1.setInt(3,pk_city_id);
				stmt1.setString(4,reg_num);
				
				
				 int res = stmt1.executeUpdate();
			if(res>0)
				{
				String sql6="select pk_id from college_address ORDER BY pk_id  DESC Limit 1";
				System.out.println(sql6);
				 stmt6 = con.prepareStatement(sql6);
				ResultSet rs1 = stmt6.executeQuery(sql6);
					
				if(rs1.next())
				{
					 pk_address_id = rs1.getInt(1);
				}
				else
				{
					
					out.println("Data Not Found");
				}	}
			
		// insert college affilation value		
	          String sql2="insert into college_affilation(affilation_num,affilation_pdf,college_image,fk_college_id)values(?,?,?,?)";
		
				
				stmt2 = con.prepareStatement(sql2);
				stmt2.setInt(1,Anumber);
				stmt2.setString(2,pdfname);
				stmt2.setString(3,picname);
				stmt2.setString(4,reg_num);
				
				
				int res2 = stmt2.executeUpdate();
//				if(res2>0)
//				{
//					out.println("<html><body><script>alert('Data Enter');</script></body></html>");
//				}
//				else
//				{
//					out.println("<html><body><script>alert('Some Thing Went Wrong');</script></body></html>");
//				}
//				
                
				// insert data into registration table
				String sql3="insert into user (name,email,username,password)values(?,?,?,?)";
		
				
				
				stmt3 = con.prepareStatement(sql3);
				stmt3.setString(1,cname);
				stmt3.setString(2,email);
				stmt3.setString(3,user);
				stmt3.setString(4,Hashed);
				
				
				int res3 = stmt3.executeUpdate();
//				if(res3>0)
//				{
//					out.println("<html><body><script>alert('Data Enter');</script></body></html>");
//				}
//				else
//				{
//					out.println("<html><body><script>alert('Some Thing Went Wrong');</script></body></html>");
//				}
			//fetch the fk_address_id
				
//				String sql6="select pk_id from college_address where fk_college_id='"+reg_num+"' ";
//				System.out.println(sql6);
//				 stmt6 = con.prepareStatement(sql6);
//				ResultSet rs1 = stmt6.executeQuery(sql6);
//					
//				if(rs1.next())
//				{
//					 pk_address_id = rs1.getInt(1);
//				}
//				else
//				{
//					
//					out.println("Data Not Found");
//				}
				
				//fetch the fk_affilation_id
				
				String sql7="select pk_id from college_affilation where fk_college_id='"+reg_num+"' ";
				System.out.println(sql7);
				 stmt7 = con.prepareStatement(sql7);
				 ResultSet rs2 = stmt7.executeQuery(sql7);
				 if(rs2.next())
				{
					 pk_affilation_id = rs2.getInt(1);
				}
				else
				{
					
					out.println("Data Not Found");
				}
				
			//fetch fk_authentication_id	
				
				String sql8="select id from user where username='"+user+"' ";
				System.out.println(sql8);
				 stmt8 = con.prepareStatement(sql8);
				 ResultSet rs3 = stmt8.executeQuery(sql8);
				 
				if(rs3.next())
				{
					 pk_authentication_id = rs3.getInt(1);
				}
				else
				{
					
					out.println("Data Not Found");
				}
				
			// college registration data inserted	
				 String sql5="insert into college_registration"
				 		+ "(registration_number,college_name,Dean_name,Username,Email,Fax_num,phone_num,Est_year,"
				 		+ "fk_address_id,fk_university_id,fk_ctype_id,fk_catagory_id,fk_affilation_id,fk_authentication_id)"
				 		+ "value(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					
					
					
				 stmt5 = con.prepareStatement(sql5);
				stmt5.setString(1,reg_num);
				stmt5.setString(2,cname);
				stmt5.setString(3,dname);
				stmt5.setString(4,user);
				stmt5.setString(5,email);
				stmt5.setInt(6,fax);
				stmt5.setString(7,num);
				stmt5.setInt(8,year);
				stmt5.setInt(9,pk_address_id);
				stmt5.setInt(10,uninum);
				stmt5.setInt(11,type);
				stmt5.setInt(12,category);
				stmt5.setInt(13,pk_affilation_id);
				stmt5.setInt(14,pk_authentication_id);
				
				
			    int res5 = stmt5.executeUpdate();
				if(res5>0)
				{
					out.println("<html><body><script>alert('Data Enter registration no is' + + );</script></body></html>");
				}
				else
				{
					out.println("<html><body><script>alert('Some Thing Went Wrong');</script></body></html>");
				}
				
               	
				
				
				
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch(NullPointerException e)
		{
			e.printStackTrace();
		}
		
	
	}

}
