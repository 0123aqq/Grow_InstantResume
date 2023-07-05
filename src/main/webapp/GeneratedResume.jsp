<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인스턴트 이력서 생성기</title>
<%@ include file="/view/header.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta property="og:title" content="유맑음 이력서">
<meta property="og:image" content="./img/thumbnail.png">
<meta property="og:description" content="유맑음의 이력서입니다.">

<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/frame.css">
<link rel="stylesheet" href="./css/table.css">
<script src="./script/myscript.js"></script>

<style>
a{
	text-decoration: none;
}

h2 {
	color: #000000;
	padding-top: 1.2rem;
}

div[id="projects"] img{
	margin: 0px 0px 5px 5px;
}
body {
   padding-top: 100px; /* 헤더때문에 내용이 잘려서 여백 추가 */
   padding-bottom: 100px; /* 푸터때문에 내용이 잘려서 여백 추가 */
   } 
   
</style>

</head>

<body>

	<div id="realbody">
		<nav>
			<h4 style="padding: 15px 0px 0px 10px">📑목차</h4>
			<hr>
			<ol>
				<li><a href="#about">자기소개</a><br></li>
				<li><a href="#skills">보유 기술</a><br></li>
				<li><a href="#projects">수행 프로젝트</a><br></li>
			</ol>
		</nav>

		<div id="contents">
			<div id="about">
				<h2>🧩‍ About Me</h2>
				<hr>
				<div class="container">
					<aside class="item">
						<img src="./img/window_imoji_developer.svg" style="width: 130px;">
					</aside>
					<section class="item">
						<label style="font-size: 1.3rem;">유맑음 (Malg-Eum Yu)</label>
						<p style="font-size: 0.9rem; color: #aaa; margin-top: 0px;">yumalg12@gmail.com</p>
						<p>실 사용자 관점에서 생각하는 개발자를 목표로 합니다.</p>
						<img src="https://img.shields.io/badge/-GitHub-181717?style=for-the-badge&amp;logo=GitHub&amp;logoColor=white" width="120px;" onclick="window.open('https://github.com/yumalg12');" style="cursor: pointer;">
					</section>
				</div>
			</div>

			
			<div id="skills">
				<h2>🪄 Skills</h2>
				<hr>
				<table>
					<tbody><tr>
						<td><strong>보유 중</strong></td>
						<td><img src="https://img.shields.io/badge/-HTML/CSS-1572B6?style=flat&amp;logo=css3&amp;logoColor=white">
						</td>
					</tr>
					<tr>
						<td><strong>공부 중</strong></td>
						<td><img src="https://img.shields.io/badge/-JAVA-orange?style=flat&amp;logo=java&amp;logoColor=white">
							<img src="https://img.shields.io/badge/-JavaScript-F7DF1E?style=flat&amp;logo=JavaScript&amp;logoColor=white">
							<img src="https://img.shields.io/badge/-Spring-6DB33F?style=flat&amp;logo=flat&amp;logoColor=white">
							<img src="https://img.shields.io/badge/-Node.js-339933?style=flat&amp;logo=nodedotjs&amp;logoColor=white">
							<img src="https://img.shields.io/badge/-React-61DAFB?style=flat&amp;logo=react&amp;logoColor=white">
						</td>
					</tr>
					<tr>
						<td><strong>접해 봄</strong></td>
						<td><img src="https://img.shields.io/badge/-Python-3776AB?style=flat&amp;logo=python&amp;logoColor=white">
							<img src="https://img.shields.io/badge/-MySQL-4479A1?style=flat&amp;logo=mysql&amp;logoColor=white">
						</td>
					</tr>
				</tbody></table>
			</div>

			
			<div id="projects">
				<h2>🗂️ Projects</h2>
				<hr>
				<div class="container column-gap-5">
					<div class="item">
						<h4>
							<img src="https://img.shields.io/badge/Project-Personal-blue">
							Dummy Project A
						</h4>
						<table>
							<tbody><tr>
								<td><strong>참여자 (기여도)</strong></td>
								<td>유맑음 (100%)</td>
							</tr>
							<tr>
								<td><strong>기간</strong></td>
								<td>2023. 05~</td>
							</tr>
							<tr>
								<td><strong>사용 기술</strong></td>
								<td>HTML/CSS, JavaScript</td>
							</tr>
							<tr>
								<td><strong>URL</strong></td>
								<td><a href="">github.com/yumalg12/dummyprojectA</a></td>
							</tr>
							<tr>
								<td><strong>주요 기능</strong></td>
								<td><ul>
										<li>기능 1</li>
										<li>기능 2</li>
										<li>기능 3</li>
									</ul></td>
							</tr>
								<tr>
									<td><strong>비고</strong></td>
									<td>어려웠던 점, 느낀 점 등등</td>
								</tr>
							</tbody></table>
					</div>
					
					
					<div class="item">
						<h4>
							<img src="https://img.shields.io/badge/Project-TEAM-green">
							Dummy Project B
						</h4>
						<table>
							<tbody><tr>
								<td><strong>참여자 (기여도)</strong></td>
								<td>유맑음 (50%), ㅇㅇㅇ (50%)</td>
							</tr>
							<tr>
								<td><strong>기간</strong></td>
								<td>2023. 05~</td>
							</tr>
							<tr>
								<td><strong>사용 기술</strong></td>
								<td>JAVA</td>
							</tr>
							<tr>
								<td><strong>URL</strong></td>
								<td><a href="">github.com/yumalg12/dummyprojectB</a></td>
							</tr>
							<tr>
								<td><strong>주요 기능</strong></td>
								<td><ul>
										<li>기능 1</li>
										<li>기능 2</li>
										<li>기능 3</li>
									</ul></td>
							</tr>
								<tr>
									<td><strong>비고</strong></td>
									<td>어려웠던 점, 느낀 점 등등</td>
								</tr>
							</tbody></table>
					</div>
					
				</div>

			</div>
		</div>
	</div>
	<br>
	<br>
<%@include file="/view/footer.jsp" %>
</body></html>