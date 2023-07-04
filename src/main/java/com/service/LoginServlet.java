package com.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.instantresume.UserDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init() throws ServletException {
		System.out.println("LoginServlet 호출");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("/");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//LoginCheckServlet을 LoginServlet으로 통합
		
		// 로그인 처리
		String userID = request.getParameter("userID");
		String userPW = request.getParameter("userPW");
		
		UserDAO dao = new UserDAO();
		
		System.out.println(userID + " / " + userPW);

		Integer num = dao.login(userID,userPW);
		
		if (num == -1) {
			// 세션 생성 및 정보 저장
			HttpSession session = request.getSession();
			session.setAttribute("userID", userID);
			
            // 세션 유효 시간 설정 (예: 30분)
            session.setMaxInactiveInterval(30 * 60);
            
            // 메인 페이지로 이동
    		response.sendRedirect("/");
		} else {						
			RequestDispatcher dispatch = request.getRequestDispatcher("Login.jsp?error="+num);
			dispatch.forward(request, response);
			}

	}

	public void destroy()

	{
		System.out.println("destroy 메소드 호출");
	}

}
