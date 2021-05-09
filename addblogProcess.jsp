<%@ page import ="java.sql.*" %>
<%
    try{
        String title = request.getParameter("title");
        String catid = request.getParameter("category");
        String description = request.getParameter("description");
        String content = request.getParameter("content");
        String authid = request.getParameter("authid");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?" + "user=root&password=");    
        PreparedStatement pst = conn.prepareStatement("Select * FROM blogs WHERE title = '"+title+"'");
        ResultSet rs = pst.executeQuery();                        
        if(!rs.next())           
          {  
            PreparedStatement pst1 = conn.prepareStatement("INSERT INTO `blogs`(`catid`,`title`, `description`,`content`,`authid` ) VALUES ('"+catid+"','"+title+"','"+description+"','"+content+"','"+authid+"')");
            int rsi = pst1.executeUpdate();  
            request.setAttribute("sucessmsg","You have successfully added a new blog!");    
            request.getRequestDispatcher("admin.jsp").forward(request,response);        
          }
          else
            request.setAttribute("errormsg","A blog with this title already exists!");    
            request.getRequestDispatcher("addblog.jsp").forward(request,response);        
            rs.close();
            pst.close();  
          }catch(Exception e)
      {       
      out.println(e);      
      }
%>