package com.kavisoft.web.abclaboratories.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kavisoft.web.abclaboratories.dto.UserDTO;
import com.kavisoft.web.abclaboratories.model.User;
import com.kavisoft.web.abclaboratories.repository.UserRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.http.HttpSession;

@Service
public class UserService {
	@Autowired
	private UserRepository repo;
	@Autowired
	private EntityManager entityManager;

	public Optional<User> getUserById(int id) {
		return repo.findById(id);
	}
	
	public User getUserByEmail(String email) {
		String hql = "SELECT u FROM User u WHERE email = :email";
		TypedQuery<User> query = entityManager.createQuery(hql, User.class);
		query.setParameter("email", email);
		
		return query.getSingleResult();
	}

	public User register(User user) {
		return repo.save(user);
	}

	public boolean authenticate(String email, String password) {

		String hql = "SELECT COUNT(*) FROM User WHERE email = :email AND password = :password";
		TypedQuery<Long> query = entityManager.createQuery(hql, Long.class);
		query.setParameter("email", email);
		query.setParameter("password", password);

		// If count is greater than 0, then the email and password exist
		return query.getSingleResult() > 0;

	}

	public String signOut(HttpSession session) {
		// Check if the session exists
		if (session != null) {
			// Invalidate the session
			session.invalidate();
			System.out.println("Session invalidated");

			return "success";
		} else {
			return "failed";
		}
	}
}
