package com.kavisoft.web.abclaboratories.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kavisoft.web.abclaboratories.model.TestType;
import com.kavisoft.web.abclaboratories.repository.TestTypeRepository;

@Service
public class TestTypeService {
	@Autowired
	private TestTypeRepository repo;

	public List<TestType> getAllTestTypes() {
		
		return repo.findAll();
	}
}
