package com.kavisoft.web.abclaboratories.util.email;

import java.util.HashMap;

//EmailTemplate interface
public interface EmailBluePrint {
 String generateEmailBluePrint(HashMap<String, String> data);
}
