<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.instantresume.UserDAO" %>
<%@ page import="com.instantresume.UserVO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
		<%String userID = (String) session.getAttribute("userID");%>
		
<%
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
<script src="./script/myscript.js"></script>

<style>
h2 {
	color: #000000;
	padding-top: 1.2rem;
}
div[id="contents"]>div{
margin-top: 0;}

<!--GitHub Style-->
readme .markdown-body, .readme .plain {
    word-wrap: break-word;
}

.markdown-body h1 {
    padding-bottom: 0.3em;
    font-size: 2em;
    border-bottom: 1px solid var(--borderColor-muted, var(--color-border-muted));
    margin-bottom: 16px;
    font-weight: var(--base-text-weight-semibold, 600);
    line-height: 1.25;
    }
  .markdown-body p, .markdown-body blockquote, .markdown-body ul, .markdown-body ol, .markdown-body dl, .markdown-body table, .markdown-body pre, .markdown-body details {
    margin-top: 0;
    margin-bottom: 16px;
}    
.markdown-body blockquote {
    padding: 0 1em;
    color: var(--fgColor-muted, var(--color-fg-muted));
    border-left: 0.25em solid var(--borderColor-default, var(--color-border-default));
}

.markdown-body table {
    display: block;
    width: 100%;
    width: max-content;
    max-width: 100%;
    overflow: auto;
    border-collapse: collapse;
    border-collapse: collapse;
}

thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}
th{
    display: table-cell;
    vertical-align: inherit;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
.markdown-body table tr {
    background-color: var(--bgColor-default, var(--color-canvas-default));
    border-top: 1px solid var(--borderColor-muted, var(--color-border-muted));
}
.markdown-body table th, .markdown-body table td {
    padding: 6px 13px;
    border: 1px solid var(--borderColor-default, var(--color-border-default));
}
tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
.markdown-body ul, .markdown-body ol {
    padding-left: 2em;
}
<!--GitHub Style-->
</style>

<script>
if ("<%=userGitHub %>" != null && "<%=userGitHub %>" != ""){
$("#gitHubDiv").show();	
}
</script>

</head>

<body>

<div id="contents" style="height: calc(100vh - 200px)">
<textarea class="form-control">
	
# 😀‍ About Me

<img align="left" height="150px" src="<%=profilePic %>"/>

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
<%String[] split = skillListArray[i].split(",");for (int j = 0; j < split.length; j++) {	String skill = split[j].trim().toLowerCase();	String badgeUrl;	switch (skill) {		case "html/css":			badgeUrl = "https://img.shields.io/badge/-HTML/CSS-1572B6?style=flat&amp;logo=css3&amp;logoColor=white";			break;		case "java":			badgeUrl = "https://img.shields.io/badge/-JAVA-orange?style=flat&amp;logo=java&amp;logoColor=white";			break;		case "javascript":			badgeUrl = "https://img.shields.io/badge/-JavaScript-F7DF1E?style=flat&amp;logo=JavaScript&amp;logoColor=white";			break;		case "spring":			badgeUrl = "https://img.shields.io/badge/-Spring-6DB33F?style=flat&amp;logo=flat&amp;logoColor=white";			break;		case "node.js":			badgeUrl = "https://img.shields.io/badge/-Node.js-339933?style=flat&amp;logo=nodedotjs&amp;logoColor=white";			break;		case "react":		case "react.js":			badgeUrl = "https://img.shields.io/badge/-React-61DAFB?style=flat&amp;logo=react&amp;logoColor=white";			break;		case "mysql":			badgeUrl = "https://img.shields.io/badge/-MySQL-4479A1?style=flat&amp;logo=mysql&amp;logoColor=white";			break;		case "oracle":			badgeUrl = "https://img.shields.io/badge/-Oracle-F80000?style=flat&amp;logo=oracle&amp;logoColor=white";			break;		default:			badgeUrl = "https://img.shields.io/badge/-"+skill+"-1D267D?style=flat&amp;logo="+skill+"&amp;logoColor=white";	}%><img src="<%= badgeUrl %>"> <%}}}%>

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

