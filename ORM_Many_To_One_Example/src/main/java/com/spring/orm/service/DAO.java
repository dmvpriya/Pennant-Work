package com.spring.orm.service;

import java.util.List;

import com.spring.orm.model.dmvp_Department_ORM_;
import com.spring.orm.model.dmvp_Employee_ORM_;

public interface DAO {
	void addEmployees(String empName, String empDsgn, Integer deptId);

	void addDepartments(String deptName);

	List<dmvp_Employee_ORM_> getAllEmployees();

	List<dmvp_Department_ORM_> getAllDepartments();

}
