package com.wktech.doasang;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
public class DoasangApplication {

	public static void main(String[] args) {
		SpringApplication.run(DoasangApplication.class, args);
	}

}
