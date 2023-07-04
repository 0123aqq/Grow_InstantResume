package com.instantresume;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PasswordCheckServlet extends HttpServlet {
	  private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        processRequest(request, response);
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        processRequest(request, response);
	    }

	    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");

	        // 비밀번호 일치 여부 확인 로직을 구현합니다.
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

	        // 예시로 "admin"의 비밀번호는 "password"로 고정된 기준을 사용합니다.
	        return username.equals("admin") && password.equals("password");
	    }
	}