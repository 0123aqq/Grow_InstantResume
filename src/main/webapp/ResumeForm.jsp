<%@ page language="java" contentType="text/html; charset=utf-8"%>
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
</style>
</head>
<body>
	<h1>이력서 양식 01</h1>

	<form name="ResumeForm01">
		<div class="container grid gap-5" style="grid-template-columns: 1fr 1fr;" id="resumeFormDiv">
			
			<!-- About me 시작 -->
			<div class="grid row-gap-3">			
				<h3>About Me</h3>

				<div class="row">
					<div class="col-4">Name</div>
					<div class="col-8">
						<input type="text" class="form-control" id="user_name"
							name="user_name" value="" readonly>
					</div>
				</div>

				<div class="row">
					<div class="col-4">Email</div>
					<div class="col-8">
						<input type="text" class="form-control" id="user_id"
							name="user_id" value="" readonly>
					</div>
				</div>

				<div class="row">
					<div class="col-4">프로필 사진</div>
					<div class="col-8">
						<input type="file" class="form-control" id="profile_picture"
							name="profile_picture" value="">
					</div>
				</div>

				<div class="row">
					<div class="col-4">한 줄 자기소개</div>
					<div class="col-8">
						<input type="text" class="form-control" id="user_introduction"
							name="user_introduction" value="">
					</div>
				</div>

				<div class="row">
					<div class="col-4">GitHub Link</div>
					<div class="col-8">
						<input type="text" class="form-control" id="user_github"
							name="user_github" value="">
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
					<div id="skill_list"></div>
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
				<select class="form-select" name="project_type" id="project_type" onchange="javascript:developersDiv();">
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
				<div class="col-8"><input type="text" class="form-control w-auto d-inline" name="developer_name">
				<span> (</span><input type="text" class="form-control d-inline" style="width: 80px;" name="develop_ratio" value="100" readonly><span>%)</span></div>
			</div>
			<div class="row" id="projectTeamDiv" style="display: none;">
				<div class="col-4">참여자 (기여도) <img src="/repo/addition-color-icon.svg" class="small-img btn" onclick="javascript:addDeveloper();"></div>
				<div class="col-8" id="developerList">
				<div>
				<input type="text" class="form-control w-auto d-inline" name="developer_name">
				<span> (</span><input type="text" class="form-control d-inline" style="width: 80px;" name="develop_ratio"><span>%)</span></div>
			</div>
			</div>
			<div class="row">
				<div class="col-4">수행 기간</div>
				<div class="col-8"><input type="date" class="form-control w-auto d-inline" name="start_date">
				<span> ~ </span><input type="date" class="form-control w-auto d-inline" name="finish_date"></div>
			</div>
			<div class="row">
				<div class="col-4">프로젝트 링크</div>
				<div class="col-8"><input type="text" class="form-control" name="project_url"></div>
			</div>
			<div class="row">
				<div class="col-4">주요 기능</div>
				<div class="col-8"><input type="text" class="form-control" name="project_function"></div>
			</div>
			<div class="row">
				<div class="col-4">비고</div>
				<div class="col-8"><input type="text" class="form-control" name="project_etc"></div>
			</div>
			
			</div>
			<!-- Projects 끝 -->
			
		</div>
		<div class="center m-5">
		<input type="button" class="btn-color2 rounded-pill p-2 w-50" style="max-width: 240px; min-width: 80px;" value="이력서 생성">
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
	if ($("#project_type").val() == "team"){
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
      var inputText = document.getElementById("skillInput").value.trim();
      if (inputText !== "") {
        var skill_list = document.getElementById("skill_list");
        var newdiv = document.createElement("div");
        newdiv.classList.add("skillBox");
        newdiv.classList.add("form-control");
        newdiv.onclick = function(event) { event.currentTarget.remove(); };
        newdiv.innerHTML = inputText;
        skill_list.appendChild(newdiv);
      }
      document.getElementById("skillInput").value = "";
    }
  }
  
  function addSkillSet(event) {
	  var skill_list = document.getElementById("skillsDiv");
	  var newdiv = document.createElement("div");
	  newdiv.classList.add("row");
	  newdiv.style.borderBottom = "1px solid #ccc";
	  newdiv.style.paddingBottom = "1.05rem";
	  newdiv.innerHTML = '<select class="form-select w-auto d-inline"><option value="having">보유 중</option><option value="studying">공부 중</option><option value="experienced">접해 봄</option><option value="input">직접 입력</option></select><select class="form-select w-auto d-inline" id="skillSelect" onChange="javascript:skillSelectInput();"><option value="JAVA">JAVA</option><option value="Python">Python</option><option value="C++">C++</option><option value="input">직접 입력</option></select> <input class="form-control w-auto d-inline" style="display: none;" id="skillInput" type="text" onkeydown="addSkill(event)"> <img src="/repo/subtract-color-outline-icon.svg" class="small-img btn" onclick="event.currentTarget.parentNode.remove()" /><div id="skill_list"></div>';
	  skill_list.appendChild(newdiv);
	}
  
  function addDeveloper(event) {
	  var skill_list = document.getElementById("developerList");
	  var newdiv = document.createElement("div");
	  newdiv.classList.add("mt-1");
	  newdiv.innerHTML = '<input type=\"text\" class=\"form-control w-auto d-inline\" name=\"developer_name\"><span> (</span><input type=\"text\" class=\"form-control d-inline\" style=\"width: 80px;\" name=\"develop_ratio\"><span>%) </span> <img src=\"/repo/subtract-color-outline-icon.svg\" class=\"small-img btn\" onclick=\"event.currentTarget.parentNode.remove()\">';
	  skill_list.appendChild(newdiv);
	}
  
  function addProject(event) {
	  var skill_list = document.getElementById("resumeFormDiv");
	  var newdiv = document.createElement("div");
	  newdiv.classList.add("grid");
	  newdiv.classList.add("row-gap-3");
	  newdiv.innerHTML = '<div style=\"text-align: right; margin-top:3px;\"><button onclick=\"event.currentTarget.parentNode.parentNode.remove()\" class=\"btn\"><img src=\"/repo/subtract-color-outline-icon.svg\" class=\"small-img\"> Delete Project</button></div><div class=\"row\"><div class=\"col-4\">프로젝트 종류</div><div class=\"col-8\"><select class=\"form-select\" name=\"project_type\"><option value=\"personal\">개인 프로젝트</option><option value=\"team\">팀 프로젝트</option></select></div></div><div class=\"row\"><div class=\"col-4\">프로젝트 제목</div><div class=\"col-8\"><input type=\"text\" class=\"form-control\"></div></div><div class=\"row\"><div class=\"col-4\">참여자 (기여도)</div><div class=\"col-8\"><input type=\"text\" class=\"form-control w-auto d-inline\" name=\"developer_name\"><span> (</span><input type=\"text\" class=\"form-control d-inline\" style=\"width: 80px;\" name=\"develop_ratio\"><span>%)</span></div></div><div class=\"row\"><div class=\"col-4\">수행 기간</div><div class=\"col-8\"><input type=\"date\" class=\"form-control w-auto d-inline\" name=\"start_date\"><span> ~ </span><input type=\"date\" class=\"form-control w-auto d-inline\" name=\"finish_date\"></div></div><div class=\"row\"><div class=\"col-4\">프로젝트 링크</div><div class=\"col-8\"><input type=\"text\" class=\"form-control\" name=\"project_url\"></div></div><div class=\"row\"><div class=\"col-4\">주요 기능</div><div class=\"col-8\"><input type=\"text\" class=\"form-control\" name=\"project_function\"></div></div><div class=\"row\"><div class=\"col-4\">비고</div><div class=\"col-8\"><input type=\"text\" class=\"form-control\" name=\"project_etc\"></div></div>';
	  skill_list.appendChild(newdiv);
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

	<%@ include file="/view/footer.jsp"%>

</body>
</html>