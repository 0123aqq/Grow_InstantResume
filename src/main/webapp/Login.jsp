<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>인스턴트 이력서 생성기 | 로그인</title>
<%@ include file="/view/header.jsp" %>

<script>

function login() {
	let userID = document.loginForm.userID.value;
	let userPW = document.loginForm.userPW.value;
	
	console.log(IDValidation(userID));
	if (!IDValidation(userID)){
		alert("올바른 이메일 아이디를 입력하십시오.");
		$(wrongID).show();
	} else {
		$(wrongID).hide();
		if (!PWValidation(userPW)){
			$(wrongPW).show();
			alert("올바른 비밀번호를 입력하십시오.");
		} else {
			$(wrongPW).hide();
			//alert(userID + " / " + userPW);
			document.loginForm.action = "/login";
			document.loginForm.submit();
		}
	}
}

<% String error = request.getParameter("error");%>
if ("<%=error%>" == 0) {
	alert("비밀번호가 틀렸습니다.");
	window.location.href="/";
} else if ("<%=error%>" == -2 ){
	alert("가입되지 않은 아이디입니다.");
	window.location.href="/";
}
</script>

<style>
.wrongNotice {
    top: -0.8rem;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-7 p-5 center">
			<img src="./repo/main-gradation.svg">
		</div>
		<div class="col-5 center">
		<div class="center w-75">
			<form name = "loginForm" method="post" onSubmit="return login();">
				<div class="form-floating mb-3" style="border-bottom: 1px solid #ccc;">
					<input type="email" class="form-control border-none" id="floatingInput" placeholder=" " name="userID" onInput="javascript:IDValidation(this.value);"> 
					<label for="floatingInput" style="color: #ccc;"><img src="./repo/person-fill.svg" class="loginform-img"> Email ID</label>
				</div>
				<span id="wrongID" class="wrongNotice" style="display: none;"><img src="./repo/exclamation-circle.svg" class="small-img"> ID는 올바른 이메일 형식을 따라야 합니다.</span>
				<div class="form-floating mb-3" style="border-bottom: 1px solid #ccc;">
					<input type="password" class="form-control border-none" id="floatingPassword" placeholder=" " name="userPW" onInput="javascript:PWValidation(this.value);"> 
					<label for="floatingPassword" style="color: #ccc;"><img src="./repo/lock-fill.svg" class="loginform-img"> Password</label>
				</div>
				<span id="wrongPW" class="wrongNotice" style="display: none;"><img src="./repo/exclamation-circle.svg" class="small-img"> 비밀번호는 영문, 숫자로 이루어진 4~20자리의 문자여야 합니다.</span>
				<div class="mb-4">
				<a href="/ResetPassword.jsp">Forgot password?</a>
				</div>
				<div>
					<input type="button" onClick="javascript:login();" class="btn btn-color2 rounded-pill w-50 p-2 mb-3" value="Login">
					<span onClick="location.href='/signup'" class="btn btn-line-color2 rounded-pill w-50 p-2">Sign up</span>
				</div>
			</form>
		</div>
		</div>
	</div>

<%@ include file="/view/footer.jsp" %>

</body>
</html>