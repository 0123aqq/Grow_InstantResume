package com.instantresume.UserService;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ResumeValidationServlet")
public class ResumeValidationServlet extends HttpServlet {
       
    public ResumeValidationServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        boolean isValid = validateResumeForm(name, email, phone);

      
        
        
        if (isValid) {
 
        	response.sendRedirect("success.jsp");
        	
        } else {

        	String errorMessage = "Please fill in all fields.";
            response.setContentType("text/html");
            response.getWriter().print("<script>alert('" + errorMessage + "');window.location.href='resume.jsp';</script>");
        }
        }

        private boolean validateResumeForm(String name, String email, String phone) {

        	return !name.isEmpty() && !email.isEmpty() && !phone.isEmpty();
        }

    }



