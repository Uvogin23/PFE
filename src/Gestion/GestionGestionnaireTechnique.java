package Gestion;

import java.sql.PreparedStatement;
import java.util.ArrayList;

import Model.Connexion;
import Model.Garage;
import Model.Vehicule;

public class GestionGestionnaireTechnique {

	Connexion connexion;
	public GestionGestionnaireTechnique(){
		this.connexion = new Connexion();
		
	}
	public ArrayList<Vehicule> ListVoiture() {
		ArrayList<Vehicule> voiture=new ArrayList<>();
		connexion.createConnexion();
		
		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("select * from voiture order by marque ASC;");
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
	
	public ArrayList<Vehicule> ListMoto() {
		ArrayList<Vehicule> MOTOR=new ArrayList<>();
		connexion.createConnexion();
		
		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("select * from moto order by marque ASC;");
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
	
	public ArrayList<Vehicule> ListBus() {
		ArrayList<Vehicule> Bus=new ArrayList<>();
		connexion.createConnexion();
		
		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("select * from bus order by marque ASC;");
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
	
	public ArrayList<Garage> ListDepot(){
		connexion.createConnexion();
		ArrayList<Garage> DEPOT=new ArrayList<>();
		
		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("select * from depot;");
			connexion.r=preparedStatement.executeQuery();
			while(connexion.r.next()) {
				Garage garage=new Garage();
				garage.setAdresse(connexion.r.getString("adresse"));
				garage.setCapacite(connexion.r.getInt("capacite"));
				garage.setCode(connexion.r.getInt("idDepot"));
				DEPOT.add(garage);
			}
			}catch(Exception e) {}
		connexion.closeConnexion();
		return DEPOT;
	}
	
	public void ajouterDepot(String adresse,int id,int capacite) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("insert into depot values(?,?,?);");
			preparedStatement.setString(2, adresse);
			preparedStatement.setInt(1, id);
			preparedStatement.setInt(3, capacite);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		
		
		
		connexion.closeConnexion();
	}
	
	public void ajouterVoiture(String marque,String modele,String categorie,String matricule,double plj,double plh,String etat,int iddepot) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("insert into voiture values(?,?,?,?,?,?,?,?);");
			preparedStatement.setString(1, matricule);
			preparedStatement.setString(2, marque);
			preparedStatement.setString(3,modele );
			preparedStatement.setString(6, etat);
			preparedStatement.setString(7, categorie);
			preparedStatement.setDouble(4, plh);
			preparedStatement.setDouble(5, plj);
			preparedStatement.setInt(8, iddepot);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		
		
		
		connexion.closeConnexion();
	}
	
