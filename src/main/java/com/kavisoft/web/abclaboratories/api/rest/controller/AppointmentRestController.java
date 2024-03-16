package com.kavisoft.web.abclaboratories.api.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kavisoft.web.abclaboratories.model.Appointment;
import com.kavisoft.web.abclaboratories.service.AppointmentService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/appointment")
public class AppointmentRestController {
	@Autowired
	AppointmentService service;

	@PostMapping("")
	public Appointment addAppointment(@RequestBody Appointment appointment,HttpSession session) {
		//TODO: process POST request
		
		appointment.setId((int) session.getAttribute("id"));
		
		return service.saveAppointment(appointment);
		
	}
	
}
