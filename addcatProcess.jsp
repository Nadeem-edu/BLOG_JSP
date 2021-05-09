<%@ page import ="java.sql.*" %>
<%
    try{
        String addcat = request.getParameter("addcat");
        String name = addcat.toUpperCase();
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?" + "user=root&password=");    
        PreparedStatement pst = conn.prepareStatement("Select * FROM category WHERE name = '"+name+"'");
        ResultSet rs = pst.executeQuery();                        
        if(!rs.next())           
          {  
            PreparedStatement pst1 = conn.prepareStatement("INSERT INTO `category`(`name`) VALUES ('"+name+"')");
            int rsi = pst1.executeUpdate();  
            request.setAttribute("sucessmsg","You have successfully added a new category!");    
            request.getRequestDispatcher("addcat.jsp").forward(request,response);        
          }
          else
            request.setAttribute("errormsg","This category already exists!");    
            request.getRequestDispatcher("addcat.jsp").forward(request,response);        
            rs.close();
            pst.close();  
          }catch(Exception e)
      {       
      out.println(e);      
      }
%>