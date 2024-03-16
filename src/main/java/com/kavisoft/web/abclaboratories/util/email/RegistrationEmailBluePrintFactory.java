package com.kavisoft.web.abclaboratories.util.email;

import java.util.HashMap;

//WelcomeEmailTemplateFactory
public class RegistrationEmailBluePrintFactory implements EmailBluePrintFactory {

	@Override
	public EmailBluePrint createEmailBluePrint() {
		// TODO Auto-generated method stub
		return new RegistrationEmailBlueprint();
	}

}
