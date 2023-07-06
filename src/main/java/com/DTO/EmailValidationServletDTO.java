package com.DTO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EmailValidationServletDTO extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:8080/instant_resume";
    private static final String DB_USERNAME = "username";
    private static final String DB_PASSWORD = "password";

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
        boolean isEmailDuplicate = checkEmailDuplicate(emailValidationDTO);

        // JSON 형식으로 결과 반환
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"isEmailDuplicate\": " + isEmailDuplicate + "}");
    }

    private boolean checkEmailDuplicate(EmailValidationDTO emailValidationDTO) {
        // 이메일 중복 여부를 확인하는 로직 작성
        boolean isEmailDuplicate = false;

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM users WHERE email = ?")) {
            stmt.setString(1, emailValidationDTO.getEmail());
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    isEmailDuplicate = (count > 0);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isEmailDuplicate;
    }
}