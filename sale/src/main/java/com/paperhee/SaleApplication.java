package com.paperhee;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SaleApplication {

	private static Logger logger = LogManager.getLogger(SaleApplication.class);

	public static void main(String[] args) {
		logger.debug("Start Spring boot Application");
		SpringApplication.run(SaleApplication.class, args);
	}
}
