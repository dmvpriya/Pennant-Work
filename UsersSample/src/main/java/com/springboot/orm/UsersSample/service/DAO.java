package com.springboot.orm.UsersSample.service;

public interface DAO {

	Boolean validateUser(String UserId, String UserName);

	void addUser(String UserId, String UserName);

	Boolean isUsernameTaken(String userName);

	void registerUser(String userName, String password);

}
