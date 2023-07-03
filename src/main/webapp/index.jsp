<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인스턴트 이력서 생성기</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="./css/main.css">

</head>
<body>
	<div class="row">
		<div class="col-7 p-5 center">
			<img src="./repo/main-gradation.svg">
		</div>
		<div class="col-5 center">
		<div class="center w-75">
			<form>
				<div class="form-floating mb-3" style="border-bottom: 1px solid #ccc;">
					<input type="email" class="form-control border-none" id="floatingInput" placeholder=" " name=""> 
					<label for="floatingInput" style="color: #ccc;"><img src="./repo/person-fill.svg" class="loginform-img"> Email ID</label>
				</div>
				<div class="form-floating mb-3" style="border-bottom: 1px solid #ccc;">
					<input type="password" class="form-control border-none" id="floatingPassword" placeholder=" " name=""> 
					<label for="floatingPassword" style="color: #ccc;"><img src="./repo/lock-fill.svg" class="loginform-img"> Password</label>
				</div>
				<div class="mb-4">
				<a href="">Forgot password?</a>
				</div>
				<div>
					<input type="submit" class="btn btn-color2 rounded-pill w-50 p-2 mb-3" value="Login">
					<input type="button" class="btn btn-line-color2 rounded-pill w-50 p-2" value="Sign up">
				</div>
			</form>
		</div>
		</div>
	</div>
</body>
</html>