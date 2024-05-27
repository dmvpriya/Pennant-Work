package com.spring.orm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.orm.model.dmvp_Department_ORM_;
import com.spring.orm.model.dmvp_Employee_ORM_;
import com.spring.orm.repository.DepartmentRepository;
import com.spring.orm.repository.EmployeeRepository;

@Service
public class EmpDeptService implements DAO {

	@Autowired
	private EmployeeRepository emprepo;

	@Autowired
	private DepartmentRepository deptrepo;

	@Override
	public void addEmployees(String empName, String empDsgn, Integer deptId) {
		// TODO Auto-generated method stub

		dmvp_Employee_ORM_ empObj = new dmvp_Employee_ORM_();
		empObj.setEmpDesgn(empDsgn);
		empObj.setEmpName(empName);
		empObj.setEmpDeptID(deptId);

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

	public List<dmvp_Employee_ORM_> getAllEmployees() {
		return emprepo.findAll();
	}

	public List<dmvp_Department_ORM_> getAllDepartments() {
		return deptrepo.findAll();
	}

}
