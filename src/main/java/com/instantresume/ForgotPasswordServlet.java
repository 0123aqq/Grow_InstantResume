package com.instantresume;

import java.io.IOException;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ForgotPasswordServlet
 */
@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // 이메일 입력 받기
	        String email = request.getParameter("email");

	        // 이메일을 통한 비밀번호 재설정 로직
	        // 임시 비밀번호 생성
	        String temporaryPassword = generateTemporaryPassword();

	        // 예시: 임시 비밀번호를 이메일로 전송
	        sendEmail(email, temporaryPassword);
	        
	        // 여기서는 예시로 세션에 저장된 임시 비밀번호를 새로운 비밀번호로 대체하는 것으로 대체합니다.
	        HttpSession session = request.getSession();
	  
	        response.sendRedirect("reset_password.jsp"); // 비밀번호 재설정 페이지로 이동
	    }

	    private String generateTemporaryPassword() {
	        // 임시 비밀번호 생성 로직 구현

	        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	        StringBuilder sb = new StringBuilder();
	        int length = 10;
	        for (int i = 0; i < length; i++) {
	            int index = (int) (Math.random() * characters.length());
	            sb.append(characters.charAt(index));
	        }
	        return sb.toString();
	    }

	    private void sendEmail(String email, String temporaryPassword) {
	        // 이메일 전송 로직 구현
	        // 여기서는 예시로 콘솔에 임시 비밀번호를 출력하는 것으로 대체합니다.
	        System.out.println("임시 비밀번호: " + temporaryPassword);
	    }
	}
