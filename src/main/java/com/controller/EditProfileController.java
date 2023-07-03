
package com.controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**컨트롤러에서 필요한 로직(UserService서블릿) 찾아서 연결시키고 EditProfileForm.jsp로 보내면 됨 
 * 
 * 사용자의 프로필 정보를 수정하는 컨트롤러 클래스입니다. 
사용자가 입력한 변경사항을 데이터베이스에 저장하고, 변경된 정보를
 반환하는 메서드를 포함합니다. 또한, 변경된 정보를 사용자에게 알리는 
알림 메시지를 처리할 수도 있습니다.

[UserService]사용하기
사용자 프로필 정보를 데이터베이스에서 가져오고
 변경하는 서비스 클래스입니다. 사용자의 정보를 수정할 때 변경된 
내용을 데이터베이스에 반영하고, 업데이트 된 정보를 반환하는 
메소드를 포함합니다.


[ValidationService]사용하기
비밀번호 변경할때 새 비밀번호의 유효성 검사
(비밀번호 길이,문자 종류,일치 여부 등)하고 결과 반환하는 메소드 포함


고려할 사항 : 

회원정보 수정 요청 시 새 값을 입력 받아 정보 수정함

-이메일은 수정불가(아이디니까)
-각 항목들이 가졌던 제약 조건 내에서(회원가입 조건)수정 가능
ex.비밀번호 수정 시 
사용자로부터 현재 비밀번호 입력 받아서 확인,
새 비밀번호와 비밀번호 확인을 입력 받음
(두 비밀번호가 일치하는지 검증 후 비밀번호 수정 가능)

*예외처리: 
1.현재 비밀번호와 사용자의 입력 값이 다른 경우 : 
'비밀번호가 일치하지 않습니다. 다시 입력해주세요. ' alert

2.새 비밀번호와 새 비밀번호 확인이 다른 경우 : 
'일치하지 않습니다. 다시 입력해주세요' 출력 후 비밀번호 확인을 다시 입력받음.

 */
@WebServlet("/EditProfileController")
public class EditProfileController extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
