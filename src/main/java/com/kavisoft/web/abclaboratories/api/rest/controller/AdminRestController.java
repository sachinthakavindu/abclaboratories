package com.kavisoft.web.abclaboratories.api.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kavisoft.web.abclaboratories.model.Admin;
import com.kavisoft.web.abclaboratories.service.AdminService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/admin/")
public class AdminRestController {
	@Autowired
	AdminService service;

	@PostMapping("login")
	public String login(@RequestBody Admin admin, HttpSession session) {
		if (service.authenticate(admin.getUsername(), admin.getPassword())) {

			// Set a session attribute
			session.setAttribute("username", admin.getUsername());

			return "success";
		} else {
			System.out.println("Failed");

			return "Invalid username or password";
		}
	}

	@GetMapping("signout")
	public String signout(HttpSession session) {
		// Check if the session exists
		if (session != null) {
			// Invalidate the session
			session.invalidate();

			return "success";
		} else {
			return "failed";
		}
	}

}
