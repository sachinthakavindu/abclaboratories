package com.kavisoft.web.abclaboratories.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kavisoft.web.abclaboratories.model.TestType;

@Repository
public interface TestTypeRepository extends JpaRepository<TestType, Integer>{

}
