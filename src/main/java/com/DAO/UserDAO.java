package com.DAO;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 회원 관련 CRUD 작업을 수행하는 메서드를 구현하여 데이터베이스와의 연동을 처리
 * 
 * [1]회원가입시 정보 저장(회원가입 요청시 사용자 정보를 데이터베이스에 저장하는 메서드 구현)
 * [2]회원정보 조회시 아이디, 비밀번호, 이름, 이메일 등의 사용자 정보와 관련된 메서드를 포함합니다.
 * [3]회원정보 수정
[4] 회원탈퇴
4-1비밀번호 동일 값 입력하면 : 사용자에게 정말 탈퇴하시겠습니까? alert 띄우고 
동의하면 탈퇴 진행
4-2비밀번호 틀리면 : 비밀번호와 일치하지 않습니다. 메시지 출력 후 다시 입력 요청
 */
@WebServlet("/UserDAO")
public class UserDAO extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDAO() {
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
