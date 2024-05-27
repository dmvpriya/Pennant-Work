package com.spring.orm.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "dmvp_Department_ORM_")
public class dmvp_Department_ORM_ {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer DeptID;
	private String DeptName;

	@OneToMany(mappedBy = "department")

	// Getters and Setters
	public Integer getDeptID() {
		return DeptID;
	}

	public void setDeptID(Integer deptID) {
		DeptID = deptID;
	}

	public String getDeptName() {
		return DeptName;
	}

	public void setDeptName(String deptName) {
		DeptName = deptName;
	}
}
