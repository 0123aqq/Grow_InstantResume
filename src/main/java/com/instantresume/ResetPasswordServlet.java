package com.instantresume;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ResetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 새로운 비밀번호 받기
        String newPassword = request.getParameter("newPassword");

        // 비밀번호 재설정 로직
        // 여기서는 예시로 세션에 저장된 임시 비밀번호를 새로운 비밀번호로 대체하는 것으로 대체합니다.
        HttpSession session = request.getSession();
        String temporaryPassword = (String) session.getAttribute("temporaryPassword");

        // 예시: 임시 비밀번호를 새로운 비밀번호로 대체
        String userId = "yourUserId";
        updatePassword(userId, newPassword);

        // 세션에서 임시 비밀번호 정보 제거
        session.removeAttribute("temporaryPassword");

        response.sendRedirect("login.jsp"); // 로그인 페이지로 이동
    }

    private void updatePassword(String userId, String newPassword) {
        // 비밀번호 업데이트 로직 구현
        // 여기서는 예시로 콘솔에 비밀번호 업데이트 메시지를 출력하는 것으로 대체합니다.
        System.out.println("비밀번호 업데이트: 사용자 " + userId + "의 비밀번호를 " + newPassword + "로 변경했습니다.");
    }
}
