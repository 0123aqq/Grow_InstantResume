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

    if (!IDValidation(userID)) {
        alert("올바른 이메일 아이디를 입력하십시오.");
        $("#wrongID").show();
        setTimeout(function () { $("#userID").focus(); }, 100);
    } else {
        if (!(document.signUpForm.userID.readOnly)) {
            alert("이메일 중복확인이 필요합니다.");
            setTimeout(function () { $("#duplicateID").focus(); }, 100);
        } else {
            if ($("#userName").val().length < 2) {
                alert("이름을 입력하십시오.");
                setTimeout(function () { $("#userName").focus(); }, 100);
            } else {
                if (!PWValidation(userPW)) {
                    $("#wrongPW").show();
                    alert("올바른 비밀번호를 입력하십시오.");
                    setTimeout(function () { $("#userPW").focus(); }, 100);
                } else {
                	if ($("#wrongPWCheck").is(":visible")) {
                        alert("비밀번호 확인이 일치하지 않습니다.");
                        setTimeout(function () { $("#checkPW").focus(); }, 100);
                    } else {
                        $(".wrongNotice").hide();
                        document.signUpForm.method = "post";
                        document.signUpForm.action = "signup";
                        document.signUpForm.submit();
                    }
                }
            }
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

function duplicateID() {
	let userID = $("#userID").val();
	
	if (!IDValidation(userID)){
	    alert("올바른 이메일 아이디를 입력하십시오.");
	    $("#wrongID").show();
	    setTimeout(function () { $("#userID").focus(); }, 100);
	} else {
		 $.ajax({
		        type: "post",
		        async: false,
		        url: "EmailValidationServletDTO",
		        dataType: "json",
		        data: {email: userID},
		        success: function(data, textStatus) {
		            if (data.isEmailDuplicate == 'false') {
		                alert("사용할 수 있는 ID입니다.");
		                $("#userID").prop("readonly", true);
		            } else {
		                alert("사용할 수 없는 ID입니다.");
		        	    setTimeout(function () { $("#userID").focus(); }, 100);
		            }
		        },
		        error: function(data, textStatus) {
		            alert("오류가 발생했습니다.");
		        },
		        complete: function(data, textStatus) {
		        }
		    });
	}
	
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
<input type="text" class="form-control" id="userID" name="userID" value="" onInput="javascript:IDValidation(this.value);" style="width: calc(100% - 96px); display: inline;">
<span class="btn btn-line-color2" id="duplicateID" onclick="javascript:duplicateID(this.value);">중복확인</span>
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
