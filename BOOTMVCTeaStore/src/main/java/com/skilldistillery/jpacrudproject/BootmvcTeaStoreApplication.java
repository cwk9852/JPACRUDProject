package com.skilldistillery.jpacrudproject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class BootmvcTeaStoreApplication extends SpringBootServletInitializer {
 
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(BootmvcTeaStoreApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(BootmvcTeaStoreApplication.class, args);
	}

}
