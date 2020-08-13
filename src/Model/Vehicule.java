package Model;

import Enumeration.Categorie;

import Enumeration.Etatv;
import Enumeration.Type;

public class Vehicule{
	private Type type;
	private String matricule,marque,modele;
	private double prix_par_heure;
	private double prix_par_jour;
	private Categorie categorie;
	private int iddepot;
	private int place;
	private Etatv etatv;
	public int getPlace() {
		return place;
	}
	public void setPlace(int place) {
		this.place = place;
	}
	public int getIddepot() {
		return iddepot;
	}
	public void setIddepot(int iddepot) {
		this.iddepot = iddepot;
	}
	public String getEtatv() {
		return String.valueOf(this.etatv);
	}
	public void setEtatv(String etatv) {
		if(etatv.equals("libre"))
			this.etatv = Etatv.libre;
		if(etatv.equals("reserve"))
			this.etatv = Etatv.reserve;
		if(etatv.equals("horsService"))
			this.etatv = Etatv.horsservice;
	}
	
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public String getMatricule() {
		return matricule;
	}
	public void setMatricule(String matricule) {
		this.matricule = matricule;
	}
	public String getMarque() {
		return marque;
	}
	public void setMarque(String marque) {
		this.marque = marque;
	}
	public String getModele() {
		return modele;
	}
	public void setModele(String modele) {
		this.modele = modele;
	}
	public double getPrix_par_heure() {
		return prix_par_heure;
	}
	public void setPrix_par_heure(double prix_par_heure) {
		this.prix_par_heure = prix_par_heure;
	}
	public double getPrix_par_jour() {
		return prix_par_jour;
	}
	public void setPrix_par_jour(double prix_par_jour) {
		this.prix_par_jour = prix_par_jour;
	}
	public String getCategorie() {
		return String.valueOf(this.categorie);
	}
	public void setCategorie(String categorie) {
		if(categorie.equals("citadine"))
			this.categorie = Categorie.VoitureCitadine;
			if(categorie.equals("luxe"))
				this.categorie = Categorie.VoitureLuxe;
			if(categorie.equals("professionel"))
				this.categorie = Categorie.VoitureProfessionnel;
			if(categorie.equals("miniBus"))
				this.categorie = Categorie.MiniBus;
			if(categorie.equals("semiConfort"))
				this.categorie = Categorie.SemiConfort;
			if(categorie.equals("confort"))
				this.categorie = Categorie.Confort;
			if(categorie.equals("sport"))
				this.categorie = Categorie.Sport;
			if(categorie.equals("urbain"))
				this.categorie = Categorie.Urbain;
			
	}

	
}