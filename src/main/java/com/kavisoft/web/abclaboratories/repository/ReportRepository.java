package com.kavisoft.web.abclaboratories.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kavisoft.web.abclaboratories.model.Report;

@Repository
public interface ReportRepository extends JpaRepository<Report, Integer>{

}
