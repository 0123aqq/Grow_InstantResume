package com.instantresume;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {

	private String userID;
	private String userPW;
	private String userName;
	private String profilePic;
	private String emailYN;
	private String joinDate;
	
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getProfilePic() {
		return profilePic;
	}
	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}
	public String getEmailYN() {
		return emailYN;
	}
	public void setEmailYN(String emailYN) {
		this.emailYN = emailYN;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}


MultipartFile file;

public MultipartFile getFile() {
	return file;
}
public void setFile(MultipartFile file) {
	this.file = file;
	
	if(! file.isEmpty()) {
		this.profilePic = file.getOriginalFilename();
		File f = new File("C://DevStudy//WebStudy//Grow_InstantResume//src//main//webapp//repo//profile");

		try {
			file.transferTo(f);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
}