<%@ page import ="java.sql.*" %>
<%
    try{
        String username = request.getParameter("username");
        String email = request.getParameter("email");   
        String pswd = request.getParameter("pswd");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?" + "user=root&password=");    
        PreparedStatement pst = conn.prepareStatement("Select * FROM users WHERE email = '"+email+"'");
        ResultSet rs = pst.executeQuery();                        
        if(!rs.next())           
          {  
            PreparedStatement pst1 = conn.prepareStatement("INSERT INTO `users`(`email`, `name`, `pswd`) VALUES ('"+email+"','"+username+"','"+pswd+"')");
            int rsi = pst1.executeUpdate();  
            request.setAttribute("sucessmsg","You have successfully been registered! Please login to continue!");    
            request.getRequestDispatcher("login.jsp").forward(request,response);        
          }
          else
            request.setAttribute("errormsg","Email ID already exists in our DB!");    
            request.getRequestDispatcher("register.jsp").forward(request,response);        
            rs.close();
            pst.close();  
          }catch(Exception e)
      {       
      out.println(e);      
      }
%>