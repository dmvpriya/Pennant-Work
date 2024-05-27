package com.spring.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "dmvp_SampleData_")
public class dmvp_SampleData_ {

	private String ItemName;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ItemID;

	// Getter for ItemName
	public String getItemName() {
		return ItemName;
	}

	// Setter for ItemName
	public void setItemName(String itemName) {
		this.ItemName = itemName;
	}

	// Getter for ItemID
	public Integer getItemID() {
		return ItemID;
	}

	// Setter for ItemID
	public void setItemID(Integer itemID) {
		this.ItemID = itemID;
	}
}
