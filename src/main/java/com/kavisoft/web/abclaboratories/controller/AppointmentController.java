package com.kavisoft.web.abclaboratories.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class AppointmentController {

	@GetMapping("/appointment")
	public String loadAppointment(HttpSession session,Model model) {
		try {
			
			
			int id=(int) session.getAttribute("id");
			
			if(id!=0) {
				
				return "appointment";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}				
		return "login";
	}
	
}
