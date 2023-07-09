package com.instantresume.UserService;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.instantresume.DAO.UserDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	public void init() throws ServletException {
		System.out.println("LoginServlet O");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("/");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userID = request.getParameter("userID");
		String userPW = request.getParameter("userPW");
		
		UserDAO dao = new UserDAO();
		
		System.out.println(userID + " / " + userPW);

		Integer num = dao.login(userID,userPW);
		
		if (num == -1) {
			HttpSession session = request.getSession();
			session.setAttribute("userID", userID);
			
            session.setMaxInactiveInterval(30 * 60);
            
    		response.sendRedirect("/");
		} else {						
			RequestDispatcher dispatch = request.getRequestDispatcher("Login.jsp?error="+num);
			dispatch.forward(request, response);
			}

	}

	public void destroy()

	{
		System.out.println("destroy O");
	}

}
