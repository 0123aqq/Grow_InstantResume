package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**컨트롤러에서 필요한 로직(UserService서블릿) 찾아서 연결시키고 GeneratedResumeForm.jsp로 보내면 됨 
 * 
 * 
 * 생성된 이력서의 정보를 처리하고 페이지에 표시하는 
컨트롤러 클래스입니다. 사용자가 입력한 이력서 데이터와 선택한
 템플릿 스타일을 렌더링하고 HTML로 출력하는 메서드를 포함합니다.
 
 * TemplateDTO 연결 : 선택한 이력서 템플릿 정보를 모델링하는 클래스입니다. 
이 클래스는 템플릿 ID, 이름, 설명, 미리보기 이미지 URL, CSS 스타일 등 
템플릿과 관련된 정보를 포함하고 있습니다.

 */
@WebServlet("/GeneratedResumeController")
public class GeneratedResumeController extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GeneratedResumeController() {
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
