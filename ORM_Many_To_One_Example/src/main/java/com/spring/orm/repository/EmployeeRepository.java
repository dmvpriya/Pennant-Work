package com.spring.orm.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.orm.model.dmvp_Employee_ORM_;

public interface EmployeeRepository extends JpaRepository<dmvp_Employee_ORM_, Integer> {

}
