package com.spring.orm.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "dmvp_Employee_ORM_")
public class dmvp_Employee_ORM_ {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer EmpID;
	private String EmpName;
	private String EmpDesgn;
	private Integer EmpDeptID;

	@ManyToOne
	@JoinColumn(name = "DeptID")
	private dmvp_Department_ORM_ department;

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

	public Integer getEmpDeptID() {
		return EmpDeptID;
	}

	public void setEmpDeptID(Integer string) {
		EmpDeptID = string;
	}
}
