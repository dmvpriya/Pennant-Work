package com.springboot.orm.UsersSample.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.springboot.orm.UsersSample.model.dmvp_Users_;

@Repository
public interface UsersRepository extends JpaRepository<dmvp_Users_, String> {
	dmvp_Users_ findByUserIdAndUserName(String UserName, String UserPassword);

	dmvp_Users_ findByUserName(String UserName);
}
