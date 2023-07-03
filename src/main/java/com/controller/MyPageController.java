package com.controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**컨트롤러에서 필요한 로직(UserService서블릿) 찾아서 연결시키고 MyPageForm.jsp로 보내면 됨 
 * 
 * 
 * 마이페이지의 기본적인 기능을 관리하는 컨트롤러 클래스입니다. 
사용자 프로필 정보를 가져와 페이지에 표시하는 메서드를 포함합니다. 
또한, 정보 수정 페이지, 로그아웃, 회원 탈퇴 페이지로의 라우팅 기능 
역시 구현합니다.

 */
@WebServlet("/MyPageController")
public class MyPageController extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
