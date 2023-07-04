package com.instantresume;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ResumeValidationServlet
 */
@WebServlet("/ResumeValidationServlet")
public class ResumeValidationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResumeValidationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        boolean isValid = validateResumeForm(name, email, phone);

      
        
        
        if (isValid) {
            // 양식 정보가 유효한 경우, 다음 처리를 수행합니다.
            // 예를 들어, 데이터베이스에 양식 정보를 저장하거나 다른 작업을 수행할 수 있습니다.
            response.sendRedirect("success.jsp");
        } else {
            // 양식 정보가 유효하지 않은 경우, 경고 메시지(alert)를 출력하는 JavaScript를 작성합니다.
            String errorMessage = "Please fill in all fields.";
            response.setContentType("text/html");
            response.getWriter().print("<script>alert('" + errorMessage + "');window.location.href='resume.jsp';</script>");
        }
        }

        private boolean validateResumeForm(String name, String email, String phone) {
        // 이곳에서 양식 정보를 검증하는 로직을 구현합니다.
        // 예를 들어, 필수 필드가 비어있는지, 이메일 형식이 유효한지 등을 확인할 수 있습니다.
        return !name.isEmpty() && !email.isEmpty() && !phone.isEmpty();
        }
        
        
        
        
    


    }



