<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>인스턴트 이력서 생성기 | Reference</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  </head>
<%@include file="/view/header.jsp" %>
<style>
.card-img-top {
	padding: 2rem 6rem 1rem 6rem;
}

.grayImg{
position:absolute;
}

.grayImg:hover{
display:none;
}



/* body { */
/*    padding-top: 200px; /* 간격 맞추기 */ */
/*    padding-bottom: 200px; /* 간격 맞추기 */ */
/*    padding-right: 10px; /* 간격 맞추기 */ */
/*    padding-left: 10px; /* 간격 맞추기 */ */
/*    } */


</style>
</head>


<body>
<h1>Main</h1>
<br>
<div class="card-group">
  <div class="card">
        <a href="./ResumeForm01.jsp">
		<img src="./repo/template01_gray.svg" class="card-img-top grayImg btn">
		<img src="./repo/template01_color.svg" class="card-img-top colorImg">
        </a>
    <div class="card-body">
      <h5 class="card-title">이력서 양식1 : </h5>
      <p class="card-text"> 자기소개 / 보유 기술 / 수행 프로젝트 등 기재 가능 </p>
      <p class="card-text"><small class="text-body-secondary"> 프로젝트에 대한 자세한 설명으로 포트폴리오 작성에 도움이 되는 이력서 </small></p>
    </div>
  </div>
  <div class="card">
    <a href="./ResumeForm02.jsp">
	<img src="./repo/template02_gray.svg" class="card-img-top grayImg btn">
    <img src="./repo/template02_color.svg" class="card-img-top colorImg">
    </a>
    <div class="card-body">
      <h5 class="card-title">이력서 양식2 : </h5>
      <p class="card-text">이력서 양식2 설명</p>
      <p class="card-text"><small class="text-body-secondary">이력서 양식2 부가설명</small></p>
    </div>
  </div>
  <div class="card">
    <a href="./ResumeForm03.jsp">
	<img src="./repo/template03_gray.svg" class="card-img-top grayImg btn">
    <img src="./repo/template03_color.svg" class="card-img-top colorImg">
    </a>
    <div class="card-body">
      <h5 class="card-title">이력서 양식3 : </h5>
      <p class="card-text">이력서 양식3 설명</p>
      <p class="card-text"><small class="text-body-secondary">이력서 양식3 부가설명</small></p>
    </div>
  </div>
</div>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<%@include file="/view/footer.jsp" %>
</body>


</html>
