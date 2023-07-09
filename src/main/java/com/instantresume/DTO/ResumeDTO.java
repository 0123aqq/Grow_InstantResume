package com.instantresume.DTO;

public class ResumeDTO {
	private String name;
	private String email;
	private String phoneNumber;
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name=name;
	
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email =email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	
	  private String filePath;

	    public String getFilePath() {
	        return filePath;
	    }

	    public void setFilePath(String filePath) {
	        this.filePath = filePath;

}
}
