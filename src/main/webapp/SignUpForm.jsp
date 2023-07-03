<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>인스턴트 이력서 생성기 | 회원가입</title>
<%@ include file="/view/header.jsp"%>

</head>
<body>
	<h1>회원가입</h1>
	<form name="signUpForm">
		<div class="container grid w-50 gap-3" style="margin: auto;">
			<div class="row">
				<div class="col-4">Email ID</div>
				<div class="col-8">
					<input type="text" class="form-control" id="user_id" name="user_id"
						value="">
				</div>
			</div>
			<div class="row">
				<div class="col-4">Name</div>
				<div class="col-8">
					<input type="text" class="form-control" id="user_name"
						name="user_name" value="">
				</div>
			</div>
			<div class="row">
				<div class="col-4">PW</div>
				<div class="col-8">
					<input type="password" class="form-control" id="user_pw" name="user_pw" value="">
						<span id="wrongPW" class="wrongNotice" style="display: none;">
						<img src="./repo/exclamation-circle.svg" class="small-img"> 비밀번호는 영문, 숫자로 이루어진 4~20자리의 문자여야 합니다.</span>
				</div>
			</div>
			<div class="row">
				<div class="col-4">PW check</div>
				<div class="col-8">
					<input type="password" class="form-control" id="check_pw" value="">
				</div>
			</div>
			<div class="row">
				<div class="col-4">광고 이메일 수신</div>
				<div class="col-8">
					<div class="form-check form-switch">
						<input class="form-check-input" type="checkbox" role="switch"
							id="flexSwitchCheckChecked" style="height: 1.8rem; width: 3rem;"
							checked> <input type="hidden" value="" name="email_YN">
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="center">
		<button class="btn btn-color2 rounded-pill w-50 p-2 m-5"
			style="max-width: 240px;">회원가입</button>
	</div>
</body>
</html>
<!-- 
UserController 에 연결해서 회원가입 로직 실행 
 회원가입 성공 후 성공 alert메세지 띄우고(j.s),index.jsp로 이동시켜야함
 -->
