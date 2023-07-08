<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.instantresume.UserDAO" %>
<%@ page import="com.instantresume.UserVO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<title>인스턴트 이력서 생성기 | Markdown Style</title>
<%@ include file="/view/header.jsp"%>

<%String userID = (String) session.getAttribute("userID");%>

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
</style>

<script>
function showInput(obj){
	let input = obj.nextElementSibling;

	if (obj.value == "input") {
		obj.disabled = true;
		obj.style.display = "none";
		
		input.style.display = "inline";
		input.disabled = false;
	}
}
</script>

</head>

<body>
	<h1>📃Markdown Style</h1>
<br>
<%
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

	<form name="ResumeForm" method="post" accept-charset="utf-8" action="GeneratedResume02.jsp">
		<div class="container grid gap-5" style="grid-template-columns: 1fr 1fr;" id="resumeFormDiv">
			
			<!-- About me 시작 -->
			<div class="grid row-gap-3" style="align-content: baseline;">			
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
						<input type="text" class="form-control" id="profilePic" name="profilePic" placeholder="웹에 업로드된 이미지 경로를 입력하십시오.">
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
			<div id="skillsDiv">
				<h3>Skills <img src="/repo/addition-color-icon.svg" class="small-img-2x" 
				style="width: 24px; cursor: pointer;" onClick="javascript:addSkillSet();"></h3>
				<div class="row" style="margin-top: 23px;">
					<select class="form-select" name="skillHeader" style="margin: 0 0.25rem 0.25rem 0.75rem; width: 10rem; display: inline;" onchange="javascript:showInput(this);">
						<option value="보유 중">보유 중</option>
						<option value="공부 중">공부 중</option>
						<option value="접해 봄">접해 봄</option>
						<option value="Language">Language</option>
						<option value="Framework">Framework</option>
						<option value="Library">Library</option>
						<option value="input">직접 입력</option>
					</select>
					<input type="text" class="form-control" name="skillHeader" style="margin: 0 0.25rem 0.25rem 0.75rem; width: 10rem; display: none;" disabled>
					<textarea name="skillList" class="form-control d-inline" style="width: calc(100% - 200px); height: 17px; margin:0 0 0.25rem 0;" placeholder="기술 목록을 입력하십시오. 기술은 쉼표로 구분합니다."></textarea>
				</div>
			</div>
			<!-- Skills 끝 -->

			<!-- Projects 시작 -->
			<div class="grid row-gap-3" style="align-content: baseline;">
			<h3>Projects <img src="/repo/addition-color-icon.svg" class="small-img-2x" style="width: 24px; cursor: pointer;" onclick="javascript:addProject();"></h3>
			<div class="grid row-gap-3" id="projectBox">
			<div class="row">
				<div class="col-4">프로젝트 종류</div>
				<div class="col-8">
				<select name="projectType" class="form-select" id="projectType" onchange="javascript:developersDiv(this);">
					<option value="Personal">개인 프로젝트</option>
					<option value="Team">팀 프로젝트</option>
				</select>
				</div>
			</div>
			<div class="row">
				<div class="col-4">프로젝트 제목</div>
				<div class="col-8"><input type="text" class="form-control" name="projectName"></div>
			</div>
			<div class="row">
				<div class="col-4">소개</div>
				<div class="col-8"><textarea name="projectEtc" class="form-control"></textarea></div>
			</div>
			<div class="row developerDiv" id="projectPersonalDiv">
				<div class="col-4">참여자 (기여도)</div>
				<div class="col-8"><input type="text" name="developerName" class="form-control d-inline" style=" width: calc(100% - 128px);" value="<%=userName %>" readonly>
				<span> (</span><input type="text" name="contribution" class="form-control d-inline" style="width: 80px;" value="100" readonly><span>%)</span></div>
			</div>
			<div class="row developerDiv" id="projectTeamDiv" style="display: none;">
				<div class="col-4">참여자 (기여도) <img src="/repo/addition-color-icon.svg" class="small-img btn" onclick="javascript:addDeveloper(this);"></div>
				<div class="col-8" id="developerList">
				<div>
				<input type="text" name="developerName" class="form-control d-inline" value="<%=userName %>" style="width: calc(100% - 128px);" readonly>
				<span> (</span><input type="number" name="contribution" class="form-control d-inline" style="width: 80px;" min="1" max="100" maxlength="3"><span>%)</span></div>
			</div>
			</div>
			<div class="row">
				<div class="col-4">수행 기간</div>
				<div class="col-8"><input type="date" name="startDate" class="form-control w-auto d-inline">
				<span> ~ </span><input type="date" name="finishDate" class="form-control w-auto d-inline"></div>
			</div>
			<div class="row">
				<div class="col-4">사용 기술</div>
				<div class="col-8"><textarea name="usedStacks" class="form-control"></textarea></div>
			</div>
			<div class="row">
				<div class="col-4">프로젝트 링크</div>
				<div class="col-8"><input type="text" name="projectLink" class="form-control"></div>
			</div>
			<div class="row">
				<div class="col-4">주요 기능</div>
				<div class="col-8"><textarea name="projectFeatures" class="form-control" placeholder="기능은 줄바꿈으로 구분합니다."></textarea></div>
			</div>
			
			</div>
		</div>
		</div>
			<!-- Projects 끝 -->
			
		</div>
		<div class="center m-5">
		<input type="button" class="btn-color2 rounded-pill p-2 w-50" style="max-width: 240px; min-width: 80px;" value="이력서 생성" onclick="javascript:validateForm();">
		</div>
	</form>

