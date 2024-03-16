package com.kavisoft.web.abclaboratories.service;

import java.sql.Date;
import java.sql.Time;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kavisoft.web.abclaboratories.dto.AppointmentDTO;
import com.kavisoft.web.abclaboratories.enums.Gender;
import com.kavisoft.web.abclaboratories.model.Appointment;
import com.kavisoft.web.abclaboratories.model.User;
import com.kavisoft.web.abclaboratories.repository.AppointmentRepository;
import com.kavisoft.web.abclaboratories.util.AddMinutesUtility;
import com.kavisoft.web.abclaboratories.util.email.AppointmentDetailsEmailBluePrint;
import com.kavisoft.web.abclaboratories.util.email.AppointmentDetailsEmailBluePrintFactory;

import jakarta.mail.MessagingException;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

@Service
public class AppointmentService {
	@Autowired
	EntityManager entityManager;
	@Autowired
	AppointmentRepository repository;
	@Autowired
	EmailService emailService;
	@Autowired
	UserService userService;

	public Appointment saveAppointment(Appointment appointment, String email) {
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

		Appointment savedAppointment = repository.save(appointment);

		// create hashmap for email blueprint
		HashMap<String, String> dataMap = new HashMap<>();

		//get data from saved appointment (with branch names and type names)
		AppointmentDTO appointmentData = getAppointmentById(savedAppointment.getId());

		User user = userService.getUserByEmail(email);

		//receiver's name
		String title = null;
		Gender gender = user.getGender();

		if (gender == Gender.MALE) {
			title = "Mr. ";
		} else if (gender == Gender.FEMALE) {
			title = "Ms. ";
		} else {

		}

		String name = title + user.getFirstName() + " " + user.getLastName();

		//addd data to map
		dataMap.put("name", name);
		dataMap.put("id", String.valueOf(appointmentData.getId()));
		dataMap.put("datetime", appointmentData.getDate() + " " + appointmentData.getTime());
		dataMap.put("branch", appointmentData.getCity());
		dataMap.put("type", appointmentData.getType());

		//data for email 
		String to = email;
		String subject = "Appointment Booked - ABC Laboratories";
		String body = new AppointmentDetailsEmailBluePrintFactory().createEmailBluePrint()
				.generateEmailBluePrint(dataMap);
		
		//send email
		try {
			emailService.sendEmail(to, subject, body);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
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

	public AppointmentDTO getAppointmentById(int id) {
		String sqlQuery = "SELECT a.`id`,a.`date`,a.`time`,b.`city`,t.`name` FROM `appointment` a INNER JOIN `test_type` t ON a.`test_type_id`=t.`id` INNER JOIN `branch` b ON a.`branch_id`=b.`id` WHERE a.`id`="
				+ id + "\n" + "";
		Query query = entityManager.createNativeQuery(sqlQuery);
		Object[] result = (Object[]) query.getSingleResult();

		AppointmentDTO dto = new AppointmentDTO();

		dto.setId((int) result[0]);
		dto.setDate((Date) result[1]);
		dto.setTime((Time) result[2]);
		dto.setCity((String) result[3]);
		dto.setType((String) result[4]);

		return dto;
	}
}
