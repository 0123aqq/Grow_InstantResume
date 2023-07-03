package com.validation;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 입력 검증 기능 수행하는 서비스 클래스.(패스워드,아이디)
 * 이력서 양식에 따라 필수 입력 사항과 입력 값 범위,
 길이 등을 검증하기 위한 메서드가 구현되어 있습니다.->결과 반환
 
 비밀번호 변경할때 새 비밀번호의 유효성 검사
(비밀번호 길이,문자 종류,일치 여부 등)하고 결과 반환하는 메소드 포함
 */
@WebServlet("/ValidationService")
public class ValidationService extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidationService() {
        super();
        // TODO Auto-generated constructor stub
    }

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
