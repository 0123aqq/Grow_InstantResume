package com.service;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 템플릿 양식1을 불러오는 작업은 ResumeFormDAO에서 처리하고
 * (DB에서 템플릿을 가져오는 메서드를 구현)
 *  정보를 입력받는 작업은 ResumeService의 서비스 로직에서 처리합니다. 
 * (사용자로부터 입력받은 정보를 처리하는 비즈니스 로직을 작성해야합니다.(필요한 경우 ResumeFormDAO를 사용하여 템플릿을 불러올 수 있습니다.)
 */
@WebServlet("/ResumeService")
public class ResumeService extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResumeService() {
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
