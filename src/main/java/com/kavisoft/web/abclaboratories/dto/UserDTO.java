package com.kavisoft.web.abclaboratories.dto;

import java.sql.Date;

import com.kavisoft.web.abclaboratories.enums.Gender;
import com.kavisoft.web.abclaboratories.model.User;

public class UserDTO {
	private int id;
	private String firstName;
	private String lastName;
	private Date dob; 
	private String mobile;
	private String email;
	private String password;
	private String addressLine1;
	private String addressLine2;
	private Gender gender;
	
	private String message;

	public UserDTO() {
		
	}
	
	public UserDTO(User user) {
		this.id = user.getId();
		this.firstName = user.getFirstName();
		this.lastName = user.getLastName();
		this.dob=user.getDob();
		this.mobile = user.getMobile();
		this.email = user.getEmail();
		this.password=user.getPassword();
		this.addressLine1 = user.getAddressLine1();
		this.addressLine2 = user.getAddressLine2();
		this.gender = user.getGender();
	}		
	
	public UserDTO(int id, String firstName, String lastName, Date dob, String mobile, String email, String password, String addressLine1,
			String addressLine2, Gender gender,String message) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dob=dob;
		this.mobile = mobile;
		this.email = email;
		this.password = password;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.gender = gender;
		this.message = message;
	}

	public long getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddressLine1() {
		return addressLine1;
	}
	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}
	public String getAddressLine2() {
		return addressLine2;
	}
	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}
	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}	
	
	
}


