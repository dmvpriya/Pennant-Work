package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.model.dmvp_SampleData_;
import com.spring.repository.DataRepository;

@Service
public class DataService implements DataDAO {
	@Autowired
	DataRepository dr;

	@Override
	public void InsertData() {
		// TODO Auto-generated method stub
		dmvp_SampleData_ dm = new dmvp_SampleData_();
		dm.setItemName("Guava");
		dr.save(dm);
		System.out.println("data successfully added");

	}

}