<div>
<div class="Box-sc-g0xbh4-0 markdown-body container-lg"><h1 data-sourcepos="2:1-2:18" dir="auto"><a id="user-content--about-me" class="anchor" aria-hidden="true" href="#-about-me"></a>😀‍ About Me</h1>
<p dir="auto"><a target="_blank" rel="noopener noreferrer nofollow" href="https://camo.githubusercontent.com/27dbaefb77559fda1717809716d9eb09ef38bcf8a53a16619be0e85ead96ee32/68747470733a2f2f73696d706c6569636f6e732e6f72672f69636f6e732f6769746875622e737667"><img align="left" height="150px" src="https://camo.githubusercontent.com/27dbaefb77559fda1717809716d9eb09ef38bcf8a53a16619be0e85ead96ee32/68747470733a2f2f73696d706c6569636f6e732e6f72672f69636f6e732f6769746875622e737667" data-canonical-src="https://simpleicons.org/icons/github.svg" style="max-width: 100%;"></a></p>
<h3 data-sourcepos="6:1-6:13" dir="auto"><a id="user-content-유맑음" class="anchor" aria-hidden="true" href="#유맑음"></a>유맑음</h3>
<p data-sourcepos="7:1-7:22" dir="auto"><code>한줄소개잘됨</code></p>
<p data-sourcepos="9:1-9:33" dir="auto"><g-emoji class="g-emoji" alias="envelope_with_arrow" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f4e9.png">📩</g-emoji>&nbsp; E-mail: <a href="mailto:yumalg12@gmail.com">yumalg12@gmail.com</a></p>
<p data-sourcepos="11:1-11:73" dir="auto"><g-emoji class="g-emoji" alias="ballot_box_with_check" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2611.png">☑️</g-emoji> GitHub: <a href="https://github.com/yumalg12">https://github.com/yumalg12</a></p>
<br>
<h1 data-sourcepos="15:1-15:13" dir="auto"><a id="user-content--skills" class="anchor" aria-hidden="true" href="#-skills"></a><g-emoji class="g-emoji" alias="computer" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f4bb.png">💻</g-emoji> Skills</h1>
<blockquote data-sourcepos="17:1-17:16">
<h3 data-sourcepos="17:3-17:16" dir="auto"><a id="user-content-보유-중" class="anchor" aria-hidden="true" href="#보유-중"></a>보유 중</h3>
</blockquote>
<p data-sourcepos="18:1-18:184" dir="auto"><a target="_blank" rel="noopener noreferrer nofollow" href="https://camo.githubusercontent.com/49fc66aed4ac2ecd34cd44f5c531eaff6d34eae3a7b2eb3baca68b1e40e5b4c5/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f2d4a4156412d6f72616e67653f7374796c653d666c6174266c6f676f3d6a617661266c6f676f436f6c6f723d7768697465"><img src="https://camo.githubusercontent.com/49fc66aed4ac2ecd34cd44f5c531eaff6d34eae3a7b2eb3baca68b1e40e5b4c5/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f2d4a4156412d6f72616e67653f7374796c653d666c6174266c6f676f3d6a617661266c6f676f436f6c6f723d7768697465" data-canonical-src="https://img.shields.io/badge/-JAVA-orange?style=flat&amp;logo=java&amp;logoColor=white" style="max-width: 100%;"></a> <a target="_blank" rel="noopener noreferrer nofollow" href="https://camo.githubusercontent.com/94aa110f3221edd73fe447d3065b0b86ef46003dc69c6d0ff0e39da78ef2e6e5/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f2d52656163742d3631444146423f7374796c653d666c6174266c6f676f3d7265616374266c6f676f436f6c6f723d7768697465"><img src="https://camo.githubusercontent.com/94aa110f3221edd73fe447d3065b0b86ef46003dc69c6d0ff0e39da78ef2e6e5/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f2d52656163742d3631444146423f7374796c653d666c6174266c6f676f3d7265616374266c6f676f436f6c6f723d7768697465" data-canonical-src="https://img.shields.io/badge/-React-61DAFB?style=flat&amp;logo=react&amp;logoColor=white" style="max-width: 100%;"></a></p>
<blockquote data-sourcepos="19:1-19:16">
<h3 data-sourcepos="19:3-19:16" dir="auto"><a id="user-content-공부-중" class="anchor" aria-hidden="true" href="#공부-중"></a>공부 중</h3>
</blockquote>
<p dir="auto"><a target="_blank" rel="noopener noreferrer nofollow" href="https://camo.githubusercontent.com/704651c2e3cc8c1171d75fa46abcbb6075d3ec1f41933f33621f0601b9f6f89a/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f2d537072696e672d3644423333463f7374796c653d666c6174266c6f676f3d666c6174266c6f676f436f6c6f723d7768697465"><img src="https://camo.githubusercontent.com/704651c2e3cc8c1171d75fa46abcbb6075d3ec1f41933f33621f0601b9f6f89a/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f2d537072696e672d3644423333463f7374796c653d666c6174266c6f676f3d666c6174266c6f676f436f6c6f723d7768697465" data-canonical-src="https://img.shields.io/badge/-Spring-6DB33F?style=flat&amp;logo=flat&amp;logoColor=white" style="max-width: 100%;"></a></p> 
<br>
<h1 data-sourcepos="24:1-24:18" dir="auto"><a id="user-content-️-projects" class="anchor" aria-hidden="true" href="#️-projects"></a><g-emoji class="g-emoji" alias="card_index_dividers" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f5c2.png">🗂️</g-emoji> Projects</h1>
<h3 data-sourcepos="26:1-26:95" dir="auto"><a id="user-content--개인프로젝트-테스트" class="anchor" aria-hidden="true" href="#-개인프로젝트-테스트"></a><a target="_blank" rel="noopener noreferrer nofollow" href="https://camo.githubusercontent.com/1a15c8b1d5135b2bc5d1052e9ffa772868e4c9a905ce9a6e28e7497334632417/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f50726f6a6563742d506572736f6e616c2d626c7565"><img src="https://camo.githubusercontent.com/1a15c8b1d5135b2bc5d1052e9ffa772868e4c9a905ce9a6e28e7497334632417/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f50726f6a6563742d506572736f6e616c2d626c7565" data-canonical-src="https://img.shields.io/badge/Project-Personal-blue" style="max-width: 100%;"></a> 개인프로젝트 테스트</h3>
<table data-sourcepos="28:1-35:34">
<thead>
<tr data-sourcepos="28:1-28:33">
<th align="left" data-sourcepos="28:2-28:11"><strong>설명</strong></th>
<th align="left" data-sourcepos="28:13-28:32">소개글소개글</th>
</tr>
</thead>
<tbody>
<tr data-sourcepos="30:1-30:3">
<td align="left" data-sourcepos="30:2-30:1"></td>
<td align="left" data-sourcepos="30:3-30:2"></td>
</tr>
<tr data-sourcepos="31:1-31:46">
<td align="left" data-sourcepos="31:2-31:26"><strong>참여자 (기여도)</strong></td>
<td align="left" data-sourcepos="31:28-31:45">유맑음 (100%)</td>
</tr>
<tr data-sourcepos="32:1-32:38">
<td align="left" data-sourcepos="32:2-32:11"><strong>기간</strong></td>
<td align="left" data-sourcepos="32:13-32:37"><em>2023-06-26 ~ 2023-07-28</em></td>
</tr>
<tr data-sourcepos="33:1-33:37">
<td align="left" data-sourcepos="33:2-33:18"><strong>사용 기술</strong></td>
<td align="left" data-sourcepos="33:20-33:36">ㅇㅁㄴㅇㄹ</td>
</tr>
<tr data-sourcepos="34:1-34:28">
<td align="left" data-sourcepos="34:2-34:8"><strong>URL</strong></td>
<td align="left" data-sourcepos="34:10-34:27"><a href="/yumalg12/yumalg12/blob/main/%EC%97%86%EC%9D%8C">없음</a></td>
</tr>
<tr data-sourcepos="35:1-35:34">
<td align="left" data-sourcepos="35:2-35:18"><strong>주요 기능</strong></td>
<td align="left" data-sourcepos="35:20-35:34">- ㄴㅇㄴㅇ</td>
</tr>
</tbody>
</table>
<ul data-sourcepos="36:2-38:0" dir="auto">
<li data-sourcepos="36:2-36:12">ㄴㅍㄴ</li>
<li data-sourcepos="37:2-38:0">ㅁㄴㅇㄹ<br> |</li>
</ul>
<p dir="auto"><a target="_blank" rel="noopener noreferrer nofollow" href="https://camo.githubusercontent.com/7863e9b6dcb97c1c1b0fd9d1428abc5b648e1fb05e002639ca6b143aea73b074/68747470733a2f2f63617073756c652d72656e6465722e76657263656c2e6170702f6170693f747970653d63796c696e64657226636f6c6f723d4434414446433330266865696768743d33"><img align="center" src="https://camo.githubusercontent.com/7863e9b6dcb97c1c1b0fd9d1428abc5b648e1fb05e002639ca6b143aea73b074/68747470733a2f2f63617073756c652d72656e6465722e76657263656c2e6170702f6170693f747970653d63796c696e64657226636f6c6f723d4434414446433330266865696768743d33" data-canonical-src="https://capsule-render.vercel.app/api?type=cylinder&amp;color=D4ADFC30&amp;height=3" style="max-width: 100%;"></a></p>
</div>
</div>
<%}}%>
	</div>
	
<%@include file="/view/footer.jsp" %>
</body></html>