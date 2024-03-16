package com.kavisoft.web.abclaboratories.dto;

import java.sql.Date;

import com.kavisoft.web.abclaboratories.enums.Gender;
import com.kavisoft.web.abclaboratories.model.User;

public class UserRegDTO {
	private int id;
	private String email;
	private String message;	
	
	public UserRegDTO() {
		
	}
	
	public UserRegDTO(int id, String email, String message) {
		super();
		this.id = id;
		this.email = email;
		this.message = message;
	}	
	
	public UserRegDTO(User user) {
		super();
		this.id = user.getId();
		this.email = user.getEmail();
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	

}
