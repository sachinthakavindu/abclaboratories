package com.kavisoft.web.abclaboratories.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kavisoft.web.abclaboratories.model.Branch;
import com.kavisoft.web.abclaboratories.repository.BranchRepository;

@Service
public class BranchService {
	@Autowired
	private BranchRepository repo;

	public List<Branch> getAllBranches() {
		
		return repo.findAll();
	}
	
}
