package com.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownload
 */
@WebServlet("/download.do")
public class FileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String file_repo = "/Users/babydoll/JavaWeb/file_repo";
		String fileName = (String) request.getParameter("fileName"); //매개변수로 전송된 파일 이름을 읽어온다.
		System.out.println("fileName=" + fileName);
		OutputStream out = response.getOutputStream();
		String downFile = file_repo + "/" + fileName; //다운로드될 파일 위치
		File f = new File(downFile); //다운로드받을 파일 객체
		
		//파일을 다운로드할 수 있다.
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + fileName); //클릭 시 다운로드할 파일명 지정
		
		FileInputStream in = new FileInputStream(f);
		
		//버퍼 기능을 이용하여 파일에서 버퍼로 데이터를 읽어와 한꺼번에 출력한다.
		byte[] buffer = new byte[1024 * 8]; //8키로바이트씩 읽어와서 버퍼에 저장할 파일 정보를 8키로바이트씩 담아서 출력.
		while (true) {
			int count = in.read(buffer); //in은 다운로드할 파일.
			if (count == -1)
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
}
	 
	 
	 