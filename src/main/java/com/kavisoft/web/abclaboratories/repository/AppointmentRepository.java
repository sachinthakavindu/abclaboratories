package com.kavisoft.web.abclaboratories.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kavisoft.web.abclaboratories.model.Appointment;

public interface AppointmentRepository extends JpaRepository<Appointment, Integer>{

}
