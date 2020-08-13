package Fonctions;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import Enumeration.M_Payement;
import Model.Client;
import Model.Connexion;
import Model.Contrat;
import Model.Reservation;
import mail.Mail;
import mail.Sender;
public class Fonctions {

	private Connexion connexion;

	public Fonctions(){
		connexion = new Connexion();
	}
	//method for handling Client
	public void bloquerClient(Client client){
		client.setEtat("bloquer");
		updateClient(client);
	}

	public ArrayList<Client> rechercherClient() {

		connexion.createConnexion();
		Client client = null;
		ArrayList<Client> clients = new ArrayList<>();

		try {

			PreparedStatement preparedStatement = Connexion.con.prepareStatement("select * from client ;");

			Connexion.r = preparedStatement.executeQuery();

			while(Connexion.r.next()) {
				client = new Client();

				setClient(client);

				clients.add(client);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		connexion.closeConnexion();		

		return clients;
	}
	private void setClient(Client client) throws SQLException {
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

	public Client rechercherClient(int id) {

		connexion.createConnexion();
		Client client = null;
		try {

			PreparedStatement preparedStatement = Connexion.con.prepareStatement("select * from client WHERE numeroIdentifient = ?;");

			preparedStatement.setInt(1, id);

			Connexion.r = preparedStatement.executeQuery();

			if(Connexion.r.next()) {
				client = new Client();

				setClient(client);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		connexion.closeConnexion();		

		return client;
	}

	public void notifierClient(int id,String notification){
		Client client = rechercherClient(id);
		client.setNotification(notification);
		updateClient(client);
	}
	private void updateClient(Client client){
		connexion.createConnexion();

		String query = "UPDATE client SET ";
		query += "nom = ? ";
		query += "prenom = ? ";
		query += "nomUtilisateur = ? ";
		query += "password = ? ";
		query += "email = ? ";
		query += "adresse = ? ";
		query += "dateNaissence = ? ";
		query += "numeroTelephone = ? ";
		query += "etat = ? ";
		query += "notification = ? ";
		query += "WHERE numeroIdentifient = ?;";

		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement(query);

			setPreparedStatement(preparedStatement,client); 

			preparedStatement.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}
		connexion.closeConnexion();
	}
	private void setPreparedStatement(PreparedStatement  preparedStatement,Client client) throws SQLException{
		preparedStatement.setString(1,client.getNom());
		preparedStatement.setString(2,client.getPrenom());
		preparedStatement.setString(3,client.getNomUtilisateur());
		preparedStatement.setString(4,client.getPassword());
		preparedStatement.setString(5,client.getEmail());
		preparedStatement.setString(6,client.getAdresse());
		preparedStatement.setString(7,client.getDateNaissence());
		preparedStatement.setInt(8,client.getNumeroTelephone());
		preparedStatement.setString(9,client.getEtat());
		preparedStatement.setString(10,client.getNotification());
		preparedStatement.setInt(11,client.getNumeroidentifient());
	}
	//method for handling Contract
	public Contrat creerContrat(Reservation reservation, int gestionnaire, M_Payement payment) {
		Contrat contrat = new Contrat();
		
		setContrat(contrat,reservation);
		
		contrat.setNumeroidentifient(gestionnaire);
		contrat.setModalites_de_payment(payment);
		
		return contrat;
	}
	private void setContrat(Contrat contrat, Reservation reservation) {
		contrat.setNumeroContrat(reservation.getIdReservation());
		contrat.setNomUtilisateur(rechercherClient(reservation.getNumeroIdentifient()).getNomUtilisateur());
		
		String dd = reservation.getDateDebut(),
				df = reservation.getDatefin(),
				hd = reservation.getHeureDebut(),
				hf = reservation.getHeureFin();
		
		contrat.setPeriode_de_location(calculerPeriode(dd,df,hd,hf));
		contrat.setPrix(calculerPrix(reservation.getPrix(),contrat.getPeriode_de_location()));
		contrat.setCharges(0);
	}
	private double calculerPrix(double prix, int periode_de_location) {
		return prix*periode_de_location;
	}
	private int calculerPeriode(String dd, String df, String hd, String hf) {
		long dateDebut = getDate(dd),
				dateFin = getDate(df),
				huereDebut = getHeure(hd),
				heureFin = getHeure(hf);
		int periode = (int) ((dateFin - dateDebut)/(60*60*24) +
				(heureFin - huereDebut)/(60*60));
		return periode ;
	}
	private long getHeure(String heure) {
		DateFormat df = new SimpleDateFormat("hh:mm:ss");
		Date date = null;
		try {
			date = df.parse(heure);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		long time = date.getTime();
		return time;  
	}
	private long getDate(String calender) {
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date day = null;
		try {
			day = df.parse(calender);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		long date = day.getTime();
		return date;
	}
	
	public void addContrat(Contrat contrat) {
		connexion.createConnexion();
		
		String query = "INSERT INTO contrat VALUES (?,?,?,?,?,?,?);";

		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement(query);

			setPreparedStatement(preparedStatement,contrat); 

			Connexion.r = preparedStatement.executeQuery();

		}catch(Exception e) {
			e.printStackTrace();
		}
		connexion.closeConnexion();
	}
	private void setPreparedStatement(PreparedStatement preparedStatement, Contrat contrat) throws SQLException {
		preparedStatement.setInt(1, contrat.getNumeroContrat());
		preparedStatement.setString(2, contrat.getModalites_de_payment().toString());
		preparedStatement.setInt(3, contrat.getPeriode_de_location());
		preparedStatement.setDouble(4, contrat.getPrix());
		preparedStatement.setDouble(5, contrat.getCharges());
		preparedStatement.setInt(6, contrat.getNumeroidentifient());
		preparedStatement.setString(7, contrat.getNomUtilisateur());
	}
	
	public void updateContrat(Contrat contrat) {
		connexion.createConnexion();

		String query = "UPDATE contrat SET ";
		query += "modalites_de_payment = ? ";
		query += "periode_de_location = ? ";
		query += "prix = ? ";
		query += "charges = ? ";
		query += "numeroIdentifient = ? ";
		query += "nomUtilisateur = ? ";
		query += "WHERE numeroContrat = ?;";

		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement(query);

			setPreparedStatementM(preparedStatement,contrat); 

			Connexion.r = preparedStatement.executeQuery();

		}catch(Exception e) {
			e.printStackTrace();
		}
		connexion.closeConnexion();
	}
	private void setPreparedStatementM(PreparedStatement preparedStatement, Contrat contrat) throws SQLException {
		preparedStatement.setInt(7, contrat.getNumeroContrat());
		preparedStatement.setString(1, contrat.getModalites_de_payment().toString());
		preparedStatement.setInt(2, contrat.getPeriode_de_location());
		preparedStatement.setDouble(3, contrat.getPrix());
		preparedStatement.setDouble(4, contrat.getCharges());
		preparedStatement.setInt(5, contrat.getNumeroidentifient());
		preparedStatement.setString(6, contrat.getNomUtilisateur());
	}
	
	public Contrat rechercherContrat(int id) {
		connexion.createConnexion();
		Contrat contrat = null;
		try {
			PreparedStatement preparedStatement = Connexion.con.prepareStatement("select * from contrat WHERE numeroContrat = ?;");
			preparedStatement.setInt(1, id);
			Connexion.r = preparedStatement.executeQuery();
			if(Connexion.r.next()) {
				contrat = new Contrat();
				setContrat(contrat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		connexion.closeConnexion();		
		return contrat;
	}
	private void setContrat(Contrat contrat) throws SQLException {
		contrat.setNumeroContrat(Connexion.r.getInt("numeroContrat"));
		contrat.setModalites_de_payment(Connexion.r.getString("modalites_de_payment"));
		contrat.setPeriode_de_location(Connexion.r.getInt("periode_de_location"));
		contrat.setPrix(Connexion.r.getDouble("prix"));
		contrat.setCharges(Connexion.r.getDouble("charges"));
		contrat.setNumeroidentifient(Connexion.r.getInt("numeroIdentifient"));
		contrat.setNomUtilisateur(Connexion.r.getString("nomUtilisateur"));
	}
	
	public void modifierContrat(int id, double charges, int periode) {
		Contrat contrat = rechercherContrat(id);
		double prix = contrat.getPrix()/contrat.getPeriode_de_location();
		
		contrat.setCharges(contrat.getCharges()+charges);
		contrat.setPeriode_de_location(contrat.getPeriode_de_location()+periode);
		contrat.setPrix(calculerPrix(prix, contrat.getPeriode_de_location()));
		
		updateContrat(contrat);
	}
	//method for handling revenue
	public double calculerRecette() {
		connexion.createConnexion();
		double recette = 0;

		String query = "SELECT SUM(prix+charges) FROM contrat WHERE numeroContrat IN "
				+ "(SELECT idReservation FROM reservation WHERE "
				+ "dateFin = ?);";

		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement(query);
			
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			
			preparedStatement.setString(1, date );
			
			Connexion.r = preparedStatement.executeQuery();
			
			if (Connexion.r.next()) {
				recette = Connexion.r.getDouble(0);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		connexion.closeConnexion();
		
		return recette;
	}
	
	public double calculerRecette(String dateDebut, String DateFin) {
		connexion.createConnexion();
		double recette = 0;
		java.sql.Date dd = getSqlDate(dateDebut), df = getSqlDate(DateFin);
		String query = "SELECT SUM(prix+charges) FROM contrat WHERE numeroContrat IN "
				+ "(SELECT idReservation FROM reservation WHERE "
				+ "dateDebut >= ? AND dateDebut <= ?);";

		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement(query);
			
			preparedStatement.setDate(1, dd);
			preparedStatement.setDate(2, df);
			
			Connexion.r = preparedStatement.executeQuery();
			
			if (Connexion.r.next()) {
				recette = Connexion.r.getDouble(0);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		connexion.closeConnexion();
		
		return recette;
	}
	private java.sql.Date getSqlDate(String date) {
		return new java.sql.Date(getDate(date));
	}
	
	public double gestionPenalite(int idReservation, String dateDeRetour, double a, double b){
		Reservation reservation = rechercherReservation(idReservation);
		return gestionPenalite(reservation, dateDeRetour, a, b);
	}
	private Reservation rechercherReservation(int idReservation) {
		connexion.createConnexion();
		Reservation reservation = null;
		String query = "select * from reservation WHERE idReservation = ?;";
		
		try {

			PreparedStatement preparedStatement = Connexion.con.prepareStatement(query);

			preparedStatement.setInt(1, idReservation);

			Connexion.r = preparedStatement.executeQuery();

			if(Connexion.r.next()) {
				reservation = new Reservation();

				setReservation(reservation);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		connexion.closeConnexion();
		
		return reservation;
	}
	private void setReservation(Reservation reservation) throws SQLException {

		String matricule = null;
		if (Connexion.r.getString("matriculeV") != null) {
			matricule = Connexion.r.getString("matriculeV");
		}else if (Connexion.r.getString("matriculeB") != null) {
			matricule = Connexion.r.getString("matriculeB");
		}else if (Connexion.r.getString("matriculeM") != null) {
			matricule = Connexion.r.getString("matriculeM");
		}
		
		reservation.setIdReservation(Connexion.r.getInt("idReservation"));
		reservation.setDateDebut(Connexion.r.getString("dateDebut"));
		reservation.setDatefin(Connexion.r.getString("dateFin"));
		reservation.setHeureDebut(Connexion.r.getString("heureDebut"));
		reservation.setHeureFin(Connexion.r.getString("heureFin"));
		reservation.setPrix(Connexion.r.getDouble("prix"));
		reservation.setEtat(Connexion.r.getString("etat"));
		reservation.setMatricule(matricule );
		reservation.setNumeroIdentifient(Connexion.r.getInt("numeroIdentifient"));
	}
	
	public double gestionPenalite(Reservation reservation, String dateDeRetour, double a, double b) {
		long dr = getDate(dateDeRetour), df = getDate(reservation.getDatefin()); 
		int nbrJour = (int) ((dr - df)/(60*60*24));
		double penalite = 0;
		
		if (nbrJour != 0) {
			penalite = a*nbrJour+b;
		}
		
		modifierContrat(reservation.getIdReservation(), penalite, 0);
		
		return penalite;
	}
	
	public void avertirClients(ArrayList<Client> clients, boolean hour) {
		String notification = null;
		Sender sender = new Sender();
		if (hour) {
			notification = "il vous reste une heure pour que votre location expirer";
		} else {
			notification = "il vous reste un jour pour que votre location expirer";
		}
		for (Client client : clients) {
			notifierClient(client.getNumeroidentifient(), client.getNotification()+notification);
			sender.send(creerMail(client, notification));
		}
	}
	private Mail creerMail(Client client, String notification) {
		return new Mail(client.getEmail(), "EXPIRATION", notification);
	}
}