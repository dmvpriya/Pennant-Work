package com.springboot.orm.UsersSample.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.orm.UsersSample.service.DAO;

@RestController
public class UserController {

	@Autowired
	private DAO dao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	private String displayLogin() {
		return "login";
	}

	@RequestMapping(value = "/LoginOutput", method = RequestMethod.POST)
	private String displayRegistration(@RequestParam("userName") String UserName,
			@RequestParam("passWord") String password) {
		Boolean output = dao.validateUser(UserName, password);

		if (output) {
			return "success";
		} else {
			return "redirect:/registration";
		}
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	private String displayLoginAfterReg(@RequestParam("username") String UserName,
			@RequestParam("password") String password, @RequestParam("confirmPassword") String confirmPassword) {

		if (!password.equals(confirmPassword)) {
			return "redirect:/registration?error=Passwords do not match";
		}

		if (dao.isUsernameTaken(UserName)) {
			return "redirect:/registration?error=Username already taken";
		}

		dao.registerUser(UserName, password);

		return "login";

	}

}
