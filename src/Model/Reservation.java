package Model;


import Enumeration.Etat;
import Enumeration.EtatC;

public class Reservation {
	private int idReservation,numeroIdentifient;
	private String matricule,dateDebut,Datefin,heureDebut,heureFin;
	private double prix;
	private EtatC etat;
	private Client client;
	private Vehicule vehicule;
	private String type;
	private Contrat contrat;
	
	public Contrat getContrat() {
		return contrat;
	}
	public void setContrat(Contrat contrat) {
		this.contrat = contrat;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public Vehicule getVehicule() {
		return vehicule;
	}
	public void setVehicule(Vehicule vehicule) {
		this.vehicule = vehicule;
	}
	public int getIdReservation() {
		return idReservation;
	}
	public void setIdReservation(int idReservation) {
		this.idReservation = idReservation;
	}
	public int getNumeroIdentifient() {
		return numeroIdentifient;
	}
	public void setNumeroIdentifient(int numeroIdentifient) {
		this.numeroIdentifient = numeroIdentifient;
	}
	public String getMatricule() {
		return matricule;
	}
	public void setMatricule(String matricule) {
		this.matricule = matricule;
	}
	public String getDateDebut() {
		return dateDebut;
	}
	public void setDateDebut(String dateDebut) {
		this.dateDebut = dateDebut;
	}
	public String getDatefin() {
		return Datefin;
	}
	public void setDatefin(String datefin) {
		Datefin = datefin;
	}
	public String getHeureDebut() {
		return heureDebut;
	}
	public void setHeureDebut(String heureDebut) {
		this.heureDebut = heureDebut;
	}
	public String getHeureFin() {
		return heureFin;
	}
	public void setHeureFin(String heureFin) {
		this.heureFin = heureFin;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	public String getEtat() {
		return String.valueOf(this.etat);
	}
	public void setEtat(String etat) {
		if(etat.equals("valide"))
			this.etat = EtatC.Valide;
			if(etat.equals("nonvalide"))
				this.etat = EtatC.NonValide;
			if(etat.equals("historique"))
				this.etat = EtatC.Historique;
	}
	

}
