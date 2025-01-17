<%@page import="in.common.GetConnection"%>
<%@page import="jdk.nashorn.internal.codegen.LocalStateRestorationInfo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
   GetConnection getCon= new GetConnection();
	Connection con=getCon.getCon();
    System.out.print(con);
    
    if(request.getParameter("uname")!=null) //get "uname" jQuery & Ajax part this line 'data:"uname="+username' from index.jsp file check not null
    {
        String user_name=request.getParameter("uname"); //getable "uname" store in new "user_name variable"
        
        try
        {
            PreparedStatement pstmt=null; //create statement
            pstmt=con.prepareStatement("SELECT * FROM user WHERE username=? "); //sql select query
            pstmt.setString(1,user_name); //set where cluase condition username set is new user_name variable
            ResultSet rs=pstmt.executeQuery(); //execute query and set in ResultSet object "rs".
            
            if(rs.next())               
            {  
                %>
                <span class="text-danger">Sorry, <%rs.getString("username");%> Already Exists ! </span>
                
                <%
            }
            else
            {
                %>
                <span class="text-success">Username is available</span>
            
                <%
            }

            con.close(); //close connection
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
      
    }
   
%>
   