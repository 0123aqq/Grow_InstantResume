package com.validation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
* 5. [이력서 입력 정보 검증 서블릿] : 에러나면 alert 경고 메세지
* 검증 기능 수행 : ValidationService
* 사용자가 입력한 이력서 정보를 담는 클래스 : ResumeDataDTO(사용자가 입력한 데이터 및 해당 데이터와 관련된 메서드를 포함)
* 
 */
@WebServlet("/ResumeValidationServlet")
public class ResumeValidation extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResumeValidation() {
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
