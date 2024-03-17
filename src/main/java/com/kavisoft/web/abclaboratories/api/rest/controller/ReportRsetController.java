package com.kavisoft.web.abclaboratories.api.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kavisoft.web.abclaboratories.dto.ReportDTO;
import com.kavisoft.web.abclaboratories.model.Report;
import com.kavisoft.web.abclaboratories.service.ReportService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
@RequestMapping("/reports/")
public class ReportRsetController {
	@Autowired
	ReportService service;

	@PostMapping("{id}")
	public Report addReport(@PathVariable("id") int appointment_id, @RequestBody Report report) {
		// TODO: process POST request

		return service.saveReport(report, appointment_id);
	}
	
	@GetMapping("test/{id}")
	public ReportDTO getAllReportData(@PathVariable int id) {
		return service.getReportDataById(id);
	}
	
}
