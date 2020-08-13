package Fonctions;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;

import Model.Client;
import Model.Connexion;

public class CheckDay implements Runnable{

	@Override
	public void run() {
		String dateFin = calculerDateFin();
		ArrayList<Client> clients = new ArrayList<>();
		Fonctions fonctions = new Fonctions();
		
		try {
			clients = getClients(dateFin);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		fonctions.avertirClients(clients, false);
	}
	private String calculerDateFin() {
		
		Date date = new Date();
		
		GregorianCalendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		calendar.add(GregorianCalendar.DAY_OF_MONTH, 1);
		
		date = calendar.getTime();
		
		String dateFin = new SimpleDateFormat("yyyy-MM-dd").format(date);
		return dateFin;
	}
	private ArrayList<Client> getClients(String dateFin) throws SQLException {
		
		ArrayList<Client> clients = new ArrayList<>();
		Connexion connexion = new Connexion();
		String query = "SELECT * FROM client WHERE numeroIdentifient IN (SELECT numeroIdentifient FROM reservation WHERE dateFin = ? AND heureDebut = heureFin AND etat='valide');";
		Client client = null;
		connexion.createConnexion();
		
		PreparedStatement preparedStatement = Connexion.con.prepareStatement(query);
		
		preparedStatement.setString(1, dateFin);
		
		Connexion.r = preparedStatement.executeQuery();
		
		while (Connexion.r.next()) {
			client = new Client();
			setClient(client);
			clients.add(client);
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

}
