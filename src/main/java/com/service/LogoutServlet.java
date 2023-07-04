package com.service;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 로그아웃 기능은 간단한거라 Logout.jsp에 로그아웃 기능 담은 서블릿 연결하지 않고 LogoutService서블릿에서 로그아웃
 * 처리하는 메서드 실행하면 alert으로 로그아웃 성공 메세지 띄운다음 바로 로그인 페이지로 리다이렉트 하는 방식으로 바꿈
 * 
 * 메서드 이름 예시 logoutUser()
 * 
 * 사용자의 로그아웃 요청 처리되면 -세션에서 사용자의 회원 정보를 제거(or쿠키 제거)하고 로그인 페이지로 돌아감
 * 
 * 
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LogoutServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		if (session.getAttribute("userID") != null) {
			session.removeAttribute("userID");
		}

	session.invalidate(); // 세션 무효화

	response.sendRedirect("Login.jsp"); // 로그아웃 후 로그인 페이지로 이동

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
