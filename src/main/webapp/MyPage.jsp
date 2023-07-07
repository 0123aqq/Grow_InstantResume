<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.instantresume.UserDAO" %>
<%@ page import="com.instantresume.UserVO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<title>인스턴트 이력서 생성기 | 마이페이지</title>
<%@ include file="/view/header.jsp" %>

<script>
//ajax로 프로필 사진 변경 구현
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

%>

<div class="container row-gap-3">
	<div class="center mb-3">
		<img src="/repo/profile/<%= profilePic %>" class="mb-3" style="width: 150px;">
		<div class="container w-50 mb-3">
			<form name="updatePICForm" method="post">
				<input type="file" accept="image/gif, image/jpeg, image/png, image/bmp, application/svg" class="form-control d-inline" style="width: 50%"> <button class="btn btn-line-color2">프로필 사진 변경</button>
			</form>
		</div>
	</div>
	<hr>
<div class="row mt-5">
	<form name="signUpForm">
		<div class="container grid w-50 gap-3" style="margin: auto;">
			<div class="row">
				<div class="col-4">Email ID</div>
				<div class="col-8">
					<input type="text" class="form-control" id="userID" value="<%= userID %>" disabled>
				</div>
			</div>
			<div class="row">
				<div class="col-4">가입일</div>
				<div class="col-8">
					<input type="text" class="form-control" id="joinDate" value="<%= joinDate %>" disabled>
				</div>
			</div>
			<div class="row">
				<div class="col-4">Name</div>
				<div class="col-8">
					<input type="text" class="form-control" id="userName" value="<%= userName %>">
				</div>
			</div>
			<div class="row" id="oldPW">
				<div class="col-4">PW</div>
				<div class="col-8">
					<input type="password" class="form-control d-inline" style="width: calc(100% - 122px)" id="oldPWVal" value=""> <span class="btn btn-line-color2" onclick="javascript:checkPW();">비밀번호 변경</span>
				</div>
			</div>

			<div class="grid row-gap-3" id="newPW" style="display: none;">
			<div class="row">
				<div class="col-4">New PW</div>
				<div class="col-8">
					<input type="password" class="form-control" id="userPW" name="userPW" value="" onInput="PWValidation(this.value); PWCheck();">
					<span id="wrongPW" class="wrongNotice" style="display: none;">
					<img src="./repo/exclamation-circle.svg" class="small-img"> 비밀번호는 영문, 숫자로 이루어진 4~20자리의 문자여야 합니다.</span>
				</div>
			</div>
			<div class="row">
				<div class="col-4">PW check</div>
				<div class="col-8">
					<input type="password" class="form-control" id="checkPW" value="" onInput="PWCheck();">
					<span id="wrongPWCheck" class="wrongNotice" style="display: none;"><img src="./repo/exclamation-circle.svg" class="small-img"> 비밀번호 확인이 일치하지 않습니다.</span>
				</div>
			</div>
</div>

			<div class="row">
				<div class="col-4">광고 이메일 수신</div>
				<div class="col-8">
					<div class="form-check form-switch">
						<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" style="height: 1.8rem; width: 3rem;" checked>
						<input type="hidden" value="" id="emailYN" name="emailYN">
					</div>
				</div>
			</div>
		</div>
	</form>

			<div class="center mt-5">
				<button class="btn btn-color2 rounded-pill w-50 p-2"
					style="max-width: 240px;">회원정보 수정</button>
				<br>
				<button class="btn btn-line-color2 rounded-pill w-50 p-2 mt-3"
					style="max-width: 240px;" onclick="location.reload()">취소</button>
				<br>
				<button class="btn btn-outline-danger rounded-pill w-50 p-2 mt-5"
					style="max-width: 240px;"
					onclick="window.location.href='DeleteUser.jsp'">회원 탈퇴</button>
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

