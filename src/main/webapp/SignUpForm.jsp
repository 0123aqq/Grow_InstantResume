<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>인스턴트 이력서 생성기 | 회원가입</title>
<%@ include file="/view/header.jsp"%>

<script>

function signUp() {
	let userID = document.signUpForm.userID.value;
	let userPW = document.signUpForm.userPW.value;
	
	if (!IDValidation(userID)){
		alert("올바른 이메일 아이디를 입력하십시오.");
		$(wrongID).show();
	} else {
		$(wrongID).hide();
		//alert(userID);
		if (!PWValidation(userPW)){
			$(wrongPW).show();
			alert("올바른 비밀번호를 입력하십시오.");
		} else {
			$(wrongPW).hide();
			//alert(userPW);
			document.signUpForm.method = "post";
			document.signUpForm.action = "signup";
			document.signUpForm.submit();
		}
	}
}

function setEmailYN() {
	if (document.signUpForm.emailSwitch.checked){
		document.signUpForm.emailYN.value = "Y";
	} else {
		document.signUpForm.emailYN.value = "N";			
	}
	//console.log(document.signUpForm.emailYN.value);
}

</script>
</head>
<body>
	<h1>회원가입</h1>
    
	<form name="signUpForm">
	
	
		<div class="container grid w-50 gap-3" style="margin: auto;">
	<input type="hidden" name="command" value="signup">
			<div class="row">
				<div class="col-4">Email ID</div>
				<div class="col-8">
					<input type="text" class="form-control" id="userID" name="userID" value="" onInput="javascript:IDValidation(this.value);">
					<span id="wrongID" class="wrongNotice" style="display: none;"><img src="./repo/exclamation-circle.svg" class="small-img"> ID는 올바른 이메일 형식을 따라야 합니다.</span>
				</div>
			</div>
			<div class="row">
				<div class="col-4">Name</div>
				<div class="col-8">
					<input type="text" class="form-control" id="userName"
						name="userName" value="">
				</div>
			</div>
			<div class="row">
				<div class="col-4">PW</div>
				<div class="col-8">
					<input type="password" class="form-control" id="userPW" name="userPW" value="" onInput="PWValidation(this.value); PWCheck();">
						<span id="wrongPW" class="wrongNotice" style="display: none;">
						<img src="./repo/exclamation-circle.svg" class="small-img"> 비밀번호는 영문, 숫자로 이루어진 4~20자리의 문자여야 합니다.</span>
				</div>
			</div>
			<div class="row">
				<div class="col-4">PW check</div>
				<div class="col-8">
					<input type="password" class="form-control" id="checkPW" value="" onInput="javascript:PWCheck();">
					<span id="wrongPWCheck" class="wrongNotice" style="display: none;"><img src="./repo/exclamation-circle.svg" class="small-img"> 비밀번호 확인이 일치하지 않습니다.</span>
				</div>
			</div>
			<div class="row">
				<div class="col-4">광고 이메일 수신</div>
				<div class="col-8">
					<div class="form-check form-switch">
						<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" name="emailSwitch" style="height: 1.8rem; width: 3rem;" onClick="javascript:setEmailYN();" checked>
						<input type="hidden" value="Y" id="emailYN" name="emailYN">
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="center">
		<button class="btn btn-color2 rounded-pill w-50 p-2 m-5"
			style="max-width: 240px;" onClick="javascript:signUp();">회원가입</button>
	</div>
	
	<%@ include file="/view/footer.jsp"%>
	
</body>
</html>
<!-- 
UserController 에 연결해서 회원가입 로직 실행 
 회원가입 성공 후 성공 alert메세지 띄우고(j.s),index.jsp로 이동시켜야함
 -->
