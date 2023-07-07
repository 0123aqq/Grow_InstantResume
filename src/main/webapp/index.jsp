<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>인스턴트 이력서 생성기</title>
<%@ include file="/view/header.jsp" %>

<%String userID = (String) session.getAttribute("userID");%>


<script>
<%
if (userID == null || userID.equals("")) {
    //response.sendRedirect("Login.jsp");
	RequestDispatcher dispatch = request.getRequestDispatcher("Login.jsp");
	dispatch.forward(request, response);
    
} else {	
    //response.sendRedirect("ResumeTemplates.jsp");
	RequestDispatcher dispatch = request.getRequestDispatcher("ResumeTemplates.jsp");
	dispatch.forward(request, response);
}
%>

</script>

</head>
<body>
<%@ include file="/view/footer.jsp" %>
</body>
</html>