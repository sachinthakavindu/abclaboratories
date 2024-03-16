package com.kavisoft.web.abclaboratories.api.rest.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kavisoft.web.abclaboratories.dto.UserDTO;
import com.kavisoft.web.abclaboratories.dto.UserRegDTO;
import com.kavisoft.web.abclaboratories.model.User;
import com.kavisoft.web.abclaboratories.service.UserService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/user/")
public class UserRestController {
	@Autowired
	private UserService service;

	@GetMapping("{id}")
	public Optional<User> getPatientById(@PathVariable("id") int id) {
		return service.getUserById(id);
	}

	@PostMapping("register")
	public ResponseEntity<UserRegDTO> registerUser(@RequestBody User user) {
		return service.register(user);
	}

	@PostMapping("login")
	public String login(@RequestBody User user, HttpSession session) {
		// TODO: process POST request
		if (service.authenticate(user.getEmail(), user.getPassword())) {
			User userData = service.getUserByEmail(user.getEmail());
			
			// Set a session attribute
			session.setAttribute("email", user.getEmail());
			session.setAttribute("id", userData.getId());

			System.out.println("Done");

			return "success";
		} else {
			System.out.println("Failed");

			return "Invalid email or password";
		}

	}
	
	@GetMapping("signout")
	public String signout(HttpSession session) {
		return service.signOut(session);
	}	

}
