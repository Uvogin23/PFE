package mail;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class Sender {
	public void send(Mail mail){
		Email email = new SimpleEmail();
		email.setHostName("smtp.googlemail.com");
		email.setSmtpPort(465);
		email.setAuthenticator(new DefaultAuthenticator(mail.getUsername(), mail.getPassword()));
		email.setSSLOnConnect(true);
		try {
			email.setFrom(mail.getUsername());
			email.setSubject(mail.getSubject());
			email.setMsg(mail.getMessage());
			email.addTo(mail.getDestination());
			email.send();
		} catch (EmailException e) {
			e.printStackTrace();
		}
	}
}