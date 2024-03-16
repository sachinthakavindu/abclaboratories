package com.kavisoft.web.abclaboratories.service;

import java.sql.Date;
import java.sql.Time;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kavisoft.web.abclaboratories.model.Appointment;
import com.kavisoft.web.abclaboratories.repository.AppointmentRepository;
import com.kavisoft.web.abclaboratories.util.AddMinutesUtility;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

@Service
public class AppointmentService {
	@Autowired
	EntityManager entityManager;
	@Autowired
	AppointmentRepository repository;

	public Appointment saveAppointment(Appointment appointment) {
		Time appointmentTime;
		
		try {

			String selectedDate = appointment.getDate().toString();

			Time time = getLastAppoinmentTime(appointment.getBranchId(), selectedDate);

			AddMinutesUtility cal = AddMinutesUtility.getInstance();
			appointmentTime = cal.addMinutesToTime(time, 10);

		} catch (NullPointerException e) {
			appointmentTime = Time.valueOf("09:00:00");
		}
		
		appointment.setTime(appointmentTime);
		
		
		
		Appointment savedAppointment=repository.save(appointment);

		
		
		return savedAppointment;
		
	}
	
	public Time getLastAppoinmentTime(int branch, String date) {

		Date givenDate = Date.valueOf(date);

		TypedQuery<Time> query = entityManager.createQuery(
				"SELECT MAX(a.time) FROM Appointment a WHERE a.date = :givenDate AND a.branchId = :givenBranchId",
				Time.class);
		query.setParameter("givenBranchId", branch);
		query.setParameter("givenDate", givenDate);
		return (query.getSingleResult());

	}
}
