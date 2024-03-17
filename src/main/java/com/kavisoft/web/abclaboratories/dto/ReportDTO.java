package com.kavisoft.web.abclaboratories.dto;

import java.util.Date;

public class ReportDTO {
	private int id;
	private Date date;
	private String technician;
	private String doctor;
	private double result1;
	private double result2;
	private double result3;
	private double result4;
	private String comment;
	private String name;
	private Date dob;
	private String gender;
	private String mobile;
	private int typeId;
	private int appointmentId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getTechnician() {
		return technician;
	}
	public void setTechnician(String technician) {
		this.technician = technician;
	}
	public String getDoctor() {
		return doctor;
	}
	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}
	public double getResult1() {
		return result1;
	}
	public void setResult1(double result1) {
		this.result1 = result1;
	}
	public double getResult2() {
		return result2;
	}
	public void setResult2(double result2) {
		this.result2 = result2;
	}
	public double getResult3() {
		return result3;
	}
	public void setResult3(double result3) {
		this.result3 = result3;
	}
	public double getResult4() {
		return result4;
	}
	public void setResult4(double result4) {
		this.result4 = result4;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public int getAppointmentId() {
		return appointmentId;
	}
	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
	}	
	
}
