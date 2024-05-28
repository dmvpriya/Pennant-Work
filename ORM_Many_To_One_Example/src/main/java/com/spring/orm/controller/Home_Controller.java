package com.spring.orm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.orm.model.dmvp_Address_ORM_;
import com.spring.orm.model.dmvp_Department_ORM_;
import com.spring.orm.model.dmvp_Employees_ORM_;
import com.spring.orm.model.dmvp_Projects_ORM_;
import com.spring.orm.service.DAO;

@Controller
public class Home_Controller {

	@Autowired
	private DAO dao;

	@RequestMapping(value = "/addDept", method = RequestMethod.GET)
	public String displayDeptForm() {
		return "Department";
	}

	@RequestMapping(value = "/addEmp", method = RequestMethod.GET)
	public String displayEmpForm() {
		return "Employee";
	}

	@RequestMapping(value = "/addAddress", method = RequestMethod.GET)
	public String displayAddressForm() {
		return "Address";
	}

	@RequestMapping(value = "/addProjects", method = RequestMethod.GET)
	public String displayProjectsForm() {
		return "Projects";
	}

	@RequestMapping(value = "/DeptFormOutput", method = RequestMethod.POST)
	public String addDepartment(@RequestParam("deptName") String deptName) {
		dao.addDepartments(deptName);
		return "redirect:/viewData";
	}

	@RequestMapping(value = "/EmpFormOutput", method = RequestMethod.POST)
	public String addEmployee(@RequestParam("empName") String empName, @RequestParam("empDesgn") String empDesgn,
			@RequestParam("empDeptID") Integer empDeptID, @RequestParam("addressId") Integer addressId,
			@RequestParam("projectId") Integer projectId) {
		dao.addEmployees(empName, empDesgn, empDeptID, addressId, projectId);
		return "redirect:/viewData";
	}

	@RequestMapping(value = "/AddressFormOutput", method = RequestMethod.POST)
	public String addAddress(@RequestParam("place") String place) {
		dao.addAddress(place);
		return "redirect:/viewData";
	}

	@RequestMapping(value = "/ProjectsFormOutput", method = RequestMethod.POST)
	public String addProjects(@RequestParam("name") String name) {
		dao.addProjects(name);
		return "redirect:/viewData";
	}

	@RequestMapping(value = "/Choose", method = { RequestMethod.GET, RequestMethod.POST })
	public String display() {
		return "Choice";
	}

	@RequestMapping(value = "/viewData", method = { RequestMethod.GET, RequestMethod.POST })
	public String viewEmployees(Model model) {

		List<dmvp_Employees_ORM_> employees = dao.getAllEmployees();
		List<dmvp_Department_ORM_> departments = dao.getAllDepartments();
		List<dmvp_Address_ORM_> address = dao.getAllAddress();
		List<dmvp_Projects_ORM_> projects = dao.getAllProjects();

		model.addAttribute("employees", employees);
		model.addAttribute("departments", departments);
		model.addAttribute("address", address);
		model.addAttribute("projects", projects);
		return "ViewData";
	}
}
