package Gestion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Enumeration.TypeG;
import Model.Client;
import Model.Connexion;
import Model.Gestionnaire;

import Model.Vehicule;

@SuppressWarnings("unused")
public class GestionInsAuth {

	Connexion connexion;

	public GestionInsAuth() {
		connexion = new Connexion();
	}
	public void inscrire(Client client) {
		connexion.createConnexion();
		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement(
					"INSERT INTO client"
							+ "(numeroIdentifient,"
							+ "nom,"
							+ "prenom,"
							+ "nomUtilisateur,"
							+ "password,"
							+ "email,"
							+ "adresse,"
							+ "dateNaissence,"
							+ "numeroTelephone,"
							+ "etat,"
							+ "notification)"
							+ "VALUES(?,?,?,?,?,?,?,?,?,?,?)");

			preparedStatement.setInt(1,client.getNumeroidentifient());
			preparedStatement.setString(2, client.getNom());
			preparedStatement.setString(3, client.getPrenom());
			preparedStatement.setString(4, client.getNomUtilisateur());
			preparedStatement.setString(5, client.getPassword());
			preparedStatement.setString(6, client.getEmail());
			preparedStatement.setString(7, client.getAdresse());    
			preparedStatement.setString(8,client.getDateNaissence());
			preparedStatement.setInt(9, client.getNumeroTelephone());
			preparedStatement.setString(10, client.getEtat());
			preparedStatement.setString(11,client.getNotification());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {


		}



		connexion.closeConnexion();

	}

	public Client sauthentifierClient(String nomUtilisateur,String password) {
		connexion.createConnexion();
		Client client = null;

		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("select * from client where(nomUtilisateur=? and password=?)");

			preparedStatement.setString(1, nomUtilisateur);   	
			preparedStatement.setString(2, password);	


			Connexion.r=preparedStatement.executeQuery();
			if(Connexion.r.next()) {
				client = new Client();
				client.setNumeroidentifient(Connexion.r.getInt("numeroIdentifient"));
				client.setNom(Connexion.r.getString("nom"));
				client.setPrenom(Connexion.r.getString("prenom"));
				client.setNomUtilisateur(Connexion.r.getString("nomUtilisateur") );	
				client.setPassword(Connexion.r.getString("password"));
				client.setEmail(Connexion.r.getString("email"));
				client.setAdresse(Connexion.r.getString("adresse"));
				client.setDateNaissence(Connexion.r.getString("dateNaissence"));
				client.setNumeroTelephone(Connexion.r.getInt("numeroTelephone"));
				client.setEtat(Connexion.r.getString("etat"));
				client.setNotification(Connexion.r.getString("notification"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		connexion.closeConnexion();		
		return client;


	}
	public Gestionnaire sauthentifierGestionnaire(String nomUtilisateur,String password) {

		connexion.createConnexion();
		Gestionnaire gestionnaire= null;

		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("select * from gestionnaire where(nomUtilisateur=? and password=?)");

			preparedStatement.setString(1, nomUtilisateur);   	
			preparedStatement.setString(2, password);	

			Connexion.r=preparedStatement.executeQuery();

			if(Connexion.r.next()) {
				gestionnaire= new Gestionnaire();
				gestionnaire.setNom(Connexion.r.getString("nom"));	
				gestionnaire.setPrenom(Connexion.r.getString("prenom"));
				gestionnaire.setNomUtilisateur(Connexion.r.getString("nomUtilisateur"));
				gestionnaire.setPassword(Connexion.r.getString("password"));
				gestionnaire.setTypeG(Connexion.r.getString("typeg"));
				gestionnaire.setEmail(Connexion.r.getString("email"));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}

		connexion.closeConnexion();		

		return gestionnaire;

	}
	public ArrayList<Vehicule> rechercheVoiture() {
		ArrayList<Vehicule> voiture=new ArrayList<>();
		connexion.createConnexion();

		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("select * from voiture where(etat='libre');");
			Connexion.r=preparedStatement.executeQuery();
			while(Connexion.r.next()){
				Vehicule car=new Vehicule();
				car.setMarque(Connexion.r.getString("marque"));
				car.setModele(Connexion.r.getString("modele"));
				car.setMatricule(Connexion.r.getString("matricule"));
				car.setCategorie(Connexion.r.getString("categorie"));
				car.setEtatv(Connexion.r.getString("etat"));
				car.setPrix_par_jour(Connexion.r.getDouble("prix_par_jour"));
				car.setPrix_par_heure(Connexion.r.getDouble("prix_par_heure"));
				car.setIddepot(Connexion.r.getInt("idDepot"));

				voiture.add(car);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		connexion.closeConnexion();
		return voiture;

	}



	public ArrayList<Vehicule> rechercheMoto() {
		ArrayList<Vehicule> MOTOR=new ArrayList<>();
		connexion.createConnexion();

		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("select * from moto where(etat='libre');");
			Connexion.r=preparedStatement.executeQuery();
			while(Connexion.r.next()){
				Vehicule moto=new Vehicule();
				moto.setMarque(Connexion.r.getString("marque"));
				moto.setModele(Connexion.r.getString("modele"));
				moto.setMatricule(Connexion.r.getString("matricule"));
				moto.setCategorie(Connexion.r.getString("categorie"));
				moto.setEtatv(Connexion.r.getString("etat"));
				moto.setPrix_par_jour(Connexion.r.getDouble("prix_par_jour"));
				moto.setPrix_par_heure(Connexion.r.getDouble("prix_par_heure"));
				moto.setIddepot(Connexion.r.getInt("idDepot"));

				MOTOR.add(moto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		connexion.closeConnexion();
		return MOTOR;

	}

	public ArrayList<Vehicule> rechercheBus() {
		ArrayList<Vehicule> Bus=new ArrayList<>();
		connexion.createConnexion();

		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("select * from bus where(etat='libre');");
			Connexion.r=preparedStatement.executeQuery();
			while(Connexion.r.next()){
				Vehicule bus=new Vehicule();
				bus.setMarque(Connexion.r.getString("marque"));
				bus.setModele(Connexion.r.getString("modele"));
				bus.setMatricule(Connexion.r.getString("matricule"));
				bus.setCategorie(Connexion.r.getString("categorie"));
				bus.setEtatv(Connexion.r.getString("etat"));
				bus.setPrix_par_jour(Connexion.r.getDouble("prix_par_jour"));
				bus.setPrix_par_heure(Connexion.r.getDouble("prix_par_heure"));
				bus.setIddepot(Connexion.r.getInt("idDepot"));

				bus.setPlace(Connexion.r.getInt("nombrePlace"));
				Bus.add(bus);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		connexion.closeConnexion();
		return Bus;

	}
	
public static void main(String[] args) {
		
		GestionInsAuth g=new GestionInsAuth();
        Gestionnaire generatedSecuredPasswordHash = g.sauthentifierGestionnaire("africain", "12345678910");
        System.out.println(generatedSecuredPasswordHash.getNom());

	}
	
	

	


}
