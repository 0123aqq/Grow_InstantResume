package com.validation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.instantresume.UserDAO;
import com.instantresume.UserVO;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SignUpServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		UserDAO dao = new UserDAO();
		String command = request.getParameter("command");

		if (command != null && command.equals("signup")) {
			// 가입 동작
			String userID = (String) request.getParameter("userID");
			String userPW = (String) request.getParameter("userPW");
			String userName = (String) request.getParameter("userName");
			String emailYN = (String) request.getParameter("emailYN");

			// setter 호출
			UserVO vo = new UserVO();

			vo.setUserID(userID);
			vo.setUserPW(userPW);
			vo.setUserName(userName);
			vo.setEmailYN(emailYN);

			dao.signUp(vo);

			System.out.println(userID + " / " + userPW + " / " + userName + " / " + emailYN);
			
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('"+userID+"님의 회원가입이 완료되었습니다.'); location.href='/';</script>"); 
			writer.close();

		} else {
			RequestDispatcher dispatch = request.getRequestDispatcher("/SignUpForm.jsp");
			dispatch.forward(request, response);
		}
	}

}
