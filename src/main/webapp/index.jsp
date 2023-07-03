<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>인스턴트 이력서 생성기 | 메인</title>
<%@ include file="/view/header.jsp" %>

<script>
function IDValidation() {
	  let user_id = document.loginForm.user_id.value;
	  let regex = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-z]+$/;
	  
	  if (regex.test(user_id)){
	    $("#wrongID").hide();
	    return true;
	  } else {
	    $("#wrongID").show();
	  	return false;
	  }
	}

function login() {
	let user_id = document.loginForm.user_id.value;
	let user_pw = document.loginForm.user_pw.value;
	
	console.log(IDValidation());
	if (!IDValidation()){
		alert("올바른 이메일 아이디를 입력하십시오.");
		$(wrongID).show();
	} else {
		$(wrongID).hide();
		//alert(user_id);
		if (!PWValidation()){
			$(wrongPW).show();
			alert("올바른 비밀번호를 입력하십시오.");
		} else {
			$(wrongPW).hide();
			//alert(user_pw);
			document.loginForm.action = "LoginServlet";
			document.loginForm.submit();
		}
	}
}
</script>

<style>
.wrongNotice {
    font-size: 0.8rem;
    margin-bottom: 10px;
    top: -0.8rem;
    position: relative;
    filter: invert(36%) sepia(97%) saturate(6269%) hue-rotate(352deg) brightness(91%) contrast(130%);
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
			<form name = "loginForm" method="post">
				<div class="form-floating mb-3" style="border-bottom: 1px solid #ccc;">
					<input type="email" class="form-control border-none" id="floatingInput" placeholder=" " name="user_id" onInput="javascript:IDValidation();"> 
					<label for="floatingInput" style="color: #ccc;"><img src="./repo/person-fill.svg" class="loginform-img"> Email ID</label>
				</div>
				<span id="wrongID" class="wrongNotice" style="display: none;"><img src="./repo/exclamation-circle.svg" class="small-img"> ID는 올바른 이메일 형식을 따라야 합니다.</span>
				<div class="form-floating mb-3" style="border-bottom: 1px solid #ccc;">
					<input type="password" class="form-control border-none" id="floatingPassword" placeholder=" " name="user_pw" onInput="javascript:PWValidation();"> 
					<label for="floatingPassword" style="color: #ccc;"><img src="./repo/lock-fill.svg" class="loginform-img"> Password</label>
				</div>
				<span id="wrongPW" class="wrongNotice" style="display: none;"><img src="./repo/exclamation-circle.svg" class="small-img"> 비밀번호는 영문, 숫자로 이루어진 4~20자리의 문자여야 합니다.</span>
				<div class="mb-4">
				<a href="">Forgot password?</a>
				</div>
				<div>
					<input type="button" onClick="javascript:login();" class="btn btn-color2 rounded-pill w-50 p-2 mb-3" value="Login">
					<input type="button" onClick="location.href='/SignUpForm.jsp'" class="btn btn-line-color2 rounded-pill w-50 p-2" value="Sign up">
				</div>
			</form>
		</div>
		</div>
	</div>

<%@ include file="/view/footer.jsp" %>

</body>
</html>