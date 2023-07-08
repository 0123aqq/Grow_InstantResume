<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>인스턴트 이력서 생성기 | Main</title>

</head>
<%@include file="/view/header.jsp" %>

<style>
i{margin-right: 0.6rem;}
</style>

</head>

<body>
<h1>Main</h1>
<br>
<div class="card-group">
  <div class="card p-3">
  <div class="center mb-1">
        <a href="./ResumeForm01.jsp">
		<img src="./repo/template01_gray.svg" class="card-img-top" onmouseover="javascript:imgHoverStart(this);">
		<img src="./repo/template01_color.svg" class="card-img-top" style="display: none;" onmouseout="javascript:imgHoverEnd(this);">
        </a>
  </div>
    <div class="card-body">
      <h4 class="card-title">📜HTML Style</h4>
      <p class="card-text">반응형 CSS가 적용된 HTML 형식으로 이력서를 출력할 수 있습니다.</p>
      <p class="card-text"><small class="text-body-secondary"><i>#홈페이지</i><i>#블로그</i><i>#확장성</i><i>#범용성</i></small></p>
    </div>
  </div>

  <div class="card p-3">
  <div class="center mb-1">
    <a href="./ResumeForm02.jsp">
	<img src="./repo/template03_gray.svg" class="card-img-top" onmouseover="javascript:imgHoverStart(this);">
    <img src="./repo/template03_color.svg" class="card-img-top" style="display: none;" onmouseout="javascript:imgHoverEnd(this);">
    </a>
    </div>
    <div class="card-body">
      <h4 class="card-title">📃Markdown Style</h4>
      <p class="card-text">경량 마크업 언어인 Markdown 형식으로 이력서를 출력할 수 있습니다.</p>
      <p class="card-text"><small class="text-body-secondary"><i>#GitHub</i><i>#README.md</i><i>#Notion</i><i>#심플</i></small></p>
    </div>
  </div>
</div>

<script>
//호버 시 색깔 그림 나타나는 이벤트
function imgHoverStart(obj){
	$(obj).hide();
	$(obj).next().show();
};
function imgHoverEnd(obj){
	$(obj).hide();
	$(obj).prev().show();
};
</script>

<%@include file="/view/footer.jsp" %>
</body>


</html>
