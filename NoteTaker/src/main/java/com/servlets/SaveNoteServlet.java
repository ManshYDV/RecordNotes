package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Todo;
import com.helper.FactoryProvider;


public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveNoteServlet() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			Todo todo=new Todo(title, content, new Date());
			System.out.println(title+" "+content);
			Session sess= FactoryProvider.getFactory().openSession();
			Transaction txt=sess.beginTransaction();
			sess.persist(todo);
			txt.commit();
			sess.close();
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.println("<h1 style='text-align:center;'>Note added successfully</h1>");
			out.println("<h1 style='text-align:center;'><a href='All_Notes.jsp'>Click to view all recorded notes</a></h1>");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
