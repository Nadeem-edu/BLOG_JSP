<%
String name=(String)session.getAttribute("name"); 
String usertype = (String)session.getAttribute("usertype");
if((!(usertype.equals("user") || usertype.equals("admin"))))
{
  response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
  <title>About</title>
    
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
          <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#">About</a>
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
    <div class="col-md-6">
      <div class="card text-center">
        <div class="card-header">
        <h4><b>Nadeem Shaikh</b></h4>
        </div>
        <div class="card-header">
          <ul class="nav nav-pills card-header-pills">
          <li class="nav-item">
          <a class="nav-link pilled active" href="#" id="nadeemper">Personal</a>
          </li>
          <li class="nav-item">
          <a class="nav-link pilled" href="#" id="nadeempro">Professional</a>
          </li>
          <li class="nav-item">
          <a class="nav-link pilled" href="#" id="nadeemint">Interests</a>
          </li>
          </ul>
        </div>
        <div class="card-body" id="nsper" style="height: 262px;">
          <img src="img_avatar.png" alt="Avatar" style="width:100px; border-radius: 50%; margin-bottom: 10px;">
        <h5 class="card-title"><b>Nadeem Shaikh</b></h5>
        <p class="card-text">24 years old <br>Lives in Yerwada, Pune <br>Second year MCA student at Allana Institute of Management Studies</p>
        </div>
        <div class="card-body" id="nspro" style="height: 262px;">
        <h5 class="card-title"><b>Education</b></h5>
        <p class="card-text">BCA from Pune University with Grade A<br></p>
        <h5 class="card-title"><b>Experience</b></h5>
          <p class="card-text">Web app in JSP<br> Web apps in PHP using CodeIgnitor and Larvel frameworks</p>
        </div>
        <div class="card-body" id="nsintr" style="height: 262px;">
        <h5 class="card-title"><b>Interests</b></h5>
        <p class="card-text">Enjoys solving complex problems<br>Movie buff<br> Loves talking about sports</p>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="card text-center">
        <div class="card-header">
        <h4><b>Jeremy Lobo</b></h4>
        </div>
        <div class="card-header">
          <ul class="nav nav-pills card-header-pills">
          <li class="nav-item">
          <a class="nav-link pilled active" href="#" id="jeremyper">Personal</a>
          </li>
          <li class="nav-item">
          <a class="nav-link pilled" href="#" id="jeremypro">Professional</a>
          </li>
          <li class="nav-item">
          <a class="nav-link pilled" href="#" id="jeremyint">Interests</a>
          </li>
          </ul>
        </div>
        <div class="card-body" id="jlper" style="height: 262px;">
        <img src="img_avatar.png" alt="Avatar" style="width:100px; border-radius: 50%; margin-bottom: 10px;">
        <h5 class="card-title"><b>Jeremy Lobo</b></h5>
        <p class="card-text">29 years old <br>Lives in Sopan Baug, Pune <br>Second year MCA student at Allana Institute of Management Studies</p>
        </div>
        <div class="card-body" id="jlpro" style="height: 262px;">
        <h5 class="card-title"><b>Education</b></h5>
        <p class="card-text">BCA from Symboisis International University with 2.79 out of 4.00 GPA<br>B.Ed from Pune University with Grade A</p>
        <h5 class="card-title"><b>Experience</b></h5>
          <p class="card-text">Web app in JSP<br> Web apps in PHP using CodeIgnitor and Larvel frameworks</p>
        </div>
        <div class="card-body" id="jlintr" style="height: 262px;">
        <h5 class="card-title"><b>Interests</b></h5>
        <p class="card-text">Loves reading books<br>Enjoys playing football<br> Passionate about sports and theology <br>Loves experimenting with food choices</p>
        </div>
      </div>
    </div>
    </div>
   </div>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("#nspro").hide();
    $("#nsintr").hide();
    $("#jlpro").hide();
    $("#jlintr").hide();

  $("#nadeemper").click(function(){
    $("#nsper").show();
    $("#nspro").hide();
     $("#nsintr").hide();
    $("#nadeemper").addClass('active');
    $("#nadeempro").removeClass('active');
    $("#nadeemint").removeClass('active');
  });
  $("#nadeempro").click(function(){
    $("#nspro").show();
    $("#nsper").hide();
     $("#nsintr").hide();
    $("#nadeemper").removeClass('active');
    $("#nadeemint").removeClass('active');
    $("#nadeempro").addClass('active');
  });
  $("#nadeemint").click(function(){
    $("#nspro").hide();
    $("#nsper").hide();
     $("#nsintr").show();
    $("#nadeemper").removeClass('active');
    $("#nadeemint").addClass('active');
    $("#nadeempro").removeClass('active');
  });

  $("#jeremyper").click(function(){
    $("#jlper").show();
    $("#jlpro").hide();
     $("#jlintr").hide();
    $("#jeremyper").addClass('active');
    $("#jeremypro").removeClass('active');
    $("#jeremyint").removeClass('active');
  });
  $("#jeremypro").click(function(){
    $("#jlpro").show();
    $("#jlper").hide();
     $("#jlintr").hide();
    $("#jeremyper").removeClass('active');
    $("#jeremyint").removeClass('active');
    $("#jeremypro").addClass('active');
  });
  $("#jeremyint").click(function(){
    $("#jlpro").hide();
    $("#jlper").hide();
     $("#jlintr").show();
    $("#jeremyper").removeClass('active');
    $("#jeremyint").addClass('active');
    $("#jeremypro").removeClass('active');
  });
});
</script>
</body>
</html>