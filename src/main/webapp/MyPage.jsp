<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>인스턴트 이력서 생성기 | 마이페이지</title>
<%@ include file="/view/header.jsp" %>

</head>
<body>
<h1>마이페이지</h1>

<div class="container row-gap-3">
<div class="center m-3"><img src="/profile/" class="m-3"><button class="btn btn-line-color2 d-block center mb-3">프로필 사진 변경</button></div>
<hr>
<div class="row mt-5">
	<form name="signUpForm">
		<div class="container grid w-50 gap-3" style="margin: auto;">
			<div class="row">
				<div class="col-4">Email ID</div>
				<div class="col-8">
					<input type="text" class="form-control" id="user_id" value="" disabled>
				</div>
			</div>
			<div class="row">
				<div class="col-4">Name</div>
				<div class="col-8">
					<input type="text" class="form-control" id="user_name" value="" disabled>
				</div>
			</div>
			<div class="row" id="oldPW">
				<div class="col-4">PW</div>
				<div class="col-8">
					<input type="password" class="form-control w-auto d-inline" id="user_pw" name="user_pw" value=""> <span class="btn btn-line-color2" onclick="javascript:checkPW();">비밀번호 변경</span>
				</div>
			</div>

			<div class="grid row-gap-3" id="newPW" style="display: none;">
			<div class="row">
				<div class="col-4">New PW</div>
				<div class="col-8">
					<input type="password" class="form-control" id="new_user_pw" name="new_user_pw" value="">
					<span id="wrongPW" class="wrongNotice" style="display: none;">
					<img src="./repo/exclamation-circle.svg" class="small-img"> 비밀번호는 영문, 숫자로 이루어진 4~20자리의 문자여야 합니다.</span>
				</div>
			</div>
			<div class="row">
				<div class="col-4">PW check</div>
				<div class="col-8">
					<input type="password" class="form-control" id="new_check_pw" value="">
				</div>
			</div>
</div>

			<div class="row">
				<div class="col-4">광고 이메일 수신</div>
				<div class="col-8">
					<div class="form-check form-switch">
						<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" 
						style="height: 1.8rem; width: 3rem;" checked>
					<input type="hidden" value="" name="email_YN">
					</div>
				</div>
			</div>
		</div>
	</form>
	
<div class="center">
<button class="btn btn-color2 rounded-pill w-50 p-2 mt-5" style="max-width:240px;">회원정보 수정</button>
<br>
<button class="btn btn-line-color2 rounded-pill w-50 p-2 mt-3" style="max-width:240px;" onclick="location.reload()">취소</button>
	</div>
	
</div>
</div>

<script>
function checkPW(){
	$("#oldPW").hide();
	$("#newPW").show();
}
</script>


<%@ include file="/view/footer.jsp" %>

</body>
</html>