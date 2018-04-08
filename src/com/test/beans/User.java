package com.test.beans;

public class User {
	private String email;
	private String password;
	private String firstname;
	private String lastname;
	private String dateofbirth;
	private String gender;
	private String aboutyou;
	private int downloadCount;
	private String imgPath;
	public User(String email, String password, String firstname, String lastname, String dateofbirth, String gender, String aboutyou, String imgpath) {
		this.email=email;
		this.password=password;
		this.firstname=firstname;
		this.lastname=lastname;
		this.dateofbirth=dateofbirth;
		this.gender=gender;
		this.aboutyou=aboutyou;
		this.downloadCount=0;
		this.imgPath=imgpath;
	}
	public User() {
		//too auto-genrated constructor stub
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email=email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password=password;
	}
	public String getFirstName() {
		return firstname;
	}
	public void setFirstName(String firstname) {
		this.firstname=firstname;
	}
	public String getLastName() {
		return lastname;
	}
	public void setLastName(String lastname) {
		this.lastname=lastname;
	}
	public String getDateOfBirth() {
		return dateofbirth;
	}
	public void setDateOfBirth(String dateofbirth) {
		this.dateofbirth=dateofbirth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender=gender;
	}
	public String getAboutYou() {
		return aboutyou;
	}
	public void setAboutYou(String aboutyou) {
		this.aboutyou=aboutyou;
	}
	
	public void setDownloadCount(int d) {
		this.downloadCount=d;
	}
	
	public int getDownloadCount() {
		return downloadCount;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath= imgPath;
	}
	
}
