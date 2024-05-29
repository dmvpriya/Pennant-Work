package com.springboot.orm.UsersSample.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.orm.UsersSample.model.dmvp_Users_;
import com.springboot.orm.UsersSample.repository.UsersRepository;

import jakarta.transaction.Transactional;

@Service
public class UserService implements DAO {

	@Autowired
	private UsersRepository userrepo;

	@Override
	public Boolean validateUser(String UserName, String UserPassword) {
		// TODO Auto-generated method stub

		dmvp_Users_ user = userrepo.findByUserIdAndUserName(UserName, UserPassword);

		return user != null;

	}

	@Override
	public void addUser(String UserName, String UserPassword) {
		// TODO Auto-generated method stub
		dmvp_Users_ user = new dmvp_Users_();
		user.setUserPassword(UserPassword);
		user.setUserName(UserName);
		userrepo.save(user);

	}

	@Override
	public Boolean isUsernameTaken(String userName) {
		return userrepo.findByUserName(userName) != null;
	}

	@Override
	@Transactional
	public void registerUser(String userName, String password) {
		dmvp_Users_ user = new dmvp_Users_(userName, password);
		userrepo.save(user);
	}

}
