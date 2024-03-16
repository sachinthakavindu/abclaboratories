package com.kavisoft.web.abclaboratories.api.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kavisoft.web.abclaboratories.dto.AppointmentDTO;
import com.kavisoft.web.abclaboratories.model.Appointment;
import com.kavisoft.web.abclaboratories.service.AppointmentService;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
@RequestMapping("/appointment")
public class AppointmentRestController {
	@Autowired
	AppointmentService service;

	@PostMapping("")
	public Appointment addAppointment(@RequestBody Appointment appointment,HttpSession session) {
		//TODO: process POST request
		
		appointment.setPatientId((int) session.getAttribute("id"));
		
		String email=(String) session.getAttribute("email");
		
		return service.saveAppointment(appointment,email);
		
	}
	
	@GetMapping("/{id}")
	public AppointmentDTO test(@PathVariable("id") int id) {
		return service.getAppointmentById(id);
	}
	
	
}
