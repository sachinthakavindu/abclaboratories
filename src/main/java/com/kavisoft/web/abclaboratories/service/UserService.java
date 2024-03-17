package com.kavisoft.web.abclaboratories.service;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.kavisoft.web.abclaboratories.dto.UserDTO;
import com.kavisoft.web.abclaboratories.dto.UserRegDTO;
import com.kavisoft.web.abclaboratories.enums.Gender;
import com.kavisoft.web.abclaboratories.model.User;
import com.kavisoft.web.abclaboratories.repository.UserRepository;
import com.kavisoft.web.abclaboratories.util.email.RegistrationEmailBluePrintFactory;

import jakarta.mail.MessagingException;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.http.HttpSession;

@Service
public class UserService {
	@Autowired
	private UserRepository repository;
	@Autowired
	private EntityManager entityManager;
	@Autowired
	EmailService emailService;

	public Optional<User> getUserById(int id) {
		return repository.findById(id);
	}
	
	public List<User> getAllUsers(){
		return repository.findAll();
	}

	public User getUserByEmail(String email) {
		try {
			String hql = "SELECT u FROM User u WHERE email = :email";
			TypedQuery<User> query = entityManager.createQuery(hql, User.class);
			query.setParameter("email", email);

			return query.getSingleResult();
		}catch(Exception e) {
			return null;
		}
		
	}

	public ResponseEntity<UserRegDTO> register(User user) {
		if (getUserByEmail(user.getEmail()) != null) {
			UserRegDTO regDTO = new UserRegDTO();
			regDTO.setMessage("Account with " + user.getEmail() + " already exists.");

			return ResponseEntity.status(HttpStatus.OK).body(regDTO);
		} else {

			User savedUser = repository.save(user);

			String title = null;
			Gender gender = savedUser.getGender();

			if (gender == Gender.MALE) {
				title = "Mr. ";
			} else if (gender == Gender.FEMALE) {
				title = "Ms. ";
			} else {

			}

			String name = title + savedUser.getFirstName() + " " + savedUser.getLastName();

			HashMap<String, String> dataMap = new HashMap<>();
			dataMap.put("id", String.valueOf(savedUser.getId()));
			dataMap.put("name", name);

			String to = savedUser.getEmail();
			String subject = "Registration Successful - ABC Laboratories";
			String body = new RegistrationEmailBluePrintFactory().createEmailBluePrint()
					.generateEmailBluePrint(dataMap);

			try {
				emailService.sendEmail(to, subject, body);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			UserRegDTO regDTO = new UserRegDTO(savedUser);
			regDTO.setMessage("success");

			return ResponseEntity.status(HttpStatus.OK).body(regDTO);
		}

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
