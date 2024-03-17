package com.kavisoft.web.abclaboratories.util.email;

import java.util.HashMap;

//ReportResultsEmailTemplate
public class ResultsReleaseEmailBluePrint implements EmailBluePrint {

	@Override
	public String generateEmailBluePrint(HashMap<String, String> data) {
		// TODO Auto-generated method stub
		return "<!DOCTYPE html>\n"
				+ "<html lang=\"en\">\n"
				+ "<head>\n"
				+ "    <meta charset=\"UTF-8\">\n"
				+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
				+ "    <title>Medical Test Results Released</title>\n"
				+ "</head>\n"
				+ "<body style=\"font-family: Arial, sans-serif; background-color: #f5f5f5; margin: 0; padding: 20px;\">\n"
				+ "\n"
				+ "    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px; margin: 0 auto; background-color: #ffffff; border-collapse: collapse;\">\n"
				+ "        <tr>\n"
				+ "            <td style=\"padding: 20px;\">\n"
				+ "                <h1 style=\"color: #3273dc; margin-top: 0;\">ABC Laboratories</h1>\n"
				+ "                <p>Dear "+data.get("name")+"</p>\n"
				+ "                <p>Your medical test results are now available. Please find the download link below:</p>\n"
				+ "                <p><strong>Report ID:</strong> "+data.get("id")+"</p>\n"
				+ "                <p><strong>Test Type:</strong> "+data.get("type")+"</p>\n"
				+ "                <p><strong>Test Date:</strong> "+data.get("date")+"</p>\n"
				+ "                <br>\n"
				+ "                <a href=\"http://"+data.get("host")+"/reports/"+data.get("id")+"\" style=\"background-color: #3273dc; color: #ffffff; text-decoration: none; padding: 10px 20px; border-radius: 5px; display: inline-block;\">Go to Report</a>\n"
				+ "                <br><br>\n"
				+ "                <p>If you have any questions or concerns, please contact us at support@abclabs.com.</p>\n"
				+ "                <p>Thank you,<br>ABC Laboratories</p>\n"
				+ "            </td>\n"
				+ "        </tr>\n"
				+ "    </table>\n"
				+ "\n"
				+ "</body>\n"
				+ "</html>\n"
				+ "";
	}

}
