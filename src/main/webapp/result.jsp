<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset=”UTF-8">
<c:set var="file1" value="${param.param1}"  />    
<c:set var="file2" value="${param.param2}"  />
 
<title>이미지 파일 출력하기</title>
</head>
<body>

파라미터 1 :<c:out value="${file1}"  /><br>
파라미터 2 :<c:out value="${file2}"  /><br>

<c:if test="${not empty file1 }">
<img src="${contextPath}/download.do?fileName=${file1}"  width=300 height=300 /><br>
</c:if>
<br>
<c:if test="${not empty file2 }">
<img src="${contextPath}/download.do?fileName=${file2}"  width=300 height=300 /><br>
</c:if>
파일 내려받기 :<br>
<a href="download.do?fileName=myfile.pdf">Download PDF</a>
<a href="download.do?fileName=myfile.html">Download HTML</a>
</body>
</html>

