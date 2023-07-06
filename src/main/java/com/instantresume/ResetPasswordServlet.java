package com.instantresume;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ResetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String newPassword = request.getParameter("newPassword");

        HttpSession session = request.getSession();
        String temporaryPassword = (String) session.getAttribute("temporaryPassword");

        String userId = "yourUserId";
        updatePassword(userId, newPassword);

        session.removeAttribute("temporaryPassword");

        response.sendRedirect("login.jsp"); 
    }

    private void updatePassword(String userId, String newPassword) {

    	System.out.println("Password Update: User " + userId + "Successful" + newPassword + "password reset.");
    }
}
