<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.instantresume.UserDAO" %>
<%@ page import="com.instantresume.UserVO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<title>인스턴트 이력서 생성기 | 이력서 양식 01</title>
<%@ include file="/view/header.jsp"%>
<style>
.skillBox {
	padding: 5px 10px 7px 10px;
    display: inline;
    margin: 3px;
    top: 1rem;
    position: relative;
    background-color: #D4ADFC25;
    cursor: pointer;
}

.skillBox:hover{
	background-color: #ff000050;
	color: #aaa;
}

#projectFeaturesList>li{
margin-bottom: 0.275rem;
}
</style>
</head>
<body>
	<h1>이력서 양식 01 </h1>
<br>

<%String userID = (String) session.getAttribute("userID"); 
String userName = null;
String profilePic = null;

UserDAO dao = new UserDAO();
List<UserVO> vo = dao.userInfo(userID);

if (vo.size() != 0) {
    userName = vo.get(0).getUserName();
    profilePic = vo.get(0).getProfilePic();
} else {
    response.sendRedirect("/");
}

%>

	<form name="ResumeForm" method="post" accept-charset="utf-8" action="GeneratedResume01.jsp">
		<div class="container grid gap-5" style="grid-template-columns: 1fr 1fr;" id="resumeFormDiv">
			
			<!-- About me 시작 -->
			<div class="grid row-gap-3">			
				<h3>About Me</h3>

				<div class="row">
					<div class="col-4">Name</div>
					<div class="col-8">
						<input type="text" class="form-control" id="userName"
							name="userName" value="<%=userName %>" readonly>
					</div>
				</div>

				<div class="row">
					<div class="col-4">Email</div>
					<div class="col-8">
						<input type="text" class="form-control" id="userID"
							name="userID" value="<%=userID %>" readonly>
					</div>
				</div>

				<div class="row">
					<div class="col-4">프로필 사진</div>
					<div class="col-8">
						<input type="file" accept="image/gif, image/jpeg, image/png, image/bmp, application/svg" class="form-control" id="profilePic"
							name="profilePic" value="<%=profilePic %>">
					</div>
				</div>

				<div class="row">
					<div class="col-4">한 줄 자기소개</div>
					<div class="col-8">
						<input type="text" class="form-control" id="userIntroduction" name="userIntroduction" value="">
					</div>
				</div>

				<div class="row">
					<div class="col-4">GitHub Link</div>
					<div class="col-8">
						<input type="text" class="form-control" id="userGitHub" name="userGitHub" value="">
					</div>
				</div>
			</div>
			<!-- About me 끝 -->
			
			<!-- Skills 시작 -->
			<div class="grid row-gap-3" id="skillsDiv">
				<h3>Skills <img src="/repo/addition-color-icon.svg" class="small-img-2x" 
				style="width: 24px; cursor: pointer;" onClick="javascript:addSkillSet();"></h3>
				<div class="row">
					<select class="form-select w-auto d-inline" style="margin-left: 0.75rem;"><option value="having">보유 중</option>
						<option value="studying">공부 중</option>
						<option value="experienced">접해 봄</option>
						<option value="input">직접 입력</option>
					</select>
					
					<select class="form-select w-auto d-inline" id="skillSelect" onChange="javascript:skillSelectInput();"><option value="JAVA">JAVA</option>
						<option value="Python">Python</option>
						<option value="C++">C++</option>
						<option value="input">직접 입력</option>
					</select> 
					
					<input class="form-control w-auto d-inline" style="display: none;" id="skillInput" type="text" onkeydown="addSkill(event)">
					<div id="skillList"></div>
				</div>
				<hr>
			</div>
			<!-- Skills 끝 -->
			
			<!-- Projects 시작 -->
			<div class="grid row-gap-3">
			<h3>Projects <img src="/repo/addition-color-icon.svg" class="small-img-2x" style="width: 24px; cursor: pointer;" onclick="javascript:addProject();"></h3>
			
			<div class="row">
				<div class="col-4">프로젝트 종류</div>
				<div class="col-8">
				<select class="form-select" name="projectType" id="projectType" onchange="javascript:developersDiv();">
					<option value="personal">개인 프로젝트</option>
					<option value="team">팀 프로젝트</option>
				</select>
				</div>
			</div>
			<div class="row">
				<div class="col-4">프로젝트 제목</div>
				<div class="col-8"><input type="text" class="form-control"></div>
			</div>
			<div class="row" id="projectPersonalDiv">
				<div class="col-4">참여자 (기여도)</div>
				<div class="col-8"><input type="text" class="form-control d-inline" style=" width: calc(100% - 128px);" name="developerName" value="<%=userName %>" readonly>
				<span> (</span><input type="text" class="form-control d-inline" style="width: 80px;" name="developContribution" value="100" readonly><span>%)</span></div>
			</div>
			<div class="row" id="projectTeamDiv" style="display: none;">
				<div class="col-4">참여자 (기여도) <img src="/repo/addition-color-icon.svg" class="small-img btn" onclick="javascript:addDeveloper();"></div>
				<div class="col-8" id="developerList">
				<div>
				<input type="text" class="form-control d-inline" style="width: calc(100% - 128px);" name="developerName" value="<%=userName %>" readonly>
				<span> (</span><input type="text" class="form-control d-inline" style="width: 80px;" name="developContribution"><span>%)</span></div>
			</div>
			</div>
			<div class="row">
				<div class="col-4">수행 기간</div>
				<div class="col-8"><input type="date" class="form-control w-auto d-inline" name="startDate">
				<span> ~ </span><input type="date" class="form-control w-auto d-inline" name="finishDate"></div>
			</div>
			<div class="row">
				<div class="col-4">프로젝트 링크</div>
				<div class="col-8"><input type="text" class="form-control" name="projectUrl"></div>
			</div>
			<div class="row">
				<div class="col-4">주요 기능 <img src="/repo/addition-color-icon.svg" class="small-img btn" onclick="javascript:addFeature();"></div>
				<div class="col-8">
				<ul id="projectFeaturesList">
				<li><input type="text" class="form-control" name="projectFeature"></li>
				</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-4">비고</div>
				<div class="col-8"><textarea type="text" class="form-control" name="projectEtc"></textarea></div>
			</div>
			
			</div>
			<!-- Projects 끝 -->
			
		</div>
		<div class="center m-5">
		<input type="submit" class="btn-color2 rounded-pill p-2 w-50" style="max-width: 240px; min-width: 80px;" value="이력서 생성">
		</div>
	</form>

