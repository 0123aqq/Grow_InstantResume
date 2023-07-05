package com.DTO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

public class DownloadResumeServletDTO extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // DTO 객체 생성 및 데이터 설정
        ResumeDTO resumeDTO = new ResumeDTO();
        resumeDTO.setFilePath("/path/to/generated_resume.html"); // 실제 파일 경로로 변경해야 합니다.

        // 다운로드할 파일 경로 가져오기
        String filePath = request.getParameter("filePath");

        // 파일 다운로드 설정
        response.setContentType("text/html");
        response.setHeader("Content-Disposition", "attachment; filename=\"generated_resume.html\"");

        // 파일 다운로드
        try (InputStream inputStream = new FileInputStream(filePath);
             OutputStream outputStream = response.getOutputStream()) {
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
