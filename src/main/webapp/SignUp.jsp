<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인스턴트 이력서 생성기</title>
</head>
<body>

    <h1>Sign Up</h1>
    <form method="post" action="SignUpValidationServlet">
        <div>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username">
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password">
        </div>
        <div>
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword">
        </div>
        <div>
            <button type="submit">Sign Up</button>
        </div>
    </form>
    
    <script>
        // 서블릿에서 전달한 경고 메시지가 있을 경우, JavaScript를 통해 경고 메시지(alert)를 출력합니다.
        var errorMessage = '<%= request.getAttribute("errorMessage") %>';
        if (errorMessage) {
            alert(errorMessage);
        }
    </script>
</body>
</html>