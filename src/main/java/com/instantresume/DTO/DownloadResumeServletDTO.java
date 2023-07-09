package com.instantresume.DTO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

public class DownloadResumeServletDTO extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ResumeDTO resumeDTO = new ResumeDTO();
        resumeDTO.setFilePath("/path/to/generated_resume.html"); //Change to real file path

        // Get file path to download
        String filePath = request.getParameter("filePath");

        // File download settings
        response.setContentType("text/html");
        response.setHeader("Content-Disposition", "attachment; filename=\"generated_resume.html\"");

        // download
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
