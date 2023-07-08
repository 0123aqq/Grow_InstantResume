<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>인스턴트 이력서 생성기 | Team</title>
<%String userID = (String) session.getAttribute("userID");
String fileName = "";
if (userID != null && userID != "") {%>
<%@include file="view/header.jsp"%>
<%} else {%>
<%@include file="view/header2.jsp"%>
<%}%>
</head>
<body>
	<div class="row row-gap-5">
		<div>
		<h1>Team</h1>
		</div>
		<div>
			<h2>Team Grow</h2>
			<p>프로젝트를 수행하면서 실력을 키우겠다는 다짐을 담아 정한 팀명입니다.</p>
		</div>
		<div class="col-4">
			<h3>유맑음</h3>
			<p>프론트엔드</p>
			<p>주요 개발파트</p>
			<ul>
				<li></li>
			</ul>
			<p>
				<img src="./repo/envelope-at-fill.svg" class="small-img">
				yumalg12@gmail.com
			</p>
			<p>
				<img src="./repo/github.svg" class="small-img"> <a
					href="https://www.github.com/yumalg12" target="_blank">github.com/yumalg12</a>
			</p>
		</div>
		<div class="col-4">
			<h3>장용태</h3>
			<p>백엔드</p>
			<p>주요 개발파트</p>
			<ul>
				<li></li>
			</ul>
			<p>
				<img src="./repo/envelope-at-fill.svg" class="small-img">
				willbe2023@naver.com
			</p>
			<p>
				<img src="./repo/github.svg" class="small-img"> <a
					href="https://www.github.com/willbe2023" target="_blank">github.com/willbe2023</a>
			</p>
		</div>
		<div class="col-4">
			<h3>하세라</h3>
			<p>백엔드/프론트엔드</p>
			<p>주요 개발파트</p>
			<ul>
				<li></li>
			</ul>
			<p>
				<img src="./repo/envelope-at-fill.svg" class="small-img">
				0123aqq@gmail.com
			</p>
			<p>
				<img src="./repo/github.svg" class="small-img"> <a
					href="https://www.github.com/0123aqq" target="_blank">github.com/0123aqq</a>
			</p>
		</div>
	</div>

<%@ include file="/view/footer.jsp" %>

</body>
</html>