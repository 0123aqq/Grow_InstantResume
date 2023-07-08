<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.instantresume.UserDAO" %>
<%@ page import="com.instantresume.UserVO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>

<%String userID = (String) session.getAttribute("userID");
String userName = request.getParameter("userName"); 
String profilePic = request.getParameter("profilePic"); 
String userIntroduction = request.getParameter("userIntroduction"); 
String userGitHub = request.getParameter("userGitHub"); 

String startDate = request.getParameter("startDate"); 
String finishDate = request.getParameter("finishDate"); 

%>

<head>
<meta charset="UTF-8">
<title>인스턴트 이력서 생성기</title>
<%@ include file="/view/header.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta property="og:title" content="<%=userName %> 이력서">
<meta property="og:image" content="./repo/profile/<%=profilePic %>">
<meta property="og:description" content="<%=userName %>의 이력서입니다.">

<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/frame.css">
<link rel="stylesheet" href="./css/github-markdown.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
h2 {
	color: #000000;
	padding-top: 1.2rem;
}
div[id="contents"]>div{
margin-top: 0;}

.markdown-body {
	box-sizing: border-box;
	min-width: 200px;
	max-width: 980px;
	margin: 0 auto;
	padding: 45px;
}

@media (max-width: 767px) {
	.markdown-body {
		padding: 15px;
	}
}
</style>

</head>

<body>

<div id="contents">
<textarea class="form-control" id="input" style="height: calc(100vh - 200px)">
	
# 😀‍ About Me

<img align="left" height="150px" src="<%=profilePic %>">

### <%=userName %>
``<%=userIntroduction %>``

📩  E-mail: <%=userID %>
 
☑️ GitHub: [<%=userGitHub %>](<%=userGitHub %>)

<br>

# 💻 Skills
<%
String[] skillHeaderArray = request.getParameterValues("skillHeader");
String[] skillListArray = request.getParameterValues("skillList");
if (skillHeaderArray != null && skillListArray != null) { for (int i = 0; i < skillHeaderArray.length; i++) {
%>
> ### <%= skillHeaderArray[i] %>
<%String[] split = skillListArray[i].split(",");for (int j = 0; j < split.length; j++) {	String skill = split[j].trim().toLowerCase();	String badgeUrl;	switch (skill) {		case "html/css":			badgeUrl = "https://img.shields.io/badge/-HTML/CSS-1572B6?style=flat&amp;logo=css3&amp;logoColor=white";			break;		case "java":			badgeUrl = "https://img.shields.io/badge/-JAVA-orange?style=flat&amp;logo=java&amp;logoColor=white";			break;		case "javascript":			badgeUrl = "https://img.shields.io/badge/-JavaScript-F7DF1E?style=flat&amp;logo=JavaScript&amp;logoColor=white";			break;		case "spring":			badgeUrl = "https://img.shields.io/badge/-Spring-6DB33F?style=flat&amp;logo=flat&amp;logoColor=white";			break;		case "node.js":			badgeUrl = "https://img.shields.io/badge/-Node.js-339933?style=flat&amp;logo=nodedotjs&amp;logoColor=white";			break;		case "react":		case "react.js":			badgeUrl = "https://img.shields.io/badge/-React-61DAFB?style=flat&amp;logo=react&amp;logoColor=white";			break;		case "mysql":			badgeUrl = "https://img.shields.io/badge/-MySQL-4479A1?style=flat&amp;logo=mysql&amp;logoColor=white";			break;		case "oracle":			badgeUrl = "https://img.shields.io/badge/-Oracle-F80000?style=flat&amp;logo=oracle&amp;logoColor=white";			break;		default:			badgeUrl = "https://img.shields.io/badge/-"+skill+"-1D267D?style=flat&amp;logo="+skill+"&amp;logoColor=white";	}%><img src="<%= badgeUrl %>"> 
<%}}}%>

<br>

# 🗂️ Projects
<%
String[] projectTypeArray = request.getParameterValues("projectType");
String[] projectNameArray = request.getParameterValues("projectName");
String[] developerNameArray = request.getParameterValues("developerName");
String[] contributionArray = request.getParameterValues("contribution");
String[] startDateArray = request.getParameterValues("startDate");
String[] finishDateArray = request.getParameterValues("finishDate");
String[] usedStacksArray = request.getParameterValues("usedStacks");
String[] projectLinkArray = request.getParameterValues("projectLink");
String[] projectFeaturesArray = request.getParameterValues("projectFeatures");
String[] projectEtcArray = request.getParameterValues("projectEtc");
if (projectTypeArray != null) {
	for (int i = 0; i < projectTypeArray.length; i++) {
		switch (projectTypeArray[i].toLowerCase()) {
			case "personal":
				projectTypeArray[i] = projectTypeArray[i] + "-blue";
				break;
			case "team":
				projectTypeArray[i] = projectTypeArray[i] + "-green";
				break;
		}
for (int j = 0; j < finishDateArray.length; j++) {
	if (finishDateArray[j] == ""){
		finishDateArray[j] = "진행 중";
	}
}
%>
### <img src="https://img.shields.io/badge/Project-<%=projectTypeArray[i] %>"> <%=projectNameArray[i] %>
  
|**설명**| <%=projectEtcArray[i] %> |
|:---------|:-----|
|||
|**참여자 (기여도)**| <%=developerNameArray[i] %> (<%=contributionArray[i] %>%) |
|**기간**|*<%=startDateArray[i] %> ~ <%=finishDateArray[i] %>*|
|**사용 기술**| <%=usedStacksArray[i] %> |
|**URL**| [<%= projectLinkArray[i] %>](<%= projectLinkArray[i] %>) |
|**주요 기능**|<% String[] split = projectFeaturesArray[i].split("\n");for (int j = 0; j < split.length; j++) {out.print(" - " + split[j].trim());if (j < split.length - 1) {out.print("<br>");}} %>|

<img align="center" src="https://capsule-render.vercel.app/api?type=cylinder&color=D4ADFC30&height=3">

</textarea>			
<%}}%>
<div class="markdown-body" id="output" style="height: calc(100vh - 200px);padding: 25px;overflow-y: scroll;">
</div>
  <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
  <script>
    document.getElementById('output').innerHTML =
      marked.parse(document.getElementById('input').value);
  </script>
</div>
	
<%@include file="/view/footer.jsp" %>
</body></html>