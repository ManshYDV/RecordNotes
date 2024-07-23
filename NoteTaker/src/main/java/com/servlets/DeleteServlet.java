package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Todo;
import com.helper.FactoryProvider;


public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
			int noteId=Integer.parseInt(request.getParameter("note_id").trim());
			Session sess=FactoryProvider.getFactory().openSession();
			Transaction txt=sess.beginTransaction();
			Todo note=(Todo)sess.get(Todo.class, noteId);
			sess.delete(note);
			txt.commit();
			sess.close();
			response.sendRedirect("All_Notes.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	

}