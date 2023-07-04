<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>홈 페이지</title>
</head>
<body>
  <h1>환영합니다!</h1>
    <%-- 세션에서 아이디와 이름 정보를 가져와 출력 --%>
    <% String userId = (String) session.getAttribute("userId"); %>
    <% String userName = (String) session.getAttribute("userName"); %>
    <p>아이디: <%= userId %></p>
    <p>이름: <%= userName %></p>

    <%-- 로그아웃 링크 --%>
    <a href="LogoutServlet">로그아웃</a>
</body>
</html>