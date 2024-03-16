package com.kavisoft.web.abclaboratories.util.email;

//ConfirmationEmailTemplateFactory
public class AppointmentConfirmationEmailTemplateFactory implements EmailBluePrintFactory {
	@Override
	public EmailBluePrint createEmailBluePrint() {
		return new AppointmentDetailsEmailBluePrint();
	}
}
