package com.instantresume;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.instantresume.UserVO;

import java.util.ArrayList;


public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource dataFactory;

	public UserDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(String userID, String userPW) {
		String SQL = "SELECT USER_PW FROM USER_DATA WHERE USER_ID = ?";
		try {
			conn = dataFactory.getConnection();

			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPW)) {
					return -1;
				} else {
					return 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}

	public int isDuplicateID(String userID) {
		int result = -1;
		
		try {
			conn = dataFactory.getConnection();

			String query = "select count(*) as result from user_data" 
			+ " where MEMBER_ID = '" + userID + "';";

			System.out.println("isDuplicateID query: " + query);

			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			rs.next();

			result = Integer.parseInt(rs.getString("result"));

			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public void signUp(UserVO userVO) {
		String userID = userVO.getUserID();
		String userPW = userVO.getUserPW();
		String userName = userVO.getUserName();
		String emailYN = userVO.getEmailYN();
		
		if (userID != "" && userPW != "" && userName != "") {
			try {
				conn = dataFactory.getConnection();
	
				String query = "insert into user_data" + "(user_id, user_pw, user_name, email_yn) " + "values('" + userID
						+ "','" + userPW + "','" + userName + "','" + emailYN + "');";
	
				System.out.println("addUser(): " + query);
	
				pstmt = conn.prepareStatement(query);
				pstmt.executeUpdate();
	
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("signUp O");
		}
	}

	public List<UserVO> listUsers() {
		List<UserVO> list = new ArrayList<UserVO>();

		try {
			conn = dataFactory.getConnection();

			String query = "SELECT * FROM instant_resume.user_data;";
			System.out.println(query);

			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String userID = rs.getString("user_id");
				String userPW = rs.getString("user_pw");
				String userName = rs.getString("user_name");
				String emailYN = rs.getString("EMAIL_YN");
				String profilePic = rs.getString("profile_pic");
				String joinDate = rs.getString("JOIN_DATE").substring(0, 10);

				UserVO vo = new UserVO();

				vo.setUserID(userID);
				vo.setUserPW(userPW);
				vo.setUserName(userName);
				vo.setEmailYN(emailYN);
				vo.setProfilePic(profilePic);
				vo.setJoinDate(joinDate);

				list.add(vo);
			}

			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<UserVO> userInfo(String userID) {
		List<UserVO> list = new ArrayList<UserVO>();

		try {
			conn = dataFactory.getConnection();

			String query = "SELECT * FROM instant_resume.user_data where user_id = '" + userID + "';";
			System.out.println(query);

			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String userPW = rs.getString("user_pw");
				String userName = rs.getString("user_name");
				String emailYN = rs.getString("EMAIL_YN");
				String profilePic = rs.getString("profile_pic");
				String joinDate = rs.getString("JOIN_DATE").substring(0, 10);

				UserVO vo = new UserVO();

				vo.setUserID(userID);
				vo.setUserPW(userPW);
				vo.setUserName(userName);
				vo.setEmailYN(emailYN);
				vo.setProfilePic(profilePic);
				vo.setJoinDate(joinDate);

				list.add(vo);
			}

			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	public boolean deleteUser(String userID, String userPW) {
	    String SQL = "SELECT USER_PW FROM USER_DATA WHERE USER_ID = ?";

	    try {
	        conn = dataFactory.getConnection();
	        pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, userID);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            if (rs.getString(1).equals(userPW)) {
	                SQL = "DELETE FROM USER_DATA WHERE USER_ID = ?";
	                pstmt = conn.prepareStatement(SQL);
	                pstmt.setString(1, userID);
	                pstmt.executeUpdate();

	                return true;
	            } else {
	                return false;
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}
}