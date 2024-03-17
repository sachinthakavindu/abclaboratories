package com.kavisoft.web.abclaboratories.model;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Report {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private Date date;
	private int technicianId;
	private int doctorId;
	private double result1;
	private double result2;
	private double result3;
	private double result4;
	@Column(length = 350)
	private String comment;
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
	public int getTechnicianId() {
		return technicianId;
	}
	public void setTechnicianId(int technicianId) {
		this.technicianId = technicianId;
	}
	public int getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
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
	
	
}
