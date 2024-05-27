package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.service.DataDAO;

@Controller
public class DataController {

	@Autowired
	DataDAO dao;

	@RequestMapping(value = "/addproducts", method = RequestMethod.GET)
	@ResponseBody
	public String addData() {
		System.out.println("controller");
		dao.InsertData();
		return "<h1>Successful</h1>";
	}
}
