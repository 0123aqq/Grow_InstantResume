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
	width: auto;
	height: 150px;
}

.card>a {
	text-align: center;
}
</style>
</head>


<body>
<h1>Reference</h1>
<br>
<div class="row row-cols-1 row-cols-md-2 g-4">
  <div class="col">
    <div class="card">
        <a target="_blank" href="https://getbootstrap.com/">
    <img src="https://icons.getbootstrap.kr/assets/img/icons-hero.png" class="card-img-top" alt="..." ></a>
      <div class="card-body">
        <h5 class="card-title">Bootstrap</h5>
        <p class="card-text">프론트엔드 개발에 사용</p>
      </div>
    </div>
  </div>
    <br>
  <div class="col">
    <div class="card">
      <a target="_blank" href="https://www.notion.so/">
    <img src="https://velog.velcdn.com/cloudflare/thehill_hannam/ab40db7a-e7e5-42f4-a96d-5fad63564102/20220408_132202.png" class="card-img-top" alt="..."></a>
      <div class="card-body">
        <h5 class="card-title">Notion</h5>
        <p class="card-text">팀 프로젝트 기획, 개발일정 공유, 개발에 필요한 정보 공유</p>
      </div>
    </div>
  </div>
    <br>
  <div class="col">
    <div class="card">
        <a target="_blank" href="https://github.com/">
      <img src="https://static.vecteezy.com/system/resources/previews/016/833/880/non_2x/github-logo-git-hub-icon-with-text-on-white-background-free-vector.jpg" class="card-img-top" alt="..." ></a>
      <div class="card-body">
        <h5 class="card-title">GitHub</h5>
        <p class="card-text">프로젝트 참고</p>
      </div>
    </div>
  </div>
  <br>
  <br>
  <br>
  <div class="col">
    <div class="card">
        <a target="_blank" href="https://stackoverflow.com/">
    <img src="https://stackoverflow.design/assets/img/logos/so/logo-stackoverflow.svg" class="card-img-top" style="padding: 40px;" alt="..."></a>
      <div class="card-body">
        <h5 class="card-title">Stack Overflow</h5>
        <p class="card-text">오류 해결</p>
      </div>
    </div>
  </div>
</div>

<%@include file="/view/footer.jsp" %>
</body>


</html>