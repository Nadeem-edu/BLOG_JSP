<%@ page import ="java.sql.*" %>
<% 
String name=(String)session.getAttribute("name"); 
String userid=(String)session.getAttribute("userid"); 
String usertype = (String)session.getAttribute("usertype");
if((!(usertype.equals("admin"))))
{
  response.sendRedirect("home.jsp");
}
Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?" + "user=root&password="); 
%>
<!DOCTYPE html>
<html>
<head>
  <title>Admin-Add Blog</title>
    
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
<!------ Include the above in your HEAD tag ---------->
   
  <!--Bootsrap 4 CDN-->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

  <!--Custom styles-->
  <link rel="stylesheet" type="text/css" href="styles1.css">
</head>
<body>
  <div>
<div class="container" style="width: 100%; margin: 0px; padding: 0px; z-index:1000; position: fixed; top:0; left:0; max-width: 100%; height: auto;">
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: rgba(0,0,0,0.5) !important; position: relative; width: 100%; margin: 0px; padding: 5px;">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="#">Techie Temple</a>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
      <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
        <li class="nav-item active">
          <a class="nav-link active" href="#">Admin Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logout.jsp">Logout</a>
        </li>
      </ul>
    </div>
    <div style="color: white; margin-right: 50px;">
      Welcome, ${name}
      </div>
</nav>
</div>
<div class="container" style="margin-top:60px; z-index: 1; max-width: 100%;">
  <div class="row" style="position: relative; background-color: rgba(0,0,0,0); margin-top: 10px;">
    <div class="col-md-4">
      <div class="contri">
        <h3>Dashboard</h3>
        <hr>
        <ul class="nav nav-pills nav-stacked" style="width: 100%;">
          <li class="nav-item" style="width: 100%;">
          <a class="nav-link pilled active" href="addblog.jsp">Add Blog</a>
          </li>
          <li class="nav-item" style="width: 100%;">
          <a class="nav-link pilled" href="admin.jsp">View Blogs</a>
          </li>
          <li class="nav-item" style="width: 100%;">
          <a class="nav-link pilled" href="addcat.jsp">Add Category</a>
          </li>
          </ul>
      </div>
      <div class="contri">
        <h3>Server Messages</h3>
        <hr>
        <div style="background-color: rgba(0,0,0,0.9); margin: 10px; min-height: 100px; padding-top: 10px;">
        <span style="color: green;">${sucessmsg}</span>
        <span style="color: red;">${errormsg}</span>
        </div>  
      </div>
    </div>
    <div class="col-md-8 scroll scrollbar scrollbar-sunny-morning">
      <div class="card text-center">
        <div class="card-header">
        Add a new blog
        </div>
        <div class="card-body">
          <form action="addblogProcess.jsp" method="post">
            <div class="input-group form-group">
            <p style="margin: 5px;">Select a Category:</p> 
            <select name="category" style="font-size: 14px; margin-left: 5px;">
              <%
        PreparedStatement ps = conn.prepareStatement("SELECT * from category");
        ResultSet rs1 = ps.executeQuery();
        while(rs1.next()){                       
%>
      
        <option value="<%=rs1.getString("id")%>"><%=rs1.getString("name")%></option>
<% } %>
            </select>
          </div>
          <div class="input-group form-group">
            <input type="text" class="form-control" placeholder="Title" name="title" required>
          </div>
          <div class="input-group form-group">
            <input type="textarea" class="form-control" placeholder="Description" name="description" required>
            <input type="hidden" class="form-control" name="authid" value="<%=userid%>" required>
          </div>
          <div class="input-group form-group">
            <textarea rows="15" cols="auto" name="content" class="form-control" placeholder="Enter your content here" style=" overflow-y: scroll; resize: none;" required></textarea>
          </div>
        </div>
        <div class="card-footer text-muted">
        <div class="form-group">
            <input type="submit" value="Post" class="btn float-right login_btn" style="margin-left: 7px;">          
            <input type="reset" name="Cancel" class="btn float-right btn-danger">
            
          </div>
        </form>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</body>
</html>