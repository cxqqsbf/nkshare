package com.nkshare.vo;

public class Admin_info {
private String  admin_id;
private String telephone;
private String email;
private String password;
private String nickname;
public String getAdmin_id() {
	return admin_id;
}
public void setAdmin_id(String admin_id) {
	this.admin_id = admin_id;
}
public String getTelephone() {
	return telephone;
}
public void setTelephone(String telephone) {
	this.telephone = telephone;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getNickname() {
	return nickname;
}
public void setNickname(String nickname) {
	this.nickname = nickname;
}
@Override
public String toString() {
	return "Admin_info [admin_id=" + admin_id + ", telephone=" + telephone + ", email=" + email + ", password=" + password + ", nickname=" + nickname + "]";
}
}
