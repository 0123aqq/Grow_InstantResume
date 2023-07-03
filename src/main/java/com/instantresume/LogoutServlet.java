package com.instantresume;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class Logout
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public LogoutServlet() {
		super();
	}
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        if(session.getAttribute("id") !=null) {
        		session.removeAttribute("id");
        }
        if(session.getAttribute("name") !=null) {
    		session.removeAttribute("name");
    }
     
      
        session.invalidate(); // 세션 무효화
        
        response.sendRedirect("login.jsp"); // 로그아웃 후 로그인 페이지로 이동
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
    	System.out.println("post");
    }
    
   
    
}
