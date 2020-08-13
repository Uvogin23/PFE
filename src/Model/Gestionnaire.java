package Model;

import Enumeration.Etat;
import Enumeration.TypeG;

@SuppressWarnings("unused")
public class Gestionnaire {
	
	private TypeG typeG;
	private String nom,prenom,nomUtilisateur,password,email;
	
	
	
	public String getTypeG() {
		return String.valueOf(typeG);
	}
	public void setTypeG(String typeG) {
		if(typeG.equals("gestionnaire"))
			this.typeG = TypeG.Gestionnaire;
			if(typeG.equals("gestionnaireTechnique"))
				this.typeG=TypeG.GestionnaireTechnique;
	}
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
	
	

}
