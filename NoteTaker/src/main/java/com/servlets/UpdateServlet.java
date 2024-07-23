package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Todo;
import com.helper.FactoryProvider;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			Session sess=FactoryProvider.getFactory().openSession();
			int id=Integer.parseInt(request.getParameter("todoId").trim());
			Transaction txt=sess.beginTransaction();
			Todo todo=sess.get(Todo.class, id);
			todo.setTitle(title);
			todo.setContent(content);
			todo.setAddedDate(new Date());
			txt.commit();
			sess.close();
			response.sendRedirect("All_Notes.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
