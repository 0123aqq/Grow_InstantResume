package com.instantresume;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EmailCheckServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        // 이메일 중복 여부 확인 로직을 구현합니다.
        boolean emailExists = checkEmailExists(email);

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        if (emailExists) {
            response.getWriter().write("exists");
        } else {
            response.getWriter().write("not_exists");
        }
    }

    private boolean checkEmailExists(String email) {
        // 실제로는 데이터베이스나 다른 회원 정보 저장소와 연동하여 이메일 중복 여부를 확인합니다.
        // 예시로 "test@example.com"이 이미 존재하는 이메일로 가정합니다.
        return email.equals("Email is true");
    }
}
