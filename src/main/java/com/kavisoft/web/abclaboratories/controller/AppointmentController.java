package com.kavisoft.web.abclaboratories.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kavisoft.web.abclaboratories.model.Branch;
import com.kavisoft.web.abclaboratories.model.TestType;
import com.kavisoft.web.abclaboratories.service.BranchService;
import com.kavisoft.web.abclaboratories.service.TestTypeService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AppointmentController {

	@Autowired
	BranchService branchService;
	@Autowired
	TestTypeService testTypeService;

	@GetMapping("/appointment")
	public String loadAppointment(HttpSession session, Model model) {
		try {						

			int id = (int) session.getAttribute("id");

			if (id != 0) {
				
				List<Branch> branches= branchService.getAllBranches();
				List<TestType> testTypes=testTypeService.getAllTestTypes();
				
				model.addAttribute("branches", branches);
				model.addAttribute("types", testTypes);

				return "appointment";
			}
		} catch (Exception e) {
			System.out.println("Redirected to login.");
		}
		return "login";
	}

}
