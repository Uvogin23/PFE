package Model;




import Enumeration.Etat;

public class Client {

	private String nom,prenom,adresse,nomUtilisateur,password, dateNaissence,email,notification;
	private int numeroTelephone,numeroidentifient;
	private Etat etat;
	
	
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public String getDateNaissence() {
		return dateNaissence;
	}
	public void setDateNaissence(String dateNaissence) {
		this.dateNaissence = dateNaissence;
	}
	public String getNomUtilisateur() {
		return nomUtilisateur;
	}
	public void setNomUtilisateur(String nomUtilisateur) {
		this.nomUtilisateur = nomUtilisateur;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getNumeroTelephone() {
		return numeroTelephone;
	}
	public void setNumeroTelephone(int numeroTelephone) {
		this.numeroTelephone = numeroTelephone;
	}
	public int getNumeroidentifient() {
		return numeroidentifient;
	}
	public void setNumeroidentifient(int numeroidentifient) {
		this.numeroidentifient = numeroidentifient;
	}
	public String getEtat() {
		return String.valueOf(this.etat);
	}
	public void setEtat(String etat) {
		if(etat.equals("bloquer"))
		this.etat = Etat.bloquer;
		if(etat.equals("preinscrit"))
			this.etat = Etat.preinscrit;
		if(etat.equals("client"))
			this.etat = Etat.client;
	}
	public String getNotification() {
		return notification;
	}
	public void setNotification(String notification) {
		this.notification = notification;
	}
	
	
	
}
