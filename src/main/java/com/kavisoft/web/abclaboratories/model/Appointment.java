package com.kavisoft.web.abclaboratories.model;

import java.sql.Date;
import java.sql.Time;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Appointment {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;
private Date date;
private Time time;
private int testTypeId;
private int reportId;
private int branchId;
private int patientId;

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
public Time getTime() {
	return time;
}
public void setTime(Time time) {
	this.time = time;
}
public int getTestTypeId() {
	return testTypeId;
}
public void setTestTypeId(int testTypeId) {
	this.testTypeId = testTypeId;
}
public int getReportId() {
	return reportId;
}
public void setReportId(int reportId) {
	this.reportId = reportId;
}
public int getBranchId() {
	return branchId;
}
public void setBranchId(int branchId) {
	this.branchId = branchId;
}
public int getPatientId() {
	return patientId;
}
public void setPatientId(int patientId) {
	this.patientId = patientId;
}

}
