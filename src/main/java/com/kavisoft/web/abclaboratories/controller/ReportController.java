package com.kavisoft.web.abclaboratories.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kavisoft.web.abclaboratories.dto.ReportDTO;
import com.kavisoft.web.abclaboratories.service.DoctorService;
import com.kavisoft.web.abclaboratories.service.ReportService;
import com.kavisoft.web.abclaboratories.service.TechnicianService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/reports/")
public class ReportController {
	@Autowired
	DoctorService doctorService;
	@Autowired
	TechnicianService technicianService;
	@Autowired
	ReportService reportService;

	@GetMapping("{type}/{appointment_id}")
	public String loadReportForm(@PathVariable("type") int type, @PathVariable("appointment_id") int appointment,
			Model model, HttpSession session) {
		if (session.getAttribute("username") == null) {
			return "admin_login";
		}

		model.addAttribute("type", type);
		model.addAttribute("appointment", appointment);
		model.addAttribute("doctors", doctorService.getAllDoctors());
		model.addAttribute("technicians", technicianService.getAllTechnicians());

		return "report_form";
	}

	@GetMapping("{id}")
	public String viewReport(@PathVariable int id, Model model) {
		ReportDTO reportData = reportService.getReportDataById(id);

		model.addAttribute("data", reportData);
		
		System.out.println(reportData);

		return "report";
	}

}
