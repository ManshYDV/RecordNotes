<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recorded Notes</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link href="css/style.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
</head>
<body>
<div class="container-fluid p-0 m-0">
    <%@include file="navbar.jsp" %> 
    <br>
    <h2 class="text_uppercase">All Notes</h2>
    <div class="row">
    <div class="col-12">
    <%
    Session sess=FactoryProvider.getFactory().openSession();
    Query q= sess.createQuery("from Todo");
    List<Todo> note=q.list();
    for(Todo n:note){
    	%>
    	
    	<div class="card lead mt-3">
  <div class="card-body lead">
  <img class="card-img-top m-2" style="max-width:50px;" src="image/pencil.png" alt="Card image cap">
    <h5 class="card-title "><%=n.getTitle() %></h5>
   <%--   <%@ page import="java.time.LocalDate, java.time.ZoneId, java.time.Instant, java.time.format.DateTimeFormatter, java.util.Date" %>
<%
    Date date = n.getAddedDate();
    LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // Change format as needed
    String formattedDate = localDate.format(formatter);
%>--%>
<!--  <h6 class="card-subtitle mb-2 text-muted"><b><%--<%=formattedDate %>--%></b></h6>-->
    
    <h6 class="card-subtitle mb-2 text-muted"><b class="text-primary"><%=n.getAddedDate() %></b></h6>
    <h6 class="card-subtitle mb-2 text-muted"><%=n.getId() %></h6>
    <p class="card-text"><%=n.getContent() %></p>
 
    <!-- <a href="#" class="card-link">Card link</a>-->
    <div class="d-flex mr-3">
      <div class="ml-auto mr-3">
        <a href="DeleteServlet?note_id=<%=n.getId()%>" class="btn btn-danger mr-2">Delete</a>
        <a href="edit.jsp?note_id=<%=n.getId() %>" class="btn btn-primary">Update</a>
      </div>
    </div>
  </div>
</div>
    	<%
    }
    sess.close();
    %>
    </div>
    </div>
    </div>
</body>
</html>