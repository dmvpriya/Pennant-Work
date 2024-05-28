package com.spring.orm.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;

@Entity
public class dmvp_Address_ORM_ {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "address_id_seq")
	@SequenceGenerator(name = "address_id_seq", sequenceName = "address_id_seq", allocationSize = 1, initialValue = 1000)
	private Integer id;

	private String place;

	// Getters and Setters
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}
}
