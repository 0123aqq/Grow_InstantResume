<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인스턴트 이력서 생성기 | About</title>

<%String userID = (String) session.getAttribute("userID");
String fileName = "";
if (userID != null && userID != "") {%>
<%@include file="view/header.jsp"%>
<%} else {%>
<%@include file="view/header2.jsp"%>
<%}%>
</head>
<body>
	<!-- 여기에 main-content 클래스를 추가함(내용 잘림 방지) -->
	<div class="row row-gap-5 main-content">
		<div>
			<h1>About</h1>
		</div>
			<img src="./repo/main.svg" style="position: absolute;opacity: 0.6;width: 55%;right: 5rem;bottom: 8rem; z-index:-1;">
		<div>
			<h2>개발자를 위한 이력서 자동생성 서비스</h2>
			<br>
			<p style="line-height: 1.8;">
				<strong>인스턴트 이력서 생성기</strong>는 개발 포트폴리오 양식 결정이나 웹페이지 작성에 어려움을 겪는 개발자를 위한 이력서 생성 서비스입니다.<br>
				마음에 드는 양식을 선택하고 정해진 정보를 입력하기만 하면 이력서 화면이 <strong>자동</strong>으로 생성됩니다.<br>
				생성한 이력서는 <strong>HTML</strong> 형태로 다운로드받아 원하는 곳에 삽입할 수 있습니다.
			</p>
		</div>
	</div>

<%@include file="/view/footer.jsp" %>
</body>
</html>
