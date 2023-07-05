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
   body {
   padding-top: 100px; /* footer때문에 내용이 잘려서 바닥에 여백 추가 */
   padding-bottom: 100px; /* footer때문에 내용이 잘려서 바닥에 여백 추가 */
   }
   img {
       width: 100px;
       height: 150px;
   }
</style>
</head>


<body>
<div class="row row-cols-1 row-cols-md-2 g-4">
  <div class="col">
    <div class="card">
        <a href="https://getbootstrap.com/">
    <img src="https://icons.getbootstrap.kr/assets/img/icons-hero.png" class="card-img-top" alt="..." ></a>
      <div class="card-body">
        <h5 class="card-title">bootstrap</h5>
        <p class="card-text">프론트엔드 개발에 사용</p>
      </div>
    </div>
  </div>
    <br>
  <div class="col">
    <div class="card">
      <a href="https://www.notion.so/">
    <img src="https://velog.velcdn.com/cloudflare/thehill_hannam/ab40db7a-e7e5-42f4-a96d-5fad63564102/20220408_132202.png" class="card-img-top" alt="..."></a>
      <div class="card-body">
        <h5 class="card-title">notion</h5>
        <p class="card-text">팀 프로젝트 기획, 개발일정 공유, 개발에 필요한 정보 공유</p>
      </div>
    </div>
  </div>
    <br>
  <div class="col">
    <div class="card">
        <a href="https://github.com/">
      <img src="https://static.vecteezy.com/system/resources/previews/016/833/880/non_2x/github-logo-git-hub-icon-with-text-on-white-background-free-vector.jpg" class="card-img-top" alt="..." ></a>
      <div class="card-body">
        <h5 class="card-title">github</h5>
        <p class="card-text">프로젝트 참고</p>
      </div>
    </div>
  </div>
  <br>
  <br>
  <br>
  <div class="col">
    <div class="card">
        <a href="https://stackoverflow.com/">
    <img src="data:image/png;base64,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" class="card-img-top" alt="..."></a>
      <div class="card-body">
        <h5 class="card-title">stackoverflow</h5>
        <p class="card-text">오류 해결</p>
      </div>
    </div>
  </div>
</div>

<%@include file="/view/footer.jsp" %>
</body>


</html>