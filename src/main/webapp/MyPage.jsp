<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.instantresume.UserDAO" %>
<%@ page import="com.instantresume.UserVO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>

<title>인스턴트 이력서 생성기 | 마이페이지</title>
<%@ include file="/view/header.jsp" %>

<%String userID = (String) session.getAttribute("userID");%>

<script>
function updateProfileImage() {
    const formData = new FormData();
    formData.append('userId', '<%= userID %>');
    formData.append('file', $('#input-profile-pic')[0].files[0]);

    $.ajax({
        url: '/upload.do',
        type: 'POST',
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function(res) {
            if (res === "success") {
                alert("프로필 사진이 변경되었습니다.");
                window.location.reload();
            } else {
                alert("프로필 사진 변경에 실패했습니다.");
            }
        },
    });
}
</script>

</head>

<body>
<h1>마이페이지</h1>
<%
String userPW = null;
String userName = null;
String emailYN = null;
String profilePic = null;
String joinDate = null;

UserDAO dao = new UserDAO();
List<UserVO> vo = dao.userInfo(userID);

if (vo.size() != 0) {
    userPW = vo.get(0).getUserPW();
    userName = vo.get(0).getUserName();
    emailYN = vo.get(0).getEmailYN();
    profilePic = vo.get(0).getProfilePic();
    joinDate = vo.get(0).getJoinDate().substring(0, 10);
} else {
    response.sendRedirect("/");
}

if (emailYN.equals("Y")){
	emailYN = "checked";
} else {
	emailYN = "";
}

%>

<div class="container row-gap-3">
	<div class="center mb-3">
		<img src="/repo/profile/<%= profilePic %>" class="mb-3" style="width: 150px;">
<div class="container w-50 mb-3">

<!-- enctype=multipart/form-data -->

    <form action="/upload.do" method="post" enctype="multipart/form-data">
        <input type="hidden" name="userId" value="<%= userID %>">
        <input type="file" accept="image/gif, image/jpeg, image/png, image/bmp, application/svg" class="form-control d-inline" style="width: 50%" id="input-profile-pic" name="file">
        <button type="submit" class="btn btn-line-color2">프로필 사진 변경</button>
    </form>
</div>
	</div>
	<hr>
<div class="row mt-5">
	<form name="updateForm">
		<div class="container grid w-50 gap-3" style="margin: auto;">
			<div class="row">
				<div class="col-4">Email ID</div>
				<div class="col-8">
					<input type="text" class="form-control" name="userID" id="userID" value="<%= userID %>" readonly>
				</div>
			</div>
			<div class="row">
				<div class="col-4">가입일</div>
				<div class="col-8">
					<input type="text" class="form-control" id="joinDate" value="<%= joinDate %>" readonly>
				</div>
			</div>
			<div class="row">
				<div class="col-4">Name</div>
				<div class="col-8">
					<input type="text" class="form-control" name="userName" id="userName" value="<%= userName %>">
				</div>
			</div>
			<div class="row" id="oldPW">
				<div class="col-4">PW</div>
				<div class="col-8">
					<input type="password" class="form-control d-inline" id="oldPW" name="oldPW" style="width: calc(100% - 122px)">
					<span class="btn btn-line-color2" id="newPWButton" onclick="javascript:showNewPW();">비밀번호 변경</span>
				</div>
			</div>

			<div class="grid row-gap-3" id="newPW" style="display: none;">
			<div class="row">
				<div class="col-4">New PW</div>
				<div class="col-8">
					<input type="password" class="form-control" id="userPW" name="userPW" onInput="PWValidation(this.value); PWCheck();">
					<span id="wrongPW" class="wrongNotice" style="display: none;">
					<img src="./repo/exclamation-circle.svg" class="small-img"> 비밀번호는 영문, 숫자로 이루어진 4~20자리의 문자여야 합니다.</span>
				</div>
			</div>
			<div class="row">
				<div class="col-4">PW check</div>
				<div class="col-8">
					<input type="password" class="form-control" id="checkPW" onInput="PWCheck();">
					<span id="wrongPWCheck" class="wrongNotice" style="display: none;"><img src="./repo/exclamation-circle.svg" class="small-img"> 비밀번호 확인이 일치하지 않습니다.</span>
				</div>
			</div>
