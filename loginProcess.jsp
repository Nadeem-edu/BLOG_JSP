<%@ page import ="java.sql.*" %>
<%
    try{
        String userdbName;
        String userdbEmail;
        String userdbPsw;
        String dbUsertype;
        String dbUserID;
        String email = request.getParameter("email");   
        String pswd = request.getParameter("pswd");
        String admin = "admin";
        String user = "user";
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?" + "user=root&password=");    
        PreparedStatement pst = conn.prepareStatement("Select * from users where email=? and pswd=?");
        pst.setString(1, email);
        pst.setString(2, pswd);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())           
          {  
          userdbName = rs.getString("name");
          userdbEmail = rs.getString("email");
          userdbPsw = rs.getString("pswd");
          dbUsertype = rs.getString("type");
          dbUserID = rs.getString("id");
          
          if(email.equals(userdbEmail) && pswd.equals(userdbPsw) && admin.equals(dbUsertype))
          {
            session.setAttribute("name",userdbName);
            session.setAttribute("email",userdbEmail);
            session.setAttribute("usertype",dbUsertype);  
            session.setAttribute("userid",dbUserID);
            response.sendRedirect("admin.jsp"); 
          }      
          else
            session.setAttribute("name",userdbName);
            session.setAttribute("email",userdbEmail);
            session.setAttribute("usertype",dbUsertype);
            session.setAttribute("userid",dbUserID);  
            response.sendRedirect("home.jsp");       
          }
          else
            request.setAttribute("errormsg","Invalid Credientials");    
            request.getRequestDispatcher("/login.jsp").forward(request,response);        
            rs.close();
            pst.close();  
          }catch(Exception e)
      {       
      out.println(e);      
      }
%>