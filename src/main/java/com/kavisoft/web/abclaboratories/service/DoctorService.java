package com.kavisoft.web.abclaboratories.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kavisoft.web.abclaboratories.model.Doctor;
import com.kavisoft.web.abclaboratories.repository.DoctorRepository;

@Service
public class DoctorService {
	@Autowired
	DoctorRepository repository;

	public List<Doctor> getAllDoctors(){
		return repository.findAll();
	}
}
