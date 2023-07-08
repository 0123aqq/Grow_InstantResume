<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, com.instantresume.UserDAO"%>

<!DOCTYPE html>
<html>
<head>
<title>인스턴트 이력서 생성기 | 회원 탈퇴</title>

<%@ include file="/view/header.jsp" %>

<%
String userID = (String) session.getAttribute("userID");
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
      var userID = document.getElementById("userID").value;
      var userPW = document.getElementById("userPW").value;

      if (userID != "" && userPW != "") {
          document.getElementById("deleteUserForm").submit();
      } else {
          alert("Email ID와 Password를 입력해주세요.");
      }
 }

 window.onload = function() {
     if ('<%=showResult%>'.toString() === 'true') {
         alert('<%= session.getAttribute("message") %>');
         <% session.removeAttribute("message"); %>
         window.location.href = "logout";
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
		<h1>회원 탈퇴</h1>
		<div class="col-6 center">
		    <form id="deleteUserForm" method="post">
		<div class="container grid gap-3 mt-3" style="margin: auto;">
	<div class="row">
				<div class="col-4">Email ID</div>
				<div class="col-8">
					<input type="text" class="form-control" name="userID" id="userID" value="<%= userID %>" readonly>
				</div>
			</div>
			
			
			<div class="row">
				<div class="col-4">PW</div>
				<div class="col-8">
					<input type="password" class="form-control" id="userPW" name="userPW" value="">
				</div>
			</div>

		</div>  <button type="button" onclick="javascript:deleteUser();" class="btn btn-danger rounded-pill w-50 mt-5" style="max-width: 240px;">회원 탈퇴</button>
    </form>
	</div>
	</div>

<%@ include file="/view/footer.jsp" %>

</body>
</html>