	public void ajouterMoto(String marque,String modele,String categorie,String matricule,double plj,double plh,String etat,int iddepot) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("insert into moto values(?,?,?,?,?,?,?,?);");
			preparedStatement.setString(1, matricule);
			preparedStatement.setString(2, marque);
			preparedStatement.setString(3,modele );
			preparedStatement.setString(6, etat);
			preparedStatement.setString(7, categorie);
			preparedStatement.setDouble(4, plh);
			preparedStatement.setDouble(5, plj);
			preparedStatement.setInt(8, iddepot);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		
		
		
		connexion.closeConnexion();
	}
	
	public void ajouterBus(int nbplace,String marque,String modele,String categorie,String matricule,double plj,double plh,String etat,int iddepot) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("insert into bus values(?,?,?,?,?,?,?,?,?);");
			preparedStatement.setString(1, matricule);
			preparedStatement.setString(2, marque);
			preparedStatement.setString(3,modele );
			preparedStatement.setString(6, etat);
			preparedStatement.setString(7, categorie);
			preparedStatement.setDouble(4, plh);
			preparedStatement.setDouble(5, plj);
			preparedStatement.setInt(8, nbplace);
			preparedStatement.setInt(9, iddepot);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		
		
		
		connexion.closeConnexion();
	}
	
	
	public void supprimerDepot(int iddepot) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("delete from depot where(idDepot=?);");
			preparedStatement.setInt(1, iddepot);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		
		connexion.closeConnexion();
	}
	
	public Vehicule recherchevoiture(String matricule) {
		Vehicule voiture=new Vehicule();
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("select * from voiture where(matricule=?);");
			preparedStatement.setString(1, matricule);
			connexion.r=preparedStatement.executeQuery();
			if(connexion.r.next()) {
				voiture.setCategorie(connexion.r.getString("categorie"));
				voiture.setEtatv(connexion.r.getString("etat"));
				voiture.setIddepot(connexion.r.getInt("idDepot"));
				voiture.setMarque(connexion.r.getString("marque"));
				voiture.setMatricule(connexion.r.getString("matricule"));
				voiture.setModele(connexion.r.getString("modele"));
				voiture.setPrix_par_heure(connexion.r.getDouble("prix_par_heure"));
				voiture.setPrix_par_jour(connexion.r.getDouble("prix_par_jour"));
				
			}
			
		}catch(Exception e) {
			
		}
		
		connexion.closeConnexion();
		return voiture;
	}
	
	public Vehicule recherchebus(String matricule) {
		Vehicule bus=new Vehicule();
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("select * from bus where(matricule=?);");
			preparedStatement.setString(1, matricule);
			connexion.r=preparedStatement.executeQuery();
			if(connexion.r.next()) {
				bus.setCategorie(connexion.r.getString("categorie"));
				bus.setEtatv(connexion.r.getString("etat"));
				bus.setIddepot(connexion.r.getInt("idDepot"));
				bus.setMarque(connexion.r.getString("marque"));
				bus.setMatricule(connexion.r.getString("matricule"));
				bus.setModele(connexion.r.getString("modele"));
				bus.setPrix_par_heure(connexion.r.getDouble("prix_par_heure"));
				bus.setPrix_par_jour(connexion.r.getDouble("prix_par_jour"));
				bus.setPlace(connexion.r.getInt("nombrePlace"));
			}
			
		}catch(Exception e) {
			
		}
		
		connexion.closeConnexion();
		return bus;
	}
	
	public Vehicule recherchemoto(String matricule) {
		Vehicule moto=new Vehicule();
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("select * from moto where(matricule=?);");
			preparedStatement.setString(1, matricule);
			connexion.r=preparedStatement.executeQuery();
			if(connexion.r.next()) {
				moto.setCategorie(connexion.r.getString("categorie"));
				moto.setEtatv(connexion.r.getString("etat"));
				moto.setIddepot(connexion.r.getInt("idDepot"));
				moto.setMarque(connexion.r.getString("marque"));
				moto.setMatricule(connexion.r.getString("matricule"));
				moto.setModele(connexion.r.getString("modele"));
				moto.setPrix_par_heure(connexion.r.getDouble("prix_par_heure"));
				moto.setPrix_par_jour(connexion.r.getDouble("prix_par_jour"));
				
			}
			
		}catch(Exception e) {
			
		}
		
		connexion.closeConnexion();
		return moto;
	}
	
	public Garage recherchedepot(int iddepot) {
		Garage depot=new Garage();
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("select * from depot where(idDepot=?);");
			preparedStatement.setInt(1, iddepot);
			connexion.r=preparedStatement.executeQuery();
			if(connexion.r.next()) {
				depot.setAdresse(connexion.r.getString("adresse"));
				depot.setCapacite(connexion.r.getInt("capacite"));
				depot.setCode(connexion.r.getInt("idDepot"));
				
				
			}
			
		}catch(Exception e) {
			
		}
		
		connexion.closeConnexion();
		return depot;
	}
	                               //voiture
	
	public void pljv(String matricule, double prix) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("update voiture set prix_par_jour=? where(matricule=?);");
			preparedStatement.setString(2, matricule);
			preparedStatement.setDouble(1, prix);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		connexion.closeConnexion();
	}
	public void plhv(String matricule, double prix) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("update voiture set prix_par_heure=? where(matricule=?);");
			preparedStatement.setString(2, matricule);
			preparedStatement.setDouble(1, prix);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		connexion.closeConnexion();
	}
	
	public void rvd(String matricule,int iddepot) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("update voiture set idDepot=? where(matricule=?);");
			preparedStatement.setString(2, matricule);
			preparedStatement.setInt(1, iddepot);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		connexion.closeConnexion();
	}
	
	public void retvd(String matricule) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("update voiture set idDepot=null where(matricule=?);");
			preparedStatement.setString(1, matricule);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		connexion.closeConnexion();
	}
	
	public void supv(String matricule) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("delete from voiture  where(matricule=?);");
			preparedStatement.setString(1, matricule);
			
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		connexion.closeConnexion();
	}
	                                    
	                                              //bus
	
	public void pljb(String matricule, double prix) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("update bus set prix_par_jour=? where(matricule=?);");
			preparedStatement.setString(2, matricule);
			preparedStatement.setDouble(1, prix);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		connexion.closeConnexion();
	}
	public void plhb(String matricule, double prix) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("update bus set prix_par_heure=? where(matricule=?);");
			preparedStatement.setString(2, matricule);
			preparedStatement.setDouble(1, prix);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		connexion.closeConnexion();
	}
	
	public void rbd(String matricule,int iddepot) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("update bus set idDepot=? where(matricule=?);");
			preparedStatement.setString(2, matricule);
			preparedStatement.setInt(1, iddepot);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		connexion.closeConnexion();
	}
	
	public void retbd(String matricule) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("update bus set idDepot=null where(matricule=?);");
			preparedStatement.setString(1, matricule);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		connexion.closeConnexion();
	}
	
	public void supb(String matricule) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("delete from bus  where(matricule=?);");
			preparedStatement.setString(1, matricule);
			
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		connexion.closeConnexion();
	}
	
	                                      //MOTO
	
	public void pljm(String matricule, double prix) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("update moto set prix_par_jour=? where(matricule=?);");
			preparedStatement.setString(2, matricule);
			preparedStatement.setDouble(1, prix);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		connexion.closeConnexion();
	}
	public void plhm(String matricule, double prix) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("update moto set prix_par_heure=? where(matricule=?);");
			preparedStatement.setString(2, matricule);
			preparedStatement.setDouble(1, prix);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		connexion.closeConnexion();
	}
	
	public void rmd(String matricule,int iddepot) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("update moto set idDepot=? where(matricule=?);");
			preparedStatement.setString(2, matricule);
			preparedStatement.setInt(1, iddepot);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		connexion.closeConnexion();
	}
	
	public void retmd(String matricule) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("update moto set idDepot=null where(matricule=?);");
			preparedStatement.setString(1, matricule);
			preparedStatement.executeUpdate();
			
		}catch(Exception e) {
			
		}
		connexion.closeConnexion();
	}
	
	public void supm(String matricule) {
		connexion.createConnexion();
		try {
			PreparedStatement preparedStatement=connexion.con.prepareStatement("delete from moto  where(matricule=?);");
			preparedStatement.setString(1, matricule);
			
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		connexion.closeConnexion();
	}
	
	public void changerEtat(String table,String Etat,String matricule) {
		connexion.createConnexion();
		PreparedStatement preparedStatement=null;
		try {
			switch (table) {
			case "moto":	
				preparedStatement=connexion.con.prepareStatement("update moto set etat=? where(matricule=?);");
				break;
			case "bus":	
				preparedStatement=connexion.con.prepareStatement("update bus set etat=? where(matricule=?);");
				break;
			case "voiture":	
				preparedStatement=connexion.con.prepareStatement("update voiture set etat=? where(matricule=?);");
				break;
			}
			
			
			preparedStatement.setString(1, Etat);
			preparedStatement.setString(2, matricule);
			
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			
		}
		connexion.closeConnexion();
	}
	
	public int countDepot(int id) {
		int n=0;
		ArrayList<Vehicule> a= ListBus();
		ArrayList<Vehicule> b= ListMoto();
		ArrayList<Vehicule> c= ListVoiture();
		for(int i=0;i<a.size();i++){
			if(a.get(i).getIddepot()==id) {
				n=n+1;
			}
		}
        for(int i=0;i<b.size();i++){
        	if(b.get(i).getIddepot()==id) {
				n=n+1;
			}
		}
        for(int i=0;i<c.size();i++){
        	if(c.get(i).getIddepot()==id) {
				n=n+1;
			}
        }
		return n; 
	}
}
