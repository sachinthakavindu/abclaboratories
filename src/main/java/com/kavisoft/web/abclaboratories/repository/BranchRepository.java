package com.kavisoft.web.abclaboratories.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kavisoft.web.abclaboratories.model.Branch;

@Repository
public interface BranchRepository extends JpaRepository<Branch, Integer>{

}
