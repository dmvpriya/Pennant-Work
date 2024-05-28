package com.spring.orm.model;

import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "dmvp_Employees_ORM_")
public class dmvp_Employees_ORM_ {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer EmpID;
	private String EmpName;
	private String EmpDesgn;
	private Integer EmpDeptID;

	@ManyToOne
	@JoinColumn(name = "DeptID")
	private dmvp_Department_ORM_ department;

	@OneToOne
	@JoinColumn(name = "address_id", referencedColumnName = "Id")
	private dmvp_Address_ORM_ address;

	@ManyToMany
	@JoinTable(name = "dmvp_employee_project_ORM_", joinColumns = @JoinColumn(name = "employee_id"), inverseJoinColumns = @JoinColumn(name = "project_id"))
	private Set<dmvp_Projects_ORM_> projects = new HashSet<>();

	// Getters and Setters
	public Integer getEmpID() {
		return EmpID;
	}

	public void setEmpID(Integer empID) {
		EmpID = empID;
	}

	public String getEmpName() {
		return EmpName;
	}

	public void setEmpName(String empName) {
		EmpName = empName;
	}

	public String getEmpDesgn() {
		return EmpDesgn;
	}

	public void setEmpDesgn(String empDesgn) {
		EmpDesgn = empDesgn;
	}

	public dmvp_Department_ORM_ getDepartment() {
		return department;
	}

	public void setDepartment(dmvp_Department_ORM_ department) {
		this.department = department;
	}

	public dmvp_Address_ORM_ getAddress() {
		return address;
	}

	public void setAddress(dmvp_Address_ORM_ address) {
		this.address = address;
	}

	public Set<dmvp_Projects_ORM_> getProjects() {
		return projects;
	}

	public void setProjects(Set<dmvp_Projects_ORM_> projects) {
		this.projects = projects;
	}

}