<script>
//Skills 블록 시작
function skillSelectInput(){
	if ($("#skillSelect").val() == "input"){
		$("#skillSelect").hide();
		$("#skillInput").show();
	}
}

function addSkillSet(event) {
	  var skillList = document.getElementById("skillsDiv");
	  var newdiv = document.createElement("div");
	  newdiv.classList.add("row");
	  newdiv.innerHTML = '<select class=\"form-select\" name=\"skillHeader\" style=\"margin: 0 0.25rem 0.25rem 0.75rem; width: 10rem; display: inline;\" onchange=\"javascript:showInput(this);\"><option value=\"보유 중\">보유 중</option><option value=\"공부 중\">공부 중</option><option value=\"접해 봄\">접해 봄</option><option value=\"Language\">Language</option><option value=\"Framework\">Framework</option><option value=\"Library\">Library</option><option value=\"input\">직접 입력</option></select><input type=\"text\" class=\"form-control\" name=\"skillHeader\" style=\"margin: 0 0.25rem 0.25rem 0.75rem; width: 10rem; display: none;\" disabled><textarea name=\"skillList\" class=\"form-control d-inline\" style=\"width: calc(100% - 200px); height: 17px; margin:0 0.5rem 0.25rem 0;\" placeholder=\"기술 목록을 입력하십시오. 기술은 쉼표로 구분합니다.\"></textarea><img src="/repo/subtract-color-outline-icon.svg" class="small-img btn" onclick="event.currentTarget.parentNode.remove()">';
	  skillList.appendChild(newdiv);
	}
//Skills 블록 끝

//Projects 블록 시작
function developersDiv(obj){
	if (obj.value == "Team"){
		$(obj).parent().parent().parent().find("#projectPersonalDiv").hide();
		$(obj).parent().parent().parent().find("#projectPersonalDiv input").prop("disabled", true);
		$(obj).parent().parent().parent().find("#projectTeamDiv").show();
		$(obj).parent().parent().parent().find("#projectTeamDiv input").prop("disabled", false);
	} else{
		$(obj).parent().parent().parent().find("#projectPersonalDiv").show();
		$(obj).parent().parent().parent().find("#projectPersonalDiv input").prop("disabled", false);
		$(obj).parent().parent().parent().find("#projectTeamDiv").hide();
		$(obj).parent().parent().parent().find("#projectTeamDiv input").prop("disabled", true);
	}
}
  
function addDeveloper(obj) {
	  var developerList = obj.parentNode.parentNode.querySelector("#developerList");
	  var newdiv = document.createElement("div");
	  newdiv.classList.add("mt-1");
	  newdiv.innerHTML = '<input type=\"text\" class=\"form-control d-inline\" name=\"developerName\" style=\"width: calc(100% - 128px)\"><span> (</span><input type=\"number\" name=\"contribution\" class=\"form-control d-inline\" style=\"width: 80px;\" min=\"1\" max=\"100\" maxlength=\"3\"><span>%) </span> <img src=\"/repo/subtract-color-outline-icon.svg\" class=\"small-img btn\" onclick=\"event.currentTarget.parentNode.remove()\">';
	  developerList.appendChild(newdiv);
	}

