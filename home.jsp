<%@ page import ="java.sql.*" %>
<% 
String name=(String)session.getAttribute("name"); 
String usertype=(String)session.getAttribute("usertype");
String email = (String)session.getAttribute("email");
String user = "user";

if((!(usertype.equals("user") || usertype.equals("admin"))))
{
  response.sendRedirect("login.jsp");
}
else
Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?" + "user=root&password=");    
PreparedStatement pst = conn.prepareStatement("SELECT blogs.*, users.name as username, category.name as category FROM blogs INNER JOIN category ON blogs.catid = category.id INNER JOIN users ON blogs.authid = users.id");
ResultSet rs = pst.executeQuery();                        
%>
<!DOCTYPE html>
<html>
<head>
  <title>Home</title>
    
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
          <a class="nav-link active" href="#">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="about.jsp">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#">Contact Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logout.jsp">Logout</a>
        </li>
      </ul>
      <div style="color: white; margin-right: 50px;">
      Welcome, ${name}
      </div>
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
</nav>
</div>
<div class="container" style="margin-top:200px; z-index: 1; max-width: 100%;">
  <div class="row" style="position: fixed; width: 100%; background-color: rgba(0,0,0,0.5); z-index: 5; top:50px;">
    <div class="col-md-2"> 
    </div>
      <div class="col-md-7" style="text-align: center; color: #FFC312; ">
        <p>
          <h3>Welcome to the Techie Temple</h3>
          <p style="padding:10px 50px;">This blog is a one of kind blog which deals with all kinds of technology that Nadeem Shaikh is interested in.</p>
        </p>
      </div>
    <div class="col-md-3">  
    </div>
  </div>
  <div class="row" style="position: relative; background-color: rgba(0,0,0,0); margin-top: 10px;">
    <div class="col-md-2">
    </div>
    <div class="col-md-7 scroll scrollbar scrollbar-sunny-morning">
      <%
      while(rs.next()){
      String id = rs.getString("blogid");
      String title = rs.getString("title");
      String category = rs.getString("category");
      String description = rs.getString("description");
      String content = rs.getString("content");
      String username = rs.getString("username");
      String date = rs.getString("created");
    %>
      <div class="card text-center">
        <div class="card-header">
        <%=category%>
        </div>
        <div class="card-body">
          <h5 class="card-title"><%=title%></h5>
          <p class="card-text"><%=description%></p>
          <p class="card-text">By: <%=username%></p>
          <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#modal<%=id%>">Go to the article</a>
        </div>
        <div class="card-footer text-muted">
        Posted On: <%=date%>
        </div>
      </div>
<!-- Modal -->
<div class="modal fade" id="modal<%=id%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"><b><%=title%></b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p style="text-align: center; margin: 5px; font-size: 18px;"><%=content%></p>
        <small style="text-align: left;">Posted on: <%=date%></small>
      </div>
      <div class="modal-footer" style="display: inline-block; text-align: center;" >
        <p>Contributed by: <%=username%></p>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
    </div>
  </div>
</div>
      <%
            }
      %>
      <!-- <div class="card text-center">
        <div class="card-header">
        Category
        </div>
        <div class="card-body">
        <h5 class="card-title">This will be the Title</h5>
        <p class="card-text">Short Description of the blog</p>
        <a href="#" class="btn btn-primary">Go to the article</a>
        </div>
      <div class="card-footer text-muted">
        2 days ago
      </div>
      </div>
      <div class="card text-center">
  <div class="card-header">
    Category
  </div>
  <div class="card-body">
    <h5 class="card-title">This will be the Title</h5>
    <p class="card-text">Short Description of the blog</p>
    <a href="#" class="btn btn-primary">Go to the article</a>
  </div>
  <div class="card-footer text-muted">
    2 days ago
  </div>
</div>
      <div class="card text-center">
  <div class="card-header">
    Category
  </div>
  <div class="card-body">
    <h5 class="card-title">This will be the Title</h5>
    <p class="card-text">Short Description of the blog</p>
    <a href="#" class="btn btn-primary">Go to the article</a>
  </div>
  <div class="card-footer text-muted">
    2 days ago
  </div>
</div>
      <div class="card text-center">
  <div class="card-header">
    Category
  </div>
  <div class="card-body">
    <h5 class="card-title">This will be the Title</h5>
    <p class="card-text">Short Description of the blog</p>
    <a href="#" class="btn btn-primary">Go to the article</a>
  </div>
  <div class="card-footer text-muted">
    2 days ago
  </div>
</div> -->
    </div>
    <div class="col-md-3" style="position: fixed; right: 0;">
      <div class="contri">
        <h3>Our Contributers</h3>
        <hr>
        <img src="img_avatar.png" alt="Avatar" style="width:100px; border-radius: 50%;">
        <h5>Nadeem Shaikh</h5>
        <img src="img_avatar.png" alt="Avatar" style="width:100px; border-radius: 50%;">
        <h5>Jeremy Lobo</h5>
      </div>
    <div class="catsearch">
      <h4>Search by Category</h4>
      <hr>
      <select name="category">
<%
        PreparedStatement ps = conn.prepareStatement("SELECT * from category");
        ResultSet rs1 = ps.executeQuery();
        while(rs1.next()){                       
%>
      
        <option value="<%=rs1.getString("id")%>"><%=rs1.getString("name")%></option>
<% } %>
      </select>
      <button class="btn btn-primary" name="serachcat"><span class = "fa fa-search"></span></button>
    </div>
  </div>
</div>
</div>
</div>
</body>
</html>