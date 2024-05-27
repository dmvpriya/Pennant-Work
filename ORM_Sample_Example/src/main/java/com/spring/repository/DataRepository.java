package com.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.model.dmvp_SampleData_;

public interface DataRepository extends JpaRepository<dmvp_SampleData_, Integer> {

}
