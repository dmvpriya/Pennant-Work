package com.spring.orm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.orm.service.DAO;

@Controller
public class Home_Controller {

	@Autowired
	private DAO dao;

	@RequestMapping(value = "/addDept", method = RequestMethod.GET)
	public String dispayEmpForm() {
		return "Department";
	}

	@RequestMapping(value = "/addEmp", method = RequestMethod.GET)
	public String dispayDeptForm() {
		return "Employee";
	}

	@RequestMapping(value = "/DeptFormOutput", method = RequestMethod.POST)
	public String addDepartment(@RequestParam("deptName") String deptName) {
		dao.addDepartments(deptName);
		return "redirect:/viewDepartments";
	}

	@RequestMapping(value = "/EmpFormOutput", method = RequestMethod.POST)
	public String addEmployee(@RequestParam("empName") String empName, @RequestParam("empDesgn") String empDesgn,
			@RequestParam("empDeptID") Integer empDeptID) {
		dao.addEmployees(empName, empDesgn, empDeptID);
		return "redirect:/viewEmployees";
	}

	@RequestMapping(value = "/Choose", method = RequestMethod.POST)
	public String display() {
		return "Choice";
	}

	@RequestMapping(value = "/viewEmployees", method = RequestMethod.POST)
	public String viewEmployees(Model model) {
		model.addAttribute("employees", dao.getAllEmployees());
		return "ViewEmployees";
	}

	@RequestMapping(value = "/viewDepartments", method = RequestMethod.POST)
	public String viewDepartments(Model model) {
		model.addAttribute("departments", dao.getAllDepartments());
		return "ViewDepartments";
	}

}
