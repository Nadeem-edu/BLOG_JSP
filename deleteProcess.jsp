<%@ page import ="java.sql.*" %>
<%
    try{
        String delete = request.getParameter("delete");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?" + "user=root&password=");    
        PreparedStatement pst = conn.prepareStatement("Delete FROM blogs WHERE blogid = '"+delete+"'");
        int rs = pst.executeUpdate();  
        request.setAttribute("sucessmsg","You have successfully deleted your blog!");    
        request.getRequestDispatcher("admin.jsp").forward(request,response);                       
        }catch(Exception e)
      {       
      out.println(e);      
      }
%>