</div>

			<div class="row">
				<div class="col-4">광고 이메일 수신</div>
				<div class="col-8">
					<div class="form-check form-switch">
						<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" name="emailSwitch" style="height: 1.8rem; width: 3rem;" <%=emailYN %>>
						<input type="hidden" value="" id="emailYN" name="emailYN">
					</div>
				</div>
			</div>
		</div>
	</form>

<div class="center mt-5">
    <button type="button" id="change-password-btn" class="btn btn-color2 rounded-pill w-50 p-2" style="max-width: 240px;" onclick="javascript:validateForm();">회원정보 수정</button>
    <br>
    <button class="btn btn-line-color2 rounded-pill w-50 p-2 mt-3" style="max-width: 240px;" onclick="location.reload()">취소</button>
    <br>
    <button class="btn btn-outline-danger rounded-pill w-50 p-2 mt-5" style="max-width: 240px;" onclick="window.location.href='DeleteUser.jsp'">회원 탈퇴</button>
</div>

</div>
</div>

<script>
function showNewPW(){
	$("#newPW").show();
    $("#newPW input").prop("disabled", false);
    $("#newPWButton").html("변경 취소");
    $('#newPWButton').prev().css('width', 'calc(100% - 93px)');
    document.getElementById("newPWButton").onclick = function() {cancelNewPW();}
}

function cancelNewPW(){
	$("#newPW").hide();
    $("#newPW input").prop("disabled", true);
    $("#newPWButton").html("비밀번호 변경");
    $('#newPWButton').prev().css('width', 'calc(100% - 122px)');
    document.getElementById("newPWButton").onclick = function() {showNewPW();}
}

function validateForm(){
	let isValidate = true;
	
	if (document.updateForm.userName.value.length < 2){
		alert("올바른 이름을 입력하십시오.");
		isValidate = false;
        setTimeout(function () { $("#userName").focus(); }, 100);
	} else if (document.updateForm.oldPW.value.length < 4){
		alert("올바른 비밀번호를 입력하십시오.");
		isValidate = false;
		setTimeout(function () { $("#oldPW").focus(); }, 100);
	} else if ($("#userPW").is(":visible") && ( document.updateForm.userPW.value.length < 4 || $("#wrongPW").is(":visible")) ){
		alert("새 비밀번호를 입력하십시오.");
		isValidate = false;
		setTimeout(function () { $("#userPW").focus(); }, 100);
	} else if ($("#checkPW").is(":visible") && ( document.updateForm.checkPW.value.length < 4 || $("#wrongPWCheck").is(":visible") )){
        alert("비밀번호 확인이 일치하지 않습니다.");
        isValidate = false;
		setTimeout(function () { $("#checkPW").focus(); }, 100);
	} else {
		isValidate = true;
	}
	
	if (document.updateForm.emailSwitch.checked){
		document.updateForm.emailYN.value = "Y";
	} else {
		document.updateForm.emailYN.value = "N";			
	}
	
	if (isValidate && $("#checkPW").is(":visible")){
		const oldPassword = document.updateForm.oldPW.value;
        const newPassword = document.updateForm.userPW.value;
        const userName = document.updateForm.userName.value;
        const emailYN = document.updateForm.emailYN.value;

        $.ajax({
            url: '/update',
            type: 'POST',
            data: {
            	type: 'all',
                userId: '<%= userID %>',
                userName: userName,
                oldPassword: oldPassword,
                newPassword: newPassword,
                emailYN: emailYN
            },
            success: function(res) {
                if (res === "success") {
                    alert("회원정보가 변경되었습니다. 다시 로그인하세요.");
                    location.href("logout");
                } else {
                    alert("비밀번호가 틀렸습니다.");
                }
            },
        });
	} else if (isValidate && $("#checkPW").is(":hidden")){
		const oldPassword = document.updateForm.oldPW.value;
        const userName = document.updateForm.userName.value;
        const emailYN = document.updateForm.emailYN.value;

        $.ajax({
            url: '/update',
            type: 'POST',
            data: {
            	type: 'basic',
                userId: '<%= userID %>',
                userName: userName,
                oldPassword: oldPassword,
                emailYN: emailYN
            },
            success: function(res) {
                if (res === "success") {
                    alert("회원정보가 변경되었습니다.");
                    window.location.reload();
                } else {
                    alert("비밀번호가 틀렸습니다.");
                }
            },
        });
	}
}
</script>

<%@ include file="/view/footer.jsp" %>

</body>
</html>
