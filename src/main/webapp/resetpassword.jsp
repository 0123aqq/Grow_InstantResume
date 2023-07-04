<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 재설정</title>
</head>
<body>
    <h1>비밀번호 재설정</h1>
    <%-- 세션에서 임시 비밀번호 정보 가져오기 --%>
    <% String temporaryPassword = (String) session.getAttribute("temporaryPassword"); %>
    <%-- 임시 비밀번호 출력 --%>
    <% if (temporaryPassword != null) { %>
        <p>임시 비밀번호: <%= temporaryPassword %></p>
    <% } %>
    <form action="ResetPasswordServlet" method="post">
        <label for="newPassword">새로운 비밀번호:</label>
        <input type="password" id="newPassword" name="newPassword">
        <br>
        <input type="submit" value="비밀번호 재설정">
    </form>
</body>
</html>