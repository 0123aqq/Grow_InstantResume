package com.service;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 회원 관련 로직을 처리하는 서비스 클래스(CRUD) : UserDAO에서 사용자 DB정보 가져옴
(UserService에서는 UserDAO의 메서드를 호출하여 데이터베이스와의 연동 작업을 수행)
 * 
 * 로그인 서비스 : 
기존 회원 여부 확인 (아이디, 패스워드) 로직 + 해당 사용자 정보 반환하는 메소드 
DB(jdbc연결 코드 필요)에서 사용자 정보 검색하는 쿼리문 넣고 검색정보 반환하는 메소드 (아이디(이메일),비밀번호,이름 등) ->로그인 요청 처리 수행

*---------------------------------------
 * 서비스 클래스 내부에 회원 생성 로직을 처리하는 메서드를 구현하여 해당 메서드에서 회원가입 정보를 전달하면 회원 생성을 처리하도록 합니다.
 * [회원가입]
 *
들어가야 할 내용 - 

*-필수 입력 사항 : 
*이메일,이름,비밀번호,비밀번호 체크,광고 이메일 수신 동의 여부
* 아이디는 이메일을 입력 받는다.
* 이메일 형식 : ‘/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-                
                zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/I’

* 비밀번호 : 6자 이상 12자 이내 영문, 숫자, 특수문자 세가지 중 
              두가지 이상 혼합 해야함
* 비밀번호 확인 : 비밀번호와 동일해야만 한다.
* 이름 : 최대 10자
*아이디는 중복확인을 진행한다.
*- 아이디로 입력된 이메일로 본인확인 진행 : 이메일로 인증번호 전송 후 사용자로부터 인증번호 확인을 입력 받아서 동일한지 확인
*---------------------------------------
 * 
 * 서비스 클래스 내부에 회원 정보 조회 로직을 처리하는 메서드를 구현하여 해당 메서드에서 사용자 아이디,비밀번호를 전달하면 [회원 정보 조회]를 처리하도록 합니다.
 * 
 * ---------------------------------------
 * 
 * 서비스 클래스 내부에 회원 수정 로직을 처리하는 메서드를 구현하여 해당 메서드에서 사용자 아이디,비밀번호를 전달하면 [회원 수정]을 처리하도록 합니다.
 * 
 * ---------------------------------------
 * 
 * 서비스 클래스 내부에 회원 탈퇴 로직(삭제)을 처리하는 메서드를 구현하여 해당 메서드에서 사용자 아이디,비밀번호를 전달하면 [회원 탈퇴]를 처리하도록 합니다.
 * (사용자 정보를 가져오고 삭제합니다 :회원 탈퇴 과정에서 데이터베이스 또는 저장소로부터 사용자 정보를 삭제하는 메서드를 포함합니다)
 * 
 */
@WebServlet("/UserService")
public class UserService extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserService() {
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
