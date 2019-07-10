package com.nkshare.vo;

import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

public class User {
private String user_id;
@NotBlank(message="昵称不能为空")
private String nickname;
@Size(min=6,max=15,message="密码为6~15位")
private String password;
@Email(message="请输入正确邮箱地址")
private String email;
@Pattern(regexp="[1][3,8][3,6,9][0-9]{8}",message="请输入正确电话号码")
private String telephone;
private String gender;
private String birthday;
private List<String> hometown;
MultipartFile photo;
public MultipartFile getPhoto() {
	return photo;
}
public void setPhoto(MultipartFile photo) {
	this.photo = photo;
}
public List<String> getHometown() {
	return hometown;
}
public void setHometown(List<String> hometown) {
	this.hometown = hometown;
}
public String getEmail() {
	return email;
}
public String toString() {
	return "User [nickname=" + nickname + ", password=" + password + ", email=" + email + ", telephone=" + telephone
			+ ", gender=" + gender + ", birthday=" + birthday +",user_id="+user_id+"]";
}
public void setEmail(String email) {
	this.email = email;
}
public String getTelephone() {
	return telephone;
}
public void setTelephone(String telephone) {
	this.telephone = telephone;
}
public String getBirthday() {
	if(birthday==null) return null;
	else
	{
		String str=birthday.replace("/", "-");
		return str;
	}
}
public void setBirthday(String birthday) {
	this.birthday = birthday;
}
public String getNickname() {
	return nickname;
}
public void setNickname(String name) {
	this.nickname = name;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getUser_id() {
	return user_id;
}
public void setUser_id(String user_id) {
	this.user_id = user_id;
}
}
