<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link href="css/style.css" rel="stylesheet" />
	 <%@include file="all_css.jsp" %> 
	<title>Add Notes</title>
  </head>
  <body>
	<div class="container-fluid p-0 m-0">
    <%@include file="navbar.jsp" %> 
    </div>
    <h4>&nbsp;&nbsp; Please record your notes </h4>
    <!--this is a form start -->
	<form style="max-width: 5000px; margin: auto; padding: 20px;" action="SaveNoteServlet" method="post">
  <div class="form-group">
    <label for="title">Note Title</label>
    <input type="text" name="title" class="form-control" id="title"  placeholder="Enter here" required>
  </div>
  <div class="form-group">
    <label for="content">Note content</label>
    <textarea required name="content" id="content" placeholder="Enter your note content here" class="form-control" style="height:300px" ></textarea>
      </div>
  
  <div class="container text-center">
  <button type="add" class="btn btn-primary" style="width:100px; height:50px;">Add</button></div>
</form>
</body>
</html>