<script>
function skillSelectInput(){
	if ($("#skillSelect").val() == "input"){
		$("#skillSelect").hide();
		$("#skillInput").show();
	}
}

function developersDiv(){
	if ($("#projectType").val() == "team"){
		$("#projectPersonalDiv").hide();
		$("#projectTeamDiv").show();
	} else{
		$("#projectPersonalDiv").show();
		$("#projectTeamDiv").hide();
	}
}

  function addSkill(event) {
    if (event.keyCode === 32 || event.keyCode === 9 || event.keyCode === 13) {
      event.preventDefault();
      let inputText = document.getElementById("skillInput").value.trim();
      if (inputText !== "") {
        let skillList = document.getElementById("skillList");
        let newdiv = document.createElement("div");
        newdiv.classList.add("skillBox");
        newdiv.classList.add("form-control");
        newdiv.onclick = function(event) { event.currentTarget.remove(); };
        newdiv.innerHTML = inputText;
        skillList.appendChild(newdiv);
      }
      document.getElementById("skillInput").value = "";
    }
  }
  
  function addSkillSet(event) {
	  let skillList = document.getElementById("skillsDiv");
	  let newdiv = document.createElement("div");
	  newdiv.classList.add("row");
	  newdiv.style.borderBottom = "1px solid #ccc";
	  newdiv.style.paddingBottom = "1.05rem";
	  newdiv.innerHTML = '<select class="form-select w-auto d-inline"><option value="having">보유 중</option><option value="studying">공부 중</option><option value="experienced">접해 봄</option><option value="input">직접 입력</option></select><select class="form-select w-auto d-inline" id="skillSelect" onChange="javascript:skillSelectInput();"><option value="JAVA">JAVA</option><option value="Python">Python</option><option value="C++">C++</option><option value="input">직접 입력</option></select> <input class="form-control w-auto d-inline" style="display: none;" id="skillInput" type="text" onkeydown="addSkill(event)"> <img src="/repo/subtract-color-outline-icon.svg" class="small-img btn" onclick="event.currentTarget.parentNode.remove()" /><div id="skillList"></div>';
	  skillList.appendChild(newdiv);
	}
  
  function addDeveloper(event) {
	  let skillList = document.getElementById("developerList");
	  let newdiv = document.createElement("div");
	  newdiv.classList.add("mt-1");
	  newdiv.innerHTML = '<input type=\"text\" class=\"form-control d-inline\" style=\"width: calc(100% - 128px);\" name=\"developerName\"><span> (</span><input type=\"text\" class=\"form-control d-inline\" style=\"width: 80px;\" name=\"developContribution\"><span>%) </span> <img src=\"/repo/subtract-color-outline-icon.svg\" class=\"small-img btn\" onclick=\"event.currentTarget.parentNode.remove()\">';
	  skillList.appendChild(newdiv);
	}
  
  function addProject(event) {
	  let skillList = document.getElementById("resumeFormDiv");
	  let newdiv = document.createElement("div");
	  newdiv.classList.add("grid");
	  newdiv.classList.add("row-gap-3");
	  newdiv.innerHTML = '<div style=\"text-align: right; margin-top:3px;\"><button onclick=\"event.currentTarget.parentNode.parentNode.remove()\" class=\"btn\"><img src=\"/repo/subtract-color-outline-icon.svg\" class=\"small-img\"> Delete Project</button></div><div class=\"row\"><div class=\"col-4\">프로젝트 종류</div><div class=\"col-8\"><select class=\"form-select\" name=\"projectType\"><option value=\"personal\">개인 프로젝트</option><option value=\"team\">팀 프로젝트</option></select></div></div><div class=\"row\"><div class=\"col-4\">프로젝트 제목</div><div class=\"col-8\"><input type=\"text\" class=\"form-control\"></div></div><div class=\"row\"><div class=\"col-4\">참여자 (기여도)</div><div class=\"col-8\"><input type=\"text\" class=\"form-control d-inline\" style=\"width: calc(100% - 128px);\" name=\"developerName\"><span> (</span><input type=\"text\" class=\"form-control d-inline\" style=\"width: 80px;\" name=\"developContribution\"><span>%)</span></div></div><div class=\"row\"><div class=\"col-4\">수행 기간</div><div class=\"col-8\"><input type=\"date\" class=\"form-control w-auto d-inline\" name=\"startDate\"><span> ~ </span><input type=\"date\" class=\"form-control w-auto d-inline\" name=\"finishDate\"></div></div><div class=\"row\"><div class=\"col-4\">프로젝트 링크</div><div class=\"col-8\"><input type=\"text\" class=\"form-control\" name=\"projectUrl\"></div></div><div class=\"row\"><div class=\"col-4\">주요 기능</div><div class=\"col-8\"><input type=\"text\" class=\"form-control\" name=\"projectFunction\"></div></div><div class=\"row\"><div class=\"col-4\">비고</div><div class=\"col-8\"><textarea type=\"text\" class=\"form-control\" name=\"projectEtc\"></textarea></div></div>';
	  skillList.appendChild(newdiv);
	}
  
  function addFeature(){
	  let featuresList = document.getElementById("projectFeaturesList");
	  let newli = document.createElement("li");
	  newli.innerHTML='<input type="text" class="form-control" name="projectFeature">';
	  featuresList.appendChild(newli);  
  }
  
