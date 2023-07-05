<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>인스턴트 이력서 생성기 | 비밀번호 재설정</title>
<%@ include file="/view/header.jsp"%>
</head>
<body>
	<h1>비밀번호 재설정</h1>
	<%-- 세션에서 임시 비밀번호 정보 가져오기 --%>
	<% String temporaryPassword = (String) session.getAttribute("temporaryPassword"); %>
	<%-- 임시 비밀번호 출력 --%>
	<% if (temporaryPassword != null) { %>
	<p>임시 비밀번호: <%= temporaryPassword %></p>
	<% } %>
	<div class="container w-50" style="margin: auto;">
	<form action="ResetPasswordServlet" method="post">
		<div class="row m-5">
			<div class="col-4">
				<label>Email ID</label>
			</div>
			<div class="col-8">
				<input type="email" class="form-control" id="userID" name="userID">
			</div>
		</div>
		<div class="center m-5">
		<input type="submit" class="btn btn-color2" value="임시 비밀번호 발급">
		</div>
	</form>
		<div class="row w-50" style="display: none;">
			<div class="col-4">
				<label for="newPassword">임시 비밀번호</label>
			</div>
			<div class="col-8">
				<input type="password" class="form-control" id="newPassword" name="newPassword">
			</div>
		</div>
	</div>
	<%@ include file="/view/footer.jsp"%>
</body>
</html>