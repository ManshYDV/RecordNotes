<%@page import="com.entities.Todo"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_css.jsp" %> 
 
</head>
<body>
 <div class="container-fluid p-0 m-0">
    <%@include file="navbar.jsp" %> 
    </div>
    <%
    int noteId=Integer.parseInt(request.getParameter("note_id").trim());
    Session sess=FactoryProvider.getFactory().openSession();
    Transaction txt=sess.beginTransaction();
    Todo todo=(Todo)sess.get(Todo.class, noteId);
    %>
    <form style="max-width: 5000px; margin: auto; padding: 20px;" action="UpdateServlet" method="post">
    <input value="<%=todo.getId() %>" name="todoId" type="hidden"/>
  <div class="form-group">
    <label for="title">Note Title</label>
    <input type="text" name="title" class="form-control" id="title"  placeholder="Enter here" required value="<%=todo.getTitle()%>">
  </div>
  <div class="form-group">
    <label for="content">Note content</label>
    <textarea required name="content" id="content" placeholder="Enter your note content here" class="form-control" style="height:300px"><%=todo.getContent() %></textarea>
      </div>
  
  <div class="container text-center">
  <button type="add" class="btn btn-outline-success" style="width:150px; height:50px;">Save Changes</button></div>
</form>
</body>
</html>