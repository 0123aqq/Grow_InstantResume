package com.instantresume;

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
    public void init() throws ServletException
    {
      System.out.println("메소드 호출");
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		System.out.println("아이디:"+"user_id");
		System.out.println("비밀번호:"+"user_pw");
		
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // 로그인 처리
    String userId = request.getParameter("userId");
    String password = request.getParameter("password");

    // 예시: 사용자 아이디와 이름 정보
    String userName = "John Doe";

    if (userId.equals("yourUserId") && password.equals("yourPassword")) {
        // 세션 생성 및 정보 저장
        HttpSession session = request.getSession();
        session.setAttribute("userId", userId);
        session.setAttribute("userName", userName);
    
    }

   response.sendRedirect("home.jsp");
	}
	public void destroy()
   
	{
	System.out.println("destroy 메소드 호출");
}

	





}
