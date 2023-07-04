<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>인스턴트 이력서 생성기</title>
<%@ include file="/view/header.jsp" %>

<script>
<%
String userID = (String) session.getAttribute("userID");
if (userID == null || userID.equals("")) {
    response.sendRedirect("/Login.jsp");
} else {	
    response.sendRedirect("/ResumeTemplates.jsp");
}
%>

</script>

</head>
<body>
<%@ include file="/view/footer.jsp" %>
</body>
</html>