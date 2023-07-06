package com.instantresume;

import java.io.IOException;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
       
	  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       
	        String email = request.getParameter("email");


	        String temporaryPassword = generateTemporaryPassword();


	        sendEmail(email, temporaryPassword);
	        

	        HttpSession session = request.getSession();
	  
	        response.sendRedirect("reset_password.jsp"); 
	    }

	    private String generateTemporaryPassword() {


	        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	        StringBuilder sb = new StringBuilder();
	        int length = 10;
	        for (int i = 0; i < length; i++) {
	            int index = (int) (Math.random() * characters.length());
	            sb.append(characters.charAt(index));
	        }
	        return sb.toString();
	    }

	    private void sendEmail(String email, String temporaryPassword) {

	        System.out.println("a temporary password : " + temporaryPassword);
	    }
	}
