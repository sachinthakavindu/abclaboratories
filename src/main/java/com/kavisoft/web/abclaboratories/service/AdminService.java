package com.kavisoft.web.abclaboratories.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

@Service
public class AdminService {
@Autowired
private EntityManager entityManager;

	    public boolean authenticate(String username, String password) {
	            // Use HQL query to check if the username and password exist in the Admin table
	            String hql = "SELECT COUNT(*) FROM Admin WHERE username = :username AND password = :password";
	            TypedQuery<Long> query = entityManager.createQuery(hql, Long.class);
	            query.setParameter("username", username);
	            query.setParameter("password", password);

	            // If count is greater than 0, then the username and password exist
	            return query.getSingleResult() > 0;

	    }
	    	   


}
