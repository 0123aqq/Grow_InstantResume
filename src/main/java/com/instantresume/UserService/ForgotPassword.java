package com.instantresume.UserService;

import java.io.IOException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.instantresume.DAO.UserDAO;

@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = request.getParameter("userID");

        // Generate a temporary password
        String temporaryPassword = generateTemporaryPassword();

        // Update the password in the database
        if (updatePassword(userID, temporaryPassword)) {
            // Send the temporary password to the user via userID or other means
            // ...

            // Redirect the user to a success page
            response.sendRedirect("passwordResetSuccess.jsp");
        } else {
            // Redirect the user to an error page
            response.sendRedirect("passwordResetError.jsp");
        }
    }

    private String generateTemporaryPassword() {
        // Generate a random byte array
        byte[] randomBytes = new byte[8];
        new SecureRandom().nextBytes(randomBytes);

        // Encode the random byte array to a string using Base64 encoding
        String temporaryPassword = Base64.getEncoder().encodeToString(randomBytes);

        return temporaryPassword;
    }

    private boolean updatePassword(String userID, String password) {
		UserDAO dao = new UserDAO();

        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean success = false;

        try {
            // Your database connection code
            // ...
            // Execute the update query
            String query = "UPDATE user_data SET PASSWORD = ? WHERE USER_ID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, password);
            pstmt.setString(2, userID);
            int rowsUpdated = pstmt.executeUpdate();
            success = (rowsUpdated > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the database resources
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return success;
    }
}