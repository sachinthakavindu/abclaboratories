package com.kavisoft.web.abclaboratories.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kavisoft.web.abclaboratories.model.Branch;
import com.kavisoft.web.abclaboratories.service.BranchService;

@Controller
public class HomeController {
	@Autowired
	BranchService branchService;

    @GetMapping("/")
    public String index(Model model) {
    	
    	List<Branch> branches = branchService.getAllBranches();
    	
    	model.addAttribute("branches", branches);
    	
        return "index";
    }
}


