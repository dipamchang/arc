package com.bits_pilani.goa.arc.Registration;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class SendMail
{static Properties mailServerProperties;
static Session getMailSession;
static MimeMessage generateMailMessage;

public static void main(String args[]) throws AddressException, MessagingException {
	generateAndSendEmail();
	System.out.println("\n\n ===> Your Java Program has just sent an Email successfully. Check your email..");
}

public static void generateAndSendEmail() throws AddressException, MessagingException {

//Step1		
	System.out.println("\n 1st ===> setup Mail Server Properties..");
	mailServerProperties = System.getProperties();
	mailServerProperties.put("mail.smtp.port", "587");
	mailServerProperties.put("mail.smtp.auth", "true");
	mailServerProperties.put("mail.smtp.starttls.enable", "true");
	mailServerProperties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	System.out.println("Mail Server Properties have been setup successfully..");

//Step2		
	System.out.println("\n\n 2nd ===> get Mail Session..");
	getMailSession = Session.getDefaultInstance(mailServerProperties, null);
	generateMailMessage = new MimeMessage(getMailSession);
	generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress("dipamchang@gmail.com"));
	//generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress("test2@crunchify.com"));
	generateMailMessage.setSubject("Greetings from Crunchify..");
	String emailBody = "Test email by Crunchify.com JavaMail API example. " + "<br><br> Regards, <br>Crunchify Admin";
	generateMailMessage.setContent(emailBody, "text/html");
	System.out.println("Mail Session has been created successfully..");

//Step3		
	System.out.println("\n\n 3rd ===> Get Session and Send mail");
	Transport transport = getMailSession.getTransport("smtp");
	
	// Enter your correct gmail UserID and Password (XXXarpitshah@gmail.com)
	transport.connect("aspmx3.googlemail.com", "f2011610", "mail.gmail.6461!@#");
	transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
	transport.close();
}
}