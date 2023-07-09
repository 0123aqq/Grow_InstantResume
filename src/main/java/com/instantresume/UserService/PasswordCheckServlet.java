package com.instantresume.UserService;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PasswordCheckServlet extends HttpServlet {

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        processRequest(request, response);
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        processRequest(request, response);
	    }

	    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");

	        boolean passwordMatched = checkPassword(username, password);

	        if (passwordMatched) {
	            HttpSession session = request.getSession();
	            session.setAttribute("username", username);

	            response.sendRedirect("index.jsp");
	        } else {
	            response.sendRedirect("login.jsp?error=1");
	        }
	    }

	    private boolean checkPassword(String username, String password) {

	        return username.equals("admin") && password.equals("password");
	    }
	}