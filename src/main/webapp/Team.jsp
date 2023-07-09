<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>인스턴트 이력서 생성기 | Team</title>

<%
String userID = (String) session.getAttribute("userID");
String fileName = "";
if (userID != null && userID != "") {
%>
<%@include file="view/header.jsp"%>
<%
} else {
%>
<%@include file="view/header2.jsp"%>
<%
}
%>

<link rel="stylesheet" href="./css/frame.css">

<style>
div[id="contents"]>div {
	padding: 1.5rem 2rem;
}

h3 {
	font-weight: bold;
}
.teamCard{
height: 310px;}
</style>
</head>
<body>
	<div class="row row-gap-3">
		<div>
			<h1>Team</h1>
		</div>
		<div class="mt-3">
			<h2>Team Grow🌲</h2>
			<p>프로젝트를 수행하면서 실력을 키우겠다는 다짐을 담아 정한 팀명입니다.</p>
		</div>
		<div id="contents" style="grid-template-columns: 1fr 1fr 1fr;">
			<div>
				<h3>유맑음</h3>
				<hr>
			<div class="teamCard">
				<span>프론트엔드</span>
				<ul>
					<li>로그인</li>
					<li>회원가입</li>
					<li>마이페이지</li>
					<li>HTML 이력서 폼/결과물</li>
					<li>Markdown 이력서 폼/결과물</li>
					<li>About 페이지</li>
					<li>Team 페이지</li>
				</ul>
				<span>백엔드</span>
				<ul>
					<li>로그인</li>
					<li>회원가입</li>
					<li>세션 정보로 로그인 여부 체크</li>
				</ul>
				</div>
				<hr>
				<p>
					<img src="./repo/envelope-at-fill.svg" class="small-img"> yumalg12@gmail.com 
					<br> 
					<img src="./repo/github.svg" class="small-img"> <a href="https://www.github.com/yumalg12" target="_blank">github.com/yumalg12</a>
				</p>
			</div>
			<div>
				<h3>장용태</h3>
				<hr>
			<div class="teamCard">
				<span>백엔드</span>
				<ul>
					<li>로그인 (계정 정보 일치 시 alert 출력)</li>
					<li>로그아웃</li>
					<li>임시 비밀번호 발급/재설정</li>
					<li>HTML 이력서 다운로드</li>
				</ul>
					</div>
					<hr>
					<p>
						<img src="./repo/envelope-at-fill.svg" class="small-img"> willbe2023@naver.com 
						<br>
						<img src="./repo/github.svg" class="small-img"> <a href="https://www.github.com/willbe2023" target="_blank">github.com/willbe2023</a>
					</p>
			</div>
			<div>
				<h3>하세라</h3>
				<hr>
			<div class="teamCard">
				<span>프론트엔드</span>
				<ul>
					<li>헤더/푸터</li>
					<li>이력서 선택 메인페이지</li>
					<li>회원 탈퇴</li>
					<li>Reference 페이지</li>
				</ul>
				<span>백엔드</span>
				<ul>
					<li>회원정보 수정</li>
					<li>프로필 사진 업로드/변경</li>
					<li>회원 탈퇴</li>
					<li>HTML 이력서 다운로드</li>
				</ul>
				</div>
				<hr>
				<p>
					<img src="./repo/envelope-at-fill.svg" class="small-img"> 0123aqq@gmail.com 
					<br>
					<img src="./repo/github.svg" class="small-img"> <a href="https://www.github.com/0123aqq" target="_blank">github.com/0123aqq</a>
				</p>
			</div>
		</div>
	</div>


	<%@ include file="/view/footer.jsp"%>

</body>
</html>