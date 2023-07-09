package com.instantresume.Update;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.instantresume.DAO.UserDAO;

@MultipartConfig(
	    location = "/repo/profile",
	    maxFileSize = 10485760, // 10MB
	    maxRequestSize = 10485760, // 10MB
	    fileSizeThreshold = 5242880 // 5MB
	)
@WebServlet("/upload.do")
public class UploadProfilePictureServlet extends HttpServlet {

    public UploadProfilePictureServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String encoding = "utf-8";

        ServletContext context = request.getSession().getServletContext();
        String basePath = context.getRealPath("/repo/profile");
        File currentDirPath = new File(basePath);

        String fileName = "";
        String userId = "";

        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setRepository(currentDirPath);
        factory.setSizeThreshold(1024 * 1024 * 1024);

        ServletFileUpload upload = new ServletFileUpload(factory);
        boolean isSuccess = true;

        try {
            List<FileItem> items = upload.parseRequest(request);

            for (FileItem fileItem : items) {

                if (fileItem.isFormField()) {
                    System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
                    if (fileItem.getFieldName().equals("userId")) { // Add this condition to capture userId from the form
                        userId = fileItem.getString(encoding);
                    }
                } else {
                    System.out.println("Parameter:" + fileItem.getFieldName());
                    System.out.println("File Name:" + fileItem.getName());
                    System.out.println("File Size:" + fileItem.getSize() + "bytes");

                    if (fileItem.getSize() > 0) {
                        int idx = fileItem.getName().lastIndexOf("\\");
                        if (idx == -1) {
                            idx = fileItem.getName().lastIndexOf("/");
                        }
                        fileName = fileItem.getName().substring(idx + 1); // Use 'fileName' variable to store the original file name
                        File uploadFile = new File(currentDirPath + "\\" + fileName);
                        fileItem.write(uploadFile);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        UserDAO userDao = new UserDAO();
        userDao.setProfilePictureUrl(userId, fileName); // 수정된: 'fileName' 변수를 사용하여 파일 경로 업데이트

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("alert('프로필 사진이 업데이트되었습니다.');");
        out.println("location.href='./MyPage.jsp';");
        out.println("</script>");

    }
}
