package com.DTO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmailValidationServletDTO
 */
@WebServlet("/EmailValidationServletDTO")
public class EmailValidationServletDTO extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청으로부터 데이터 받기
        String email = request.getParameter("email");

        // DTO 객체 생성 및 데이터 설정
        EmailValidationDTO emailValidationDTO = new EmailValidationDTO();
        emailValidationDTO.setEmail(email);

        // 이메일 중복 여부 확인
        boolean isEmailDuplicate = checkEmailDuplicate(emailValidationDTO); // 중복 여부 확인 로직은 별도의 메서드로 분리하여 작성

        // JSON 형식으로 결과 반환
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"isEmailDuplicate\": " + isEmailDuplicate + "}");
    }

    private boolean checkEmailDuplicate(EmailValidationDTO emailValidationDTO) {
        // 이메일 중복 여부를 확인하는 로직 작성
        // 중복 여부를 데이터베이스 등에서 검사하고, 검사 결과를 반환

        // 예시로 하드코딩으로 중복 여부 확인
        String duplicateEmail = "test@example.com";
        String email = emailValidationDTO.getEmail();
        return duplicateEmail.equalsIgnoreCase(email);
    }
}
