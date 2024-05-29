package com.springboot.orm.UsersSample;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "com.springboot.orm.UsersSample.repository")
public class UsersSampleApplication {

	public static void main(String[] args) {
		SpringApplication.run(UsersSampleApplication.class, args);
	}

}
