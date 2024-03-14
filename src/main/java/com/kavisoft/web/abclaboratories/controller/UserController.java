package com.kavisoft.web.abclaboratories.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/register")
	public String loadRegister() {
		return "register";
	}
	
}
