package com.kavisoft.web.abclaboratories.util.email;

import java.util.HashMap;

//WelcomeEmailTemplate
public class RegistrationEmailBlueprint implements EmailBluePrint {

	@Override
	public String generateEmailBluePrint(HashMap<String, String> data) {
		// TODO Auto-generated method stub
		return "<!DOCTYPE html>\n"
				+ "<html lang=\"en\">\n"
				+ "<head>\n"
				+ "    <meta charset=\"UTF-8\">\n"
				+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
				+ "    <title>Sign Up Success</title>\n"
				+ "    <style>\n"
				+ "        body {\n"
				+ "            font-family: Arial, sans-serif;\n"
				+ "            background-color: #f4f4f4;\n"
				+ "            margin: 0;\n"
				+ "            padding: 0;\n"
				+ "            display: flex;\n"
				+ "            justify-content: center;\n"
				+ "            align-items: center;\n"
				+ "            height: 100vh;\n"
				+ "        }\n"
				+ "\n"
				+ "        .container {\n"
				+ "            background-color: #fff;\n"
				+ "            border-radius: 8px;\n"
				+ "            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);\n"
				+ "            padding: 40px;\n"
				+ "            text-align: center;\n"
				+ "            max-width: 400px;\n"
				+ "        }\n"
				+ "\n"
				+ "        h1 {\n"
				+ "            color: #333;\n"
				+ "            margin-bottom: 20px;\n"
				+ "        }\n"
				+ "\n"
				+ "        p {\n"
				+ "            color: #666;\n"
				+ "            margin-bottom: 30px;\n"
				+ "        }\n"
				+ "\n"
				+ "        .button:hover {\n"
				+ "            background-color: #45a049;\n"
				+ "        }\n"
				+ "\n"
				+ "        .contact-details {\n"
				+ "            margin-top: 30px;\n"
				+ "            color: #999;\n"
				+ "        }\n"
				+ "    </style>\n"
				+ "</head>\n"
				+ "<body>\n"
				+ "    <div class=\"container\">\n"
				+ "        <h1>Welcome to ABC Laboratories!</h1>\n"
				+ "\n"
				+ "        <p>Dear "
				+ data.get("name")
				+ "</p>\n"
				+ "\n"
				+ "        <p>Thank you for signing up. Your account has been successfully created.</p>\n"
				+ "        <p>Your Patient ID is: <strong>"
				+ data.get("id")
				+ "</strong></p>\n"
				+ "        <p>If you have any questions or need further assistance, please feel free to contact us via email:</p>\n"
				+ "        <p><strong>Email:</strong> <a href=\"mailto:info@abclaboratories.com\">info@abclaboratories.com</a></p>\n"
				+ "        <p class=\"contact-details\">ABC Laboratories | 789 Health Avenue, Colombo, Sri Lanka | Phone: +94 (0)11 123 4567</p>\n"
				+ "    </div>\n"
				+ "</body>\n"
				+ "</html>\n"
				+ "";
	}

}
