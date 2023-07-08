package com.instantresume;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/update")

public class UpdateInfoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String type = request.getParameter("type");

    	String userId = request.getParameter("userId");
        String userName = request.getParameter("userName");
        String oldPassword = request.getParameter("oldPassword");
        String emailYN = request.getParameter("emailYN");
        
        UserDAO userDao = new UserDAO();

        if (type.equals("all")) {
	        String newPassword = request.getParameter("newPassword");
	
	        boolean successfulUpdate = userDao.updateInfo(userId, userName, oldPassword, newPassword, emailYN);
	
	        if (successfulUpdate) {
	            response.getWriter().write("success");
	        } else {
	            // Redirects back to password change page with an error message
	            request.setAttribute("errorMessage", "Incorrect old password.");
	            response.getWriter().write("fail");
	        }
        } else if (type.equals("basic")) {
	        boolean successfulUpdate = userDao.updateInfo(userId, userName, oldPassword, emailYN);
	
	        if (successfulUpdate) {
	            response.getWriter().write("success");
	        } else {
	            // Redirects back to password change page with an error message
	            request.setAttribute("errorMessage", "Incorrect old password.");
	            response.getWriter().write("fail");
	        }
        }
    }
}
