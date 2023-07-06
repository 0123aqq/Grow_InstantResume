package com.DTO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import org.apache.tomcat.jdbc.pool.PoolProperties;

@WebServlet("/EmailValidationServletDTO")
public class EmailValidationServletDTO extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/INSTANT_RESUME";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "mysql"; //본인 데이터로 수정 필요

    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        super.init();
        setupDataSource();
    }

    private void setupDataSource() {
        PoolProperties poolProperties = new PoolProperties();
        poolProperties.setUrl(DB_URL);
        poolProperties.setUsername(DB_USERNAME);
        poolProperties.setPassword(DB_PASSWORD);

        dataSource = new org.apache.tomcat.jdbc.pool.DataSource(poolProperties);
    }

    @Override
    public void destroy() {
        super.destroy();
        closeDataSource();
    }

    private void closeDataSource() {
        if (dataSource != null) {
            ((org.apache.tomcat.jdbc.pool.DataSource) dataSource).close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청으로부터 데이터 받기
        String userID = request.getParameter("userID");

        // 이메일 중복 여부 확인
        boolean isEmailDuplicate = checkEmailDuplicate(userID);

        // JSON 형식으로 결과 반환
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"isEmailDuplicate\": " + isEmailDuplicate + "}");
    }

    private boolean checkEmailDuplicate(String userID) {
        // 이메일 중복 여부를 확인하는 로직 작성
        boolean isEmailDuplicate = false;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();
 
            stmt = conn.prepareStatement("SELECT COUNT(*) FROM `instant_resume`.user_data WHERE USER_ID = ?");
            stmt.setString(1, userID);
            rs = stmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                isEmailDuplicate = (count > 0);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResultSet(rs);
            closeStatement(stmt);
            closeConnection(conn);
        }

        return isEmailDuplicate;
    }

    private void closeResultSet(ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void closeStatement(PreparedStatement stmt) {
        try {
            if (stmt != null) {
                stmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void closeConnection(Connection conn) {
        try {
            if (conn != null) {
                conn.close();
                
            }
           } catch (SQLException e) {
               e.printStackTrace();
           }
       }
   }