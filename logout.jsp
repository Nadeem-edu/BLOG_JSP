<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<% session.invalidate();
request.setAttribute("logmsg","You have succesfully logged out!");    
request.getRequestDispatcher("login.jsp").forward(request,response);
 %>
