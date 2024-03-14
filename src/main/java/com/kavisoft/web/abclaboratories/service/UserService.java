package com.kavisoft.web.abclaboratories.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kavisoft.web.abclaboratories.dto.UserDTO;
import com.kavisoft.web.abclaboratories.model.User;
import com.kavisoft.web.abclaboratories.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository repo;

	public Optional<User> getUserById(int id) {
		return repo.findById(id);
	}
	
	public User register(User user) {
		return repo.save(user);
	}
}
