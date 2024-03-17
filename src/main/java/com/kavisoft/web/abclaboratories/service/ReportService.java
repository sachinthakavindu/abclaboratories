package com.kavisoft.web.abclaboratories.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kavisoft.web.abclaboratories.dto.AllAppointmentsDTO;
import com.kavisoft.web.abclaboratories.dto.ReportDTO;
import com.kavisoft.web.abclaboratories.enums.Gender;
import com.kavisoft.web.abclaboratories.model.Appointment;
import com.kavisoft.web.abclaboratories.model.Report;
import com.kavisoft.web.abclaboratories.model.User;
import com.kavisoft.web.abclaboratories.repository.ReportRepository;
import com.kavisoft.web.abclaboratories.util.email.ResultsReleaseEmailBluePrintFactory;

import jakarta.mail.MessagingException;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;

@Service
public class ReportService {
	@Autowired
	ReportRepository repository;
	@Autowired
	AppointmentService appointmentService;
	@Autowired
	UserService userService;
	@Autowired
	EmailService emailService;
	@Autowired
	EntityManager entityManager;
	@Value("${app.host.name}")
	String hostName;
	@Value("${app.host.port}")
	String port;

	public Report saveReport(Report report, int appointmentId) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		report.setDate(java.sql.Date.valueOf(sdf.format(new Date())));

		Appointment appointment = new Appointment();

		Report savedReport = repository.save(report);

		appointment.setId(appointmentId);
		appointment.setReportId(savedReport.getId());

		Appointment appointmentData = appointmentService.updateAppointmentReportId(appointment);

		User user = userService.getUserById(appointmentData.getPatientId()).get();

		String title = null;
		Gender gender = user.getGender();

		if (gender == Gender.MALE) {
			title = "Mr. ";
		} else if (gender == Gender.FEMALE) {
			title = "Ms. ";
		} else {

		}

		String name = title + user.getFirstName() + " " + user.getLastName();

		int typeId = appointmentData.getTestTypeId();
		String type = "";
		if (typeId == 1) {
			type = "Blood Test";
		} else if (typeId == 2) {
			type = "Cholesterol Test";
		}

		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("id", String.valueOf(savedReport.getId()));
		dataMap.put("name", name);
		dataMap.put("date", String.valueOf(savedReport.getDate()));
		dataMap.put("type", type);
		dataMap.put("host", hostName + ":" + port);

		String to = user.getEmail();
		String subject = "Test Report Released - ABC Laboratories";
		String body = new ResultsReleaseEmailBluePrintFactory().createEmailBluePrint().generateEmailBluePrint(dataMap);

		try {
			emailService.sendEmail(to, subject, body);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return savedReport;
	}

	public ReportDTO getReportDataById(int id) {

		String sqlQuery = "SELECT r.`id`,r.`date`,t.`name` AS `technician`,d.`name` AS `doctor`,r.`result1`,r.`result2`,r.`result3`,r.`result4`,r.`comment`,u.`first_name`,u.`last_name`,u.`dob`,u.`gender`,u.`mobile`,a.`test_type_id`,a.`id` FROM `appointment` a INNER JOIN `report` r ON a.`report_id`=r.`id` INNER JOIN `USER` u ON a.`patient_id`=u.`id` INNER JOIN `doctor` d ON r.`doctor_id`=d.`id` INNER JOIN `technician` t ON r.`technician_id`=t.`id` WHERE r.`id`="
				+ id + "";
		Query query = entityManager.createNativeQuery(sqlQuery);
		Object[] result = (Object[]) query.getSingleResult();

		int rid = (int) result[0];
		Date date = (Date) result[1];
		String technician = (String) result[2];
		String doctor = (String) result[3];
		double result1 = (double) result[4];
		double result2 = (double) result[5];
		double result3 = (double) result[6];
		double result4 = (double) result[7];
		String comment = (String) result[8];
		String name = (String) result[9] + " " + result[10];
		Date dob = (Date) result[11];
		String gender = (String) result[12];
		String mobile = (String) result[13];
		int typeId = (int) result[14];
		int appointmentId = (int) result[15];

		ReportDTO reportDTO = new ReportDTO();
		reportDTO.setId(rid);
		reportDTO.setDate(date);
		reportDTO.setTechnician(technician);
		reportDTO.setDoctor(doctor);
		reportDTO.setResult1(result1);
		reportDTO.setResult2(result2);
		reportDTO.setResult3(result3);
		reportDTO.setResult3(result3);
		reportDTO.setResult4(result4);
		reportDTO.setComment(comment);
		reportDTO.setName(name);
		reportDTO.setDob(dob);
		reportDTO.setGender(gender);
		reportDTO.setMobile(mobile);
		reportDTO.setTypeId(typeId);
		reportDTO.setAppointmentId(appointmentId);

		return reportDTO;
	}

}