function addProject(event) {
	  var skillList = document.getElementById("resumeFormDiv");
	  var newdiv = document.createElement("div");
	  newdiv.classList.add("grid");
	  newdiv.classList.add("row-gap-3");
	  newdiv.style.alignContent = "baseline";
	  newdiv.innerHTML = '<div style=\'text-align: right; margin-top:3px;\'><span onclick=\'event.currentTarget.parentNode.parentNode.remove()\' class=\'btn\'><img src=\'/repo/subtract-color-outline-icon.svg\' class=\'small-img\'> Delete This Project</span></div>' + $("#projectBox").html();
	  skillList.appendChild(newdiv);
	}
//Projects 블록 끝
  

//validation function 수정중. name으로 받아와서 빈 칸을 찾는 로직 추가 필요
function validateForm() {
	let isValidationComplete = false;

	let optionalInput = [ "profilePic", "userIntroduction", "userGitHub", "finishDate", "usedStacks", "projectLink"];
	let requireInput = [ "skillList", "projectName", "developerName", "contribution", "startDate", "projectFeatures"];
	let emptyOptional = "";

	//optional 값 중 빈 칸이 있으면 confirm
	for (let i = 0; i < optionalInput.length; i++) {
		if ($("#" + optionalInput[i]).val() == "") {
			emptyOptional += " - " + ($("#" + optionalInput[i]).parent().prev().html()) + "\n";
		}
	}
	if (emptyOptional.length > 0) {
		let result = confirm("다음 항목이 입력되지 않았습니다. 계속하시겠습니까?\n" + emptyOptional);
		if (!result) {
			return false;
		}
	}

	//필수 값 중 빈 칸이 있으면 alert
	isThisLoop = true; //빈칸이 나오는 시점에 바깥 for문을 break하기 위함
	for (let i = 0; i < requireInput.length; i++) {
	isValidationComplete = false; //for문 시작 시 validation boolean을 false로 초기화

	if(!isThisLoop){
		break;
	}
	
	let list = document.getElementsByName(requireInput[i]);
	for (let j = 0; j < list.length; j++) {
		isValidationComplete = false; //for문이 시작될 때 false로 변경
		if (list[j].value === "") {
			if (requireInput[i] == "skillList"){
				alert("'Skills' 항목을 입력하십시오.");
			} else if (requireInput[i] == "developerName") {
				if ($("[name='developerName']").eq(j).closest('.developerDiv').css('display') !== 'none'){
					alert("'참여자' 항목을 입력하십시오.");
				} else {
					break;
				}
			} else if (requireInput[i] == "contribution") {
				if ($("[name='contribution']").eq(j).closest('.developerDiv').css('display') !== 'none'){
					alert("'기여도' 항목을 입력하십시오.");
				} else {
					break;
				}
			} else if (requireInput[i] == "startDate") {
				alert("'수행 기간' 항목을 입력하십시오.");
			} else {				
				alert("'" + $("[name='"+requireInput[i]+"']").eq(j).parent().prev().html() + "' 항목을 입력하십시오.");
			}
		setTimeout(function() {$("[name='"+requireInput[i]+"']").eq(j).focus();}, 100); 
		isThisLoop = false;
		break;
		} else { // 빈 값이 아닌 경우 값 검증
			if ($("[name='finishDate']").eq(j).val() != "" && $("[name='startDate']").eq(j).val() > $("[name='finishDate']").eq(j).val()) {
				alert("프로젝트 수행 기간이 올바르지 않습니다.");
				setTimeout(function() {$("[name='finishDate']").eq(j).focus();}, 100); 
				isThisLoop = false;
				break;
			} else if (requireInput[i] == "contribution") {
				let total = 0; 

				let divlist = document.getElementsByClassName("developerDiv");

				for (let i = 0; i < divlist.length; i++) {
				  if (divlist[i].style.display !== 'none') { // display가 none이 아닐 경우에만 합 계산
				    const contributions = divlist[i].querySelectorAll('[name="contribution"]');
				  
				    for (let j = 0; j < contributions.length; j++) {
				        total += parseInt(contributions[j].value);
				    }
				  }
				}

				console.log(total); // 누적합 출력
				
				if (total != 100){
					alert("기여도 합은 100%가 되어야 합니다.");
					isThisLoop = false;
					break;				}

			} else {
				isValidationComplete = true; // for문을 돌렸을 때 list[j].value 가 빈 값이 아니라면 true로 설정
			}
		}
	}
	} // 필수값 검증 for문 끝
	
	if (isValidationComplete) {
		document.ResumeForm.action = "GeneratedResume02.jsp";
		document.ResumeForm.submit();
	}
}
  
  </script>


	<%@ include file="/view/footer.jsp"%>

</body>
</html>