package com.spring.orm.model;

import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.SequenceGenerator;

@Entity
public class dmvp_Projects_ORM_ {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "project_id_seq")
	@SequenceGenerator(name = "project_id_seq", sequenceName = "project_id_seq", allocationSize = 1, initialValue = 23245000)
	private Integer Id;
	private String Name;

	@ManyToMany(mappedBy = "projects")
	private Set<dmvp_Employees_ORM_> employees = new HashSet<>();

	// Getters and setters

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		this.Id = id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		this.Name = name;
	}

	public Set<dmvp_Employees_ORM_> getEmployees() {
		return employees;
	}

	public void setEmployees(Set<dmvp_Employees_ORM_> employees) {
		this.employees = employees;
	}

}
