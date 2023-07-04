package com.instantresume;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {
		try {
			String dbURL = "jdbc:mysq://localhost:8080/instant_resume";
			String dbID = "root";
			String dbPassword = "mysql";
			Class.forName("com.mysql.jdbc.Drvier");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(String userID, String userPW) {
		String SQL = "SELECT user_PW FROM USER_DATA WHERE user_ID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPW))
					return -1;
				else
					return 0;
			}

			return -1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}

}
