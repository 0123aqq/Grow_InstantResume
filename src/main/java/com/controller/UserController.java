package com.controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**컨트롤러에서 필요한 로직(UserService서블릿) 찾아서 연결시키고 view(jsp)로 보내면 됨 

 *1.회원가입(UserService서블릿 이용)
 *
 *사용자가 입력한 회원가입 정보를 검증한 후, 데이터베이스에 
저장하는 메서드를 포함합니다. 회원가입이 성공적으로 이루어지면, 
성공 알림 메시지를 반환하고 메인 화면으로 이동할 수 있도록 합니다.

+UserDAO에 회원가입 정보 저장

-------------------
 *2.회원정보 조회(UserService서블릿 이용)
 *-------------------
 *3.정보수정(UserService서블릿 이용)
 *-------------------
 *4.탈퇴(UserService서블릿 이용)
 
사용자의 회원 탈퇴 요청을 처리하고, 
데이터베이스에서 사용자 정보를 삭제하는 메서드를 포함합니다. 
삭제가 완료되면 회원 탈퇴 성공 메시지를 반환하고, 사용자를 
메인 페이지 또는 로그인 페이지로 리다이렉트할 수 있습니다.

DeleteAccountForm.jsp에서 탈퇴 요청 받은다음
UserService에서 사용자 아이디 전달받고 회원탈퇴 로직 실행함
(UserDTO클래스 사용해서 탈퇴하려는 계정 정보:아이디,비밀번호,이메일 등 전달하고 
UserDAO에서 DB데이터에 접근하는 메서드 + CRUD작업하는 메서드 수행시킴)
*/


@WebServlet("/UserController")
public class UserController extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
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
