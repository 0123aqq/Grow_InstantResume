package com.instantresume;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updatePassword")

public class UpdatePasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");

        UserDAO userDao = new UserDAO();
        boolean successfulUpdate = userDao.updatePassword(userId, oldPassword, newPassword);

        if (successfulUpdate) {
            response.getWriter().write("success");
        } else {
            // Redirects back to password change page with an error message
            request.setAttribute("errorMessage", "Incorrect old password.");
            response.getWriter().write("fail");
        }
    }
}
