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
</style>
</head>


<body>
<div class="row row-cols-1 row-cols-md-2 g-4">
  <div class="col">
    <div class="card">
        <a href="https://getbootstrap.com/">
    <img src="./repo/boo.jpg" class="card-img-top" alt="..."style="width: 100%; height: auto;"></a>
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
    <img src="./repo/no.jpg" class="card-img-top" alt="..."style="width: 100%; height: auto;"></a>
      <div class="card-body">
        <h5 class="card-title">notion</h5>
        <p class="card-text">팀 프로젝트 기획, 개발일정 공유, 개발에 필요한 정보 공유 등</p>
      </div>
    </div>
  </div>
    <br>
  <div class="col">
    <div class="card">
        <a href="https://github.com/">
    <img src="./repo/git.jpg" class="card-img-top" alt="..."style="width: 100%; height: auto;"></a>
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
    <img src="./repo/stack.jpg" class="card-img-top" alt="..."style="width: 100%; height: auto;"></a>
      <div class="card-body">
        <h5 class="card-title">stackoverflow</h5>
        <p class="card-text">오류 해결 등</p>
      </div>
    </div>
  </div>
</div>

<%@include file="/view/footer.jsp" %>
</body>


</html>
