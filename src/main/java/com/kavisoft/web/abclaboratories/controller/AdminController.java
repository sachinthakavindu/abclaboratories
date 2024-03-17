package com.kavisoft.web.abclaboratories.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kavisoft.web.abclaboratories.dto.AllAppointmentsDTO;
import com.kavisoft.web.abclaboratories.model.Branch;
import com.kavisoft.web.abclaboratories.model.Doctor;
import com.kavisoft.web.abclaboratories.model.Technician;
import com.kavisoft.web.abclaboratories.model.User;
import com.kavisoft.web.abclaboratories.service.AppointmentService;
import com.kavisoft.web.abclaboratories.service.BranchService;
import com.kavisoft.web.abclaboratories.service.DoctorService;
import com.kavisoft.web.abclaboratories.service.TechnicianService;
import com.kavisoft.web.abclaboratories.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	@Autowired
	AppointmentService appointmentService;
	@Autowired
	UserService userService;
	@Autowired
	BranchService branchService;
	@Autowired
	DoctorService doctorService;
	@Autowired
	TechnicianService technicianService;

	@GetMapping("login")
	public String loadLogin(HttpSession session) {
		if(session.getAttribute("username")!=null) {
			return "dashboard";
		}
		
		return "admin_login";
	}
	
	@GetMapping("dashboard")
	public String loadDashboard(HttpSession session, Model model) {
		if(session.getAttribute("username")==null) {
			return "admin_login";
		}
		
		ArrayList<AllAppointmentsDTO> data= appointmentService.getAllAppointments();
		
		model.addAttribute("appointments", data);
		
		return "dashboard";
	}
	
	@GetMapping("patients")
	public String loadPatinets(HttpSession session,Model model) {
		if(session.getAttribute("username")==null) {
			return "admin_login";
		}
		

		List<User> data= userService.getAllUsers();
		
		model.addAttribute("patients", data);
		
		return "users";
	}
	
	@GetMapping("branches")
	public String loadBranches(HttpSession session,Model model) {
		if(session.getAttribute("username")==null) {
			return "admin_login";
		}
		

		List<Branch> data= branchService.getAllBranches();
		
		model.addAttribute("branches", data);
		
		return "branches";
	}
	
	@GetMapping("doctors")
	public String loadDoctors(HttpSession session,Model model) {
		if(session.getAttribute("username")==null) {
			return "admin_login";
		}
		

		List<Doctor> data= doctorService.getAllDoctors();
		
		model.addAttribute("doctors", data);
		
		return "doctors";
	}
	
	@GetMapping("technicians")
	public String loadTechnicians(HttpSession session,Model model) {
		if(session.getAttribute("username")==null) {
			return "admin_login";
		}
		

		List<Technician> data= technicianService.getAllTechnicians();
		
		model.addAttribute("technicians", data);
		
		return "technicians";
	}

	
	
	
}
