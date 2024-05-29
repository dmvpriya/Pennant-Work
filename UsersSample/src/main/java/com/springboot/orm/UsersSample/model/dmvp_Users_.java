package com.springboot.orm.UsersSample.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "dmvp_Users_")
public class dmvp_Users_ {

	@Id
	@Column(name = "username")
	private String UserName;

	@Column(name = "upassword")
	private String Userpassword;

	public dmvp_Users_() {

	}

	public dmvp_Users_(String UserName, String UserPassword) {
		this.Userpassword = UserPassword;
		this.UserName = UserName;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getUserPassword() {
		return Userpassword;
	}

	public void setUserPassword(String UserPassword) {
		Userpassword = UserPassword;
	}

}
