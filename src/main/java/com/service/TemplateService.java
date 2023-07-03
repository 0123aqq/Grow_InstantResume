package com.service;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 이 페이지에서 사용자가 사용 가능한 이력서 템플릿을 목록으로 제공하고
 선택할 수 있게 합니다. TemplateService 클래스는 사용자에게 제공할 
템플릿 관련 정보를 가져오는 메소드를 구현합니다

연결할거: 
[TemplateDTO] 이력서 템플릿 정보 모델링 하는 클래스. 템플릿 ID,이름,설명,미리보기 이미지 URL,카테고리 등 
템플릿과 관련한 정보 포함

 *템플릿 양식1을 불러오는 작업은 ResumeFormDAO에서 처리하고, 정보를 입력받는 작업은 ResumeFormDAO의 서비스 로직에서 처리합니다. 
가져온 템플릿과 사용자 입력 정보를 담는 객체로는 ResumeFormDTO 클래스를 사용합니다.
 */
@WebServlet("/TemplateController")
public class TemplateService extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TemplateService() {
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
