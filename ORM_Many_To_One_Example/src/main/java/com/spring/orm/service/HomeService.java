package com.spring.orm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.orm.model.dmvp_Address_ORM_;
import com.spring.orm.model.dmvp_Department_ORM_;
import com.spring.orm.model.dmvp_Employees_ORM_;
import com.spring.orm.model.dmvp_Projects_ORM_;
import com.spring.orm.repository.AddressRepository;
import com.spring.orm.repository.DepartmentRepository;
import com.spring.orm.repository.EmployeeRepository;
import com.spring.orm.repository.ProjectsRepository;

@Service
public class HomeService implements DAO {

	@Autowired
	private EmployeeRepository emprepo;

	@Autowired
	private DepartmentRepository deptrepo;

	@Autowired
	private AddressRepository addressrepo;

	@Autowired
	private ProjectsRepository projectsrepo;

	@Override
	public void addEmployees(String empName, String empDsgn, Integer deptId, Integer AddressId, Integer projectId) {
		// TODO Auto-generated method stub

		dmvp_Employees_ORM_ empObj = new dmvp_Employees_ORM_();
		dmvp_Department_ORM_ d = new dmvp_Department_ORM_();
		dmvp_Address_ORM_ a = new dmvp_Address_ORM_();
		dmvp_Projects_ORM_ p = new dmvp_Projects_ORM_();
		p.setId(projectId);
		a.setId(AddressId);
		d.setDeptID(deptId);
		empObj.setEmpDesgn(empDsgn);
		empObj.setEmpName(empName);
		empObj.setDepartment(d);
		empObj.setAddress(a);
		p.getEmployees().add(empObj);
		empObj.getProjects().add(p);
		emprepo.save(empObj);
	}

	@Override
	public void addDepartments(String deptName) {
		// Create Department object with dynamic input
		dmvp_Department_ORM_ deptObj = new dmvp_Department_ORM_();
		deptObj.setDeptName(deptName);

		// Save the department to the database
		deptrepo.save(deptObj);
	}

	@Override
	public void addAddress(String Place) {
		// TODO Auto-generated method stub

		dmvp_Address_ORM_ addressObj = new dmvp_Address_ORM_();
		addressObj.setPlace(Place);

		addressrepo.save(addressObj);
	}

	@Override
	public void addProjects(String Name) {
		// TODO Auto-generated method stub

		dmvp_Projects_ORM_ projectsObj = new dmvp_Projects_ORM_();
		projectsObj.setName(Name);

		projectsrepo.save(projectsObj);
	}

	public List<dmvp_Employees_ORM_> getAllEmployees() {
		return emprepo.findAll();
	}

	public List<dmvp_Department_ORM_> getAllDepartments() {
		return deptrepo.findAll();
	}

	public List<dmvp_Address_ORM_> getAllAddress() {
		return addressrepo.findAll();
	}

	public List<dmvp_Projects_ORM_> getAllProjects() {
		return projectsrepo.findAll();
	}

}
