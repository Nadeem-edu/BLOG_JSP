<%@ page import ="java.sql.*" %>
<%
    try{
        String title = request.getParameter("title");
        String catid = request.getParameter("category");
        String description = request.getParameter("description");
        String content = request.getParameter("content");
        String authid = request.getParameter("authid");
        String blogid = request.getParameter("blogid");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?" + "user=root&password=");    
            PreparedStatement pst1 = conn.prepareStatement("UPDATE `blogs` SET `catid`='"+catid+"',`title`='"+title+"',`description`='"+description+"',`content`='"+content+"' WHERE blogid='"+blogid+"'");

            int rsi = pst1.executeUpdate();  
            request.setAttribute("sucessmsg","You have successfully edited your blog!");    
            request.getRequestDispatcher("admin.jsp").forward(request,response);              
            
            pst1.close();  
          }catch(Exception e)
      {       
      out.println(e);      
      }
%>