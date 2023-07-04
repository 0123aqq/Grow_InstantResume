package com.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public void init() throws ServletException {
		System.out.println("LoginServlet 호출");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인 처리
		String userID = request.getParameter("userID");
		String userPW = request.getParameter("userPW");
		
		//System.out.println(userID + " / " + userPW);

		// 사용자 비밀번호
		String dbPW = "asdf";

		System.out.println(userID.equals("yumalg12@gmail.com") && userPW.equals(dbPW));
		if (userID.equals("yumalg12@gmail.com") && userPW.equals(dbPW)) {
			// 세션 생성 및 정보 저장
			HttpSession session = request.getSession();
			session.setAttribute("userID", userID);
			response.sendRedirect("index.jsp");
		}

	}

	public void destroy()

	{
		System.out.println("destroy 메소드 호출");
	}

}
