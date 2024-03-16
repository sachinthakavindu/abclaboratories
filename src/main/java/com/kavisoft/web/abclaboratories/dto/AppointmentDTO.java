package com.kavisoft.web.abclaboratories.dto;

import java.sql.Date;
import java.sql.Time;

public class AppointmentDTO {
private int id;
private Date date;
private Time time;
private String city;
private String type;

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
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}


}
