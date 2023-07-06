package com.instantresume;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


@WebServlet("/EmailValidationDTO")
public class EmailValidationDTO extends HttpServlet {

    private DataSource dataFactory;

    public EmailValidationDTO() {
        try {
            Context ctx = new InitialContext();
            Context envContext = (Context) ctx.lookup("java:/comp/env");
            dataFactory = (DataSource) envContext.lookup("jdbc/mysql");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	
        String userID = request.getParameter("userID");
        
        System.out.println("Received userID: " + userID);


        boolean isEmailDuplicate = checkEmailDuplicate(userID);

        // Return results in JSON format
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"isEmailDuplicate\": " + isEmailDuplicate + "}");
    }

    private boolean checkEmailDuplicate(String userID) {

        boolean isEmailDuplicate = false;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
        	if(conn == null) {
        	    throw new SQLException("database is unreachable.");
        	}

            conn = dataFactory.getConnection();

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
