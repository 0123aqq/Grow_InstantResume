<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Resume Form</title>
</head>
<body>
    <h1>Resume Form</h1>
    <form action="ResumeValidationServlet" method="post" onsubmit="return validateForm()">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="phone">Phone:</label>
        <input type="tel" id="phone" name="phone" required><br><br>
        
        <input type="submit" value="Submit">
    </form>

    <script>
        function validateForm() {
            var name = document.getElementById("name").value;
            var email = document.getElementById("email").value;
            var phone = document.getElementById("phone").value;

            // 양식 정보를 클라이언트 측에서도 검증할 수 있습니다.
            if (name === "" || email === "" || phone === "") {
                alert("Please fill in all fields.");
                return false;
            }

            return true;
        }
    </script>
</body>
</html>