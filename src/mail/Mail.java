package mail;

public class Mail {
	private String source, username, password, destination, subject, message;

	public Mail(String source, String username, String password, String destination, String subject, String message) {
		this.source = source;
		this.username = username;
		this.password = password;
		this.destination = destination;
		this.subject = subject;
		this.message = message;
	}
	
	public Mail(String destination, String subject, String message) {
		this("projethassan5@gmail.com",
				"projethassan5@gmail.com",
				"hassanhassan5",
				destination,
				subject,
				message);
	}

	public String getSource() {
		return source;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String getDestination() {
		return destination;
	}

	public String getSubject() {
		return subject;
	}

	public String getMessage() {
		return message;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}