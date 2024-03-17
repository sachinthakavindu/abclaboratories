package com.kavisoft.web.abclaboratories.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kavisoft.web.abclaboratories.model.Technician;
import com.kavisoft.web.abclaboratories.repository.TechnicianRepository;

@Service
public class TechnicianService {
	@Autowired
	TechnicianRepository repo;

	public List<Technician> getAllTechnicians(){
		return repo.findAll();
	}
}
