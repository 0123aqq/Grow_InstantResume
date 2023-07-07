<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, com.instantresume.UserDAO"%>

<!DOCTYPE html>
<html>
<head>
<title>인스턴트 이력서 생성기 | 회원 탈퇴</title>

<%@ include file="/view/header.jsp" %>


<%
String userID = request.getParameter("userID");
String userPW = request.getParameter("userPW");
boolean showResult = false;
if(userID != null && userPW != null) {
	// UserDAO 인스턴스를 만들고 deleteUser 호출
	UserDAO userDAO = new UserDAO();
	boolean result = userDAO.deleteUser(userID, userPW);
	showResult = true;
	if (result) {
		session.setAttribute("message", "정상적으로 탈퇴되었습니다.");
	} else {
		session.setAttribute("message", "회원 탈퇴 실패");
	}
}
%>

<script>
 function deleteUser() {
      var userID = document.getElementById("floatingInput").value;
      var userPW = document.getElementById("floatingPassword").value;

      if (userID != "" && userPW != "") {
          document.getElementById("userID").value = userID;
          document.getElementById("userPW").value = userPW;
          document.getElementById("deleteUserForm").submit();
      } else {
          alert("Email ID와 Password를 입력해주세요.");
      }
 }

 window.onload = function() {
     if ('<%=showResult%>'.toString() === 'true') {
         alert('<%= session.getAttribute("message") %>');
         <% session.removeAttribute("message"); %>
         window.location.href = "Login.jsp";
     }
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
			<div class="form-floating mb-3" style="border-bottom: 1px solid #ccc;">
			     <input type="email" class="form-control border-none" id="floatingInput" placeholder=" " name="userID"> 
			     <label for="floatingInput" style="color: #ccc;"><img src="./repo/person-fill.svg" class="loginform-img"> Email ID</label>
			</div>
			<div class="form-floating mb-3" style="border-bottom: 1px solid #ccc;">
			     <input type="password" class="form-control border-none" id="floatingPassword" placeholder=" " name="userPW"> 
			     <label for="floatingPassword" style="color: #ccc;"><img src="./repo/lock-fill.svg" class="loginform-img"> Password</label>
			</div>
			
			<form id="deleteUserForm" method="post" style="display: none;">
			     <input type="hidden" id="userID" name="userID">
			     <input type="hidden" id="userPW" name="userPW">
			</form>
			
			<div class="mb-4">
			</div>
			<div>
				<div class="d-grid gap-2 col-6 mx-auto">
				      <button type="button" onClick="javascript:deleteUser();" class="btn btn-danger">회원 탈퇴</button>
				</div>
			</div>
			</div>
		</div>
	</div>

<%@ include file="/view/footer.jsp" %>

</body>
</html>
