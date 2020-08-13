package Model;

import Enumeration.M_Payement;

public class Contrat{
	private int numeroContrat;
	private String nomUtilisateur;
	private int numeroidentifient;
	private M_Payement modalites_de_payment;
	private int periode_de_location;
	private double prix;
	private double charges;
	
	
	public int getNumeroContrat() {
		return numeroContrat;
	}
	public void setNumeroContrat(int numeroContrat) {
		this.numeroContrat = numeroContrat;
	}
	public String getNomUtilisateur() {
		return nomUtilisateur;
	}
	public void setNomUtilisateur(String nomUtilisateur) {
		this.nomUtilisateur = nomUtilisateur;
	}
	public int getNumeroidentifient() {
		return numeroidentifient;
	}
	public void setNumeroidentifient(int numeroidentifient) {
		this.numeroidentifient = numeroidentifient;
	}
	public M_Payement getModalites_de_payment() {
		return modalites_de_payment;
	}
	public void setModalites_de_payment(M_Payement modalites_de_payment) {
		this.modalites_de_payment = modalites_de_payment;
	}
	public int getPeriode_de_location() {
		return periode_de_location;
	}
	public void setPeriode_de_location(int periode_de_location) {
		this.periode_de_location = periode_de_location;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	public double getCharges() {
		return charges;
	}
	public void setCharges(double charges) {
		this.charges = charges;
	}
	public void setModalites_de_payment(String string) {
		if (string.equals(M_Payement.CHEQUE.toString())) {
			setModalites_de_payment(M_Payement.CHEQUE);
		} 
		if (string.equals(M_Payement.ESPECE.toString())) {
			setModalites_de_payment(M_Payement.ESPECE);
		}
		if (string.equals(M_Payement.NULL.toString())) {
			setModalites_de_payment(M_Payement.NULL);
		}
		
		
	}
	
	public void setModalites_de_paymentc(String string) {
		if (string.equals("cheque")) {
			setModalites_de_payment(M_Payement.CHEQUE);
		} 
		if (string.equals("espece")) {
			setModalites_de_payment(M_Payement.ESPECE);
		}
		
		
		
	}
	
	
}