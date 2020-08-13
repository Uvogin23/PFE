package Gestion;

import java.util.ArrayList;

import Enumeration.M_Payement;

import java.sql.PreparedStatement; 
import java.sql.SQLException;
import java.util.ArrayList;

import Model.Client;
import Model.Connexion;
import Model.Contrat;
import Model.Reservation;
import Model.Vehicule;
import converter.StringToSqlObject;

public class GestionGestionnaire {
	

	Connexion connexion;
	
	public GestionGestionnaire() {
		this.connexion = new Connexion();
	}
	
	public ArrayList<Client> ListClient() {
		ArrayList<Client> Client=new ArrayList<>();
		connexion.createConnexion();
		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("select * from client;");
			Connexion.r=preparedStatement.executeQuery();
			while(Connexion.r.next()){
				Client c=new Client();
				c.setAdresse(Connexion.r.getString("adresse"));
				c.setDateNaissence(Connexion.r.getString("dateNaissence"));
				c.setEmail(Connexion.r.getString("email"));
				c.setEtat(Connexion.r.getString("etat"));
				c.setNom(Connexion.r.getString("nom"));
				c.setNomUtilisateur(Connexion.r.getString("nomUtilisateur"));
				c.setNotification(Connexion.r.getString("notification"));
				c.setNumeroidentifient(Connexion.r.getInt("numeroIdentifient"));
				c.setNumeroTelephone(Connexion.r.getInt("numeroTelephone"));
				c.setPassword(Connexion.r.getString("password"));
				c.setPrenom(Connexion.r.getString("prenom"));
				
				Client.add(c);
			}
		}catch(Exception e ) {
			
		}
		connexion.closeConnexion();
		return Client;
		}
	
	public ArrayList<Reservation> ListReservation(){
		ArrayList<Reservation> res= new ArrayList<>();
		connexion.createConnexion();
		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("select * from reservation;");
			Connexion.r=preparedStatement.executeQuery();
			while(Connexion.r.next()){
				Reservation r=new Reservation();
				r.setDateDebut(Connexion.r.getString("dateDebut"));
				r.setDatefin(Connexion.r.getString("dateFin"));
				r.setEtat(Connexion.r.getString("etat"));
				r.setHeureDebut(Connexion.r.getString("heureDebut"));
				r.setHeureFin(Connexion.r.getString("heureFin"));
				r.setIdReservation(connexion.r.getInt("idReservation"));
				String mv=Connexion.r.getString("matriculeV");
				if(mv!=null) {
				    r.setMatricule(mv);
				    r.setType("voiture");}
				else {
					String mb=Connexion.r.getString("matriculeB");
				   if(mb!=null) {
				r.setMatricule(mb); r.setType("bus");
				}else {
				String mm=Connexion.r.getString("matriculeM");
				r.setMatricule(mm);
				 r.setType("moto");
				}}
				
				
				r.setNumeroIdentifient(Connexion.r.getInt("numeroIdentifient"));
				r.setPrix(Connexion.r.getDouble("prix"));
				res.add(r);
			}
			}catch(Exception e) {
				
			}
		for(int i=0;i<res.size();i++) {
			GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
			GestionGestionnaire gg=new GestionGestionnaire();
			Contrat contrat=new Contrat();
			Vehicule v=new Vehicule();
			Client c=new Client();
			if(res.get(i).getType()=="voiture") {
			v=ggt.recherchevoiture(res.get(i).getMatricule());
			res.get(i).setVehicule(v);}
			if(res.get(i).getType()=="bus") {
				v=ggt.recherchebus(res.get(i).getMatricule());
				res.get(i).setVehicule(v);}
			if(res.get(i).getType()=="moto") {
				v=ggt.recherchemoto(res.get(i).getMatricule());
				res.get(i).setVehicule(v);}
			c=gg.rechercheClient(res.get(i).getNumeroIdentifient());
			res.get(i).setClient(c);
			if(res.get(i).getEtat()!="NonValide")
			contrat=gg.rechercherContrat(res.get(i).getIdReservation());
			res.get(i).setContrat(contrat);
		}
		connexion.closeConnexion();
		return res;
	}
	public Client rechercheClient(int id) {
		connexion.createConnexion();
		Client c=new Client();
		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("select * from client where(numeroIdentifient=?);");
			preparedStatement.setInt(1, id);
			Connexion.r=preparedStatement.executeQuery();
		if(connexion.r.next()) {
			c.setAdresse(Connexion.r.getString("adresse"));
			c.setDateNaissence(Connexion.r.getString("dateNaissence"));
			c.setEmail(Connexion.r.getString("email"));
			c.setEtat(Connexion.r.getString("etat"));
			c.setNom(Connexion.r.getString("nom"));
			c.setNomUtilisateur(Connexion.r.getString("nomUtilisateur"));
			c.setNotification(Connexion.r.getString("notification"));
			c.setNumeroidentifient(Connexion.r.getInt("numeroIdentifient"));
			c.setNumeroTelephone(Connexion.r.getInt("numeroTelephone"));
			c.setPassword(Connexion.r.getString("password"));
			c.setPrenom(Connexion.r.getString("prenom"));
		}
		}catch(Exception e) {
			
		}
		connexion.closeConnexion();
		return c ;
	}
	
	public void confirmerReservation(int id) {
		connexion.createConnexion();
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		Reservation r=new Reservation();
		GestionGestionnaire gg=new GestionGestionnaire();
		try {
			
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("update reservation set etat='valide' where(idReservation=?);");
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
			r=gg.rechercherReservation(id);
			if(r.getType()=="voiture") {
			ggt.changerEtat("voiture", "reserve", r.getVehicule().getMatricule());}
			if(r.getType()=="moto") {
				ggt.changerEtat("moto", "reserve", r.getVehicule().getMatricule());}
			if(r.getType()=="bus") {
				ggt.changerEtat("bus", "reserve", r.getVehicule().getMatricule());}
			}catch(Exception e) {
				
			}
		connexion.closeConnexion();
	}
	public Reservation rechercherReservation(int id) {
		Reservation r =new Reservation();
		connexion.createConnexion();
		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("select * from reservation where(idReservation=?);");
			preparedStatement.setInt(1, id);
			Connexion.r=preparedStatement.executeQuery();
			if(connexion.r.next()) {
				r.setDateDebut(Connexion.r.getString("dateDebut"));
				r.setDatefin(Connexion.r.getString("dateFin"));
				r.setEtat(Connexion.r.getString("etat"));
				r.setHeureDebut(Connexion.r.getString("heureDebut"));
				r.setHeureFin(Connexion.r.getString("heureFin"));
				r.setIdReservation(connexion.r.getInt("idReservation"));
				String mv=Connexion.r.getString("matriculeV");
				if(mv!=null) {
				    r.setMatricule(mv);
				    r.setType("voiture");}
				else {
					String mb=Connexion.r.getString("matriculeB");
				   if(mb!=null) {
				r.setMatricule(mb); r.setType("bus");
				}else {
				String mm=Connexion.r.getString("matriculeM");
				r.setMatricule(mm);
				 r.setType("moto");
				}}
				
				
				r.setNumeroIdentifient(Connexion.r.getInt("numeroIdentifient"));
				r.setPrix(Connexion.r.getDouble("prix"));
				GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
				GestionGestionnaire gg=new GestionGestionnaire();
				Vehicule v=new Vehicule();
				Client c=new Client();
				if(r.getType()=="voiture") {
				v=ggt.recherchevoiture(r.getMatricule());
				r.setVehicule(v);}
				if(r.getType()=="bus") {
					v=ggt.recherchebus(r.getMatricule());
					r.setVehicule(v);}
				if(r.getType()=="moto") {
					v=ggt.recherchemoto(r.getMatricule());
					r.setVehicule(v);}
				c=gg.rechercheClient(r.getNumeroIdentifient());
				r.setClient(c);
			}
		}catch(Exception e){
			
		}
		connexion.closeConnexion();
		return r;
	}
	public void annulerReservation(int id) {
		connexion.createConnexion();
		
		try {
			
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("delete from reservation where(idReservation=?);");
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
			
			}catch(Exception e) {
				
			}
		connexion.closeConnexion();
	}
	public void notifierclient(int id ,String Not) {
		connexion.createConnexion();
            try {
			
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("update client set notification=? where(numeroIdentifient=?);");
			preparedStatement.setInt(2, id);
			preparedStatement.setString(1, Not);
			preparedStatement.executeUpdate();
			
			}catch(Exception e) {
				
			}
		connexion.closeConnexion();
	}
	public void confirmerinscription(int id ){
		connexion.createConnexion();
            try {
			
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("update client set etat='client' where(numeroIdentifient=?);");
			preparedStatement.setInt(1, id);
			
			preparedStatement.executeUpdate();
			
			}catch(Exception e) {
				
			}
		connexion.closeConnexion();
	}
	
	public void annulerinscription(int id ){
		connexion.createConnexion();
            try {
			
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("delete from client where(numeroIdentifient=?);");
			preparedStatement.setInt(1, id);
			
			preparedStatement.executeUpdate();
			
			}catch(Exception e) {
				
			}
		connexion.closeConnexion();
	}

	public void bloquerclient(int id ){
		connexion.createConnexion();
            try {
			
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("update client set etat='bloquer' where(numeroIdentifient=?);");
			preparedStatement.setInt(1, id);
			
			preparedStatement.executeUpdate();
			
			}catch(Exception e) {
				
			}
		connexion.closeConnexion();
	}
	
	public void mettrefinreservation(int id) {
connexion.createConnexion();
		
		try {
			
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("update reservation set etat='historique' where(idReservation=?);");
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
			
			}catch(Exception e) {
				
			}
		connexion.closeConnexion();
	}
	
	public ArrayList<Reservation> ListReservationClient(int id){
		ArrayList<Reservation> res=new ArrayList<>();
		connexion.createConnexion();
		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("select * from reservation where(numeroIdentifient=?);");
			preparedStatement.setInt(1, id);
			Connexion.r=preparedStatement.executeQuery();
			while(Connexion.r.next()){
				Reservation r=new Reservation();
				r.setDateDebut(Connexion.r.getString("dateDebut"));
				r.setDatefin(Connexion.r.getString("dateFin"));
				r.setEtat(Connexion.r.getString("etat"));
				r.setHeureDebut(Connexion.r.getString("heureDebut"));
				r.setHeureFin(Connexion.r.getString("heureFin"));
				r.setIdReservation(connexion.r.getInt("idReservation"));
				String mv=Connexion.r.getString("matriculeV");
				if(mv!=null) {
				    r.setMatricule(mv);
				    r.setType("voiture");}
				else {
					String mb=Connexion.r.getString("matriculeB");
				   if(mb!=null) {
				r.setMatricule(mb); r.setType("bus");
				}else {
				String mm=Connexion.r.getString("matriculeM");
				r.setMatricule(mm);
				 r.setType("moto");
				}}
				
				
				r.setNumeroIdentifient(Connexion.r.getInt("numeroIdentifient"));
				r.setPrix(Connexion.r.getDouble("prix"));
				res.add(r);}
		}catch(Exception e) {
			
		}
		
		connexion.closeConnexion();
		return res;
	}
	//method for handling Contract
		public Contrat creerContrat(Reservation reservation, int idclient, M_Payement payment,int periode, double prix, double charges,String user) {
			Contrat contrat = new Contrat();
			
			setContrat(contrat,reservation, periode, prix, charges,user);
			
			contrat.setNumeroidentifient(idclient);
			contrat.setModalites_de_payment(payment);
			
			return contrat;
		}
		private void setContrat(Contrat contrat, Reservation reservation,int periode, double prix ,double charges,String user) {
			contrat.setNumeroContrat(reservation.getIdReservation());
			contrat.setNomUtilisateur(user);
			
			String dd = reservation.getDateDebut(),
					df = reservation.getDatefin(),
					hd = reservation.getHeureDebut(),
					hf = reservation.getHeureFin();
			
			contrat.setPeriode_de_location(periode);
			contrat.setPrix(prix);
			contrat.setCharges(charges);
		}
		public void addContrat(Contrat contrat) {
			connexion.createConnexion();
			
			String query = "INSERT INTO contrat VALUES (?,?,?,?,?,?,?);";

			try {
				PreparedStatement  preparedStatement = Connexion.con.prepareStatement(query);

				setPreparedStatement(preparedStatement,contrat); 

				preparedStatement.executeUpdate();

			}catch(Exception e) {
				e.printStackTrace();
			}
			connexion.closeConnexion();
		}
		
		public void setPreparedStatement(PreparedStatement  preparedStatement,Client client) throws SQLException{
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
		
		private void setPreparedStatement(PreparedStatement preparedStatement, Contrat contrat) throws SQLException {
			preparedStatement.setInt(1, contrat.getNumeroContrat());
			preparedStatement.setString(2, contrat.getModalites_de_payment().toString());
			preparedStatement.setInt(3, contrat.getPeriode_de_location());
			preparedStatement.setDouble(4, contrat.getPrix());
			preparedStatement.setDouble(5, contrat.getCharges());
			preparedStatement.setInt(6, contrat.getNumeroidentifient());
			preparedStatement.setString(7, "yacoubDemir");
		}
		
		public void updateContratc(Contrat contrat) {
			connexion.createConnexion();

			String query = "UPDATE contrat SET ";
			query += "modalites_de_payment = 'cheque', ";
			query += "periode_de_location = ? ,";
			query += "prix = ?, ";
			query += "charges = ?, ";
			query += "numeroIdentifient = ?, ";
			query += "nomUtilisateur = ? ";
			query += "WHERE (numeroContrat = ?);";

			try {
				PreparedStatement  preparedStatement = Connexion.con.prepareStatement(query);

				setPreparedStatementM(preparedStatement,contrat); 

				preparedStatement.executeUpdate();

			}catch(Exception e) {
				e.printStackTrace();
			}
			connexion.closeConnexion();
		}
		
		public void updateContrate(Contrat contrat) {
			connexion.createConnexion();

			String query = "UPDATE contrat SET ";
			query += "modalites_de_payment = 'espece', ";
			query += "periode_de_location = ? ,";
			query += "prix = ?, ";
			query += "charges = ?, ";
			query += "numeroIdentifient = ?, ";
			query += "nomUtilisateur = ? ";
			query += "WHERE (numeroContrat = ?);";

			try {
				PreparedStatement  preparedStatement = Connexion.con.prepareStatement(query);

				setPreparedStatementM(preparedStatement,contrat); 

				preparedStatement.executeUpdate();

			}catch(Exception e) {
				e.printStackTrace();
			}
			connexion.closeConnexion();
		}
		private void setPreparedStatementM(PreparedStatement preparedStatement, Contrat contrat) throws SQLException {
			preparedStatement.setInt(6, contrat.getNumeroContrat());
			//preparedStatement.setString(1, contrat.getModalites_de_payment().toString());
			preparedStatement.setInt(1, contrat.getPeriode_de_location());
			preparedStatement.setDouble(2, contrat.getPrix());
			preparedStatement.setDouble(3, contrat.getCharges());
			preparedStatement.setInt(4, contrat.getNumeroidentifient());
			preparedStatement.setString(5, contrat.getNomUtilisateur());
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
			contrat.setModalites_de_paymentc(Connexion.r.getString("modalites_de_payment"));
			contrat.setPeriode_de_location(Connexion.r.getInt("periode_de_location"));
			contrat.setPrix(Connexion.r.getDouble("prix"));
			contrat.setCharges(Connexion.r.getDouble("charges"));
			contrat.setNumeroidentifient(Connexion.r.getInt("numeroIdentifient"));
			contrat.setNomUtilisateur(Connexion.r.getString("nomUtilisateur"));
		}
		
		public void modifierContratespece(int id, double charges, int periode,M_Payement payement) {
			Contrat contrat = rechercherContrat(id);
			payement=M_Payement.ESPECE;
			double prix = contrat.getPrix()/contrat.getPeriode_de_location();
			contrat.setModalites_de_payment(payement);
			contrat.setPeriode_de_location(contrat.getPeriode_de_location()+periode);
			contrat.setCharges(periode*charges);
			
			contrat.setPrix(calculerPrix(prix, contrat.getPeriode_de_location(),contrat.getCharges()));
			
			updateContrate(contrat);
		}
		public void modifierContratcheque(int id, double charges, int periode,M_Payement payement) {
			Contrat contrat = rechercherContrat(id);
			payement=M_Payement.ESPECE;
			double prix = contrat.getPrix()/contrat.getPeriode_de_location();
			contrat.setModalites_de_payment(payement);
			contrat.setPeriode_de_location(contrat.getPeriode_de_location()+periode);
			contrat.setCharges(periode*charges);
			
			contrat.setPrix(calculerPrix(prix, contrat.getPeriode_de_location(),contrat.getCharges()));
			
			updateContratc(contrat);
		}
		
		private double calculerPrix(double prix, int periode_de_location,double charges) {
			return (prix*periode_de_location)+charges;
		}
		
		public void changerprix(Double prix, int id) {
			connexion.createConnexion();
					
					try {
						
						PreparedStatement  preparedStatement = Connexion.con.prepareStatement("update reservation set prix=? where(idReservation=?);");
						preparedStatement.setInt(2, id);
						preparedStatement.setDouble(1, prix);
						preparedStatement.executeUpdate();
						
						}catch(Exception e) {
							
						}
					connexion.closeConnexion();
				}
		
		
		public Double CalculerRecette(String Date) {
			connexion.createConnexion();
			Double recette=0.0;
			
			ArrayList<Reservation> res=ListReservation();
			for(int i=0;i<res.size();i++) {
				if(Date.equals(res.get(i).getDatefin()) && res.get(i).getEtat()=="Historique") {
					recette=recette+res.get(i).getPrix();
				}
			}
		
			connexion.closeConnexion();
			return recette;
		}
		
	
}