//수정 필요
  function validateForm() {
      let userName = document.getElementById("userName").value;

      // 양식 정보를 클라이언트 측에서도 검증할 수 있습니다.
      if (userName === "") {
          alert("Please fill in all fields.");
          return false;
      } else {
    	  
      }
      return true;
  }
  
  
  </script>



	<!-- 
4-1 view파일에 header,footer import
4-2 RF.css링크 or 여기에 css코드 추가
4-3 About Me 부분
이름,이메일,사진(파일 선택(저번에 배운 사진 업로드 기능 이용),한줄 자기소개,GitHub Link 입력칸 만들기(사진 빼고 input-text))

4-4 SKills 부분
입력칸에 보유 중,공부 중,접해 봄,직접 입력 선택지 +옆에 개발언어 JAVA 등등 선택지

+ResumeFormController에 연결
 -->
 
 <!-- 
  5-1+ view 파일에 header,footer import
 5-2+ GRF.css 만들어서 링크 or 이 안에 css코드 넣기

5-3+ GeneratedResumeController에 연결
:생성된 이력서의 정보를 처리하고 페이지에 표시하는 
컨트롤러 클래스입니다. 사용자가 입력한 이력서 데이터와 선택한
 템플릿 스타일을 렌더링하고 HTML로 출력하는 메서드를 포함합니다.


5-4+ Projects 부분(+버튼)
프로젝트 종류 & 옆에 선택지 창(개인 프로젝트 / 팀 프로젝트)
프로젝트 제목 input-text
참여자(기여도) input-text ( input-text %)
수행 기간 input-text ~ input-text (총 #일)
URL input-text
주요 기능(+버튼) input-text
비고 input-textarea


5-5+ html형식(pdf는 되면 하기)으로 다운로드 받을 수 있게 링크
( DownloadService에 연결 ) 
 -->

	<%@ include file="/view/footer.jsp"%>

</body>
</html>