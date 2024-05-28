package com.spring.orm.service;

import java.util.List;

import com.spring.orm.model.dmvp_Address_ORM_;
import com.spring.orm.model.dmvp_Department_ORM_;
import com.spring.orm.model.dmvp_Employees_ORM_;
import com.spring.orm.model.dmvp_Projects_ORM_;

public interface DAO {
	void addEmployees(String empName, String empDsgn, Integer deptId, Integer AddressId, Integer projectId);

	void addDepartments(String deptName);

	void addAddress(String Place);

	void addProjects(String Name);

	List<dmvp_Employees_ORM_> getAllEmployees();

	List<dmvp_Department_ORM_> getAllDepartments();

	List<dmvp_Address_ORM_> getAllAddress();

	List<dmvp_Projects_ORM_> getAllProjects();

}
