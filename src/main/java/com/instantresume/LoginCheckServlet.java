package com.instantresume;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 기존 회원 여부를 확인하는 로직을 구현합니다.
        boolean authenticated = authenticateUser(username, password);
        
       
        
        // 기존 회원 여부를 확인하는 로직을 구현합니다. (예시로 "admin" / "password"로 고정된 기준을 사용합니다.)
        if (username.equals("admin") && password.equals("password")) {
            // 인증이 성공한 경우
            HttpSession session = request.getSession();
            session.setAttribute("username", username);

            // 홈 페이지로 리다이렉트합니다. (로그인 후의 이동 경로를 지정해 주세요.)
            response.sendRedirect("home.jsp");
        } else {
         
        }
    

        if (authenticated) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);

            // 세션 유효 시간 설정 (예: 30분)
            session.setMaxInactiveInterval(30 * 60);

            response.sendRedirect("home.jsp"); // 로그인 후 홈 페이지로 이동
        } else {
            response.sendRedirect("login.jsp?error=1"); // 로그인 실패 시 로그인 페이지로 이동 (에러 코드 전달)
        }
    }

    private boolean authenticateUser(String username, String password) {
        // 실제 회원 정보를 확인하여 인증하는 로직을 구현합니다.
        // ...

        // 예시: "admin" / "password"로 고정된 기준을 사용합니다.
        return username.equals("admin") && password.equals("password");
    }
}
